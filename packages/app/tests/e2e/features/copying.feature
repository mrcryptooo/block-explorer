@copying @regression

Feature: Copying

  Background:
    Given I am on main page

  @id209:III @id230:II
  Scenario Outline: Check copy button action on "<Page>" page
    Given I go to page "<Page>"
    When I click on the first copy button
    Then Element with "text" "Copied!" should be "visible"

    Examples:
      | Page                                                                   |
      | /tx/0xe84dcdaa4e40c9899763c8f55255376fd77f3a588be0fe0afa69f153a0ae3f10 |
      | /address/0xed7175341f123f7718aBaCF1702d6980CFc08784                    |
      | /tx/0xe239f4cc4ddbaad475d0ef3e23114a89387864bcde5da5b5ca4d2c140bfc4bc4 |
      | /block/1                                                               |
      | /address/0x574343B3d1544477f2C4dF38c2Ef720Ab33e782b                    |

  @id239 @testnet
  Scenario Outline: Check "<Row>" hashes copying for Transaction page
    Given I go to page "/tx/0xe7a91cc9b270d062328ef995e0ef67195a3703d43ce4e1d375f87d5c64e51981"
    When I click on the copy button with "<Row>" row on "Transaction" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row                 | Text                                                               |
      | Transaction Hash    | 0xe7a91cc9b270d062328ef995e0ef67195a3703d43ce4e1d375f87d5c64e51981 |
      | From                | 0x8f0F33583a56908F7F933cd6F0AaE382aC3fd8f6                         |
      | To                  | 0x0faF6df7054946141266420b43783387A78d82A9                         |
      | Input data          | 0xa9059cbb0000000000000000000000000faf6df7054946141266420b43783387a78d82a90000000000000000000000000000000000000000000000000000000000989680 |

  @id239 @mainnet 
  Scenario Outline: Check "<Row>" hashes copying for Transaction page
    Given I go to page "/tx/0x97e3d593e03e764df14e352e73ba6af487faf8d04bd65a1fd3d55208b6e0d972"
    When I click on the copy button with "<Row>" row on "Transaction" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row                 | Text                                                               |
      | Transaction Hash    | 0x97e3d593e03e764df14e352e73ba6af487faf8d04bd65a1fd3d55208b6e0d972 |
      | From                | 0xE1D6FA366B480Ea437419333333b31366C8a158F                         |
      | To                  | 0xA0924Cc8792836F48D94759c76D32986BC74B54c                         |
      | Input data          | 0x2e4dbe8f000000000000000000000000000000000000000000000000000000000001bc45000000000000000000000000d613effb65b11e301f1338f71013b390985380300000000000000000000000000000000000000000000000000000000008116e2b000000000000000000000000000000000000000000000000000000000001bc4500000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000004123131c5b6401f42c98f7e84ae00ef577fa5e580f313a83a135c8fc893103ec884bc0bbd4b5d3ef32ec774eb20529ffebb7aae5d250d2568cff65e5ac412f99f21c00000000000000000000000000000000000000000000000000000000000000 |

  @id257 @testnet 
  Scenario Outline: Check "<Row>" hashes copying for Logs tab on Transaction page
    Given I go to page "/tx/0xe7a91cc9b270d062328ef995e0ef67195a3703d43ce4e1d375f87d5c64e51981"
    And I select "Logs" tab on "Transaction" page
    When I click on the copy button with "<Row>" row on "Transaction" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row     | Text                                                               |
      | Address | 0x000000000000000000000000000000000000800A                         |
      | Topics  | 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef |
      | Data    | 855606582320872                                                    |

  @id257:I @mainnet
  Scenario Outline: Check "<Row>" hashes copying for Logs tab on Transaction page
    Given I go to page "/tx/0x97e3d593e03e764df14e352e73ba6af487faf8d04bd65a1fd3d55208b6e0d972"
    And I select "Logs" tab on "Transaction" page
    When I click on the copy button with "<Row>" row on "Transaction" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row     | Text                                                               |
      | Address | 0x000000000000000000000000000000000000800A                         |
      | Topics  | 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef |
      | Data    | 490189750000000                                                    |

  @id269:I
  Scenario Outline: Check Address hashes copying for Contract page
    Given I go to page "/address/0x000000000000000000000000000000000000800A"
    When I click on the copy button with "<Row>" row on "Contract" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row     | Text                                       |
      | Address | 0x000000000000000000000000000000000000800A |

  @id269:II @id266:II @id244:II
  Scenario Outline: Check hashes copying from title on Contract/Block/Accounts page
    Given I go to page "<Address>"
    When I click on the copy button for page title
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Address                                             | Text                                       |
      | /address/0x0faF6df7054946141266420b43783387A78d82A9 | 0x0faF6df7054946141266420b43783387A78d82A9 |
      | /block/1                                            | 1                                          |
      | /address/0x8f0F33583a56908F7F933cd6F0AaE382aC3fd8f6 | 0x8f0F33583a56908F7F933cd6F0AaE382aC3fd8f6 |


  @id272
  Scenario Outline: Check hashes copying for Contracts tab on Contracts page
    Given I go to page "/address/0x000000000000000000000000000000000000800A"
    When I select "Contract" tab on "Contract" page
    And I click on the copy button for deployed bytecode
    Then Clipboard contains "<Text>" value

    Examples:
      | Text |
      | 0x00030000000000020005000000000002000200000001035500000060011002700000010f0010019d000100000000001f0000008001000039000000400010043f00000001012001900000003c0000c13d0000000002000031000000040120008c0000029c0000413d0000000201000367000000000301043b000000e003300270000001110430009c000000440000a13d000001120430009c000000650000a13d000001130430009c000000e80000613d000001140130009c0000028b0000613d000001150130009c0000029c0000c13d0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000200310008c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d00000004010000390000000201100367000000000101043b0000011e011001970000000000100435000000200000043f0000000001000019043803fe0000040f000000000101041a000000400200043d00000000001204350000010f010000410000010f0320009c000000000102401900000040011002100000011f011001c7000004390001042e0000000001000416000000000110004c0000029c0000c13d0000002001000039000001000010044300000120000004430000011001000041000004390001042e000001180130009c000000a20000213d0000011b0130009c0000020b0000613d0000011c0130009c0000029c0000c13d0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000000310004c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d0000000101000039000000000101041a000000400200043d00000000001204350000010f010000410000010f0320009c000000000102401900000040011002100000011f011001c7000004390001042e000001160430009c000002330000613d000001170130009c0000029c0000c13d0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000600310008c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d00000002010003670000000402100370000000000402043b0000011e0240009c0000029c0000213d0000002402100370000000000202043b0000011e052001970000011e0220009c0000029c0000213d00000000020004110000004401100370000000000301043b000080060120008c0000033e0000613d000000090100008a000000000112016f000080010110008c0000033e0000613d000000400100043d00000064021000390000012703000041000000000032043500000044021000390000012803000041000000000032043500000024021000390000003e030000390000000000320435000001290200004100000000002104350000000402100039000000200300003900000000003204350000010f020000410000010f0310009c000000000102801900000040011002100000012a011001c70000043a00010430000001190130009c000002710000613d0000011a0130009c0000029c0000c13d0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000400310008c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d00000002010003670000000402100370000000000402043b0000011e0240009c0000029c0000213d0000002401100370000000000501043b0000000001000411000080010110008c000002b80000c13d0000000101000039000000000301041a0000000002530019000000000332004b000000000300001900000001030040390000000103300190000000e20000c13d000400000005001d000000000021041b0000000000400435000000200000043f0000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039000500000004001d043804330000040f000000050500002900000001022001900000029c0000613d000000000101043b000000000301041a00000004040000290000000002430019000000000332004b0000000003000019000000010300403900000001033001900000038b0000613d000001310100004100000000001004350000001101000039000000040010043f00000132010000410000043a00010430000000040320008a0000011d04000041000000400530008c000000000500001900000000050440190000011d03300197000000000630004c000000000400a0190000011d0330009c00000000030500190000000003046019000000000330004c0000029c0000c13d0000000403100370000000000803043b0000011e0380009c0000029c0000213d0000002403100370000000000303043b000001210430009c0000029c0000213d00000023043000390000011d05000041000000000624004b000000000600001900000000060580190000011d022001970000011d04400197000000000724004b0000000005008019000000000224013f0000011d0220009c00000000020600190000000002056019000000000220004c0000029c0000c13d0000000402300039000000000121034f000000000101043b000001210210009c0000026b0000213d000000bf02100039000000200500008a000000000252016f000001210420009c0000026b0000213d000000400020043f000000800010043f000000240330003900000000023100190000000004000031000000000242004b0000029c0000213d000400000005001d0000001f0210018f000000020330036700000005041002720000012b0000613d00000000050000190000000506500210000000000763034f000000000707043b000000a00660003900000000007604350000000105500039000000000645004b000001230000413d000500000008001d000000000520004c0000013b0000613d0000000504400210000000000343034f0000000302200210000000a004400039000000000504043300000000052501cf000000000525022f000000000303043b0000010002200089000000000323022f00000000022301cf000000000252019f0000000000240435000000a00110003900000000000104350000000001000416000300000001001d00000000010004100000000000100435000000200000043f0000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039043804330000040f0000000102200190000000050400002900000004070000290000029c0000613d000000000101043b000000000201041a00000003090000290000000002920049000000000021041b0000000101000039000000000201041a0000000002920049000000000021041b0000012302000041000000400100043d000000200310003900000000002304350000006002400210000000240310003900000000002304350000000008000411000000600280021000000058031000390000000000230435000000380210003900000000009204350000006c03100039000000800200043d000000000420004c000001700000613d00000000040000190000000005340019000000a006400039000000000606043300000000006504350000002004400039000000000524004b000001690000413d000000000332001900000000000304350000004c0320003900000000003104350000008b02200039000000000272016f000000000a12001900000000022a004b000000000200001900000001020040390000012103a0009c0000026b0000213d00000001022001900000026b0000c13d000100000008001d0000004000a0043f000001240200004100000000002a04350000000402a000390000002003000039000000000032043500000000020104330000002403a0003900000000002304350000004403a00039000000000420004c000001930000613d000000000400001900000000053400190000002004400039000000000614001900000000060604330000000000650435000000000524004b0000018c0000413d000000000132001900000000000104350000001f01200039000000000171016f0000010f020000410000010f03a0009c000000000302001900000000030a4019000000400330021000000044011000390000010f0410009c00000000010280190000006001100210000000000131019f00000000030004140000010f0430009c0000000002034019000000c002200210000000000112019f000080080200003900020000000a001d0438042e0000040f000000020a000029000000000301001900000060033002700000010f03300197000000200430008c000000200400003900000000040340190000001f0540018f0000000506400272000001bc0000613d0000000007000019000000050870021000000000098a0019000000000881034f000000000808043b00000000008904350000000107700039000000000867004b000001b40000413d000000000750004c000001cb0000613d0000000506600210000000000761034f00000000066a00190000000305500210000000000806043300000000085801cf000000000858022f000000000707043b0000010005500089000000000757022f00000000055701cf000000000585019f0000000000560435000100000003001f0000000102200190000003d80000613d0000001f01400039000000600210018f0000000001a20019000000000221004b00000000020000190000000102004039000001210410009c000000050400002900000003050000290000026b0000213d00000001022001900000026b0000c13d000000400010043f000000200230008c0000029c0000413d00000020021000390000004003000039000000000032043500000000005104350000004003100039000000800200043d000000000023043500000060031000390000011e06400197000000000420004c000001f00000613d00000000040000190000000005340019000000a007400039000000000707043300000000007504350000002004400039000000000524004b000001e90000413d000000000332001900000000000304350000007f022000390000000403000029000000000232016f0000010f030000410000010f0410009c000000000103801900000040011002100000010f0420009c00000000020380190000006002200210000000000112019f00000000020004140000010f0420009c0000000002038019000000c002200210000000000112019f00000125011001c70000800d020000390000000303000039000001260400004100000001050000290438042e0000040f0000000101200190000003d60000c13d0000029c0000013d0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000000310004c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d000000c001000039000000400010043f0000000501000039000000800010043f0000013501000041000000a00010043f0000002001000039000000400200043d000500000002001d00000000021204360000008001000039043804100000040f000000050400002900000000014100490000010f020000410000010f0310009c00000000010280190000010f0340009c000000000204401900000040022002100000006001100210000000000121019f000004390001042e000000040220008a0000011d03000041000000200420008c000000000400001900000000040340190000011d02200197000000000520004c000000000300a0190000011d0220009c00000000020400190000000002036019000000000220004c0000029c0000c13d0000000401100370000000000401043b0000011e0140009c0000029c0000213d0000000001000416000400000001001d00000000010004100000000000100435000000200000043f0000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039000500000004001d043804330000040f000000050400002900000001022001900000029c0000613d000000000101043b000000000201041a00000004050000290000000002520049000000000021041b0000000101000039000000000201041a0000000002520049000000000021041b0000012302000041000000400100043d0000002003100039000000000023043500000060024002100000002403100039000000000023043500000038021000390000000000520435000000380200003900000000002104350000012f0210009c000002ca0000413d000001310100004100000000001004350000004101000039000000040010043f00000132010000410000043a000104300000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000000310004c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029c0000c13d000000400100043d000000120200003900000000002104350000010f020000410000010f0310009c000000000102801900000040011002100000011f011001c7000004390001042e0000000001000416000000000110004c0000029c0000c13d000000040100008a00000000011000310000011d02000041000000000310004c000000000300001900000000030240190000011d01100197000000000410004c000000000200a0190000011d0110009c00000000010300190000000001026019000000000110004c0000029e0000613d00000000010000190000043a00010430000000400100043d000400000001001d043804230000040f00000004030000290000002001300039000001200200004100000000002104350000000301000039000000000013043500000000010300190000002002000039000000400300043d000500000003001d0000000002230436043804100000040f000000050400002900000000014100490000010f020000410000010f0310009c00000000010280190000010f0340009c000000000204401900000040022002100000006001100210000000000121019f000004390001042e000000400100043d00000044021000390000013303000041000000000032043500000024021000390000001f030000390000000000320435000001290200004100000000002104350000000402100039000000200300003900000000003204350000010f020000410000010f0310009c000000000102801900000040011002100000012e011001c70000043a000104300000006007100039000000400070043f00000124020000410000000000270435000000640210003900000020030000390000000000320435000000840310003900000000020104330000000000230435000000a403100039000000000420004c000002df0000613d000000000400001900000000053400190000002004400039000000000614001900000000060604330000000000650435000000000524004b000002d80000413d000000000132001900000000000104350000001f01200039000000200200008a000000000121016f0000010f020000410000010f0370009c00000000030200190000000003074019000000400330021000000044011000390000010f0410009c00000000010280190000006001100210000000000131019f00000000030004140000010f0430009c0000000002034019000000c002200210000000000112019f0000800802000039000300000007001d0438042e0000040f000000030a000029000000000301001900000060033002700000010f03300197000000200430008c000000200400003900000000040340190000001f0540018f0000000506400272000003090000613d0000000007000019000000050870021000000000098a0019000000000881034f000000000808043b00000000008904350000000107700039000000000867004b000003010000413d000000000750004c000003180000613d0000000506600210000000000761034f00000000066a00190000000305500210000000000806043300000000085801cf000000000858022f000000000707043b0000010005500089000000000757022f00000000055701cf000000000585019f0000000000560435000100000003001f0000000102200190000003650000613d0000001f01400039000000600210018f0000000001a20019000000000221004b00000000020000190000000102004039000001210410009c000000050500002900000004040000290000026b0000213d00000001022001900000026b0000c13d000000400010043f000000200230008c0000029c0000413d00000000004104350000010f0200004100000000030004140000010f0430009c00000000030280190000010f0410009c00000000010280190000004001100210000000c002300210000000000112019f0000012b011001c70000011e065001970000800d020000390000000303000039000001300400004100000000050004110438042e0000040f0000000101200190000003d60000c13d0000029c0000013d000400000003001d0000000000400435000000200000043f0000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039000500000004001d000300000005001d043804330000040f000000050300002900000001022001900000029c0000613d000000000101043b000000000201041a0000000401000029000000000112004b0000039f0000813d000000400100043d00000044021000390000012d03000041000000000032043500000024021000390000001f030000390000000000320435000001290200004100000000002104350000000402100039000000200300003900000000003204350000010f020000410000010f0310009c000000000102801900000040011002100000012e011001c70000043a00010430000000400200043d0000001f0430018f0000000503300272000003720000613d000000000500001900000005065002100000000007620019000000000661034f000000000606043b00000000006704350000000105500039000000000635004b0000036a0000413d000000000540004c000003810000613d0000000503300210000000000131034f00000000033200190000000304400210000000000503043300000000054501cf000000000545022f000000000101043b0000010004400089000000000141022f00000000014101cf000000000151019f00000000001304350000010f0100004100000001030000310000010f0430009c00000000030180190000010f0420009c000000000102401900000040011002100000006002300210000000000112019f0000043a00010430000000000021041b000000400100043d00000000004104350000010f0200004100000000030004140000010f0430009c00000000030280190000010f0410009c00000000010280190000004001100210000000c002300210000000000112019f0000012b011001c70000800d02000039000000020300003900000134040000410438042e0000040f00000001012001900000029c0000613d000003d60000013d000200000002001d0000000000300435000000200000043f0000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039043804330000040f000000030300002900000001022001900000029c0000613d000000040200002900000002040000290000000002240049000000000101043b000000000021041b00000000003004350000010f0100004100000000020004140000010f0320009c0000000001024019000000c00110021000000122011001c70000801002000039043804330000040f0000000306000029000000050500002900000001022001900000029c0000613d000000000101043b000000000201041a00000004030000290000000002320019000000000021041b000000400100043d00000000003104350000010f0200004100000000030004140000010f0430009c00000000030280190000010f0410009c00000000010280190000004001100210000000c002300210000000000112019f0000012b011001c70000800d0200003900000003030000390000012c040000410438042e0000040f00000001012001900000029c0000613d0000000001000019000004390001042e000000400200043d0000001f0430018f0000000503300272000003e50000613d000000000500001900000005065002100000000007620019000000000661034f000000000606043b00000000006704350000000105500039000000000635004b000003dd0000413d000000000540004c000003f40000613d0000000503300210000000000131034f00000000033200190000000304400210000000000503043300000000054501cf000000000545022f000000000101043b0000010004400089000000000141022f00000000014101cf000000000151019f00000000001304350000010f0100004100000001030000310000010f0430009c00000000030180190000010f0420009c000000000102401900000040011002100000006002300210000000000112019f0000043a000104300000010f0200004100000000030004140000010f0430009c00000000030280190000010f0410009c00000000010280190000004001100210000000c002300210000000000112019f00000122011001c70000801002000039043804330000040f00000001022001900000040e0000613d000000000101043b000000000001042d00000000010000190000043a0001043000000000030104330000000002320436000000000430004c0000041c0000613d000000000400001900000000052400190000002004400039000000000614001900000000060604330000000000650435000000000534004b000004150000413d000000000123001900000000000104350000001f01300039000000200300008a000000000131016f0000000001120019000000000001042d000001360210009c000004280000813d0000004001100039000000400010043f000000000001042d000001310100004100000000001004350000004101000039000000040010043f00000132010000410000043a0001043000000431002104210000000102000039000000000001042d0000000002000019000000000001042d00000436002104230000000102000039000000000001042d0000000002000019000000000001042d0000043800000432000004390001042e0000043a00010430000000000000000000000000000000000000000000000000000000000000000000000000ffffffff00000002000000000000000000000000000000400000010000000000000000000000000000000000000000000000000000000000000000000000000051cff8d80000000000000000000000000000000000000000000000000000000084bc3eaf0000000000000000000000000000000000000000000000000000000084bc3eb00000000000000000000000000000000000000000000000000000000095d89b41000000000000000000000000000000000000000000000000000000009cc7f7080000000000000000000000000000000000000000000000000000000051cff8d900000000000000000000000000000000000000000000000000000000579952fc00000000000000000000000000000000000000000000000000000000313ce56600000000000000000000000000000000000000000000000000000000313ce5670000000000000000000000000000000000000000000000000000000040c10f190000000000000000000000000000000000000000000000000000000006fdde030000000000000000000000000000000000000000000000000000000018160ddd8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000200000000000000000000000004554480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffff02000000000000000000000000000000000000400000000000000000000000006c0960f90000000000000000000000000000000000000000000000000000000062f84b24000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000c405fe8958410bbaf0c73b7a0c3e20859e86ca168a4c9b0def9c54d2555a306b616c206163636573732063616e2063616c6c2074686973206d6574686f6400004f6e6c792073797374656d20636f6e747261637473207769746820737065636908c379a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000840000000000000000000000000200000000000000000000000000000000000020000000000000000000000000ddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef5472616e7366657220616d6f756e7420657863656564732062616c616e6365000000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffa02717ead6b9200dd235aad468c9809ea400fe33ac69b5bfaa6d3e90fc922b63984e487b7100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002400000000000000000000000043616c6c61626c65206f6e6c792062792074686520626f6f746c6f61646572000f6798a560793a54c3bcfe86a93cde1e73087d944c0ea20544137d41213968854574686572000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffc00000000000000000000000000000000000000000000000000000000000000000ddc5dc721c8b9bd2a24f5a4211a9d7f39ea650f0bf2a7a3469174fb210e6355e |

  @id266:I @testnet 
  Scenario Outline: Check "<Row>" hashes copying on Block page
    Given I go to page "/block/1"
    When I click on the copy button with "<Row>" row on "Block" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row             | Text                                                               |
      | Root hash       | 0x51f81bcdfc324a0dff2b5bec9d92e21cbebc4d5e29d3a3d30de3e03fbeab8d7f |
      | Commit tx hash  | 0x6ad6a118e09a27e39ee57c63e812953788de4974987c76bc954c14a8c32688e8 |
      | Prove tx hash   | 0xfbd3a89cee83e4f28999bc8fd5e96d133b7ebc367d5c7026f173d21687998379 |
      | Execute tx hash | 0x5131c1bb47dca3d42ccdfd12d1ab7224cbb88fb9ad91b94e2da26631602f6fab |

  @id266:III @mainnet 
  Scenario Outline: Check "<Row>" hashes copying on Block page
    Given I go to page "/block/1"
    When I click on the copy button with "<Row>" row on "Block" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row             | Text                                                               |
      | Root hash       | 0x51f81bcdfc324a0dff2b5bec9d92e21cbebc4d5e29d3a3d30de3e03fbeab8d7f |
      | Commit tx hash  | 0x33143afba6c91f77d18b0d7a50248e6255461ec0e0cd80a06d3bd86f2686768c |
      | Prove tx hash   | 0x424cdbfb877178a909fbbe6dca6ef131a752e6c91c8b24470d919e30c06e3692 |
      | Execute tx hash | 0x51425089db3b2ce38b1893ec2f1dc23e3f5db8e9f48f06bb624e99d77fe76aca |

  @id244:I
  Scenario Outline: Check account address hashes copying for Account page
    Given I go to page "/address/0x000000000000000000000000000000000000800A"
    When I click on the copy button with "<Row>" row on "Account" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row     | Text                                       |
      | Address | 0x000000000000000000000000000000000000800A |
