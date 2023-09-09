import { ref } from "vue";

import { $fetch, FetchError } from "ohmyfetch";

import useContext from "@/composables/useContext";

import type { Hash } from "@/types";

export type BlockStatus = "sealed" | "verified";
export type Block = {
  number: number;
  status: BlockStatus;
  hash: Hash;
  commitTxHash: null | Hash;
  l1BatchNumber: number;
  isL1BatchSealed: boolean;
  executeTxHash: null | Hash;
  proveTxHash: null | Hash;
  committedAt: null | string;
  executedAt: null | string;
  provenAt: null | string;
  l1TxCount: number;
  l2TxCount: number;
  timestamp: string;
  isProvenByNewProver?: boolean;
};

export type BlockListItem = {
  number: number;
  hash: Hash;
  timestamp: string;
  gasUsed: string;
  l1BatchNumber: number;
  l1TxCount: number;
  l2TxCount: number;
  size: number;
  status: BlockStatus;
  isL1BatchSealed: boolean;
};

export default (context = useContext()) => {
  const isRequestPending = ref(false);
  const isRequestFailed = ref(false);
  const blockItem = ref(<null | Block>null);

  const getBatchNewProof = async (id: number) => {
    try {
      return await $fetch(`${context.currentNetwork.value.newProverUrl}/proof_${id}.bin`, { method: "HEAD" });
    } catch (error: unknown) {
      return null;
    }
  };

  const getById = async (id: string) => {
    isRequestPending.value = true;
    isRequestFailed.value = false;

    try {
      const data = await $fetch(`${context.currentNetwork.value.apiURLv2}/blocks/${id}`);
      if (data.l1BatchNumber && data.proveTxHash) {
        const proof = await getBatchNewProof(data.l1BatchNumber);
        data.isProvenByNewProver = !!proof;
      }
      blockItem.value = data;
    } catch (error: unknown) {
      blockItem.value = null;
      if (!(error instanceof FetchError) || error.response?.status !== 404) {
        isRequestFailed.value = true;
      }
    } finally {
      isRequestPending.value = false;
    }
  };

  return {
    getById,
    blockItem,
    isRequestPending,
    isRequestFailed,
  };
};