# related to ZKF-2551. It needs to be uncommented after the fix of the main issue.
#  @id244:II
#  Scenario: Check token address hashes copying for Account page
#    Given I go to page "/address/0xE60EB4Bbd3F8EA522CBFA8025b8763442FaDe55e"
#    When I click on the copy button for the first token asset
#    And Element with "text" "Copied!" should be "visible"
#    Then Clipboard value is not empty

  @id275 @testnet @testnetSmokeSuite
  Scenario Outline: Check "<Row>" hashes copying for Tokens page
    Given I go to page "/tokenlist"
    When I click on the copy button with "<Row>" row on "Tokens" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row             | Text                                       |
      | ETH             | 0x000000000000000000000000000000000000800A |
      | USDC            | 0x0faF6df7054946141266420b43783387A78d82A9 |
      | DAI             | 0x3e7676937A7E96CFB7616f255b9AD9FF47363D4b |
      | wBTC            | 0x0BfcE1D53451B4a8175DD94e6e029F7d8a701e9c |
      | LINK            | 0x40609141Db628BeEE3BfAB8034Fc2D8278D0Cc78 |

  @id275:I @mainnet
  Scenario Outline: Check "<Row>" hashes copying for Tokens page
    Given I go to page "/tokenlist"
    When I click on the copy button with "<Row>" row on "Tokens" page
    And Element with "text" "Copied!" should be "visible"
    Then Clipboard contains "<Text>" value

    Examples:
      | Row             | Text                                       |
      | ETH             | 0x000000000000000000000000000000000000800A |
      | USDC            | 0x3355df6D4c9C3035724Fd0e3914dE96A5a83aaf4 |
      | MUTE            | 0x0e97C7a0F8B2C9885C8ac9fC6136e829CbC21d42 |
      | COMBO           | 0xc2B13Bb90E33F1E191b8aA8F44Ce11534D5698E3 |
      | PERP            | 0x42c1c56be243c250AB24D2ecdcC77F9cCAa59601 |
