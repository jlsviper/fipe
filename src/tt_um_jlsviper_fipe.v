module tt_um_jlsviper_fipe (
    ena,
    uio_in,
    rst_n,
    clk,
    ui_in,
    uo_out,
    uio_out,
    uio_oe
);

    input ena;
    input [7:0] uio_in;
    input rst_n;
    input clk;
    input [7:0] ui_in;
    output [7:0] uo_out;
    output [7:0] uio_out;
    output [7:0] uio_oe;

    /* signal declarations */
    wire _368 = 1'b0;
    wire _367 = 1'b0;
    wire [1:0] _379 = 2'b01;
    wire _380;
    wire [1:0] _376 = 2'b01;
    wire _377;
    wire [1:0] _373 = 2'b01;
    wire _374;
    wire [1:0] _370 = 2'b01;
    wire _371;
    wire _366;
    wire _372;
    wire _355;
    wire _375;
    wire _293;
    wire _378;
    wire _282;
    wire _381;
    wire _2;
    reg pin0_out;
    wire _419 = 1'b0;
    wire _418 = 1'b0;
    wire [1:0] _430 = 2'b01;
    wire _431;
    wire [1:0] _427 = 2'b01;
    wire _428;
    wire [1:0] _424 = 2'b01;
    wire _425;
    wire [1:0] _421 = 2'b01;
    wire _422;
    wire _417;
    wire _423;
    wire _408;
    wire _426;
    wire _399;
    wire _429;
    wire _390;
    wire _432;
    wire _3;
    reg pin1_out;
    wire _470 = 1'b0;
    wire _469 = 1'b0;
    wire [1:0] _481 = 2'b01;
    wire _482;
    wire [1:0] _478 = 2'b01;
    wire _479;
    wire [1:0] _475 = 2'b01;
    wire _476;
    wire [1:0] _472 = 2'b01;
    wire _473;
    wire _468;
    wire _474;
    wire _459;
    wire _477;
    wire _450;
    wire _480;
    wire _441;
    wire _483;
    wire _4;
    reg pin2_out;
    wire _521 = 1'b0;
    wire _520 = 1'b0;
    wire [1:0] _532 = 2'b01;
    wire _533;
    wire [1:0] _529 = 2'b01;
    wire _530;
    wire [1:0] _526 = 2'b01;
    wire _527;
    wire [1:0] _523 = 2'b01;
    wire _524;
    wire _519;
    wire _525;
    wire _510;
    wire _528;
    wire _501;
    wire _531;
    wire _492;
    wire _534;
    wire _5;
    reg pin3_out;
    wire _572 = 1'b0;
    wire _571 = 1'b0;
    wire [1:0] _583 = 2'b01;
    wire _584;
    wire [1:0] _580 = 2'b01;
    wire _581;
    wire [1:0] _577 = 2'b01;
    wire _578;
    wire [1:0] _574 = 2'b01;
    wire _575;
    wire _570;
    wire _576;
    wire _561;
    wire _579;
    wire _552;
    wire _582;
    wire _543;
    wire _585;
    wire _6;
    reg pin4_out;
    wire _623 = 1'b0;
    wire _622 = 1'b0;
    wire [1:0] _634 = 2'b01;
    wire _635;
    wire [1:0] _631 = 2'b01;
    wire _632;
    wire [1:0] _628 = 2'b01;
    wire _629;
    wire [1:0] _625 = 2'b01;
    wire _626;
    wire _621;
    wire _627;
    wire _612;
    wire _630;
    wire _603;
    wire _633;
    wire _594;
    wire _636;
    wire _7;
    reg pin5_out;
    wire _674 = 1'b0;
    wire _673 = 1'b0;
    wire [1:0] _685 = 2'b01;
    wire _686;
    wire [1:0] _682 = 2'b01;
    wire _683;
    wire [1:0] _679 = 2'b01;
    wire _680;
    wire [1:0] _676 = 2'b01;
    wire _677;
    wire _672;
    wire _678;
    wire _663;
    wire _681;
    wire _654;
    wire _684;
    wire _645;
    wire _687;
    wire _8;
    reg pin6_out;
    wire _725 = 1'b0;
    wire _724 = 1'b0;
    wire [1:0] _736 = 2'b01;
    wire _737;
    wire [1:0] _733 = 2'b01;
    wire _734;
    wire [1:0] _730 = 2'b01;
    wire _731;
    wire [1:0] _727 = 2'b01;
    wire _728;
    wire _723;
    wire _729;
    wire _714;
    wire _732;
    wire _705;
    wire _735;
    wire _696;
    wire _738;
    wire _9;
    reg pin7_out;
    wire [7:0] _739;
    wire [6:0] _5760 = 7'b0000000;
    wire [6:0] _5759 = 7'b0000000;
    wire [3:0] _5755 = 4'b0000;
    wire _5756;
    wire _5757;
    wire _5752;
    wire _5753;
    wire _5754;
    wire [6:0] _5758;
    reg [6:0] _5761;
    wire _5747 = 1'b0;
    wire _5746 = 1'b0;
    wire [31:0] _5723 = 32'b00000000000000000000000000000000;
    wire [31:0] _5722 = 32'b00000000000000000000000000000000;
    wire _5727 = 1'b0;
    wire [30:0] _5726;
    wire [31:0] _5728;
    wire [31:0] _5700 = 32'b01000110010010010101000001000101;
    wire [31:0] _5699 = 32'b00000000000000000000000000000000;
    wire [31:0] _5698 = 32'b00000000000000000000000000000000;
    wire [31:0] _5697 = 32'b00000000000000000000000000000000;
    wire [31:0] _5696 = 32'b00000000000000000000000000000000;
    wire [31:0] _5695 = 32'b00000000000000000000000000000000;
    wire [31:0] _5694 = 32'b00000000000000000000000000000000;
    wire [31:0] _5693 = 32'b00000000000000000000000000000000;
    wire [31:0] _5692 = 32'b00000000000000000000000000000000;
    wire [31:0] _5691 = 32'b00000000000000000000000000000000;
    wire [31:0] _5690 = 32'b00000000000000000000000000000000;
    wire [31:0] _5689 = 32'b00000000000000000000000000000000;
    wire [31:0] _5688 = 32'b00000000000000000000000000000000;
    wire [31:0] _5687 = 32'b00000000000000000000000000000000;
    wire [31:0] _5686 = 32'b00000000000000000000000000000000;
    wire [31:0] _5685 = 32'b00000000000000000000000000000000;
    wire [31:0] _5684 = 32'b00000000000000000000000000000000;
    wire [31:0] _5683 = 32'b00000000000000000000000000000000;
    wire [31:0] _5682 = 32'b00000000000000000000000000000000;
    wire [31:0] _5681 = 32'b00000000000000000000000000000000;
    wire [31:0] _5680 = 32'b00000000000000000000000000000000;
    wire [31:0] _5679;
    wire [7:0] _5677 = 8'b00000000;
    wire [31:0] _5678;
    wire [2:0] _5674 = 3'b000;
    wire [14:0] _5675;
    wire [16:0] _5673 = 17'b00000000000000000;
    wire [31:0] _5676;
    wire [31:0] _754 = 32'b00000000000000000000000000000000;
    wire [31:0] _753 = 32'b00000000000000000000000000000000;
    wire [31:0] _784 = 32'b00000000000000000000000000000000;
    wire _779;
    wire _778;
    wire _777;
    wire _776;
    wire _775;
    wire _774;
    wire _773;
    wire _772;
    reg _780;
    wire _770;
    wire _769;
    wire _768;
    wire _767;
    wire _766;
    wire _765;
    wire _764;
    wire _763;
    reg _771;
    wire _781;
    wire [30:0] _756;
    wire [31:0] _782;
    wire [31:0] _783;
    wire [31:0] _785;
    wire [31:0] _11;
    reg [31:0] _755;
    wire [31:0] _5672 = 32'b00000000000000000000000000000000;
    wire _1134 = 1'b0;
    wire _1133 = 1'b0;
    wire _1136;
    wire _1137;
    wire _1139;
    wire _12;
    reg seq_b_halted;
    wire _1141 = 1'b0;
    wire _1140 = 1'b0;
    wire [23:0] _1147;
    wire [23:0] _1148;
    wire _1149;
    wire _1150;
    wire [23:0] _1143;
    wire [23:0] _1144;
    wire _1145;
    wire _1146;
    wire _1151;
    wire _1152;
    wire _1153;
    wire _13;
    reg _1142;
    wire _1219 = 1'b0;
    wire _1218 = 1'b0;
    wire [23:0] _1168 = 24'b000000000000000000000000;
    wire [23:0] _1167 = 24'b000000000000000000000000;
    wire [23:0] _1213;
    wire [23:0] _14;
    reg [23:0] queue_b_last_due;
    wire [23:0] _1222;
    wire _1223;
    wire _1215 = 1'b0;
    wire _1214 = 1'b0;
    wire _1217;
    wire _15;
    reg queue_b_last_valid;
    wire _1221;
    wire _1224;
    wire _1225;
    wire _1226;
    wire _16;
    reg _1220;
    wire _1228 = 1'b0;
    wire _1227 = 1'b0;
    wire [23:0] _1234 = 24'b110000000000000000000000;
    wire _1235;
    wire _1232;
    wire [23:0] _1230;
    wire _1231;
    wire _1233;
    wire _1236;
    wire _1237;
    wire _1238;
    wire _1239;
    wire _17;
    reg _1229;
    wire _1241 = 1'b0;
    wire _1240 = 1'b0;
    wire _1243;
    wire _1244;
    wire _18;
    reg seq_b_trapped;
    wire [4:0] _5670 = 5'b00000;
    wire [5:0] _1246 = 6'b000000;
    wire [5:0] _1245 = 6'b000000;
    wire [5:0] _1255 = 6'b000000;
    wire [5:0] _1252 = 6'b000001;
    wire [5:0] _1253;
    wire [5:0] _1248 = 6'b111111;
    wire _1249;
    wire _1250;
    wire [1:0] _749 = 2'b11;
    wire _750;
    wire _751;
    wire [1:0] _746 = 2'b11;
    wire _747;
    wire _748;
    wire _752;
    wire _1251;
    wire [5:0] _1254;
    wire _745;
    wire [5:0] _1256;
    wire [5:0] _19;
    reg [5:0] _1247;
    wire [6:0] _5669 = 7'b0000000;
    wire [1:0] _5668 = 2'b00;
    wire [31:0] _5671;
    wire [19:0] _5666 = 20'b00000000000000000000;
    wire [31:0] _5667;
    wire [31:0] _5665;
    wire [7:0] _5663 = 8'b00000000;
    wire [31:0] _5664;
    wire [7:0] _5661 = 8'b00000000;
    wire [31:0] _5662;
    wire [2:0] _5658 = 3'b000;
    wire [14:0] _5659;
    wire [16:0] _5657 = 17'b00000000000000000;
    wire [31:0] _5660;
    wire [31:0] _5656 = 32'b00000000000000000000000000000000;
    wire [31:0] _5655 = 32'b00000000000000000000000000000000;
    wire [31:0] _5654 = 32'b00000000000000000000000000000000;
    wire [7:0] _1462 = 8'b00000000;
    wire [7:0] _1461 = 8'b00000000;
    wire [7:0] _1471 = 8'b00000000;
    wire [7:0] _1467 = 8'b00000001;
    wire [7:0] _1468;
    wire [7:0] _1464 = 8'b11111111;
    wire _1465;
    wire _1466;
    wire [7:0] _1469;
    wire [7:0] _1470;
    wire [7:0] _1472;
    wire [7:0] _20;
    reg [7:0] mon0_intervals;
    wire [7:0] _1655 = 8'b00000000;
    wire [7:0] _1654 = 8'b00000000;
    wire [7:0] _1664 = 8'b00000000;
    wire [7:0] _1660 = 8'b00000001;
    wire [7:0] _1661;
    wire [7:0] _1657 = 8'b11111111;
    wire _1658;
    wire _1659;
    wire [7:0] _1662;
    wire [7:0] _1663;
    wire [7:0] _1665;
    wire [7:0] _21;
    reg [7:0] mon1_intervals;
    wire [7:0] _1848 = 8'b00000000;
    wire [7:0] _1847 = 8'b00000000;
    wire [7:0] _1857 = 8'b00000000;
    wire [7:0] _1853 = 8'b00000001;
    wire [7:0] _1854;
    wire [7:0] _1850 = 8'b11111111;
    wire _1851;
    wire _1852;
    wire [7:0] _1855;
    wire [7:0] _1856;
    wire [7:0] _1858;
    wire [7:0] _22;
    reg [7:0] mon2_intervals;
    wire [7:0] _2041 = 8'b00000000;
    wire [7:0] _2040 = 8'b00000000;
    wire [7:0] _2050 = 8'b00000000;
    wire [7:0] _2046 = 8'b00000001;
    wire [7:0] _2047;
    wire [7:0] _2043 = 8'b11111111;
    wire _2044;
    wire _2045;
    wire [7:0] _2048;
    wire [7:0] _2049;
    wire [7:0] _2051;
    wire [7:0] _23;
    reg [7:0] mon3_intervals;
    wire [31:0] _5653;
    wire [15:0] _2053 = 16'b0000000000000000;
    wire [15:0] _2052 = 16'b0000000000000000;
    wire [15:0] _2058 = 16'b1111111111111111;
    wire _2055;
    wire [15:0] _2056;
    wire [15:0] _2057;
    wire [15:0] _2059;
    wire [15:0] _24;
    reg [15:0] mon3_min_seen;
    wire [15:0] _2061 = 16'b0000000000000000;
    wire [15:0] _2060 = 16'b0000000000000000;
    wire [15:0] _2066 = 16'b0000000000000000;
    wire _2063;
    wire [15:0] _2064;
    wire _2039;
    wire [15:0] _2065;
    wire [15:0] _2067;
    wire [15:0] _25;
    reg [15:0] mon3_max_seen;
    wire [31:0] _5652;
    wire [15:0] _2069 = 16'b0000000000000000;
    wire [15:0] _2068 = 16'b0000000000000000;
    wire [15:0] _2074 = 16'b1111111111111111;
    wire _2071;
    wire [15:0] _2072;
    wire [15:0] _2073;
    wire [15:0] _2075;
    wire [15:0] _26;
    reg [15:0] mon2_min_seen;
    wire [15:0] _2077 = 16'b0000000000000000;
    wire [15:0] _2076 = 16'b0000000000000000;
    wire [15:0] _2082 = 16'b0000000000000000;
    wire _2079;
    wire [15:0] _2080;
    wire _1846;
    wire [15:0] _2081;
    wire [15:0] _2083;
    wire [15:0] _27;
    reg [15:0] mon2_max_seen;
    wire [31:0] _5651;
    wire [15:0] _2085 = 16'b0000000000000000;
    wire [15:0] _2084 = 16'b0000000000000000;
    wire [15:0] _2090 = 16'b1111111111111111;
    wire _2087;
    wire [15:0] _2088;
    wire [15:0] _2089;
    wire [15:0] _2091;
    wire [15:0] _28;
    reg [15:0] mon1_min_seen;
    wire [15:0] _2093 = 16'b0000000000000000;
    wire [15:0] _2092 = 16'b0000000000000000;
    wire [15:0] _2098 = 16'b0000000000000000;
    wire _2095;
    wire [15:0] _2096;
    wire _1653;
    wire [15:0] _2097;
    wire [15:0] _2099;
    wire [15:0] _29;
    reg [15:0] mon1_max_seen;
    wire [31:0] _5650;
    wire [15:0] _2101 = 16'b0000000000000000;
    wire [15:0] _2100 = 16'b0000000000000000;
    wire [15:0] _2106 = 16'b1111111111111111;
    wire _2103;
    wire [15:0] _2104;
    wire [15:0] _2105;
    wire [15:0] _2107;
    wire [15:0] _30;
    reg [15:0] mon0_min_seen;
    wire [15:0] _2109 = 16'b0000000000000000;
    wire [15:0] _2108 = 16'b0000000000000000;
    wire [15:0] _2114 = 16'b0000000000000000;
    wire _2111;
    wire [15:0] _2112;
    wire _1460;
    wire [15:0] _2113;
    wire [15:0] _2115;
    wire [15:0] _31;
    reg [15:0] mon0_max_seen;
    wire [31:0] _5649;
    wire [31:0] _5648 = 32'b00000000000000000000000000000000;
    wire [31:0] _5647 = 32'b00000000000000000000000000000000;
    wire [31:0] _5646 = 32'b00000000000000000000000000000000;
    wire [31:0] _5645 = 32'b00000000000000000000000000000000;
    wire [17:0] _5643 = 18'b000000000000000000;
    wire [31:0] _5644;
    wire [4:0] _5640 = 5'b00000;
    wire [4:0] _5639 = 5'b00000;
    wire [4:0] _5637 = 5'b00000;
    wire [4:0] _5636 = 5'b00000;
    wire [4:0] _5635;
    reg [4:0] _5638;
    reg [4:0] _5641;
    wire [26:0] _5634 = 27'b000000000000000000000000000;
    wire [31:0] _5642;
    wire [31:0] _2125 = 32'b00000000000000000000000000000000;
    wire [31:0] _2124 = 32'b00000000000000000000000000000000;
    wire [31:0] _2149 = 32'b00000000000000000000000000000000;
    wire _2144;
    wire _2143;
    wire _2142;
    wire _2141;
    wire _2140;
    wire _2139;
    wire _2138;
    wire _2137;
    reg _2145;
    wire _2135;
    wire _2134;
    wire _2133;
    wire _2132;
    wire _2131;
    wire _2130;
    wire _2129;
    wire _2128;
    reg _2136;
    wire _2146;
    wire [30:0] _2127;
    wire [31:0] _2147;
    wire [31:0] _2148;
    wire [31:0] _2150;
    wire [31:0] _32;
    reg [31:0] _2126;
    wire _2499 = 1'b0;
    wire _2498 = 1'b0;
    wire _2501;
    wire _2502;
    wire _2503;
    wire _33;
    reg seq_a_halted;
    wire _2505 = 1'b0;
    wire _2504 = 1'b0;
    wire [23:0] _2511;
    wire [23:0] _2512;
    wire _2513;
    wire _2514;
    wire [23:0] _2507;
    wire [23:0] _2508;
    wire _2509;
    wire _2510;
    wire _2515;
    wire _2516;
    wire _2517;
    wire _34;
    reg _2506;
    wire _2583 = 1'b0;
    wire _2582 = 1'b0;
    wire [23:0] _2532 = 24'b000000000000000000000000;
    wire [23:0] _2531 = 24'b000000000000000000000000;
    wire [23:0] _2577;
    wire [23:0] _35;
    reg [23:0] queue_a_last_due;
    wire [23:0] _2586;
    wire _2587;
    wire _2579 = 1'b0;
    wire _2578 = 1'b0;
    wire _2581;
    wire _36;
    reg queue_a_last_valid;
    wire _2585;
    wire _2588;
    wire _2589;
    wire _2590;
    wire _37;
    reg _2584;
    wire _2592 = 1'b0;
    wire _2591 = 1'b0;
    wire [23:0] _2598 = 24'b110000000000000000000000;
    wire _2599;
    wire _2596;
    wire [23:0] _2594;
    wire _2595;
    wire _2597;
    wire _2600;
    wire _2601;
    wire _2602;
    wire _2603;
    wire _38;
    reg _2593;
    wire _2605 = 1'b0;
    wire _2604 = 1'b0;
    wire _2607;
    wire _2608;
    wire _39;
    reg seq_a_trapped;
    wire [4:0] _5632 = 5'b00000;
    wire [5:0] _2610 = 6'b000000;
    wire [5:0] _2609 = 6'b000000;
    wire [5:0] _2619 = 6'b000000;
    wire [5:0] _2616 = 6'b000001;
    wire [5:0] _2617;
    wire [5:0] _2612 = 6'b111111;
    wire _2613;
    wire _2614;
    wire [1:0] _2120 = 2'b11;
    wire _2121;
    wire _2122;
    wire [1:0] _2117 = 2'b11;
    wire _2118;
    wire _2119;
    wire _2123;
    wire _2615;
    wire [5:0] _2618;
    wire _743 = 1'b0;
    wire _742 = 1'b0;
    wire _740;
    wire _741;
    reg ctrl_bit2;
    wire _2116;
    wire [5:0] _2620;
    wire [5:0] _40;
    reg [5:0] _2611;
    wire [1:0] _5631 = 2'b00;
    wire _2732 = 1'b0;
    wire _2731 = 1'b0;
    wire _2728;
    wire [15:0] _2725;
    wire _2726;
    wire _2723;
    wire _1361;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    wire _1355;
    wire _1354;
    reg _1362;
    wire _1363;
    wire _1348;
    wire _1347;
    wire _1346;
    wire _1345;
    wire _1344;
    wire _1343;
    wire _1342;
    wire _1341;
    reg _1349;
    wire _1350;
    wire _1364;
    wire _1333;
    wire _1334;
    wire _1365;
    wire _1329;
    wire _1327;
    wire _1326;
    wire _1325;
    wire _1324;
    wire _1323;
    wire _1322;
    wire _1321;
    wire _1320;
    wire [2:0] _1319;
    reg _1328;
    wire _1330;
    wire _1317;
    wire _1318;
    wire _1331;
    wire _1315;
    wire _1313;
    wire _1314;
    wire _1310;
    wire _1309;
    wire _1308;
    wire _1307;
    wire _1306;
    wire _1305;
    wire _1304;
    wire _1303;
    reg _1311;
    wire _1300;
    wire _1299;
    wire _1298;
    wire _1297;
    wire _1296;
    wire _1295;
    wire _1294;
    wire _1293;
    wire [2:0] _1283;
    reg _1301;
    wire _1302;
    wire _1312;
    wire [1:0] _1282;
    reg _1316;
    wire _1332;
    wire _1366;
    wire _1273 = 1'b0;
    wire _1272 = 1'b0;
    wire _2693;
    wire _1458;
    wire _1383;
    wire [15:0] _1378 = 16'b0000000000000000;
    wire [15:0] _1377 = 16'b0000000000000000;
    wire [15:0] _2718 = 16'b0000000000000001;
    wire [15:0] _2715 = 16'b0000000000000001;
    wire [15:0] _2716;
    wire [15:0] _2711 = 16'b1111111111111111;
    wire _2712;
    wire _2713;
    wire [11:0] _2707 = 12'b111111111111;
    wire _2708;
    wire [7:0] _2705 = 8'b11111111;
    wire [7:0] _2704;
    wire _2706;
    wire [3:0] _2702 = 4'b1111;
    wire [3:0] _2701;
    wire _2703;
    wire [1:0] _2697;
    reg _2709;
    wire _2710;
    wire _2714;
    wire [15:0] _2717;
    wire [15:0] _2719;
    wire [15:0] _2720;
    wire [15:0] _41;
    reg [15:0] mon0_count_cycles;
    wire [6:0] _1372 = 7'b1001001;
    wire _1373;
    wire _1374;
    wire [31:0] _1371 = 32'b00000000000000000000000000000000;
    wire [31:0] _1370 = 32'b00000000000000000000000000000000;
    reg [31:0] _1375;
    wire [15:0] _1376;
    wire _1380;
    wire _1369;
    wire _1381;
    wire _1368;
    wire _1382;
    wire _1384;
    wire _1459;
    wire _1456;
    wire _1449;
    wire _1448;
    wire _1447;
    wire _1446;
    wire _1445;
    wire _1444;
    wire _1443;
    wire _1442;
    reg _1450;
    wire _1451;
    wire _1439;
    wire _1438;
    wire _1437;
    wire _1436;
    wire _1435;
    wire _1434;
    wire _1433;
    wire _1432;
    reg _1440;
    wire _1441;
    wire _1452;
    wire _1430;
    wire _1431;
    wire _1453;
    wire _1426;
    wire _1424;
    wire _1423;
    wire _1422;
    wire _1421;
    wire _1420;
    wire _1419;
    wire _1418;
    wire _1417;
    wire [2:0] _1416;
    reg _1425;
    wire _1427;
    wire _1414;
    wire _1415;
    wire _1428;
    wire _1412;
    wire _1410;
    wire _1411;
    wire _1407;
    wire _1406;
    wire _1405;
    wire _1404;
    wire _1403;
    wire _1402;
    wire _1401;
    wire _1400;
    reg _1408;
    wire _1397;
    wire _1396;
    wire _1395;
    wire _1394;
    wire _1393;
    wire _1392;
    wire _1391;
    wire _1390;
    wire [2:0] _1389;
    reg _1398;
    wire _1399;
    wire _1409;
    wire [1:0] _1388;
    reg _1413;
    wire _1429;
    wire _1454;
    wire _1386;
    wire _1385;
    wire _1387;
    wire _1455;
    wire _1457;
    wire _2689;
    wire _2690;
    wire _2691;
    wire _2692;
    wire _2694;
    wire _2695;
    wire _2682;
    wire _2681;
    wire _2680;
    wire _2679;
    wire _2678;
    wire _2677;
    wire _2676;
    wire _2675;
    reg _2683;
    wire _2684;
    wire _2672;
    wire _2671;
    wire _2670;
    wire _2669;
    wire _2668;
    wire _2667;
    wire _2666;
    wire _2665;
    reg _2673;
    wire _2674;
    wire _2685;
    wire _2663;
    wire _2664;
    wire _2686;
    wire _2659;
    wire _2657;
    wire _2656;
    wire _2655;
    wire _2654;
    wire _2653;
    wire _2652;
    wire _2651;
    wire _2650;
    wire [2:0] _2649;
    reg _2658;
    wire _2660;
    wire _2647;
    wire _2648;
    wire _2661;
    wire _2645;
    wire _2643;
    wire _2644;
    wire _2640;
    wire _2639;
    wire _2638;
    wire _2637;
    wire _2636;
    wire _2635;
    wire _2634;
    wire _2633;
    reg _2641;
    wire _2630;
    wire _2629;
    wire _2628;
    wire _2627;
    wire _2626;
    wire _2625;
    wire _2624;
    wire _2623;
    wire [2:0] _2622;
    reg _2631;
    wire _2632;
    wire _2642;
    wire [6:0] _1278 = 7'b1001000;
    wire _1279;
    wire _1280;
    wire [31:0] _1277 = 32'b00000000000000000000000000000000;
    wire [31:0] _1276 = 32'b00000000000000000000000000000000;
    reg [31:0] _1281;
    wire [1:0] _2621;
    reg _2646;
    wire _2662;
    wire _2687;
    wire _2688;
    wire _2696;
    wire _2721;
    wire _2722;
    wire _42;
    reg mon0_armed;
    wire [6:0] _1266 = 7'b1001010;
    wire _1267;
    wire _1268;
    wire [7:0] _1265 = 8'b00000000;
    wire [7:0] _1264 = 8'b00000000;
    wire [7:0] _1263;
    reg [7:0] _1269;
    wire [23:0] _1262 = 24'b000000000000000000000000;
    wire [31:0] _1270;
    wire _1271;
    wire _1275;
    wire _1367;
    wire _2724;
    wire _2727;
    wire _2729;
    wire _2730;
    wire _2734;
    wire _2735;
    wire _43;
    reg mon0_sticky;
    wire _2844 = 1'b0;
    wire _2843 = 1'b0;
    wire _2840;
    wire [15:0] _2837;
    wire _2838;
    wire _2835;
    wire _1554;
    wire _1553;
    wire _1552;
    wire _1551;
    wire _1550;
    wire _1549;
    wire _1548;
    wire _1547;
    reg _1555;
    wire _1556;
    wire _1544;
    wire _1543;
    wire _1542;
    wire _1541;
    wire _1540;
    wire _1539;
    wire _1538;
    wire _1537;
    reg _1545;
    wire _1546;
    wire _1557;
    wire _1535;
    wire _1536;
    wire _1558;
    wire _1531;
    wire _1529;
    wire _1528;
    wire _1527;
    wire _1526;
    wire _1525;
    wire _1524;
    wire _1523;
    wire _1522;
    wire [2:0] _1521;
    reg _1530;
    wire _1532;
    wire _1519;
    wire _1520;
    wire _1533;
    wire _1517;
    wire _1515;
    wire _1516;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire _1507;
    wire _1506;
    wire _1505;
    reg _1513;
    wire _1502;
    wire _1501;
    wire _1500;
    wire _1499;
    wire _1498;
    wire _1497;
    wire _1496;
    wire _1495;
    wire [2:0] _1494;
    reg _1503;
    wire _1504;
    wire _1514;
    wire [1:0] _1493;
    reg _1518;
    wire _1534;
    wire _1559;
    wire _1484 = 1'b0;
    wire _1483 = 1'b0;
    wire _2808;
    wire _1651;
    wire _1576;
    wire [15:0] _1571 = 16'b0000000000000000;
    wire [15:0] _1570 = 16'b0000000000000000;
    wire [15:0] _2830 = 16'b0000000000000001;
    wire [15:0] _2827 = 16'b0000000000000001;
    wire [15:0] _2828;
    wire [15:0] _2823 = 16'b1111111111111111;
    wire _2824;
    wire _2825;
    wire [11:0] _2819 = 12'b111111111111;
    wire _2820;
    wire [7:0] _2817 = 8'b11111111;
    wire [7:0] _2816;
    wire _2818;
    wire [3:0] _2814 = 4'b1111;
    wire [3:0] _2813;
    wire _2815;
    wire [1:0] _2812;
    reg _2821;
    wire _2822;
    wire _2826;
    wire [15:0] _2829;
    wire [15:0] _2831;
    wire [15:0] _2832;
    wire [15:0] _44;
    reg [15:0] mon1_count_cycles;
    wire [6:0] _1565 = 7'b1001100;
    wire _1566;
    wire _1567;
    wire [31:0] _1564 = 32'b00000000000000000000000000000000;
    wire [31:0] _1563 = 32'b00000000000000000000000000000000;
    reg [31:0] _1568;
    wire [15:0] _1569;
    wire _1573;
    wire _1562;
    wire _1574;
    wire _1561;
    wire _1575;
    wire _1577;
    wire _1652;
    wire _1649;
    wire _1642;
    wire _1641;
    wire _1640;
    wire _1639;
    wire _1638;
    wire _1637;
    wire _1636;
    wire _1635;
    reg _1643;
    wire _1644;
    wire _1632;
    wire _1631;
    wire _1630;
    wire _1629;
    wire _1628;
    wire _1627;
    wire _1626;
    wire _1625;
    reg _1633;
    wire _1634;
    wire _1645;
    wire _1623;
    wire _1624;
    wire _1646;
    wire _1619;
    wire _1617;
    wire _1616;
    wire _1615;
    wire _1614;
    wire _1613;
    wire _1612;
    wire _1611;
    wire _1610;
    wire [2:0] _1609;
    reg _1618;
    wire _1620;
    wire _1607;
    wire _1608;
    wire _1621;
    wire _1605;
    wire _1603;
    wire _1604;
    wire _1600;
    wire _1599;
    wire _1598;
    wire _1597;
    wire _1596;
    wire _1595;
    wire _1594;
    wire _1593;
    reg _1601;
    wire _1590;
    wire _1589;
    wire _1588;
    wire _1587;
    wire _1586;
    wire _1585;
    wire _1584;
    wire _1583;
    wire [2:0] _1582;
    reg _1591;
    wire _1592;
    wire _1602;
    wire [1:0] _1581;
    reg _1606;
    wire _1622;
    wire _1647;
    wire _1579;
    wire _1578;
    wire _1580;
    wire _1648;
    wire _1650;
    wire _2804;
    wire _2805;
    wire _2806;
    wire _2807;
    wire _2809;
    wire _2810;
    wire _2797;
    wire _2796;
    wire _2795;
    wire _2794;
    wire _2793;
    wire _2792;
    wire _2791;
    wire _2790;
    reg _2798;
    wire _2799;
    wire _2787;
    wire _2786;
    wire _2785;
    wire _2784;
    wire _2783;
    wire _2782;
    wire _2781;
    wire _2780;
    reg _2788;
    wire _2789;
    wire _2800;
    wire _2778;
    wire _2779;
    wire _2801;
    wire _2774;
    wire _2772;
    wire _2771;
    wire _2770;
    wire _2769;
    wire _2768;
    wire _2767;
    wire _2766;
    wire _2765;
    wire [2:0] _2764;
    reg _2773;
    wire _2775;
    wire _2762;
    wire _2763;
    wire _2776;
    wire _2760;
    wire _2758;
    wire _2759;
    wire _2755;
    wire _2754;
    wire _2753;
    wire _2752;
    wire _2751;
    wire _2750;
    wire _2749;
    wire _2748;
    reg _2756;
    wire _2745;
    wire _2744;
    wire _2743;
    wire _2742;
    wire _2741;
    wire _2740;
    wire _2739;
    wire _2738;
    wire [2:0] _2737;
    reg _2746;
    wire _2747;
    wire _2757;
    wire [6:0] _1489 = 7'b1001011;
    wire _1490;
    wire _1491;
    wire [31:0] _1488 = 32'b00000000000000000000000000000000;
    wire [31:0] _1487 = 32'b00000000000000000000000000000000;
    reg [31:0] _1492;
    wire [1:0] _2736;
    reg _2761;
    wire _2777;
    wire _2802;
    wire _2803;
    wire _2811;
    wire _2833;
    wire _2834;
    wire _45;
    reg mon1_armed;
    wire [6:0] _1477 = 7'b1001101;
    wire _1478;
    wire _1479;
    wire [7:0] _1476 = 8'b00000000;
    wire [7:0] _1475 = 8'b00000000;
    wire [7:0] _1474;
    reg [7:0] _1480;
    wire [23:0] _1473 = 24'b000000000000000000000000;
    wire [31:0] _1481;
    wire _1482;
    wire _1486;
    wire _1560;
    wire _2836;
    wire _2839;
    wire _2841;
    wire _2842;
    wire _2846;
    wire _2847;
    wire _46;
    reg mon1_sticky;
    wire _2956 = 1'b0;
    wire _2955 = 1'b0;
    wire _2952;
    wire [15:0] _2949;
    wire _2950;
    wire _2947;
    wire _1747;
    wire _1746;
    wire _1745;
    wire _1744;
    wire _1743;
    wire _1742;
    wire _1741;
    wire _1740;
    reg _1748;
    wire _1749;
    wire _1737;
    wire _1736;
    wire _1735;
    wire _1734;
    wire _1733;
    wire _1732;
    wire _1731;
    wire _1730;
    reg _1738;
    wire _1739;
    wire _1750;
    wire _1728;
    wire _1729;
    wire _1751;
    wire _1724;
    wire _1722;
    wire _1721;
    wire _1720;
    wire _1719;
    wire _1718;
    wire _1717;
    wire _1716;
    wire _1715;
    wire [2:0] _1714;
    reg _1723;
    wire _1725;
    wire _1712;
    wire _1713;
    wire _1726;
    wire _1710;
    wire _1708;
    wire _1709;
    wire _1705;
    wire _1704;
    wire _1703;
    wire _1702;
    wire _1701;
    wire _1700;
    wire _1699;
    wire _1698;
    reg _1706;
    wire _1695;
    wire _1694;
    wire _1693;
    wire _1692;
    wire _1691;
    wire _1690;
    wire _1689;
    wire _1688;
    wire [2:0] _1687;
    reg _1696;
    wire _1697;
    wire _1707;
    wire [1:0] _1686;
    reg _1711;
    wire _1727;
    wire _1752;
    wire _1677 = 1'b0;
    wire _1676 = 1'b0;
    wire _2920;
    wire _1844;
    wire _1769;
    wire [15:0] _1764 = 16'b0000000000000000;
    wire [15:0] _1763 = 16'b0000000000000000;
    wire [15:0] _2942 = 16'b0000000000000001;
    wire [15:0] _2939 = 16'b0000000000000001;
    wire [15:0] _2940;
    wire [15:0] _2935 = 16'b1111111111111111;
    wire _2936;
    wire _2937;
    wire [11:0] _2931 = 12'b111111111111;
    wire _2932;
    wire [7:0] _2929 = 8'b11111111;
    wire [7:0] _2928;
    wire _2930;
    wire [3:0] _2926 = 4'b1111;
    wire [3:0] _2925;
    wire _2927;
    wire [1:0] _2924;
    reg _2933;
    wire _2934;
    wire _2938;
    wire [15:0] _2941;
    wire [15:0] _2943;
    wire [15:0] _2944;
    wire [15:0] _47;
    reg [15:0] mon2_count_cycles;
    wire [6:0] _1758 = 7'b1001111;
    wire _1759;
    wire _1760;
    wire [31:0] _1757 = 32'b00000000000000000000000000000000;
    wire [31:0] _1756 = 32'b00000000000000000000000000000000;
    reg [31:0] _1761;
    wire [15:0] _1762;
    wire _1766;
    wire _1755;
    wire _1767;
    wire _1754;
    wire _1768;
    wire _1770;
    wire _1845;
    wire _1842;
    wire _1835;
    wire _1834;
    wire _1833;
    wire _1832;
    wire _1831;
    wire _1830;
    wire _1829;
    wire _1828;
    reg _1836;
    wire _1837;
    wire _1825;
    wire _1824;
    wire _1823;
    wire _1822;
    wire _1821;
    wire _1820;
    wire _1819;
    wire _1818;
    reg _1826;
    wire _1827;
    wire _1838;
    wire _1816;
    wire _1817;
    wire _1839;
    wire _1812;
    wire _1810;
    wire _1809;
    wire _1808;
    wire _1807;
    wire _1806;
    wire _1805;
    wire _1804;
    wire _1803;
    wire [2:0] _1802;
    reg _1811;
    wire _1813;
    wire _1800;
    wire _1801;
    wire _1814;
    wire _1798;
    wire _1796;
    wire _1797;
    wire _1793;
    wire _1792;
    wire _1791;
    wire _1790;
    wire _1789;
    wire _1788;
    wire _1787;
    wire _1786;
    reg _1794;
    wire _1783;
    wire _1782;
    wire _1781;
    wire _1780;
    wire _1779;
    wire _1778;
    wire _1777;
    wire _1776;
    wire [2:0] _1775;
    reg _1784;
    wire _1785;
    wire _1795;
    wire [1:0] _1774;
    reg _1799;
    wire _1815;
    wire _1840;
    wire _1772;
    wire _1771;
    wire _1773;
    wire _1841;
    wire _1843;
    wire _2916;
    wire _2917;
    wire _2918;
    wire _2919;
    wire _2921;
    wire _2922;
    wire _2909;
    wire _2908;
    wire _2907;
    wire _2906;
    wire _2905;
    wire _2904;
    wire _2903;
    wire _2902;
    reg _2910;
    wire _2911;
    wire _2899;
    wire _2898;
    wire _2897;
    wire _2896;
    wire _2895;
    wire _2894;
    wire _2893;
    wire _2892;
    reg _2900;
    wire _2901;
    wire _2912;
    wire _2890;
    wire _2891;
    wire _2913;
    wire _2886;
    wire _2884;
    wire _2883;
    wire _2882;
    wire _2881;
    wire _2880;
    wire _2879;
    wire _2878;
    wire _2877;
    wire [2:0] _2876;
    reg _2885;
    wire _2887;
    wire _2874;
    wire _2875;
    wire _2888;
    wire _2872;
    wire _2870;
    wire _2871;
    wire _2867;
    wire _2866;
    wire _2865;
    wire _2864;
    wire _2863;
    wire _2862;
    wire _2861;
    wire _2860;
    reg _2868;
    wire _2857;
    wire _2856;
    wire _2855;
    wire _2854;
    wire _2853;
    wire _2852;
    wire _2851;
    wire _2850;
    wire [2:0] _2849;
    reg _2858;
    wire _2859;
    wire _2869;
    wire [6:0] _1682 = 7'b1001110;
    wire _1683;
    wire _1684;
    wire [31:0] _1681 = 32'b00000000000000000000000000000000;
    wire [31:0] _1680 = 32'b00000000000000000000000000000000;
    reg [31:0] _1685;
    wire [1:0] _2848;
    reg _2873;
    wire _2889;
    wire _2914;
    wire _2915;
    wire _2923;
    wire _2945;
    wire _2946;
    wire _48;
    reg mon2_armed;
    wire [6:0] _1670 = 7'b1010000;
    wire _1671;
    wire _1672;
    wire [7:0] _1669 = 8'b00000000;
    wire [7:0] _1668 = 8'b00000000;
    wire [7:0] _1667;
    reg [7:0] _1673;
    wire [23:0] _1666 = 24'b000000000000000000000000;
    wire [31:0] _1674;
    wire _1675;
    wire _1679;
    wire _1753;
    wire _2948;
    wire _2951;
    wire _2953;
    wire _2954;
    wire _2958;
    wire _2959;
    wire _49;
    reg mon2_sticky;
    wire _3230 = 1'b0;
    wire _3229 = 1'b0;
    wire _3226;
    wire [15:0] _3223;
    wire _3224;
    wire _3221;
    wire _1940;
    wire _1939;
    wire _1938;
    wire _1937;
    wire _1936;
    wire _1935;
    wire _1934;
    wire _1933;
    reg _1941;
    wire _1942;
    wire _1930;
    wire _1929;
    wire _1928;
    wire _1927;
    wire _1926;
    wire _1925;
    wire _1924;
    wire _1923;
    reg _1931;
    wire _1932;
    wire _1943;
    wire _1921;
    wire _1922;
    wire _1944;
    wire _1917;
    wire _1915;
    wire _1914;
    wire _1913;
    wire _1912;
    wire _1911;
    wire _1910;
    wire _1909;
    wire _1908;
    wire [2:0] _1907;
    reg _1916;
    wire _1918;
    wire _1905;
    wire _1906;
    wire _1919;
    wire _1903;
    wire _1901;
    wire _1902;
    wire _1898;
    wire _1897;
    wire _1896;
    wire _1895;
    wire _1894;
    wire _1893;
    wire _1892;
    wire _1891;
    reg _1899;
    wire _1888;
    wire _1887;
    wire _1886;
    wire _1885;
    wire _1884;
    wire _1883;
    wire _1882;
    wire _1881;
    wire [2:0] _1880;
    reg _1889;
    wire _1890;
    wire _1900;
    wire [1:0] _1879;
    reg _1904;
    wire _1920;
    wire _1945;
    wire _1870 = 1'b0;
    wire _1869 = 1'b0;
    wire _3034;
    wire _2037;
    wire _1962;
    wire [15:0] _1957 = 16'b0000000000000000;
    wire [15:0] _1956 = 16'b0000000000000000;
    wire [15:0] _3056 = 16'b0000000000000001;
    wire [15:0] _3053 = 16'b0000000000000001;
    wire [15:0] _3054;
    wire [15:0] _3049 = 16'b1111111111111111;
    wire _3050;
    wire _3051;
    wire [11:0] _3045 = 12'b111111111111;
    wire _3046;
    wire [7:0] _3043 = 8'b11111111;
    wire [7:0] _3042;
    wire _3044;
    wire [3:0] _3040 = 4'b1111;
    wire [11:0] _2699 = 12'b000000000000;
    wire [11:0] _2698 = 12'b000000000000;
    wire [11:0] _2960 = 12'b000000000001;
    wire [11:0] _2961;
    wire [11:0] _50;
    reg [11:0] _2700;
    wire [3:0] _3039;
    wire _3041;
    wire [1:0] _3038;
    reg _3047;
    wire _3048;
    wire _3052;
    wire [15:0] _3055;
    wire [15:0] _3057;
    wire [15:0] _3058;
    wire [15:0] _51;
    reg [15:0] mon3_count_cycles;
    wire [6:0] _1951 = 7'b1010010;
    wire _1952;
    wire _1953;
    wire [31:0] _1950 = 32'b00000000000000000000000000000000;
    wire [31:0] _1949 = 32'b00000000000000000000000000000000;
    reg [31:0] _1954;
    wire [15:0] _1955;
    wire _1959;
    wire _1948;
    wire _1960;
    wire _1947;
    wire _1961;
    wire _1963;
    wire _2038;
    wire _2035;
    wire _2028;
    wire _2027;
    wire _2026;
    wire _2025;
    wire _2024;
    wire _2023;
    wire _2022;
    wire _2021;
    reg _2029;
    wire _2030;
    wire _2018;
    wire _2017;
    wire _2016;
    wire _2015;
    wire _2014;
    wire _2013;
    wire _2012;
    wire _2011;
    reg _2019;
    wire _2020;
    wire _2031;
    wire _2009;
    wire _2010;
    wire _2032;
    wire _2005;
    wire _2003;
    wire _2002;
    wire _2001;
    wire _2000;
    wire _1999;
    wire _1998;
    wire _1997;
    wire _1996;
    wire [2:0] _1995;
    reg _2004;
    wire _2006;
    wire _1993;
    wire _1994;
    wire _2007;
    wire _1991;
    wire _1989;
    wire _1990;
    wire _1986;
    wire _1985;
    wire _1984;
    wire _1983;
    wire _1982;
    wire _1981;
    wire _1980;
    wire _1979;
    reg _1987;
    wire _1976;
    wire _1975;
    wire _1974;
    wire _1973;
    wire _1972;
    wire _1971;
    wire _1970;
    wire _1969;
    wire [2:0] _1968;
    reg _1977;
    wire _1978;
    wire _1988;
    wire [1:0] _1967;
    reg _1992;
    wire _2008;
    wire _2033;
    wire _1965;
    wire _1964;
    wire _1966;
    wire _2034;
    wire _2036;
    wire _3030;
    wire _3031;
    wire _3032;
    wire _3033;
    wire _3035;
    wire _3036;
    wire _3023;
    wire _3022;
    wire _3021;
    wire _3020;
    wire _3019;
    wire _3018;
    wire _3017;
    wire [7:0] _1352 = 8'b00000000;
    wire [7:0] _1351 = 8'b00000000;
    reg [7:0] _1353;
    wire _3016;
    reg _3024;
    wire _3025;
    wire _3013;
    wire _3012;
    wire _3011;
    wire _3010;
    wire _3009;
    wire _3008;
    wire _3007;
    wire [7:0] _1339 = 8'b00000000;
    wire [7:0] _1338 = 8'b00000000;
    wire [7:0] _1336 = 8'b00000000;
    wire [7:0] _1335 = 8'b00000000;
    wire _202 = 1'b0;
    wire _201 = 1'b0;
    wire [1:0] _3071 = 2'b10;
    wire _3072;
    wire [1:0] _363 = 2'b01;
    wire _364;
    wire [1:0] _361 = 2'b00;
    wire _362;
    wire _365;
    wire _3073;
    wire [2:0] _357 = 3'b000;
    wire _358;
    wire _359;
    wire _3074;
    wire _3075;
    wire [1:0] _3067 = 2'b10;
    wire _3068;
    wire [1:0] _352 = 2'b01;
    wire _353;
    wire [1:0] _350 = 2'b00;
    wire _351;
    wire _354;
    wire _3069;
    wire [2:0] _346 = 3'b000;
    wire _347;
    wire _348;
    wire _3070;
    wire _3076;
    wire [1:0] _3063 = 2'b10;
    wire _3064;
    wire [1:0] _290 = 2'b01;
    wire _291;
    wire [1:0] _288 = 2'b00;
    wire _289;
    wire _292;
    wire _3065;
    wire [2:0] _284 = 3'b000;
    wire _285;
    wire _286;
    wire _3066;
    wire _3077;
    wire [1:0] _3059 = 2'b10;
    wire _3060;
    wire [1:0] _279 = 2'b01;
    wire _280;
    wire [1:0] _277 = 2'b00;
    wire _278;
    wire _281;
    wire _3061;
    wire [2:0] _273 = 3'b000;
    wire _274;
    wire _275;
    wire _3062;
    wire _3078;
    wire _52;
    reg pin0_oe;
    wire _199 = 1'b0;
    wire _198 = 1'b0;
    wire [1:0] _3091 = 2'b10;
    wire _3092;
    wire [1:0] _414 = 2'b01;
    wire _415;
    wire [1:0] _412 = 2'b00;
    wire _413;
    wire _416;
    wire _3093;
    wire [2:0] _409 = 3'b001;
    wire _410;
    wire _411;
    wire _3094;
    wire _3095;
    wire [1:0] _3087 = 2'b10;
    wire _3088;
    wire [1:0] _405 = 2'b01;
    wire _406;
    wire [1:0] _403 = 2'b00;
    wire _404;
    wire _407;
    wire _3089;
    wire [2:0] _400 = 3'b001;
    wire _401;
    wire _402;
    wire _3090;
    wire _3096;
    wire [1:0] _3083 = 2'b10;
    wire _3084;
    wire [1:0] _396 = 2'b01;
    wire _397;
    wire [1:0] _394 = 2'b00;
    wire _395;
    wire _398;
    wire _3085;
    wire [2:0] _391 = 3'b001;
    wire _392;
    wire _393;
    wire _3086;
    wire _3097;
    wire [1:0] _3079 = 2'b10;
    wire _3080;
    wire [1:0] _387 = 2'b01;
    wire _388;
    wire [1:0] _385 = 2'b00;
    wire _386;
    wire _389;
    wire _3081;
    wire [2:0] _382 = 3'b001;
    wire _383;
    wire _384;
    wire _3082;
    wire _3098;
    wire _53;
    reg pin1_oe;
    wire _196 = 1'b0;
    wire _195 = 1'b0;
    wire [1:0] _3111 = 2'b10;
    wire _3112;
    wire [1:0] _465 = 2'b01;
    wire _466;
    wire [1:0] _463 = 2'b00;
    wire _464;
    wire _467;
    wire _3113;
    wire [2:0] _460 = 3'b010;
    wire _461;
    wire _462;
    wire _3114;
    wire _3115;
    wire [1:0] _3107 = 2'b10;
    wire _3108;
    wire [1:0] _456 = 2'b01;
    wire _457;
    wire [1:0] _454 = 2'b00;
    wire _455;
    wire _458;
    wire _3109;
    wire [2:0] _451 = 3'b010;
    wire _452;
    wire _453;
    wire _3110;
    wire _3116;
    wire [1:0] _3103 = 2'b10;
    wire _3104;
    wire [1:0] _447 = 2'b01;
    wire _448;
    wire [1:0] _445 = 2'b00;
    wire _446;
    wire _449;
    wire _3105;
    wire [2:0] _442 = 3'b010;
    wire _443;
    wire _444;
    wire _3106;
    wire _3117;
    wire [1:0] _3099 = 2'b10;
    wire _3100;
    wire [1:0] _438 = 2'b01;
    wire _439;
    wire [1:0] _436 = 2'b00;
    wire _437;
    wire _440;
    wire _3101;
    wire [2:0] _433 = 3'b010;
    wire _434;
    wire _435;
    wire _3102;
    wire _3118;
    wire _54;
    reg pin2_oe;
    wire _193 = 1'b0;
    wire _192 = 1'b0;
    wire [1:0] _3131 = 2'b10;
    wire _3132;
    wire [1:0] _516 = 2'b01;
    wire _517;
    wire [1:0] _514 = 2'b00;
    wire _515;
    wire _518;
    wire _3133;
    wire [2:0] _511 = 3'b011;
    wire _512;
    wire _513;
    wire _3134;
    wire _3135;
    wire [1:0] _3127 = 2'b10;
    wire _3128;
    wire [1:0] _507 = 2'b01;
    wire _508;
    wire [1:0] _505 = 2'b00;
    wire _506;
    wire _509;
    wire _3129;
    wire [2:0] _502 = 3'b011;
    wire _503;
    wire _504;
    wire _3130;
    wire _3136;
    wire [1:0] _3123 = 2'b10;
    wire _3124;
    wire [1:0] _498 = 2'b01;
    wire _499;
    wire [1:0] _496 = 2'b00;
    wire _497;
    wire _500;
    wire _3125;
    wire [2:0] _493 = 3'b011;
    wire _494;
    wire _495;
    wire _3126;
    wire _3137;
    wire [1:0] _3119 = 2'b10;
    wire _3120;
    wire [1:0] _489 = 2'b01;
    wire _490;
    wire [1:0] _487 = 2'b00;
    wire _488;
    wire _491;
    wire _3121;
    wire [2:0] _484 = 3'b011;
    wire _485;
    wire _486;
    wire _3122;
    wire _3138;
    wire _55;
    reg pin3_oe;
    wire _190 = 1'b0;
    wire _189 = 1'b0;
    wire [1:0] _3151 = 2'b10;
    wire _3152;
    wire [1:0] _567 = 2'b01;
    wire _568;
    wire [1:0] _565 = 2'b00;
    wire _566;
    wire _569;
    wire _3153;
    wire [2:0] _562 = 3'b100;
    wire _563;
    wire _564;
    wire _3154;
    wire _3155;
    wire [1:0] _3147 = 2'b10;
    wire _3148;
    wire [1:0] _558 = 2'b01;
    wire _559;
    wire [1:0] _556 = 2'b00;
    wire _557;
    wire _560;
    wire _3149;
    wire [2:0] _553 = 3'b100;
    wire _554;
    wire _555;
    wire _3150;
    wire _3156;
    wire [1:0] _3143 = 2'b10;
    wire _3144;
    wire [1:0] _549 = 2'b01;
    wire _550;
    wire [1:0] _547 = 2'b00;
    wire _548;
    wire _551;
    wire _3145;
    wire [2:0] _544 = 3'b100;
    wire _545;
    wire _546;
    wire _3146;
    wire _3157;
    wire [1:0] _3139 = 2'b10;
    wire _3140;
    wire [1:0] _540 = 2'b01;
    wire _541;
    wire [1:0] _538 = 2'b00;
    wire _539;
    wire _542;
    wire _3141;
    wire [2:0] _535 = 3'b100;
    wire _536;
    wire _537;
    wire _3142;
    wire _3158;
    wire _56;
    reg pin4_oe;
    wire _187 = 1'b0;
    wire _186 = 1'b0;
    wire [1:0] _3171 = 2'b10;
    wire _3172;
    wire [1:0] _618 = 2'b01;
    wire _619;
    wire [1:0] _616 = 2'b00;
    wire _617;
    wire _620;
    wire _3173;
    wire [2:0] _613 = 3'b101;
    wire _614;
    wire _615;
    wire _3174;
    wire _3175;
    wire [1:0] _3167 = 2'b10;
    wire _3168;
    wire [1:0] _609 = 2'b01;
    wire _610;
    wire [1:0] _607 = 2'b00;
    wire _608;
    wire _611;
    wire _3169;
    wire [2:0] _604 = 3'b101;
    wire _605;
    wire _606;
    wire _3170;
    wire _3176;
    wire [1:0] _3163 = 2'b10;
    wire _3164;
    wire [1:0] _600 = 2'b01;
    wire _601;
    wire [1:0] _598 = 2'b00;
    wire _599;
    wire _602;
    wire _3165;
    wire [2:0] _595 = 3'b101;
    wire _596;
    wire _597;
    wire _3166;
    wire _3177;
    wire [1:0] _3159 = 2'b10;
    wire _3160;
    wire [1:0] _591 = 2'b01;
    wire _592;
    wire [1:0] _589 = 2'b00;
    wire _590;
    wire _593;
    wire _3161;
    wire [2:0] _586 = 3'b101;
    wire _587;
    wire _588;
    wire _3162;
    wire _3178;
    wire _57;
    reg pin5_oe;
    wire _184 = 1'b0;
    wire _183 = 1'b0;
    wire [1:0] _3191 = 2'b10;
    wire _3192;
    wire [1:0] _669 = 2'b01;
    wire _670;
    wire [1:0] _667 = 2'b00;
    wire _668;
    wire _671;
    wire _3193;
    wire [2:0] _664 = 3'b110;
    wire _665;
    wire _666;
    wire _3194;
    wire _3195;
    wire [1:0] _3187 = 2'b10;
    wire _3188;
    wire [1:0] _660 = 2'b01;
    wire _661;
    wire [1:0] _658 = 2'b00;
    wire _659;
    wire _662;
    wire _3189;
    wire [2:0] _655 = 3'b110;
    wire _656;
    wire _657;
    wire _3190;
    wire _3196;
    wire [1:0] _3183 = 2'b10;
    wire _3184;
    wire [1:0] _651 = 2'b01;
    wire _652;
    wire [1:0] _649 = 2'b00;
    wire _650;
    wire _653;
    wire _3185;
    wire [2:0] _646 = 3'b110;
    wire _647;
    wire _648;
    wire _3186;
    wire _3197;
    wire [1:0] _3179 = 2'b10;
    wire _3180;
    wire [1:0] _642 = 2'b01;
    wire _643;
    wire [1:0] _640 = 2'b00;
    wire _641;
    wire _644;
    wire _3181;
    wire [2:0] _637 = 3'b110;
    wire _638;
    wire _639;
    wire _3182;
    wire _3198;
    wire _58;
    reg pin6_oe;
    wire _181 = 1'b0;
    wire _172 = 1'b0;
    wire [1:0] _3211 = 2'b10;
    wire _3212;
    wire [1:0] _720 = 2'b01;
    wire _721;
    wire [1:0] _718 = 2'b00;
    wire _719;
    wire _722;
    wire _3213;
    wire [2:0] _715 = 3'b111;
    wire _716;
    wire _717;
    wire _3214;
    wire _3215;
    wire [1:0] _3207 = 2'b10;
    wire _3208;
    wire [1:0] _711 = 2'b01;
    wire _712;
    wire [1:0] _709 = 2'b00;
    wire _710;
    wire _713;
    wire _3209;
    wire [2:0] _706 = 3'b111;
    wire _707;
    wire _708;
    wire _3210;
    wire _3216;
    wire [1:0] _3203 = 2'b10;
    wire _3204;
    wire [1:0] _702 = 2'b01;
    wire _703;
    wire [1:0] _700 = 2'b00;
    wire _701;
    wire _704;
    wire _3205;
    wire [2:0] _697 = 3'b111;
    wire _698;
    wire _699;
    wire _3206;
    wire _3217;
    wire [1:0] _3199 = 2'b10;
    wire _3200;
    wire [1:0] _693 = 2'b01;
    wire _694;
    wire [1:0] _691 = 2'b00;
    wire _692;
    wire _695;
    wire _3201;
    wire [2:0] _688 = 3'b111;
    wire _689;
    wire _690;
    wire _3202;
    wire _3218;
    wire _59;
    reg pin7_oe;
    wire [7:0] _204;
    reg [7:0] _1337;
    reg [7:0] _1340;
    wire _3006;
    reg _3014;
    wire _3015;
    wire _3026;
    wire _3004;
    wire _3005;
    wire _3027;
    wire _3000;
    wire _2998;
    wire _2997;
    wire _2996;
    wire _2995;
    wire _2994;
    wire _2993;
    wire _2992;
    wire _2991;
    wire [2:0] _2990;
    reg _2999;
    wire _3001;
    wire _2988;
    wire _2989;
    wire _3002;
    wire _2986;
    wire _2984;
    wire _2985;
    wire _2981;
    wire _2980;
    wire _2979;
    wire _2978;
    wire _2977;
    wire _2976;
    wire _2975;
    wire _2974;
    reg _2982;
    wire _2971;
    wire _2970;
    wire _2969;
    wire _2968;
    wire _2967;
    wire _2966;
    wire _2965;
    wire [7:0] _1291 = 8'b00000000;
    wire [7:0] _1290 = 8'b00000000;
    wire [7:0] _1288 = 8'b00000000;
    wire [7:0] _1287 = 8'b00000000;
    wire [7:0] _1285 = 8'b00000000;
    wire [7:0] _1284 = 8'b00000000;
    reg [7:0] _1286;
    reg [7:0] _1289;
    reg [7:0] _1292;
    wire _2964;
    wire [2:0] _2963;
    reg _2972;
    wire _2973;
    wire _2983;
    wire [6:0] _1875 = 7'b1010001;
    wire _1876;
    wire _1877;
    wire [31:0] _1874 = 32'b00000000000000000000000000000000;
    wire [31:0] _1873 = 32'b00000000000000000000000000000000;
    reg [31:0] _1878;
    wire [1:0] _2962;
    reg _2987;
    wire _3003;
    wire _3028;
    wire _3029;
    wire _3037;
    wire _3219;
    wire _3220;
    wire _60;
    reg mon3_armed;
    wire [6:0] _1863 = 7'b1010011;
    wire _1864;
    wire _1865;
    wire [7:0] _1862 = 8'b00000000;
    wire [7:0] _1861 = 8'b00000000;
    wire [7:0] _1860;
    reg [7:0] _1866;
    wire [23:0] _1859 = 24'b000000000000000000000000;
    wire [31:0] _1867;
    wire _1868;
    wire _1872;
    wire _1946;
    wire _3222;
    wire _3225;
    wire _3227;
    wire _3228;
    wire _3232;
    wire _1260 = 1'b0;
    wire _1259 = 1'b0;
    wire _1257;
    wire _1258;
    reg ctrl_bit1;
    wire _3233;
    wire _61;
    reg mon3_sticky;
    wire [3:0] _5630;
    wire _5628 = 1'b0;
    wire _5627 = 1'b0;
    wire _5625 = 1'b0;
    wire _5624 = 1'b0;
    wire _63;
    reg _5626;
    reg _5629;
    wire _5429 = 1'b0;
    wire _5428 = 1'b0;
    wire _5475;
    wire [1:0] _5470 = 2'b11;
    wire _5471;
    wire _5472;
    wire _5473;
    wire [1:0] _5466 = 2'b11;
    wire _5467;
    wire _5468;
    wire _5469;
    wire _5474;
    wire _5476;
    wire [2:0] _272;
    wire _5463;
    wire [1:0] _5458 = 2'b11;
    wire _5459;
    wire _5460;
    wire _5461;
    wire [1:0] _5454 = 2'b11;
    wire [1:0] _276;
    wire _5455;
    wire _5456;
    wire _5457;
    wire _5462;
    wire _5464;
    wire [2:0] _345;
    wire _5451;
    wire [1:0] _5446 = 2'b11;
    wire [1:0] _349;
    wire _5447;
    wire _5448;
    wire _5449;
    wire [1:0] _5442 = 2'b11;
    wire _5443;
    wire _5444;
    wire _5445;
    wire _5450;
    wire _5452;
    wire [2:0] _356;
    wire [2:0] _283;
    wire _5440;
    wire [1:0] _5435 = 2'b11;
    wire [1:0] _360;
    wire _5436;
    wire _5437;
    wire [23:0] _326 = 24'b000000000000000000000000;
    wire [23:0] _324;
    wire [23:0] _325;
    wire _327;
    reg [28:0] _320;
    wire [23:0] _321;
    wire [23:0] _322;
    wire _323;
    wire _328;
    wire [2:0] _302 = 3'b000;
    wire [2:0] _295 = 3'b000;
    wire [23:0] _341 = 24'b000000000000000000000000;
    wire [23:0] _339;
    wire [23:0] _340;
    wire _342;
    wire [28:0] _318 = 29'b00000000000000000000000000000;
    wire [28:0] _317 = 29'b00000000000000000000000000000;
    wire [1:0] _3237 = 2'b11;
    wire _3238;
    wire [28:0] _3367;
    wire [28:0] _3368;
    wire [28:0] _64;
    reg [28:0] queue_b_entry3;
    wire [28:0] _315 = 29'b00000000000000000000000000000;
    wire [28:0] _314 = 29'b00000000000000000000000000000;
    wire [1:0] _3369 = 2'b10;
    wire _3370;
    wire [28:0] _3371;
    wire [28:0] _3372;
    wire [28:0] _65;
    reg [28:0] queue_b_entry2;
    wire [28:0] _312 = 29'b00000000000000000000000000000;
    wire [28:0] _311 = 29'b00000000000000000000000000000;
    wire [1:0] _3373 = 2'b01;
    wire _3374;
    wire [28:0] _3375;
    wire [28:0] _3376;
    wire [28:0] _66;
    reg [28:0] queue_b_entry1;
    wire [28:0] _309 = 29'b00000000000000000000000000000;
    wire [28:0] _308 = 29'b00000000000000000000000000000;
    wire [1:0] _3359 = 2'b00;
    wire _3360;
    wire _3361;
    wire [1:0] _3357 = 2'b00;
    wire _3358;
    wire _3362;
    wire _3356;
    wire _3363;
    wire [1:0] _3364;
    wire [1:0] _3346 = 2'b01;
    wire [1:0] _3345 = 2'b10;
    wire [1:0] _3347;
    wire [1:0] _3341 = 2'b00;
    wire _3342;
    wire [1:0] _3343;
    wire [1:0] _3338 = 2'b10;
    wire [1:0] _3337 = 2'b01;
    wire _3336;
    wire [1:0] _3339;
    wire [1:0] _3331 = 2'b00;
    wire _3332;
    wire _3333;
    wire [1:0] _3329 = 2'b00;
    wire [1:0] _3326 = 2'b00;
    wire [1:0] _3325 = 2'b00;
    wire [1:0] _3479 = 2'b10;
    wire [1:0] _3475;
    wire [1:0] _3476;
    wire [1:0] _3477;
    wire [1:0] _3478;
    wire [1:0] _3480;
    wire [1:0] _67;
    reg [1:0] seq_b_shadow_clk;
    wire [1:0] _3323 = 2'b00;
    wire [1:0] _3322 = 2'b00;
    wire [1:0] _3485 = 2'b10;
    wire [1:0] _3481;
    wire [2:0] _3471 = 3'b111;
    wire _3472;
    wire [2:0] _3468 = 3'b110;
    wire _3469;
    wire [2:0] _3466 = 3'b101;
    wire _3467;
    wire _3470;
    wire _3473;
    wire _3474;
    wire [1:0] _3482;
    wire [1:0] _3483;
    wire [1:0] _3484;
    wire [1:0] _3486;
    wire [1:0] _68;
    reg [1:0] seq_b_shadow_data;
    wire [1:0] _3328;
    wire _3330;
    wire _3334;
    wire _3320;
    wire _3321;
    wire _3315;
    wire _3335;
    wire [1:0] _3340;
    wire [1:0] _3344;
    wire [1:0] _3348;
    wire [1:0] _3313 = 2'b11;
    wire [1:0] _3312 = 2'b01;
    wire [1:0] _3314;
    wire [1:0] _3349;
    wire [1:0] _3311 = 2'b00;
    wire [2:0] _3307 = 3'b111;
    wire _3308;
    wire [2:0] _3305 = 3'b101;
    wire _3306;
    wire _3309;
    wire [2:0] _3301 = 3'b100;
    wire _3302;
    wire [2:0] _3299 = 3'b011;
    wire _3300;
    wire _3303;
    wire [2:0] _3296 = 3'b010;
    wire _3297;
    wire [2:0] _3294 = 3'b001;
    wire _3295;
    wire _3298;
    wire _3304;
    wire _3310;
    wire [1:0] _3350;
    wire [1:0] _3365;
    wire [2:0] _3261;
    wire [2:0] _3258;
    wire [2:0] _3244 = 3'b111;
    wire _3245;
    wire [2:0] _3242 = 3'b110;
    wire _3243;
    wire _3246;
    wire [2:0] _3240 = 3'b101;
    wire _3241;
    wire _3247;
    wire [2:0] _3262;
    wire [5:0] _1209 = 6'b000000;
    wire [17:0] _1208;
    wire [23:0] _1210;
    wire [3:0] _1206 = 4'b0000;
    wire [19:0] _1205;
    wire [23:0] _1207;
    wire [1:0] _1203 = 2'b00;
    wire [21:0] _1202;
    wire [23:0] _1204;
    wire [5:0] _1199;
    wire [7:0] _1188 = 8'b00000000;
    wire [7:0] _1187 = 8'b00000000;
    wire [3:0] _3491 = 4'b0100;
    wire _3492;
    wire [3:0] _3487 = 4'b0101;
    wire _3488;
    wire _3489;
    wire _3493;
    wire [7:0] _3495;
    wire [7:0] _3496;
    wire [7:0] _3505;
    wire [7:0] _69;
    reg [7:0] seq_b_k3;
    wire [7:0] _1185 = 8'b00000000;
    wire [7:0] _1184 = 8'b00000000;
    wire [3:0] _3509 = 4'b0011;
    wire _3510;
    wire [3:0] _3506 = 4'b0101;
    wire _3507;
    wire _3508;
    wire _3511;
    wire [7:0] _3512;
    wire [7:0] _3513;
    wire [7:0] _3515;
    wire [7:0] _70;
    reg [7:0] seq_b_k2;
    wire [7:0] _1182 = 8'b00000000;
    wire [7:0] _1181 = 8'b00000000;
    wire [3:0] _3519 = 4'b0010;
    wire _3520;
    wire [3:0] _3516 = 4'b0101;
    wire _3517;
    wire _3518;
    wire _3521;
    wire [7:0] _3522;
    wire [7:0] _3523;
    wire [7:0] _3525;
    wire [7:0] _71;
    reg [7:0] seq_b_k1;
    wire [7:0] _1180 = 8'b00000000;
    wire [1:0] _1179;
    reg [7:0] _1190;
    wire _1191;
    wire [1:0] _1192;
    wire [9:0] _1193;
    wire [5:0] _1177;
    wire [3:0] _1176 = 4'b0000;
    wire [9:0] _1178;
    wire [9:0] _1194;
    wire _1195;
    wire [1:0] _1196;
    wire [3:0] _1197;
    wire [7:0] _1198;
    wire [13:0] _1200;
    wire [23:0] _1201;
    reg [23:0] _1211;
    wire [23:0] _1212;
    wire [28:0] _3366;
    wire [1:0] _3529 = 2'b00;
    wire [1:0] _3235 = 2'b00;
    wire [1:0] _3234 = 2'b00;
    wire [1:0] _3526 = 2'b01;
    wire [1:0] _3527;
    wire [1:0] _3528;
    wire [1:0] _72;
    reg [1:0] queue_b_write_ptr;
    wire _3530;
    wire [28:0] _3531;
    wire [28:0] _3532;
    wire [28:0] _73;
    reg [28:0] queue_b_entry0;
    wire [1:0] _333 = 2'b01;
    wire [1:0] _306 = 2'b00;
    wire _301;
    wire [1:0] _305 = 2'b00;
    wire [1:0] _3538;
    wire [1:0] _3539;
    wire [1:0] _74;
    reg [1:0] queue_b_read_ptr;
    wire [1:0] _334;
    reg [28:0] _335;
    wire [23:0] _336;
    wire [23:0] _337;
    wire _338;
    wire _343;
    wire [2:0] _330 = 3'b001;
    wire _331;
    wire _332;
    wire _344;
    wire [1:0] _3535 = 2'b00;
    wire [2:0] _3536;
    wire [1:0] _3533 = 2'b00;
    wire [2:0] _3534;
    wire [2:0] _3537;
    wire _1162;
    wire [2:0] _1164 = 3'b100;
    wire _1165;
    wire _75;
    wire [3:0] _1154 = 4'b0001;
    wire _1155;
    wire _1156;
    wire _787 = 1'b0;
    wire _786 = 1'b0;
    wire _1132;
    wire _4335;
    wire [15:0] _1112 = 16'b0000000000000000;
    wire [15:0] _1110 = 16'b0000001111111111;
    wire [15:0] _1111;
    wire _1113;
    wire _1107 = 1'b1;
    wire _1106;
    wire _1108;
    wire _1103 = 1'b0;
    wire _1102;
    wire _1104;
    wire [3:0] _1100 = 4'b0111;
    wire [3:0] _1099;
    wire _1101;
    wire _1105;
    wire _1109;
    wire _1114;
    wire [15:0] _1095 = 16'b0000000000000000;
    wire [15:0] _1093 = 16'b0000000111111111;
    wire [15:0] _1094;
    wire _1096;
    wire [2:0] _1089 = 3'b100;
    wire [2:0] _1088;
    wire _1090;
    wire [2:0] _1085 = 3'b011;
    wire [2:0] _1084;
    wire _1086;
    wire [2:0] _1081 = 3'b010;
    wire [2:0] _1080;
    wire _1082;
    wire [2:0] _1078 = 3'b000;
    wire [2:0] _1077;
    wire _1079;
    wire _1083;
    wire _1087;
    wire _1091;
    wire [3:0] _1075 = 4'b1000;
    wire [3:0] _1074;
    wire _1076;
    wire _1092;
    wire _1097;
    wire [3:0] _1069 = 4'b1001;
    wire [3:0] _1068;
    wire _1070;
    wire [3:0] _1065 = 4'b1000;
    wire [3:0] _1064;
    wire _1066;
    wire [3:0] _1061 = 4'b0111;
    wire [3:0] _1060;
    wire _1062;
    wire [7:0] _1055 = 8'b00111101;
    wire [7:0] _1054;
    wire _1056;
    wire [7:0] _1051 = 8'b00111100;
    wire [7:0] _1050;
    wire _1052;
    wire [7:0] _1047 = 8'b00111001;
    wire [7:0] _1046;
    wire _1048;
    wire [7:0] _1043 = 8'b00111000;
    wire [7:0] _1042;
    wire _1044;
    wire [7:0] _1039 = 8'b00110101;
    wire [7:0] _1038;
    wire _1040;
    wire [7:0] _1035 = 8'b00110100;
    wire [7:0] _1034;
    wire _1036;
    wire [7:0] _1031 = 8'b00110001;
    wire [7:0] _1030;
    wire _1032;
    wire [7:0] _1027 = 8'b00110000;
    wire [7:0] _1026;
    wire _1028;
    wire [7:0] _1023 = 8'b00101101;
    wire [7:0] _1022;
    wire _1024;
    wire [7:0] _1019 = 8'b00101100;
    wire [7:0] _1018;
    wire _1020;
    wire [7:0] _1015 = 8'b00101001;
    wire [7:0] _1014;
    wire _1016;
    wire [7:0] _1011 = 8'b00101000;
    wire [7:0] _1010;
    wire _1012;
    wire [7:0] _1007 = 8'b00100101;
    wire [7:0] _1006;
    wire _1008;
    wire [7:0] _1003 = 8'b00100100;
    wire [7:0] _1002;
    wire _1004;
    wire [7:0] _999 = 8'b00100001;
    wire [7:0] _998;
    wire _1000;
    wire [7:0] _995 = 8'b00100000;
    wire [7:0] _994;
    wire _996;
    wire [7:0] _991 = 8'b00011101;
    wire [7:0] _990;
    wire _992;
    wire [7:0] _987 = 8'b00011100;
    wire [7:0] _986;
    wire _988;
    wire [7:0] _983 = 8'b00011001;
    wire [7:0] _982;
    wire _984;
    wire [7:0] _979 = 8'b00011000;
    wire [7:0] _978;
    wire _980;
    wire [7:0] _975 = 8'b00010101;
    wire [7:0] _974;
    wire _976;
    wire [7:0] _971 = 8'b00010100;
    wire [7:0] _970;
    wire _972;
    wire [7:0] _967 = 8'b00010001;
    wire [7:0] _966;
    wire _968;
    wire [7:0] _963 = 8'b00010000;
    wire [7:0] _962;
    wire _964;
    wire [7:0] _959 = 8'b00001101;
    wire [7:0] _958;
    wire _960;
    wire [7:0] _955 = 8'b00001100;
    wire [7:0] _954;
    wire _956;
    wire [7:0] _951 = 8'b00001001;
    wire [7:0] _950;
    wire _952;
    wire [7:0] _947 = 8'b00001000;
    wire [7:0] _946;
    wire _948;
    wire [7:0] _943 = 8'b00000101;
    wire [7:0] _942;
    wire _944;
    wire [7:0] _939 = 8'b00000100;
    wire [7:0] _938;
    wire _940;
    wire [7:0] _935 = 8'b00000001;
    wire [7:0] _934;
    wire _936;
    wire [7:0] _932 = 8'b00000000;
    wire [7:0] _931;
    wire _933;
    wire _937;
    wire _941;
    wire _945;
    wire _949;
    wire _953;
    wire _957;
    wire _961;
    wire _965;
    wire _969;
    wire _973;
    wire _977;
    wire _981;
    wire _985;
    wire _989;
    wire _993;
    wire _997;
    wire _1001;
    wire _1005;
    wire _1009;
    wire _1013;
    wire _1017;
    wire _1021;
    wire _1025;
    wire _1029;
    wire _1033;
    wire _1037;
    wire _1041;
    wire _1045;
    wire _1049;
    wire _1053;
    wire _1057;
    wire [3:0] _929 = 4'b0101;
    wire [3:0] _928;
    wire _930;
    wire _1058;
    wire [3:0] _925 = 4'b0100;
    wire [3:0] _924;
    wire _926;
    wire [3:0] _921 = 4'b0011;
    wire [3:0] _920;
    wire _922;
    wire [3:0] _917 = 4'b0010;
    wire [3:0] _916;
    wire _918;
    wire [3:0] _913 = 4'b0001;
    wire [3:0] _912;
    wire _914;
    wire [3:0] _910 = 4'b0000;
    wire [3:0] _909;
    wire _911;
    wire _915;
    wire _919;
    wire _923;
    wire _927;
    wire _1059;
    wire _1063;
    wire _1067;
    wire _1071;
    wire [3:0] _907 = 4'b0101;
    wire [3:0] _906;
    wire _908;
    wire _1072;
    wire [15:0] _902 = 16'b0000000000000000;
    wire [15:0] _900 = 16'b0000000011000000;
    wire [15:0] _901;
    wire _903;
    wire [3:0] _896 = 4'b0100;
    wire [3:0] _895;
    wire _897;
    wire [3:0] _892 = 4'b0011;
    wire [3:0] _891;
    wire _893;
    wire [3:0] _888 = 4'b0010;
    wire [3:0] _887;
    wire _889;
    wire [3:0] _884 = 4'b0001;
    wire [3:0] _883;
    wire _885;
    wire [3:0] _881 = 4'b0000;
    wire [3:0] _880;
    wire _882;
    wire _886;
    wire _890;
    wire _894;
    wire _898;
    wire [3:0] _878 = 4'b0100;
    wire [3:0] _877;
    wire _879;
    wire _899;
    wire _904;
    wire [15:0] _873 = 16'b0000000000000000;
    wire [15:0] _871 = 16'b0000000000111111;
    wire [15:0] _872;
    wire _874;
    wire [1:0] _867 = 2'b10;
    wire [1:0] _866;
    wire _868;
    wire [1:0] _863 = 2'b01;
    wire [1:0] _862;
    wire _864;
    wire [1:0] _860 = 2'b00;
    wire [1:0] _859;
    wire _861;
    wire _865;
    wire _869;
    wire [2:0] _855 = 3'b011;
    wire [2:0] _854;
    wire _856;
    wire [2:0] _851 = 3'b010;
    wire [2:0] _850;
    wire _852;
    wire [2:0] _847 = 3'b001;
    wire [2:0] _846;
    wire _848;
    wire [2:0] _844 = 3'b000;
    wire [2:0] _843;
    wire _845;
    wire _849;
    wire _853;
    wire _857;
    wire [3:0] _841 = 4'b0011;
    wire [3:0] _840;
    wire _842;
    wire _858;
    wire _870;
    wire _875;
    wire [3:0] _837 = 4'b0010;
    wire [3:0] _836;
    wire _838;
    wire [2:0] _831 = 3'b111;
    wire [2:0] _830;
    wire _832;
    wire [2:0] _827 = 3'b110;
    wire [2:0] _826;
    wire _828;
    wire [2:0] _823 = 3'b101;
    wire [2:0] _822;
    wire _824;
    wire [2:0] _819 = 3'b100;
    wire [2:0] _818;
    wire _820;
    wire [2:0] _815 = 3'b011;
    wire [2:0] _814;
    wire _816;
    wire [2:0] _811 = 3'b010;
    wire [2:0] _810;
    wire _812;
    wire [2:0] _807 = 3'b001;
    wire [2:0] _806;
    wire _808;
    wire [2:0] _804 = 3'b000;
    wire [2:0] _803;
    wire _805;
    wire _809;
    wire _813;
    wire _817;
    wire _821;
    wire _825;
    wire _829;
    wire _833;
    wire [3:0] _801 = 4'b0001;
    wire [3:0] _800;
    wire _802;
    wire _834;
    wire [15:0] _797 = 16'b0000000000000000;
    wire [15:0] _795 = 16'b0000111111111111;
    wire [15:0] _796;
    wire _798;
    wire [3:0] _793 = 4'b0000;
    wire [15:0] _790 = 16'b0000000000000000;
    wire [15:0] _789 = 16'b0000000000000000;
    wire [5:0] _3593;
    wire [4:0] _3594;
    reg [15:0] _3792;
    wire [15:0] _76;
    wire [15:0] _4332;
    wire _3464;
    wire [5:0] _1128 = 6'b000000;
    wire [5:0] _1127 = 6'b000000;
    wire [5:0] _3591 = 6'b100000;
    wire [5:0] _3590;
    wire [5:0] _3592;
    wire [5:0] _3580 = 6'b000001;
    wire [5:0] _3581;
    wire _3576;
    wire _3575;
    wire _3574;
    wire _3573;
    wire _3572;
    wire _3571;
    wire _3570;
    wire _3569;
    reg _3577;
    wire [3:0] _3565 = 4'b0100;
    wire _3566;
    wire _3567;
    wire _3568;
    wire _3578;
    wire _3561 = 1'b0;
    wire _3560 = 1'b0;
    wire _3793;
    wire _3794;
    wire _3795;
    wire _3796;
    wire _77;
    reg seq_b_flag;
    wire [3:0] _3557 = 4'b0011;
    wire _3558;
    wire _3559;
    wire _3563;
    wire [15:0] _3551 = 16'b0000000000000000;
    wire _3552;
    wire _3553;
    wire [3:0] _3549 = 4'b0010;
    wire _3550;
    wire _3554;
    wire [15:0] _3544 = 16'b0000000000000000;
    wire _3545;
    wire _3546;
    wire [3:0] _3542 = 4'b0001;
    wire _3543;
    wire _3547;
    wire [3:0] _3540 = 4'b0000;
    wire _3541;
    wire _3548;
    wire _3555;
    wire _3556;
    wire _3564;
    wire _3579;
    wire [5:0] _3582;
    wire [2:0] _3289 = 3'b011;
    wire _3290;
    wire [2:0] _3286 = 3'b010;
    wire _3287;
    wire [2:0] _3283 = 3'b001;
    wire _3284;
    wire [2:0] _3280 = 3'b000;
    wire _3281;
    wire [2:0] _3278 = 3'b100;
    wire _3279;
    wire _3282;
    wire _3285;
    wire _3288;
    wire _3291;
    wire _3248;
    wire _3277;
    wire _3292;
    wire [2:0] _3273 = 3'b101;
    wire _3274;
    wire [2:0] _3271 = 3'b110;
    wire [2:0] _3269 = 3'b000;
    wire [2:0] _3268 = 3'b000;
    wire [2:0] _4158 = 3'b000;
    wire [2:0] _4155 = 3'b000;
    wire [2:0] _4149 = 3'b001;
    wire [2:0] _4150;
    wire [2:0] _4148 = 3'b001;
    wire _4147;
    wire [2:0] _4151;
    wire [2:0] _4144 = 3'b001;
    wire [2:0] _4145;
    wire [2:0] _4143 = 3'b000;
    wire _3352 = 1'b0;
    wire _3351 = 1'b0;
    wire _3813 = 1'b0;
    wire _3810 = 1'b0;
    wire _3808;
    wire _3809;
    wire _3811;
    wire _3812;
    wire _3814;
    wire _78;
    reg seq_b_stuff_last;
    wire _3354;
    wire _3355;
    wire [31:0] _3317 = 32'b00000000000000000000000000000000;
    wire [31:0] _3316 = 32'b00000000000000000000000000000000;
    wire [31:0] _4141 = 32'b00000000000000000000000000000000;
    wire [15:0] _4137 = 16'b0000000000000000;
    wire _4134 = 1'b0;
    wire [14:0] _4133;
    wire [15:0] _4135;
    wire [1:0] _4131 = 2'b00;
    wire [13:0] _4130;
    wire [15:0] _4132;
    wire [2:0] _4128 = 3'b000;
    wire [12:0] _4127;
    wire [15:0] _4129;
    wire [3:0] _4125 = 4'b0000;
    wire [11:0] _4124;
    wire [15:0] _4126;
    wire [4:0] _4122 = 5'b00000;
    wire [10:0] _4121;
    wire [15:0] _4123;
    wire [5:0] _4119 = 6'b000000;
    wire [9:0] _4118;
    wire [15:0] _4120;
    wire [6:0] _4116 = 7'b0000000;
    wire [8:0] _4115;
    wire [15:0] _4117;
    wire [7:0] _4113 = 8'b00000000;
    wire [7:0] _4112;
    wire [15:0] _4114;
    wire [8:0] _4110 = 9'b000000000;
    wire [6:0] _4109;
    wire [15:0] _4111;
    wire [9:0] _4107 = 10'b0000000000;
    wire [5:0] _4106;
    wire [15:0] _4108;
    wire [10:0] _4104 = 11'b00000000000;
    wire [4:0] _4103;
    wire [15:0] _4105;
    wire [11:0] _4101 = 12'b000000000000;
    wire [3:0] _4100;
    wire [15:0] _4102;
    wire [12:0] _4098 = 13'b0000000000000;
    wire [2:0] _4097;
    wire [15:0] _4099;
    wire [13:0] _4095 = 14'b00000000000000;
    wire [1:0] _4094;
    wire [15:0] _4096;
    wire [14:0] _4092 = 15'b000000000000000;
    wire _3816 = 1'b0;
    wire _3815 = 1'b0;
    wire _3846 = 1'b0;
    wire _3843 = 1'b0;
    wire _3841 = 1'b1;
    wire _3839 = 1'b0;
    wire _3840;
    wire [2:0] _3829 = 3'b100;
    wire [2:0] _3828;
    wire _3830;
    wire [3:0] _3825 = 4'b1000;
    wire _3826;
    wire _3827;
    wire _3831;
    wire _3842;
    wire _3844;
    wire _3845;
    wire _3847;
    wire _79;
    reg seq_b_crc_corrupt;
    wire [14:0] _4086 = 15'b000000000000000;
    wire [15:0] _4087;
    wire [15:0] _4084 = 16'b0000000000000000;
    wire _3849 = 1'b0;
    wire _3848 = 1'b0;
    wire _3851;
    wire _3852;
    wire _3853;
    wire _3854;
    wire _80;
    reg seq_b_crc_inv;
    wire [15:0] _4085;
    wire [15:0] _4088;
    wire [15:0] _3882 = 16'b0000000000000000;
    wire [15:0] _3881 = 16'b0000000000000000;
    wire [3:0] _4016 = 4'b0000;
    wire _4017;
    wire _4018;
    wire [3:0] _4013 = 4'b0001;
    wire _4014;
    wire _4015;
    wire [3:0] _4010 = 4'b0010;
    wire _4011;
    wire _4012;
    wire [3:0] _4007 = 4'b0011;
    wire _4008;
    wire _4009;
    wire [3:0] _4004 = 4'b0100;
    wire _4005;
    wire _4006;
    wire [3:0] _4001 = 4'b0101;
    wire _4002;
    wire _4003;
    wire [3:0] _3998 = 4'b0110;
    wire _3999;
    wire _4000;
    wire [3:0] _3995 = 4'b0111;
    wire _3996;
    wire _3997;
    wire [3:0] _3992 = 4'b1000;
    wire _3993;
    wire _3994;
    wire [3:0] _3989 = 4'b1001;
    wire _3990;
    wire _3991;
    wire [3:0] _3986 = 4'b1010;
    wire _3987;
    wire _3988;
    wire [3:0] _3983 = 4'b1011;
    wire _3984;
    wire _3985;
    wire [3:0] _3980 = 4'b1100;
    wire _3981;
    wire _3982;
    wire [3:0] _3977 = 4'b1101;
    wire _3978;
    wire _3979;
    wire [3:0] _3974 = 4'b1110;
    wire _3975;
    wire _3976;
    wire [3:0] _3971 = 4'b1111;
    wire [3:0] _3970;
    wire _3972;
    wire _3973;
    wire [15:0] _4019;
    wire [15:0] _3969 = 16'b0000000000000000;
    wire _3968;
    wire [15:0] _4020;
    wire [3:0] _3960 = 4'b0000;
    wire _3961;
    wire _3962;
    wire [3:0] _3957 = 4'b0001;
    wire _3958;
    wire _3959;
    wire [3:0] _3954 = 4'b0010;
    wire _3955;
    wire _3956;
    wire [3:0] _3951 = 4'b0011;
    wire _3952;
    wire _3953;
    wire [3:0] _3948 = 4'b0100;
    wire _3949;
    wire _3950;
    wire [3:0] _3945 = 4'b0101;
    wire _3946;
    wire _3947;
    wire [3:0] _3942 = 4'b0110;
    wire _3943;
    wire _3944;
    wire [3:0] _3939 = 4'b0111;
    wire _3940;
    wire _3941;
    wire [3:0] _3936 = 4'b1000;
    wire _3937;
    wire _3938;
    wire [3:0] _3933 = 4'b1001;
    wire _3934;
    wire _3935;
    wire [3:0] _3930 = 4'b1010;
    wire _3931;
    wire _3932;
    wire [3:0] _3927 = 4'b1011;
    wire _3928;
    wire _3929;
    wire [3:0] _3924 = 4'b1100;
    wire _3925;
    wire _3926;
    wire [3:0] _3921 = 4'b1101;
    wire _3922;
    wire _3923;
    wire [3:0] _3918 = 4'b1110;
    wire _3919;
    wire _3920;
    wire [3:0] _3915 = 4'b1111;
    wire _3916;
    wire _3917;
    wire [15:0] _3963;
    wire [15:0] _3856 = 16'b0000000000000000;
    wire [15:0] _3855 = 16'b0000000000000000;
    wire [15:0] _3858;
    wire [15:0] _3859;
    wire [15:0] _3860;
    wire [15:0] _3861;
    wire [15:0] _81;
    reg [15:0] seq_b_crc_poly;
    wire [15:0] _3912 = 16'b0000000000000000;
    wire _3909;
    wire _3908;
    wire _3907;
    wire _3906;
    wire _3905;
    wire _3904;
    wire _3903;
    wire _3902;
    wire _3901;
    wire _3900;
    wire _3899;
    wire _3898;
    wire _3897;
    wire _3896;
    wire _3895;
    wire _3894;
    reg _3910;
    wire _3911;
    wire [15:0] _3913;
    wire _3889 = 1'b0;
    wire [14:0] _3888;
    wire [15:0] _3890;
    wire [15:0] _3914;
    wire [15:0] _3964;
    wire _3863 = 1'b0;
    wire _3862 = 1'b0;
    wire _3879 = 1'b0;
    wire _3876 = 1'b0;
    wire _3874 = 1'b1;
    wire _3872 = 1'b0;
    wire _3873;
    wire [2:0] _3869 = 3'b000;
    wire [2:0] _3868;
    wire _3870;
    wire [3:0] _3865 = 4'b1000;
    wire _3866;
    wire _3867;
    wire _3871;
    wire _3875;
    wire _3877;
    wire _3878;
    wire _3880;
    wire _82;
    reg seq_b_crc_feed;
    wire [15:0] _3965;
    wire [15:0] _3966;
    wire [15:0] _3967;
    wire [15:0] _4021;
    wire [15:0] _4022;
    wire [15:0] _4023;
    wire [15:0] _83;
    reg [15:0] seq_b_crc;
    wire [15:0] _4089;
    wire [15:0] _4090;
    wire _4091;
    wire [15:0] _4093;
    wire [3:0] _3892 = 4'b0000;
    wire [3:0] _3891 = 4'b0000;
    wire [3:0] _4024;
    wire [2:0] _3836 = 3'b010;
    wire [2:0] _3835;
    wire _3837;
    wire [3:0] _3832 = 4'b1000;
    wire _3833;
    wire _3834;
    wire _3838;
    wire [3:0] _4025;
    wire [3:0] _4026;
    wire [3:0] _4027;
    wire [3:0] _84;
    reg [3:0] seq_b_crc_width_m1;
    reg [15:0] _4136;
    wire [31:0] _4138;
    wire [31:0] _4041 = 32'b00000000000000000000000000000000;
    wire [31:0] _4040 = 32'b00000000000000000000000000000000;
    wire [1:0] _4037 = 2'b11;
    wire _4038;
    wire _4039;
    wire [31:0] _4043;
    wire [31:0] _85;
    reg [31:0] _4042;
    wire [31:0] _4048 = 32'b00000000000000000000000000000000;
    wire [31:0] _4047 = 32'b00000000000000000000000000000000;
    wire [1:0] _4044 = 2'b10;
    wire _4045;
    wire _4046;
    wire [31:0] _4050;
    wire [31:0] _86;
    reg [31:0] _4049;
    wire [31:0] _4055 = 32'b00000000000000000000000000000000;
    wire [31:0] _4054 = 32'b00000000000000000000000000000000;
    wire [1:0] _4051 = 2'b01;
    wire _4052;
    wire _4053;
    wire [31:0] _4057;
    wire [31:0] _87;
    reg [31:0] _4056;
    wire [31:0] _4065 = 32'b00000000000000000000000000000000;
    wire [31:0] _4064 = 32'b00000000000000000000000000000000;
    wire [1:0] _4061 = 2'b00;
    wire [1:0] _4035 = 2'b00;
    wire [1:0] _4034 = 2'b00;
    wire [1:0] _4058 = 2'b01;
    wire [1:0] _4059;
    wire [1:0] _4060;
    wire [1:0] _88;
    reg [1:0] _4036;
    wire _4062;
    wire _4063;
    wire [31:0] _4067;
    wire [31:0] _89;
    reg [31:0] _4066;
    wire [1:0] _4072 = 2'b00;
    wire [1:0] _4071 = 2'b00;
    wire [1:0] _4074 = 2'b01;
    wire [1:0] _4075;
    wire [1:0] _4076;
    wire [1:0] _90;
    reg [1:0] _4073;
    reg [31:0] _4082;
    wire _4078 = 1'b0;
    wire [30:0] _4077;
    wire [31:0] _4079;
    wire _3886;
    wire [2:0] _3884 = 3'b100;
    wire _3885;
    wire _3887;
    wire [31:0] _4080;
    wire [31:0] _4081;
    wire [31:0] _4083;
    wire [2:0] _3822 = 3'b011;
    wire [2:0] _3821;
    wire _3823;
    wire [3:0] _3818 = 4'b1000;
    wire _3819;
    wire _3820;
    wire _3824;
    wire [31:0] _4139;
    wire [31:0] _4140;
    wire [31:0] _4142;
    wire [31:0] _91;
    reg [31:0] seq_b_osr;
    wire _3319;
    wire _3807;
    wire [2:0] _4146;
    wire [2:0] _4152;
    wire [2:0] _3803 = 3'b100;
    wire [2:0] _3239;
    wire _3804;
    wire _3805;
    wire _3806;
    wire [2:0] _4153;
    wire [2:0] _4154;
    wire [2:0] _4156;
    wire [2:0] _4157;
    wire [2:0] _4159;
    wire [2:0] _92;
    reg [2:0] seq_b_stuff_run;
    wire _3272;
    wire _3267;
    wire _3275;
    wire [5:0] _3264 = 6'b000000;
    wire [5:0] _3263 = 6'b000000;
    wire [5:0] _4163 = 6'b000000;
    wire [5:0] _4160;
    wire [3:0] _3800 = 4'b0101;
    wire _3801;
    wire [3:0] _3797 = 4'b0101;
    wire _3798;
    wire _3799;
    wire _3802;
    wire [5:0] _4161;
    wire [5:0] _4162;
    wire [5:0] _4164;
    wire [5:0] _93;
    reg [5:0] seq_b_coder;
    wire _3266;
    wire _3276;
    wire _3293;
    wire _4165;
    wire _4166;
    wire [5:0] _4167;
    wire [5:0] _4168;
    wire [5:0] _4169;
    wire [5:0] _94;
    reg [5:0] seq_b_ir_pc;
    wire [5:0] _1126;
    wire _1130;
    wire [3:0] _1123 = 4'b0000;
    wire _1124;
    wire _1125;
    wire _1131;
    wire _3462;
    wire _3457;
    wire [3:0] _3454 = 4'b0100;
    wire _3455;
    wire _3456;
    wire _3458;
    wire [15:0] _3445 = 16'b1111111111111111;
    wire [15:0] _3443 = 16'b0000000000000000;
    wire [15:0] _3442 = 16'b0000000000000000;
    wire [15:0] _4199 = 16'b0000000000000000;
    wire [7:0] _4195;
    wire [15:0] _4196;
    wire [7:0] _4192 = 8'b00000000;
    wire [15:0] _4193;
    wire [15:0] _4189 = 16'b0000000000000001;
    wire [15:0] _4190;
    wire [15:0] _4185 = 16'b0000000000000000;
    wire _4186;
    wire _4187;
    wire [3:0] _4182 = 4'b0010;
    wire _4183;
    wire _4184;
    wire _4188;
    wire [15:0] _4191;
    wire [3:0] _4179 = 4'b0001;
    wire _4180;
    wire [3:0] _4176 = 4'b0101;
    wire _4177;
    wire _4178;
    wire _4181;
    wire [15:0] _4194;
    wire [3:0] _4173 = 4'b1001;
    wire _4174;
    wire [3:0] _4170 = 4'b0101;
    wire _4171;
    wire _4172;
    wire _4175;
    wire [15:0] _4197;
    wire [15:0] _4198;
    wire [15:0] _4200;
    wire [15:0] _95;
    reg [15:0] seq_b_y;
    wire [15:0] _3440 = 16'b0000000000000000;
    wire [15:0] _3439 = 16'b0000000000000000;
    wire [15:0] _4230 = 16'b0000000000000000;
    wire [7:0] _4226;
    wire [15:0] _4227;
    wire [7:0] _4223 = 8'b00000000;
    wire [15:0] _4224;
    wire [15:0] _4220 = 16'b0000000000000001;
    wire [15:0] _4221;
    wire [15:0] _4216 = 16'b0000000000000000;
    wire _4217;
    wire _4218;
    wire [3:0] _4213 = 4'b0001;
    wire [3:0] _1122;
    wire _4214;
    wire [3:0] _1119 = 4'b0100;
    wire _1120;
    wire _1121;
    wire _4215;
    wire _4219;
    wire [15:0] _4222;
    wire [3:0] _4210 = 4'b0000;
    wire _4211;
    wire [3:0] _4207 = 4'b0101;
    wire _4208;
    wire _4209;
    wire _4212;
    wire [15:0] _4225;
    wire [3:0] _4204 = 4'b1000;
    wire _4205;
    wire [3:0] _4201 = 4'b0101;
    wire _4202;
    wire _4203;
    wire _4206;
    wire [15:0] _4228;
    wire [15:0] _4229;
    wire [15:0] _4231;
    wire [15:0] _96;
    reg [15:0] seq_b_x;
    wire [15:0] _3438 = 16'b1111111111111111;
    reg [15:0] _3446;
    wire [15:0] _3436 = 16'b0000000000000000;
    wire [15:0] _3435 = 16'b0000000000000000;
    wire [15:0] _4240 = 16'b0000000000000000;
    wire [15:0] _4237 = 16'b0000000000000001;
    wire [15:0] _4238;
    wire [15:0] _4236 = 16'b0000000000000000;
    wire _4234;
    wire _4232;
    wire _4233;
    wire _4235;
    wire [15:0] _4239;
    wire [15:0] _4241;
    wire [15:0] _97;
    reg [15:0] seq_b_wait_count;
    wire _3447;
    wire [1:0] _3432 = 2'b00;
    wire [1:0] _3431;
    wire _3433;
    wire _3434;
    wire _3448;
    wire _3429;
    wire _3427;
    wire _3426;
    wire _3425;
    wire _3424;
    wire _3423;
    wire _3422;
    wire _3421;
    wire _3420;
    wire [2:0] _3259;
    wire [2:0] _3257;
    wire [2:0] _3256;
    wire [6:0] _3252 = 7'b1100100;
    wire _3253;
    wire _3254;
    wire [11:0] _3251 = 12'b000000000000;
    wire [11:0] _3250 = 12'b000000000000;
    wire [11:0] _3249;
    reg [11:0] _3255;
    wire [2:0] _3260;
    wire [2:0] _3417;
    wire [1:0] _3418;
    reg [2:0] _3419;
    reg _3428;
    wire _3430;
    wire _3449;
    wire _3415 = 1'b0;
    wire _3414 = 1'b0;
    wire [23:0] _4293 = 24'b000000000000000000000000;
    wire _4294;
    wire [23:0] _4289 = 24'b000000000000000000000001;
    wire [23:0] _4290;
    wire [23:0] _4291;
    wire _4292;
    wire _4295;
    wire [23:0] _4272 = 24'b000000000000000000000000;
    wire _4273;
    wire [23:0] _4268 = 24'b000000000000000000000001;
    wire [23:0] _4269;
    wire [23:0] _4270;
    wire _4271;
    wire _4274;
    wire _4296;
    wire _4297;
    wire [23:0] _4251 = 24'b000000000000000000000000;
    wire _4252;
    wire [23:0] _4247 = 24'b000000000000000000000001;
    wire [23:0] _4248;
    wire [23:0] _4249;
    wire _4250;
    wire _4253;
    wire _4245;
    wire _4243;
    wire _4242;
    wire _4244;
    wire _4246;
    wire _4298;
    wire _4299;
    wire _98;
    reg seq_b_caught_up;
    wire _3450;
    wire _3451;
    wire _3452;
    wire [2:0] _3404 = 3'b000;
    wire [2:0] _3403 = 3'b000;
    wire [2:0] _4068 = 3'b000;
    wire _4069;
    wire _99;
    wire _4070;
    wire [1:0] _4303 = 2'b00;
    wire [2:0] _4304;
    wire [2:0] _4031 = 3'b100;
    wire _4032;
    wire [6:0] _4028 = 7'b1100110;
    wire _4029;
    wire _4030;
    wire _4033;
    wire [1:0] _4300 = 2'b00;
    wire [2:0] _4301;
    wire [2:0] _4302;
    wire [2:0] _4305;
    wire [2:0] _100;
    reg [2:0] _3405;
    wire [2:0] _3402 = 3'b000;
    wire _3406;
    wire _3401;
    wire _3407;
    wire _3408;
    wire _3398 = 1'b0;
    wire _3397;
    wire _3399;
    wire [3:0] _3394 = 4'b0111;
    wire _3395;
    wire _3396;
    wire _3400;
    wire _3409;
    wire _1160 = 1'b0;
    wire _1159 = 1'b0;
    wire _4328;
    wire _4327;
    wire _4329;
    wire [23:0] _1171 = 24'b000000000000000000000000;
    wire [23:0] _1170 = 24'b000000000000000000000000;
    wire [23:0] _4321 = 24'b000000000000000001000000;
    wire [23:0] _4322;
    wire [5:0] _4264 = 6'b000000;
    wire [17:0] _4263;
    wire [23:0] _4265;
    wire [3:0] _4261 = 4'b0000;
    wire [19:0] _4260;
    wire [23:0] _4262;
    wire [1:0] _4258 = 2'b00;
    wire [21:0] _4257;
    wire [23:0] _4259;
    wire [11:0] _4255;
    wire [11:0] _4254 = 12'b000000000000;
    wire [23:0] _4256;
    reg [23:0] _4266;
    wire [23:0] _4267;
    wire [5:0] _4285 = 6'b000000;
    wire [17:0] _4284;
    wire [23:0] _4286;
    wire [3:0] _4282 = 4'b0000;
    wire [19:0] _4281;
    wire [23:0] _4283;
    wire [1:0] _4279 = 2'b00;
    wire [21:0] _4278;
    wire [23:0] _4280;
    wire [5:0] _4276;
    wire [17:0] _4275 = 18'b000000000000000000;
    wire [23:0] _4277;
    wire [1:0] _1174 = 2'b00;
    wire [1:0] _1173 = 2'b00;
    wire [1:0] _4315 = 2'b00;
    wire [7:0] _3494;
    wire [1:0] _4312;
    wire [3:0] _4309 = 4'b0111;
    wire [3:0] _3490;
    wire _4310;
    wire [3:0] _4306 = 4'b0101;
    wire _4307;
    wire _4308;
    wire _4311;
    wire [1:0] _4313;
    wire [1:0] _4314;
    wire [1:0] _4316;
    wire [1:0] _101;
    reg [1:0] seq_b_prescale;
    reg [23:0] _4287;
    wire [23:0] _4288;
    wire [23:0] _4317;
    wire [23:0] _4318;
    wire [3:0] _3411 = 4'b0011;
    wire _3412;
    wire _3413;
    wire [23:0] _4319;
    wire [23:0] _4320;
    wire [23:0] _4323;
    wire [23:0] _102;
    reg [23:0] seq_b_sched_s;
    wire [23:0] _4324;
    wire _4325;
    wire _4326;
    wire _4330;
    wire _4331;
    wire _103;
    reg seq_b_far;
    wire _3389;
    wire [3:0] _3385 = 4'b0010;
    wire _3386;
    wire _3387;
    wire _3388;
    wire _3390;
    wire _3391;
    wire [3:0] _3382 = 4'b0010;
    wire _3383;
    wire _3384;
    wire _3392;
    wire _3380;
    wire [3:0] _3377 = 4'b0001;
    wire [3:0] _1118;
    wire _3378;
    wire _3379;
    wire _3381;
    wire _3393;
    wire _3410;
    wire _3453;
    wire _3459;
    wire _3460;
    wire _3461;
    wire _3463;
    wire _3465;
    wire [15:0] _4333;
    wire [15:0] _4334;
    wire [15:0] _104;
    reg [15:0] seq_b_ir;
    wire [3:0] _792;
    wire _794;
    wire _799;
    wire _835;
    wire _839;
    wire _876;
    wire _905;
    wire _1073;
    wire _1098;
    wire _1115;
    wire _1116;
    wire _1117;
    wire _4336;
    wire _4337;
    wire _105;
    reg seq_b_running;
    wire _1157;
    wire _1158;
    wire _1163;
    wire _1166;
    wire [1:0] _4338 = 2'b00;
    wire [2:0] _4339;
    wire [2:0] _4340;
    wire [2:0] _4341;
    wire [2:0] _106;
    reg [2:0] queue_b_count;
    wire [2:0] _294 = 3'b000;
    wire _304;
    wire _329;
    wire _5438;
    wire [1:0] _5431 = 2'b11;
    wire [1:0] _287;
    wire _5432;
    wire _5433;
    wire [23:0] _253 = 24'b000000000000000000000000;
    wire [23:0] _251;
    wire [23:0] _252;
    wire _254;
    reg [28:0] _244;
    wire [23:0] _245;
    wire [23:0] _249;
    wire _250;
    wire _255;
    wire [2:0] _226 = 3'b000;
    wire [2:0] _206 = 3'b000;
    wire [23:0] _268 = 24'b000000000000000000000000;
    wire [23:0] _266;
    wire [23:0] _267;
    wire _269;
    wire [28:0] _242 = 29'b00000000000000000000000000000;
    wire [28:0] _241 = 29'b00000000000000000000000000000;
    wire [1:0] _4345 = 2'b11;
    wire _4346;
    wire [28:0] _4475;
    wire [28:0] _4476;
    wire [28:0] _107;
    reg [28:0] queue_a_entry3;
    wire [28:0] _239 = 29'b00000000000000000000000000000;
    wire [28:0] _238 = 29'b00000000000000000000000000000;
    wire [1:0] _4477 = 2'b10;
    wire _4478;
    wire [28:0] _4479;
    wire [28:0] _4480;
    wire [28:0] _108;
    reg [28:0] queue_a_entry2;
    wire [28:0] _236 = 29'b00000000000000000000000000000;
    wire [28:0] _235 = 29'b00000000000000000000000000000;
    wire [1:0] _4481 = 2'b01;
    wire _4482;
    wire [28:0] _4483;
    wire [28:0] _4484;
    wire [28:0] _109;
    reg [28:0] queue_a_entry1;
    wire [28:0] _233 = 29'b00000000000000000000000000000;
    wire [28:0] _232 = 29'b00000000000000000000000000000;
    wire [1:0] _4467 = 2'b00;
    wire _4468;
    wire _4469;
    wire [1:0] _4465 = 2'b00;
    wire _4466;
    wire _4470;
    wire _4464;
    wire _4471;
    wire [1:0] _4472;
    wire [1:0] _4454 = 2'b01;
    wire [1:0] _4453 = 2'b10;
    wire [1:0] _4455;
    wire [1:0] _4449 = 2'b00;
    wire _4450;
    wire [1:0] _4451;
    wire [1:0] _4446 = 2'b10;
    wire [1:0] _4445 = 2'b01;
    wire _4444;
    wire [1:0] _4447;
    wire [1:0] _4439 = 2'b00;
    wire _4440;
    wire _4441;
    wire [1:0] _4437 = 2'b00;
    wire [1:0] _4434 = 2'b00;
    wire [1:0] _4433 = 2'b00;
    wire [1:0] _4587 = 2'b10;
    wire [1:0] _4583;
    wire [1:0] _4584;
    wire [1:0] _4585;
    wire [1:0] _4586;
    wire [1:0] _4588;
    wire [1:0] _110;
    reg [1:0] seq_a_shadow_clk;
    wire [1:0] _4431 = 2'b00;
    wire [1:0] _4430 = 2'b00;
    wire [1:0] _4593 = 2'b10;
    wire [1:0] _4589;
    wire [2:0] _4579 = 3'b111;
    wire _4580;
    wire [2:0] _4576 = 3'b110;
    wire _4577;
    wire [2:0] _4574 = 3'b101;
    wire _4575;
    wire _4578;
    wire _4581;
    wire _4582;
    wire [1:0] _4590;
    wire [1:0] _4591;
    wire [1:0] _4592;
    wire [1:0] _4594;
    wire [1:0] _111;
    reg [1:0] seq_a_shadow_data;
    wire [1:0] _4436;
    wire _4438;
    wire _4442;
    wire _4428;
    wire _4429;
    wire _4423;
    wire _4443;
    wire [1:0] _4448;
    wire [1:0] _4452;
    wire [1:0] _4456;
    wire [1:0] _4421 = 2'b11;
    wire [1:0] _4420 = 2'b01;
    wire [1:0] _4422;
    wire [1:0] _4457;
    wire [1:0] _4419 = 2'b00;
    wire [2:0] _4415 = 3'b111;
    wire _4416;
    wire [2:0] _4413 = 3'b101;
    wire _4414;
    wire _4417;
    wire [2:0] _4409 = 3'b100;
    wire _4410;
    wire [2:0] _4407 = 3'b011;
    wire _4408;
    wire _4411;
    wire [2:0] _4404 = 3'b010;
    wire _4405;
    wire [2:0] _4402 = 3'b001;
    wire _4403;
    wire _4406;
    wire _4412;
    wire _4418;
    wire [1:0] _4458;
    wire [1:0] _4473;
    wire [2:0] _4369;
    wire [2:0] _4366;
    wire [2:0] _4352 = 3'b111;
    wire _4353;
    wire [2:0] _4350 = 3'b110;
    wire _4351;
    wire _4354;
    wire [2:0] _4348 = 3'b101;
    wire _4349;
    wire _4355;
    wire [2:0] _4370;
    wire [5:0] _2573 = 6'b000000;
    wire [17:0] _2572;
    wire [23:0] _2574;
    wire [3:0] _2570 = 4'b0000;
    wire [19:0] _2569;
    wire [23:0] _2571;
    wire [1:0] _2567 = 2'b00;
    wire [21:0] _2566;
    wire [23:0] _2568;
    wire [5:0] _2563;
    wire [7:0] _2552 = 8'b00000000;
    wire [7:0] _2551 = 8'b00000000;
    wire [7:0] _3504;
    wire [3:0] _4599 = 4'b0100;
    wire _4600;
    wire [3:0] _4595 = 4'b0101;
    wire _4596;
    wire _4597;
    wire _4601;
    wire [7:0] _4603;
    wire [7:0] _4604;
    wire [7:0] _4605;
    wire [7:0] _112;
    reg [7:0] seq_a_k3;
    wire [7:0] _2549 = 8'b00000000;
    wire [7:0] _2548 = 8'b00000000;
    wire [7:0] _3514;
    wire [3:0] _4609 = 4'b0011;
    wire _4610;
    wire [3:0] _4606 = 4'b0101;
    wire _4607;
    wire _4608;
    wire _4611;
    wire [7:0] _4612;
    wire [7:0] _4613;
    wire [7:0] _4614;
    wire [7:0] _113;
    reg [7:0] seq_a_k2;
    wire [7:0] _2546 = 8'b00000000;
    wire [7:0] _2545 = 8'b00000000;
    wire [7:0] _3524;
    wire [3:0] _4618 = 4'b0010;
    wire _4619;
    wire [3:0] _4615 = 4'b0101;
    wire _4616;
    wire _4617;
    wire _4620;
    wire [7:0] _4621;
    wire [7:0] _4622;
    wire [7:0] _4623;
    wire [7:0] _114;
    reg [7:0] seq_a_k1;
    wire [7:0] _2544 = 8'b00000000;
    wire [1:0] _2543;
    reg [7:0] _2554;
    wire _2555;
    wire [1:0] _2556;
    wire [9:0] _2557;
    wire [5:0] _2541;
    wire [3:0] _2540 = 4'b0000;
    wire [9:0] _2542;
    wire [9:0] _2558;
    wire _2559;
    wire [1:0] _2560;
    wire [3:0] _2561;
    wire [7:0] _2562;
    wire [13:0] _2564;
    wire [23:0] _2565;
    reg [23:0] _2575;
    wire [23:0] _2576;
    wire [28:0] _4474;
    wire [1:0] _4627 = 2'b00;
    wire [1:0] _4343 = 2'b00;
    wire [1:0] _4342 = 2'b00;
    wire [1:0] _4624 = 2'b01;
    wire [1:0] _4625;
    wire [1:0] _4626;
    wire [1:0] _115;
    reg [1:0] queue_a_write_ptr;
    wire _4628;
    wire [28:0] _4629;
    wire [28:0] _4630;
    wire [28:0] _116;
    reg [28:0] queue_a_entry0;
    wire [1:0] _260 = 2'b01;
    wire [1:0] _230 = 2'b00;
    wire _225;
    wire [1:0] _229 = 2'b00;
    wire [1:0] _4636;
    wire [1:0] _4637;
    wire [1:0] _117;
    reg [1:0] queue_a_read_ptr;
    wire [1:0] _261;
    reg [28:0] _262;
    wire [23:0] _263;
    wire [23:0] _264;
    wire _265;
    wire _270;
    wire [2:0] _257 = 3'b001;
    wire _258;
    wire _259;
    wire _271;
    wire [1:0] _4633 = 2'b00;
    wire [2:0] _4634;
    wire [1:0] _4631 = 2'b00;
    wire [2:0] _4632;
    wire [2:0] _4635;
    wire _2526;
    wire [2:0] _2528 = 3'b100;
    wire _2529;
    wire _118;
    wire [3:0] _2518 = 4'b0001;
    wire _2519;
    wire _2520;
    wire _2152 = 1'b0;
    wire _2151 = 1'b0;
    wire _2497;
    wire _5420;
    wire [15:0] _2477 = 16'b0000000000000000;
    wire [15:0] _2475 = 16'b0000001111111111;
    wire [15:0] _2476;
    wire _2478;
    wire _2472 = 1'b1;
    wire _2471;
    wire _2473;
    wire _2468 = 1'b0;
    wire _2467;
    wire _2469;
    wire [3:0] _2465 = 4'b0111;
    wire [3:0] _2464;
    wire _2466;
    wire _2470;
    wire _2474;
    wire _2479;
    wire [15:0] _2460 = 16'b0000000000000000;
    wire [15:0] _2458 = 16'b0000000111111111;
    wire [15:0] _2459;
    wire _2461;
    wire [2:0] _2454 = 3'b100;
    wire [2:0] _2453;
    wire _2455;
    wire [2:0] _2450 = 3'b011;
    wire [2:0] _2449;
    wire _2451;
    wire [2:0] _2446 = 3'b010;
    wire [2:0] _2445;
    wire _2447;
    wire [2:0] _2443 = 3'b000;
    wire [2:0] _2442;
    wire _2444;
    wire _2448;
    wire _2452;
    wire _2456;
    wire [3:0] _2440 = 4'b1000;
    wire [3:0] _2439;
    wire _2441;
    wire _2457;
    wire _2462;
    wire [3:0] _2434 = 4'b1001;
    wire [3:0] _2433;
    wire _2435;
    wire [3:0] _2430 = 4'b1000;
    wire [3:0] _2429;
    wire _2431;
    wire [3:0] _2426 = 4'b0111;
    wire [3:0] _2425;
    wire _2427;
    wire [7:0] _2420 = 8'b00111101;
    wire [7:0] _2419;
    wire _2421;
    wire [7:0] _2416 = 8'b00111100;
    wire [7:0] _2415;
    wire _2417;
    wire [7:0] _2412 = 8'b00111001;
    wire [7:0] _2411;
    wire _2413;
    wire [7:0] _2408 = 8'b00111000;
    wire [7:0] _2407;
    wire _2409;
    wire [7:0] _2404 = 8'b00110101;
    wire [7:0] _2403;
    wire _2405;
    wire [7:0] _2400 = 8'b00110100;
    wire [7:0] _2399;
    wire _2401;
    wire [7:0] _2396 = 8'b00110001;
    wire [7:0] _2395;
    wire _2397;
    wire [7:0] _2392 = 8'b00110000;
    wire [7:0] _2391;
    wire _2393;
    wire [7:0] _2388 = 8'b00101101;
    wire [7:0] _2387;
    wire _2389;
    wire [7:0] _2384 = 8'b00101100;
    wire [7:0] _2383;
    wire _2385;
    wire [7:0] _2380 = 8'b00101001;
    wire [7:0] _2379;
    wire _2381;
    wire [7:0] _2376 = 8'b00101000;
    wire [7:0] _2375;
    wire _2377;
    wire [7:0] _2372 = 8'b00100101;
    wire [7:0] _2371;
    wire _2373;
    wire [7:0] _2368 = 8'b00100100;
    wire [7:0] _2367;
    wire _2369;
    wire [7:0] _2364 = 8'b00100001;
    wire [7:0] _2363;
    wire _2365;
    wire [7:0] _2360 = 8'b00100000;
    wire [7:0] _2359;
    wire _2361;
    wire [7:0] _2356 = 8'b00011101;
    wire [7:0] _2355;
    wire _2357;
    wire [7:0] _2352 = 8'b00011100;
    wire [7:0] _2351;
    wire _2353;
    wire [7:0] _2348 = 8'b00011001;
    wire [7:0] _2347;
    wire _2349;
    wire [7:0] _2344 = 8'b00011000;
    wire [7:0] _2343;
    wire _2345;
    wire [7:0] _2340 = 8'b00010101;
    wire [7:0] _2339;
    wire _2341;
    wire [7:0] _2336 = 8'b00010100;
    wire [7:0] _2335;
    wire _2337;
    wire [7:0] _2332 = 8'b00010001;
    wire [7:0] _2331;
    wire _2333;
    wire [7:0] _2328 = 8'b00010000;
    wire [7:0] _2327;
    wire _2329;
    wire [7:0] _2324 = 8'b00001101;
    wire [7:0] _2323;
    wire _2325;
    wire [7:0] _2320 = 8'b00001100;
    wire [7:0] _2319;
    wire _2321;
    wire [7:0] _2316 = 8'b00001001;
    wire [7:0] _2315;
    wire _2317;
    wire [7:0] _2312 = 8'b00001000;
    wire [7:0] _2311;
    wire _2313;
    wire [7:0] _2308 = 8'b00000101;
    wire [7:0] _2307;
    wire _2309;
    wire [7:0] _2304 = 8'b00000100;
    wire [7:0] _2303;
    wire _2305;
    wire [7:0] _2300 = 8'b00000001;
    wire [7:0] _2299;
    wire _2301;
    wire [7:0] _2297 = 8'b00000000;
    wire [7:0] _2296;
    wire _2298;
    wire _2302;
    wire _2306;
    wire _2310;
    wire _2314;
    wire _2318;
    wire _2322;
    wire _2326;
    wire _2330;
    wire _2334;
    wire _2338;
    wire _2342;
    wire _2346;
    wire _2350;
    wire _2354;
    wire _2358;
    wire _2362;
    wire _2366;
    wire _2370;
    wire _2374;
    wire _2378;
    wire _2382;
    wire _2386;
    wire _2390;
    wire _2394;
    wire _2398;
    wire _2402;
    wire _2406;
    wire _2410;
    wire _2414;
    wire _2418;
    wire _2422;
    wire [3:0] _2294 = 4'b0101;
    wire [3:0] _2293;
    wire _2295;
    wire _2423;
    wire [3:0] _2290 = 4'b0100;
    wire [3:0] _2289;
    wire _2291;
    wire [3:0] _2286 = 4'b0011;
    wire [3:0] _2285;
    wire _2287;
    wire [3:0] _2282 = 4'b0010;
    wire [3:0] _2281;
    wire _2283;
    wire [3:0] _2278 = 4'b0001;
    wire [3:0] _2277;
    wire _2279;
    wire [3:0] _2275 = 4'b0000;
    wire [3:0] _2274;
    wire _2276;
    wire _2280;
    wire _2284;
    wire _2288;
    wire _2292;
    wire _2424;
    wire _2428;
    wire _2432;
    wire _2436;
    wire [3:0] _2272 = 4'b0101;
    wire [3:0] _2271;
    wire _2273;
    wire _2437;
    wire [15:0] _2267 = 16'b0000000000000000;
    wire [15:0] _2265 = 16'b0000000011000000;
    wire [15:0] _2266;
    wire _2268;
    wire [3:0] _2261 = 4'b0100;
    wire [3:0] _2260;
    wire _2262;
    wire [3:0] _2257 = 4'b0011;
    wire [3:0] _2256;
    wire _2258;
    wire [3:0] _2253 = 4'b0010;
    wire [3:0] _2252;
    wire _2254;
    wire [3:0] _2249 = 4'b0001;
    wire [3:0] _2248;
    wire _2250;
    wire [3:0] _2246 = 4'b0000;
    wire [3:0] _2245;
    wire _2247;
    wire _2251;
    wire _2255;
    wire _2259;
    wire _2263;
    wire [3:0] _2243 = 4'b0100;
    wire [3:0] _2242;
    wire _2244;
    wire _2264;
    wire _2269;
    wire [15:0] _2238 = 16'b0000000000000000;
    wire [15:0] _2236 = 16'b0000000000111111;
    wire [15:0] _2237;
    wire _2239;
    wire [1:0] _2232 = 2'b10;
    wire [1:0] _2231;
    wire _2233;
    wire [1:0] _2228 = 2'b01;
    wire [1:0] _2227;
    wire _2229;
    wire [1:0] _2225 = 2'b00;
    wire [1:0] _2224;
    wire _2226;
    wire _2230;
    wire _2234;
    wire [2:0] _2220 = 3'b011;
    wire [2:0] _2219;
    wire _2221;
    wire [2:0] _2216 = 3'b010;
    wire [2:0] _2215;
    wire _2217;
    wire [2:0] _2212 = 3'b001;
    wire [2:0] _2211;
    wire _2213;
    wire [2:0] _2209 = 3'b000;
    wire [2:0] _2208;
    wire _2210;
    wire _2214;
    wire _2218;
    wire _2222;
    wire [3:0] _2206 = 4'b0011;
    wire [3:0] _2205;
    wire _2207;
    wire _2223;
    wire _2235;
    wire _2240;
    wire [3:0] _2202 = 4'b0010;
    wire [3:0] _2201;
    wire _2203;
    wire [2:0] _2196 = 3'b111;
    wire [2:0] _2195;
    wire _2197;
    wire [2:0] _2192 = 3'b110;
    wire [2:0] _2191;
    wire _2193;
    wire [2:0] _2188 = 3'b101;
    wire [2:0] _2187;
    wire _2189;
    wire [2:0] _2184 = 3'b100;
    wire [2:0] _2183;
    wire _2185;
    wire [2:0] _2180 = 3'b011;
    wire [2:0] _2179;
    wire _2181;
    wire [2:0] _2176 = 3'b010;
    wire [2:0] _2175;
    wire _2177;
    wire [2:0] _2172 = 3'b001;
    wire [2:0] _2171;
    wire _2173;
    wire [2:0] _2169 = 3'b000;
    wire [2:0] _2168;
    wire _2170;
    wire _2174;
    wire _2178;
    wire _2182;
    wire _2186;
    wire _2190;
    wire _2194;
    wire _2198;
    wire [3:0] _2166 = 4'b0001;
    wire [3:0] _2165;
    wire _2167;
    wire _2199;
    wire [15:0] _2162 = 16'b0000000000000000;
    wire [15:0] _2160 = 16'b0000111111111111;
    wire [15:0] _2161;
    wire _2163;
    wire [3:0] _2158 = 4'b0000;
    wire [15:0] _2155 = 16'b0000000000000000;
    wire [15:0] _2154 = 16'b0000000000000000;
    wire [5:0] _3788 = 6'b111111;
    wire _3789;
    wire _3790;
    wire [15:0] _3787 = 16'b0000000000000000;
    wire [15:0] _3786 = 16'b0000000000000000;
    reg [15:0] imem_63;
    wire [5:0] _3782 = 6'b111110;
    wire _3783;
    wire _3784;
    wire [15:0] _3781 = 16'b0000000000000000;
    wire [15:0] _3780 = 16'b0000000000000000;
    reg [15:0] imem_62;
    wire [5:0] _3776 = 6'b111101;
    wire _3777;
    wire _3778;
    wire [15:0] _3775 = 16'b0000000000000000;
    wire [15:0] _3774 = 16'b0000000000000000;
    reg [15:0] imem_61;
    wire [5:0] _3770 = 6'b111100;
    wire _3771;
    wire _3772;
    wire [15:0] _3769 = 16'b0000000000000000;
    wire [15:0] _3768 = 16'b0000000000000000;
    reg [15:0] imem_60;
    wire [5:0] _3764 = 6'b111011;
    wire _3765;
    wire _3766;
    wire [15:0] _3763 = 16'b0000000000000000;
    wire [15:0] _3762 = 16'b0000000000000000;
    reg [15:0] imem_59;
    wire [5:0] _3758 = 6'b111010;
    wire _3759;
    wire _3760;
    wire [15:0] _3757 = 16'b0000000000000000;
    wire [15:0] _3756 = 16'b0000000000000000;
    reg [15:0] imem_58;
    wire [5:0] _3752 = 6'b111001;
    wire _3753;
    wire _3754;
    wire [15:0] _3751 = 16'b0000000000000000;
    wire [15:0] _3750 = 16'b0000000000000000;
    reg [15:0] imem_57;
    wire [5:0] _3746 = 6'b111000;
    wire _3747;
    wire _3748;
    wire [15:0] _3745 = 16'b0000000000000000;
    wire [15:0] _3744 = 16'b0000000000000000;
    reg [15:0] imem_56;
    wire [5:0] _3740 = 6'b110111;
    wire _3741;
    wire _3742;
    wire [15:0] _3739 = 16'b0000000000000000;
    wire [15:0] _3738 = 16'b0000000000000000;
    reg [15:0] imem_55;
    wire [5:0] _3734 = 6'b110110;
    wire _3735;
    wire _3736;
    wire [15:0] _3733 = 16'b0000000000000000;
    wire [15:0] _3732 = 16'b0000000000000000;
    reg [15:0] imem_54;
    wire [5:0] _3728 = 6'b110101;
    wire _3729;
    wire _3730;
    wire [15:0] _3727 = 16'b0000000000000000;
    wire [15:0] _3726 = 16'b0000000000000000;
    reg [15:0] imem_53;
    wire [5:0] _3722 = 6'b110100;
    wire _3723;
    wire _3724;
    wire [15:0] _3721 = 16'b0000000000000000;
    wire [15:0] _3720 = 16'b0000000000000000;
    reg [15:0] imem_52;
    wire [5:0] _3716 = 6'b110011;
    wire _3717;
    wire _3718;
    wire [15:0] _3715 = 16'b0000000000000000;
    wire [15:0] _3714 = 16'b0000000000000000;
    reg [15:0] imem_51;
    wire [5:0] _3710 = 6'b110010;
    wire _3711;
    wire _3712;
    wire [15:0] _3709 = 16'b0000000000000000;
    wire [15:0] _3708 = 16'b0000000000000000;
    reg [15:0] imem_50;
    wire [5:0] _3704 = 6'b110001;
    wire _3705;
    wire _3706;
    wire [15:0] _3703 = 16'b0000000000000000;
    wire [15:0] _3702 = 16'b0000000000000000;
    reg [15:0] imem_49;
    wire [5:0] _3698 = 6'b110000;
    wire _3699;
    wire _3700;
    wire [15:0] _3697 = 16'b0000000000000000;
    wire [15:0] _3696 = 16'b0000000000000000;
    reg [15:0] imem_48;
    wire [5:0] _3692 = 6'b101111;
    wire _3693;
    wire _3694;
    wire [15:0] _3691 = 16'b0000000000000000;
    wire [15:0] _3690 = 16'b0000000000000000;
    reg [15:0] imem_47;
    wire [5:0] _3686 = 6'b101110;
    wire _3687;
    wire _3688;
    wire [15:0] _3685 = 16'b0000000000000000;
    wire [15:0] _3684 = 16'b0000000000000000;
    reg [15:0] imem_46;
    wire [5:0] _3680 = 6'b101101;
    wire _3681;
    wire _3682;
    wire [15:0] _3679 = 16'b0000000000000000;
    wire [15:0] _3678 = 16'b0000000000000000;
    reg [15:0] imem_45;
    wire [5:0] _3674 = 6'b101100;
    wire _3675;
    wire _3676;
    wire [15:0] _3673 = 16'b0000000000000000;
    wire [15:0] _3672 = 16'b0000000000000000;
    reg [15:0] imem_44;
    wire [5:0] _3668 = 6'b101011;
    wire _3669;
    wire _3670;
    wire [15:0] _3667 = 16'b0000000000000000;
    wire [15:0] _3666 = 16'b0000000000000000;
    reg [15:0] imem_43;
    wire [5:0] _3662 = 6'b101010;
    wire _3663;
    wire _3664;
    wire [15:0] _3661 = 16'b0000000000000000;
    wire [15:0] _3660 = 16'b0000000000000000;
    reg [15:0] imem_42;
    wire [5:0] _3656 = 6'b101001;
    wire _3657;
    wire _3658;
    wire [15:0] _3655 = 16'b0000000000000000;
    wire [15:0] _3654 = 16'b0000000000000000;
    reg [15:0] imem_41;
    wire [5:0] _3650 = 6'b101000;
    wire _3651;
    wire _3652;
    wire [15:0] _3649 = 16'b0000000000000000;
    wire [15:0] _3648 = 16'b0000000000000000;
    reg [15:0] imem_40;
    wire [5:0] _3644 = 6'b100111;
    wire _3645;
    wire _3646;
    wire [15:0] _3643 = 16'b0000000000000000;
    wire [15:0] _3642 = 16'b0000000000000000;
    reg [15:0] imem_39;
    wire [5:0] _3638 = 6'b100110;
    wire _3639;
    wire _3640;
    wire [15:0] _3637 = 16'b0000000000000000;
    wire [15:0] _3636 = 16'b0000000000000000;
    reg [15:0] imem_38;
    wire [5:0] _3632 = 6'b100101;
    wire _3633;
    wire _3634;
    wire [15:0] _3631 = 16'b0000000000000000;
    wire [15:0] _3630 = 16'b0000000000000000;
    reg [15:0] imem_37;
    wire [5:0] _3626 = 6'b100100;
    wire _3627;
    wire _3628;
    wire [15:0] _3625 = 16'b0000000000000000;
    wire [15:0] _3624 = 16'b0000000000000000;
    reg [15:0] imem_36;
    wire [5:0] _3620 = 6'b100011;
    wire _3621;
    wire _3622;
    wire [15:0] _3619 = 16'b0000000000000000;
    wire [15:0] _3618 = 16'b0000000000000000;
    reg [15:0] imem_35;
    wire [5:0] _3614 = 6'b100010;
    wire _3615;
    wire _3616;
    wire [15:0] _3613 = 16'b0000000000000000;
    wire [15:0] _3612 = 16'b0000000000000000;
    reg [15:0] imem_34;
    wire [5:0] _3608 = 6'b100001;
    wire _3609;
    wire _3610;
    wire [15:0] _3607 = 16'b0000000000000000;
    wire [15:0] _3606 = 16'b0000000000000000;
    reg [15:0] imem_33;
    wire [5:0] _3602 = 6'b100000;
    wire _3603;
    wire _3604;
    wire [15:0] _3597 = 16'b0000000000000000;
    wire [15:0] _3596 = 16'b0000000000000000;
    reg [15:0] imem_32;
    wire [5:0] _4871 = 6'b011111;
    wire _4872;
    wire _4873;
    wire [15:0] _4870 = 16'b0000000000000000;
    wire [15:0] _4869 = 16'b0000000000000000;
    reg [15:0] imem_31;
    wire [5:0] _4865 = 6'b011110;
    wire _4866;
    wire _4867;
    wire [15:0] _4864 = 16'b0000000000000000;
    wire [15:0] _4863 = 16'b0000000000000000;
    reg [15:0] imem_30;
    wire [5:0] _4859 = 6'b011101;
    wire _4860;
    wire _4861;
    wire [15:0] _4858 = 16'b0000000000000000;
    wire [15:0] _4857 = 16'b0000000000000000;
    reg [15:0] imem_29;
    wire [5:0] _4853 = 6'b011100;
    wire _4854;
    wire _4855;
    wire [15:0] _4852 = 16'b0000000000000000;
    wire [15:0] _4851 = 16'b0000000000000000;
    reg [15:0] imem_28;
    wire [5:0] _4847 = 6'b011011;
    wire _4848;
    wire _4849;
    wire [15:0] _4846 = 16'b0000000000000000;
    wire [15:0] _4845 = 16'b0000000000000000;
    reg [15:0] imem_27;
    wire [5:0] _4841 = 6'b011010;
    wire _4842;
    wire _4843;
    wire [15:0] _4840 = 16'b0000000000000000;
    wire [15:0] _4839 = 16'b0000000000000000;
    reg [15:0] imem_26;
    wire [5:0] _4835 = 6'b011001;
    wire _4836;
    wire _4837;
    wire [15:0] _4834 = 16'b0000000000000000;
    wire [15:0] _4833 = 16'b0000000000000000;
    reg [15:0] imem_25;
    wire [5:0] _4829 = 6'b011000;
    wire _4830;
    wire _4831;
    wire [15:0] _4828 = 16'b0000000000000000;
    wire [15:0] _4827 = 16'b0000000000000000;
    reg [15:0] imem_24;
    wire [5:0] _4823 = 6'b010111;
    wire _4824;
    wire _4825;
    wire [15:0] _4822 = 16'b0000000000000000;
    wire [15:0] _4821 = 16'b0000000000000000;
    reg [15:0] imem_23;
    wire [5:0] _4817 = 6'b010110;
    wire _4818;
    wire _4819;
    wire [15:0] _4816 = 16'b0000000000000000;
    wire [15:0] _4815 = 16'b0000000000000000;
    reg [15:0] imem_22;
    wire [5:0] _4811 = 6'b010101;
    wire _4812;
    wire _4813;
    wire [15:0] _4810 = 16'b0000000000000000;
    wire [15:0] _4809 = 16'b0000000000000000;
    reg [15:0] imem_21;
    wire [5:0] _4805 = 6'b010100;
    wire _4806;
    wire _4807;
    wire [15:0] _4804 = 16'b0000000000000000;
    wire [15:0] _4803 = 16'b0000000000000000;
    reg [15:0] imem_20;
    wire [5:0] _4799 = 6'b010011;
    wire _4800;
    wire _4801;
    wire [15:0] _4798 = 16'b0000000000000000;
    wire [15:0] _4797 = 16'b0000000000000000;
    reg [15:0] imem_19;
    wire [5:0] _4793 = 6'b010010;
    wire _4794;
    wire _4795;
    wire [15:0] _4792 = 16'b0000000000000000;
    wire [15:0] _4791 = 16'b0000000000000000;
    reg [15:0] imem_18;
    wire [5:0] _4787 = 6'b010001;
    wire _4788;
    wire _4789;
    wire [15:0] _4786 = 16'b0000000000000000;
    wire [15:0] _4785 = 16'b0000000000000000;
    reg [15:0] imem_17;
    wire [5:0] _4781 = 6'b010000;
    wire _4782;
    wire _4783;
    wire [15:0] _4780 = 16'b0000000000000000;
    wire [15:0] _4779 = 16'b0000000000000000;
    reg [15:0] imem_16;
    wire [5:0] _4775 = 6'b001111;
    wire _4776;
    wire _4777;
    wire [15:0] _4774 = 16'b0000000000000000;
    wire [15:0] _4773 = 16'b0000000000000000;
    reg [15:0] imem_15;
    wire [5:0] _4769 = 6'b001110;
    wire _4770;
    wire _4771;
    wire [15:0] _4768 = 16'b0000000000000000;
    wire [15:0] _4767 = 16'b0000000000000000;
    reg [15:0] imem_14;
    wire [5:0] _4763 = 6'b001101;
    wire _4764;
    wire _4765;
    wire [15:0] _4762 = 16'b0000000000000000;
    wire [15:0] _4761 = 16'b0000000000000000;
    reg [15:0] imem_13;
    wire [5:0] _4757 = 6'b001100;
    wire _4758;
    wire _4759;
    wire [15:0] _4756 = 16'b0000000000000000;
    wire [15:0] _4755 = 16'b0000000000000000;
    reg [15:0] imem_12;
    wire [5:0] _4751 = 6'b001011;
    wire _4752;
    wire _4753;
    wire [15:0] _4750 = 16'b0000000000000000;
    wire [15:0] _4749 = 16'b0000000000000000;
    reg [15:0] imem_11;
    wire [5:0] _4745 = 6'b001010;
    wire _4746;
    wire _4747;
    wire [15:0] _4744 = 16'b0000000000000000;
    wire [15:0] _4743 = 16'b0000000000000000;
    reg [15:0] imem_10;
    wire [5:0] _4739 = 6'b001001;
    wire _4740;
    wire _4741;
    wire [15:0] _4738 = 16'b0000000000000000;
    wire [15:0] _4737 = 16'b0000000000000000;
    reg [15:0] imem_09;
    wire [5:0] _4733 = 6'b001000;
    wire _4734;
    wire _4735;
    wire [15:0] _4732 = 16'b0000000000000000;
    wire [15:0] _4731 = 16'b0000000000000000;
    reg [15:0] imem_08;
    wire [5:0] _4727 = 6'b000111;
    wire _4728;
    wire _4729;
    wire [15:0] _4726 = 16'b0000000000000000;
    wire [15:0] _4725 = 16'b0000000000000000;
    reg [15:0] imem_07;
    wire [5:0] _4721 = 6'b000110;
    wire _4722;
    wire _4723;
    wire [15:0] _4720 = 16'b0000000000000000;
    wire [15:0] _4719 = 16'b0000000000000000;
    reg [15:0] imem_06;
    wire [5:0] _4715 = 6'b000101;
    wire _4716;
    wire _4717;
    wire [15:0] _4714 = 16'b0000000000000000;
    wire [15:0] _4713 = 16'b0000000000000000;
    reg [15:0] imem_05;
    wire [5:0] _4709 = 6'b000100;
    wire _4710;
    wire _4711;
    wire [15:0] _4708 = 16'b0000000000000000;
    wire [15:0] _4707 = 16'b0000000000000000;
    reg [15:0] imem_04;
    wire [5:0] _4703 = 6'b000011;
    wire _4704;
    wire _4705;
    wire [15:0] _4702 = 16'b0000000000000000;
    wire [15:0] _4701 = 16'b0000000000000000;
    reg [15:0] imem_03;
    wire [5:0] _4697 = 6'b000010;
    wire _4698;
    wire _4699;
    wire [15:0] _4696 = 16'b0000000000000000;
    wire [15:0] _4695 = 16'b0000000000000000;
    reg [15:0] imem_02;
    wire [5:0] _4691 = 6'b000001;
    wire _4692;
    wire _4693;
    wire [15:0] _4690 = 16'b0000000000000000;
    wire [15:0] _4689 = 16'b0000000000000000;
    reg [15:0] imem_01;
    wire [5:0] _4685 = 6'b000000;
    wire [5:0] _3601;
    wire _4686;
    wire [6:0] _3598 = 7'b1000000;
    wire _3599;
    wire _3600;
    wire _4687;
    wire [15:0] _4684 = 16'b0000000000000000;
    wire [15:0] _4683 = 16'b0000000000000000;
    wire [15:0] _3595;
    reg [15:0] imem_00;
    wire [5:0] _4682;
    reg [15:0] _4875;
    wire [15:0] _119;
    wire [15:0] _5417;
    wire _4572;
    wire [5:0] _2493 = 6'b000000;
    wire [5:0] _2492 = 6'b000000;
    wire [6:0] _3586 = 7'b1000111;
    wire _3587;
    wire _3588;
    wire [13:0] _3585 = 14'b00000000000000;
    wire [13:0] _3584 = 14'b00000000000000;
    wire [13:0] _3583;
    reg [13:0] _3589;
    wire [5:0] _4681;
    wire [5:0] _4678 = 6'b000001;
    wire [5:0] _4679;
    wire _4674;
    wire _4673;
    wire _4672;
    wire _4671;
    wire _4670;
    wire _4669;
    wire _4668;
    wire _4667;
    reg _4675;
    wire [3:0] _4663 = 4'b0100;
    wire _4664;
    wire _4665;
    wire _4666;
    wire _4676;
    wire _4659 = 1'b0;
    wire _4658 = 1'b0;
    wire _4876;
    wire _4877;
    wire _4878;
    wire _4879;
    wire _120;
    reg seq_a_flag;
    wire [3:0] _4655 = 4'b0011;
    wire _4656;
    wire _4657;
    wire _4661;
    wire [15:0] _4649 = 16'b0000000000000000;
    wire _4650;
    wire _4651;
    wire [3:0] _4647 = 4'b0010;
    wire _4648;
    wire _4652;
    wire [15:0] _4642 = 16'b0000000000000000;
    wire _4643;
    wire _4644;
    wire [3:0] _4640 = 4'b0001;
    wire _4641;
    wire _4645;
    wire [3:0] _4638 = 4'b0000;
    wire _4639;
    wire _4646;
    wire _4653;
    wire _4654;
    wire _4662;
    wire _4677;
    wire [5:0] _4680;
    wire [2:0] _4397 = 3'b011;
    wire _4398;
    wire [2:0] _4394 = 3'b010;
    wire _4395;
    wire [2:0] _4391 = 3'b001;
    wire _4392;
    wire [2:0] _4388 = 3'b000;
    wire _4389;
    wire [2:0] _4386 = 3'b100;
    wire _4387;
    wire _4390;
    wire _4393;
    wire _4396;
    wire _4399;
    wire _4356;
    wire _4385;
    wire _4400;
    wire [2:0] _4381 = 3'b101;
    wire _4382;
    wire [2:0] _4379 = 3'b110;
    wire [2:0] _4377 = 3'b000;
    wire [2:0] _4376 = 3'b000;
    wire [2:0] _5241 = 3'b000;
    wire [2:0] _5238 = 3'b000;
    wire [2:0] _5232 = 3'b001;
    wire [2:0] _5233;
    wire [2:0] _5231 = 3'b001;
    wire _5230;
    wire [2:0] _5234;
    wire [2:0] _5227 = 3'b001;
    wire [2:0] _5228;
    wire [2:0] _5226 = 3'b000;
    wire _4460 = 1'b0;
    wire _4459 = 1'b0;
    wire _4896 = 1'b0;
    wire _4893 = 1'b0;
    wire _4891;
    wire _4892;
    wire _4894;
    wire _4895;
    wire _4897;
    wire _121;
    reg seq_a_stuff_last;
    wire _4462;
    wire _4463;
    wire [31:0] _4425 = 32'b00000000000000000000000000000000;
    wire [31:0] _4424 = 32'b00000000000000000000000000000000;
    wire [31:0] _5224 = 32'b00000000000000000000000000000000;
    wire [15:0] _5220 = 16'b0000000000000000;
    wire _5217 = 1'b0;
    wire [14:0] _5216;
    wire [15:0] _5218;
    wire [1:0] _5214 = 2'b00;
    wire [13:0] _5213;
    wire [15:0] _5215;
    wire [2:0] _5211 = 3'b000;
    wire [12:0] _5210;
    wire [15:0] _5212;
    wire [3:0] _5208 = 4'b0000;
    wire [11:0] _5207;
    wire [15:0] _5209;
    wire [4:0] _5205 = 5'b00000;
    wire [10:0] _5204;
    wire [15:0] _5206;
    wire [5:0] _5202 = 6'b000000;
    wire [9:0] _5201;
    wire [15:0] _5203;
    wire [6:0] _5199 = 7'b0000000;
    wire [8:0] _5198;
    wire [15:0] _5200;
    wire [7:0] _5196 = 8'b00000000;
    wire [7:0] _5195;
    wire [15:0] _5197;
    wire [8:0] _5193 = 9'b000000000;
    wire [6:0] _5192;
    wire [15:0] _5194;
    wire [9:0] _5190 = 10'b0000000000;
    wire [5:0] _5189;
    wire [15:0] _5191;
    wire [10:0] _5187 = 11'b00000000000;
    wire [4:0] _5186;
    wire [15:0] _5188;
    wire [11:0] _5184 = 12'b000000000000;
    wire [3:0] _5183;
    wire [15:0] _5185;
    wire [12:0] _5181 = 13'b0000000000000;
    wire [2:0] _5180;
    wire [15:0] _5182;
    wire [13:0] _5178 = 14'b00000000000000;
    wire [1:0] _5177;
    wire [15:0] _5179;
    wire [14:0] _5175 = 15'b000000000000000;
    wire _4899 = 1'b0;
    wire _4898 = 1'b0;
    wire _4929 = 1'b0;
    wire _4926 = 1'b0;
    wire _4924 = 1'b1;
    wire _4922 = 1'b0;
    wire _4923;
    wire [2:0] _4912 = 3'b100;
    wire [2:0] _4911;
    wire _4913;
    wire [3:0] _4908 = 4'b1000;
    wire _4909;
    wire _4910;
    wire _4914;
    wire _4925;
    wire _4927;
    wire _4928;
    wire _4930;
    wire _122;
    reg seq_a_crc_corrupt;
    wire [14:0] _5169 = 15'b000000000000000;
    wire [15:0] _5170;
    wire [15:0] _5167 = 16'b0000000000000000;
    wire _4932 = 1'b0;
    wire _4931 = 1'b0;
    wire _4934;
    wire _4935;
    wire _4936;
    wire _4937;
    wire _123;
    reg seq_a_crc_inv;
    wire [15:0] _5168;
    wire [15:0] _5171;
    wire [15:0] _4965 = 16'b0000000000000000;
    wire [15:0] _4964 = 16'b0000000000000000;
    wire [3:0] _5099 = 4'b0000;
    wire _5100;
    wire _5101;
    wire [3:0] _5096 = 4'b0001;
    wire _5097;
    wire _5098;
    wire [3:0] _5093 = 4'b0010;
    wire _5094;
    wire _5095;
    wire [3:0] _5090 = 4'b0011;
    wire _5091;
    wire _5092;
    wire [3:0] _5087 = 4'b0100;
    wire _5088;
    wire _5089;
    wire [3:0] _5084 = 4'b0101;
    wire _5085;
    wire _5086;
    wire [3:0] _5081 = 4'b0110;
    wire _5082;
    wire _5083;
    wire [3:0] _5078 = 4'b0111;
    wire _5079;
    wire _5080;
    wire [3:0] _5075 = 4'b1000;
    wire _5076;
    wire _5077;
    wire [3:0] _5072 = 4'b1001;
    wire _5073;
    wire _5074;
    wire [3:0] _5069 = 4'b1010;
    wire _5070;
    wire _5071;
    wire [3:0] _5066 = 4'b1011;
    wire _5067;
    wire _5068;
    wire [3:0] _5063 = 4'b1100;
    wire _5064;
    wire _5065;
    wire [3:0] _5060 = 4'b1101;
    wire _5061;
    wire _5062;
    wire [3:0] _5057 = 4'b1110;
    wire _5058;
    wire _5059;
    wire [3:0] _5054 = 4'b1111;
    wire [3:0] _5053;
    wire _5055;
    wire _5056;
    wire [15:0] _5102;
    wire [15:0] _5052 = 16'b0000000000000000;
    wire _5051;
    wire [15:0] _5103;
    wire [3:0] _5043 = 4'b0000;
    wire _5044;
    wire _5045;
    wire [3:0] _5040 = 4'b0001;
    wire _5041;
    wire _5042;
    wire [3:0] _5037 = 4'b0010;
    wire _5038;
    wire _5039;
    wire [3:0] _5034 = 4'b0011;
    wire _5035;
    wire _5036;
    wire [3:0] _5031 = 4'b0100;
    wire _5032;
    wire _5033;
    wire [3:0] _5028 = 4'b0101;
    wire _5029;
    wire _5030;
    wire [3:0] _5025 = 4'b0110;
    wire _5026;
    wire _5027;
    wire [3:0] _5022 = 4'b0111;
    wire _5023;
    wire _5024;
    wire [3:0] _5019 = 4'b1000;
    wire _5020;
    wire _5021;
    wire [3:0] _5016 = 4'b1001;
    wire _5017;
    wire _5018;
    wire [3:0] _5013 = 4'b1010;
    wire _5014;
    wire _5015;
    wire [3:0] _5010 = 4'b1011;
    wire _5011;
    wire _5012;
    wire [3:0] _5007 = 4'b1100;
    wire _5008;
    wire _5009;
    wire [3:0] _5004 = 4'b1101;
    wire _5005;
    wire _5006;
    wire [3:0] _5001 = 4'b1110;
    wire _5002;
    wire _5003;
    wire [3:0] _4998 = 4'b1111;
    wire _4999;
    wire _5000;
    wire [15:0] _5046;
    wire [15:0] _4939 = 16'b0000000000000000;
    wire [15:0] _4938 = 16'b0000000000000000;
    wire [15:0] _4941;
    wire [15:0] _4942;
    wire [15:0] _4943;
    wire [15:0] _4944;
    wire [15:0] _124;
    reg [15:0] seq_a_crc_poly;
    wire [15:0] _4995 = 16'b0000000000000000;
    wire _4992;
    wire _4991;
    wire _4990;
    wire _4989;
    wire _4988;
    wire _4987;
    wire _4986;
    wire _4985;
    wire _4984;
    wire _4983;
    wire _4982;
    wire _4981;
    wire _4980;
    wire _4979;
    wire _4978;
    wire _4977;
    reg _4993;
    wire _4994;
    wire [15:0] _4996;
    wire _4972 = 1'b0;
    wire [14:0] _4971;
    wire [15:0] _4973;
    wire [15:0] _4997;
    wire [15:0] _5047;
    wire _4946 = 1'b0;
    wire _4945 = 1'b0;
    wire _4962 = 1'b0;
    wire _4959 = 1'b0;
    wire _4957 = 1'b1;
    wire _4955 = 1'b0;
    wire _4956;
    wire [2:0] _4952 = 3'b000;
    wire [2:0] _4951;
    wire _4953;
    wire [3:0] _4948 = 4'b1000;
    wire _4949;
    wire _4950;
    wire _4954;
    wire _4958;
    wire _4960;
    wire _4961;
    wire _4963;
    wire _125;
    reg seq_a_crc_feed;
    wire [15:0] _5048;
    wire [15:0] _5049;
    wire [15:0] _5050;
    wire [15:0] _5104;
    wire [15:0] _5105;
    wire [15:0] _5106;
    wire [15:0] _126;
    reg [15:0] seq_a_crc;
    wire [15:0] _5172;
    wire [15:0] _5173;
    wire _5174;
    wire [15:0] _5176;
    wire [3:0] _4975 = 4'b0000;
    wire [3:0] _4974 = 4'b0000;
    wire [3:0] _5107;
    wire [2:0] _4919 = 3'b010;
    wire [2:0] _4918;
    wire _4920;
    wire [3:0] _4915 = 4'b1000;
    wire _4916;
    wire _4917;
    wire _4921;
    wire [3:0] _5108;
    wire [3:0] _5109;
    wire [3:0] _5110;
    wire [3:0] _127;
    reg [3:0] seq_a_crc_width_m1;
    reg [15:0] _5219;
    wire [31:0] _5221;
    wire [31:0] _5124 = 32'b00000000000000000000000000000000;
    wire [31:0] _5123 = 32'b00000000000000000000000000000000;
    wire [1:0] _5120 = 2'b11;
    wire _5121;
    wire _5122;
    wire [31:0] _5126;
    wire [31:0] _128;
    reg [31:0] _5125;
    wire [31:0] _5131 = 32'b00000000000000000000000000000000;
    wire [31:0] _5130 = 32'b00000000000000000000000000000000;
    wire [1:0] _5127 = 2'b10;
    wire _5128;
    wire _5129;
    wire [31:0] _5133;
    wire [31:0] _129;
    reg [31:0] _5132;
    wire [31:0] _5138 = 32'b00000000000000000000000000000000;
    wire [31:0] _5137 = 32'b00000000000000000000000000000000;
    wire [1:0] _5134 = 2'b01;
    wire _5135;
    wire _5136;
    wire [31:0] _5140;
    wire [31:0] _130;
    reg [31:0] _5139;
    wire [31:0] _5148 = 32'b00000000000000000000000000000000;
    wire [31:0] _5147 = 32'b00000000000000000000000000000000;
    wire [1:0] _5144 = 2'b00;
    wire [1:0] _5118 = 2'b00;
    wire [1:0] _5117 = 2'b00;
    wire [1:0] _5141 = 2'b01;
    wire [1:0] _5142;
    wire [1:0] _5143;
    wire [1:0] _131;
    reg [1:0] _5119;
    wire _5145;
    wire _5146;
    wire [31:0] _5150;
    wire [31:0] _132;
    reg [31:0] _5149;
    wire [1:0] _5155 = 2'b00;
    wire [1:0] _5154 = 2'b00;
    wire [1:0] _5157 = 2'b01;
    wire [1:0] _5158;
    wire [1:0] _5159;
    wire [1:0] _133;
    reg [1:0] _5156;
    reg [31:0] _5165;
    wire _5161 = 1'b0;
    wire [30:0] _5160;
    wire [31:0] _5162;
    wire _4969;
    wire [2:0] _4967 = 3'b100;
    wire _4968;
    wire _4970;
    wire [31:0] _5163;
    wire [31:0] _5164;
    wire [31:0] _5166;
    wire [2:0] _4905 = 3'b011;
    wire [2:0] _4904;
    wire _4906;
    wire [3:0] _4901 = 4'b1000;
    wire _4902;
    wire _4903;
    wire _4907;
    wire [31:0] _5222;
    wire [31:0] _5223;
    wire [31:0] _5225;
    wire [31:0] _134;
    reg [31:0] seq_a_osr;
    wire _4427;
    wire _4890;
    wire [2:0] _5229;
    wire [2:0] _5235;
    wire [2:0] _4886 = 3'b100;
    wire [2:0] _4347;
    wire _4887;
    wire _4888;
    wire _4889;
    wire [2:0] _5236;
    wire [2:0] _5237;
    wire [2:0] _5239;
    wire [2:0] _5240;
    wire [2:0] _5242;
    wire [2:0] _135;
    reg [2:0] seq_a_stuff_run;
    wire _4380;
    wire _4375;
    wire _4383;
    wire [5:0] _4372 = 6'b000000;
    wire [5:0] _4371 = 6'b000000;
    wire [5:0] _5246 = 6'b000000;
    wire [5:0] _5243;
    wire [3:0] _4883 = 4'b0101;
    wire _4884;
    wire [3:0] _4880 = 4'b0101;
    wire _4881;
    wire _4882;
    wire _4885;
    wire [5:0] _5244;
    wire [5:0] _5245;
    wire [5:0] _5247;
    wire [5:0] _136;
    reg [5:0] seq_a_coder;
    wire _4374;
    wire _4384;
    wire _4401;
    wire _5248;
    wire _5249;
    wire [5:0] _5250;
    wire [5:0] _5251;
    wire [5:0] _5252;
    wire [5:0] _137;
    reg [5:0] seq_a_ir_pc;
    wire [5:0] _2491;
    wire _2495;
    wire [3:0] _2488 = 4'b0000;
    wire _2489;
    wire _2490;
    wire _2496;
    wire _4570;
    wire _4565;
    wire [3:0] _4562 = 4'b0100;
    wire _4563;
    wire _4564;
    wire _4566;
    wire [15:0] _4553 = 16'b1111111111111111;
    wire [15:0] _4551 = 16'b0000000000000000;
    wire [15:0] _4550 = 16'b0000000000000000;
    wire [15:0] _5282 = 16'b0000000000000000;
    wire [7:0] _5278;
    wire [15:0] _5279;
    wire [7:0] _5275 = 8'b00000000;
    wire [15:0] _5276;
    wire [15:0] _5272 = 16'b0000000000000001;
    wire [15:0] _5273;
    wire [15:0] _5268 = 16'b0000000000000000;
    wire _5269;
    wire _5270;
    wire [3:0] _5265 = 4'b0010;
    wire _5266;
    wire _5267;
    wire _5271;
    wire [15:0] _5274;
    wire [3:0] _5262 = 4'b0001;
    wire _5263;
    wire [3:0] _5259 = 4'b0101;
    wire _5260;
    wire _5261;
    wire _5264;
    wire [15:0] _5277;
    wire [3:0] _5256 = 4'b1001;
    wire _5257;
    wire [3:0] _5253 = 4'b0101;
    wire _5254;
    wire _5255;
    wire _5258;
    wire [15:0] _5280;
    wire [15:0] _5281;
    wire [15:0] _5283;
    wire [15:0] _138;
    reg [15:0] seq_a_y;
    wire [15:0] _4548 = 16'b0000000000000000;
    wire [15:0] _4547 = 16'b0000000000000000;
    wire [15:0] _5313 = 16'b0000000000000000;
    wire [7:0] _5309;
    wire [15:0] _5310;
    wire [7:0] _5306 = 8'b00000000;
    wire [15:0] _5307;
    wire [15:0] _5303 = 16'b0000000000000001;
    wire [15:0] _5304;
    wire [15:0] _5299 = 16'b0000000000000000;
    wire _5300;
    wire _5301;
    wire [3:0] _5296 = 4'b0001;
    wire [3:0] _2487;
    wire _5297;
    wire [3:0] _2484 = 4'b0100;
    wire _2485;
    wire _2486;
    wire _5298;
    wire _5302;
    wire [15:0] _5305;
    wire [3:0] _5293 = 4'b0000;
    wire _5294;
    wire [3:0] _5290 = 4'b0101;
    wire _5291;
    wire _5292;
    wire _5295;
    wire [15:0] _5308;
    wire [3:0] _5287 = 4'b1000;
    wire _5288;
    wire [3:0] _5284 = 4'b0101;
    wire _5285;
    wire _5286;
    wire _5289;
    wire [15:0] _5311;
    wire [15:0] _5312;
    wire [15:0] _5314;
    wire [15:0] _139;
    reg [15:0] seq_a_x;
    wire [15:0] _4546 = 16'b1111111111111111;
    reg [15:0] _4554;
    wire [15:0] _4544 = 16'b0000000000000000;
    wire [15:0] _4543 = 16'b0000000000000000;
    wire [15:0] _5323 = 16'b0000000000000000;
    wire [15:0] _5320 = 16'b0000000000000001;
    wire [15:0] _5321;
    wire [15:0] _5319 = 16'b0000000000000000;
    wire _5317;
    wire _5315;
    wire _5316;
    wire _5318;
    wire [15:0] _5322;
    wire [15:0] _5324;
    wire [15:0] _140;
    reg [15:0] seq_a_wait_count;
    wire _4555;
    wire [1:0] _4540 = 2'b00;
    wire [1:0] _4539;
    wire _4541;
    wire _4542;
    wire _4556;
    wire _4537;
    wire _4535;
    wire _4534;
    wire _4533;
    wire _4532;
    wire _4531;
    wire _4530;
    wire _4529;
    wire [7:0] _761 = 8'b00000000;
    wire [7:0] _760 = 8'b00000000;
    wire [7:0] _758 = 8'b00000000;
    wire [7:0] _757 = 8'b00000000;
    wire [7:0] _142;
    reg [7:0] pins_sync1;
    reg [7:0] pins_sync;
    wire _4528;
    wire [2:0] _4367;
    wire [2:0] _4365;
    wire [2:0] _4364;
    wire [2:0] _4368;
    wire [2:0] _4525;
    wire [1:0] _4526;
    reg [2:0] _4527;
    reg _4536;
    wire _4538;
    wire _4557;
    wire _4523 = 1'b0;
    wire _4522 = 1'b0;
    wire [23:0] _5376 = 24'b000000000000000000000000;
    wire _5377;
    wire [23:0] _5372 = 24'b000000000000000000000001;
    wire [23:0] _5373;
    wire [23:0] _5374;
    wire _5375;
    wire _5378;
    wire [23:0] _5355 = 24'b000000000000000000000000;
    wire _5356;
    wire [23:0] _5351 = 24'b000000000000000000000001;
    wire [23:0] _5352;
    wire [23:0] _5353;
    wire _5354;
    wire _5357;
    wire _5379;
    wire _5380;
    wire [23:0] _5334 = 24'b000000000000000000000000;
    wire _5335;
    wire [23:0] _5330 = 24'b000000000000000000000001;
    wire [23:0] _5331;
    wire [23:0] _5332;
    wire _5333;
    wire _5336;
    wire _5328;
    wire _5326;
    wire _5325;
    wire _5327;
    wire _5329;
    wire _5381;
    wire _5382;
    wire _143;
    reg seq_a_caught_up;
    wire _4558;
    wire _4559;
    wire _4560;
    wire [2:0] _4512 = 3'b000;
    wire [2:0] _4511 = 3'b000;
    wire [2:0] _5151 = 3'b000;
    wire _5152;
    wire _144;
    wire _5153;
    wire [1:0] _5386 = 2'b00;
    wire [2:0] _5387;
    wire [2:0] _5114 = 3'b100;
    wire _5115;
    wire [6:0] _5111 = 7'b1000011;
    wire _5112;
    wire _5113;
    wire _5116;
    wire [1:0] _5383 = 2'b00;
    wire [2:0] _5384;
    wire [2:0] _5385;
    wire [2:0] _5388;
    wire [2:0] _145;
    reg [2:0] _4513;
    wire [2:0] _4510 = 3'b000;
    wire _4514;
    wire _4509;
    wire _4515;
    wire _4516;
    wire _4506 = 1'b0;
    wire _4505;
    wire _4507;
    wire [3:0] _4502 = 4'b0111;
    wire _4503;
    wire _4504;
    wire _4508;
    wire _4517;
    wire _2524 = 1'b0;
    wire _2523 = 1'b0;
    wire _5413;
    wire _5412;
    wire _5414;
    wire [23:0] _2535 = 24'b000000000000000000000000;
    wire [23:0] _2534 = 24'b000000000000000000000000;
    wire [23:0] _5406 = 24'b000000000000000001000000;
    wire [23:0] _5407;
    wire [23:0] _247 = 24'b000000000000000000000000;
    wire [23:0] _246 = 24'b000000000000000000000000;
    wire [23:0] _5389 = 24'b000000000000000000000001;
    wire [23:0] _5390;
    wire [23:0] _146;
    reg [23:0] timebase;
    wire [5:0] _5347 = 6'b000000;
    wire [17:0] _5346;
    wire [23:0] _5348;
    wire [3:0] _5344 = 4'b0000;
    wire [19:0] _5343;
    wire [23:0] _5345;
    wire [1:0] _5341 = 2'b00;
    wire [21:0] _5340;
    wire [23:0] _5342;
    wire [11:0] _5338;
    wire [11:0] _5337 = 12'b000000000000;
    wire [23:0] _5339;
    reg [23:0] _5349;
    wire [23:0] _5350;
    wire [5:0] _5368 = 6'b000000;
    wire [17:0] _5367;
    wire [23:0] _5369;
    wire [3:0] _5365 = 4'b0000;
    wire [19:0] _5364;
    wire [23:0] _5366;
    wire [1:0] _5362 = 2'b00;
    wire [21:0] _5361;
    wire [23:0] _5363;
    wire [5:0] _5359;
    wire [17:0] _5358 = 18'b000000000000000000;
    wire [23:0] _5360;
    wire [1:0] _2538 = 2'b00;
    wire [1:0] _2537 = 2'b00;
    wire [1:0] _5400 = 2'b00;
    wire [7:0] _4602;
    wire [1:0] _5397;
    wire [3:0] _5394 = 4'b0111;
    wire [3:0] _4598;
    wire _5395;
    wire [3:0] _5391 = 4'b0101;
    wire _5392;
    wire _5393;
    wire _5396;
    wire [1:0] _5398;
    wire [1:0] _5399;
    wire [1:0] _5401;
    wire [1:0] _147;
    reg [1:0] seq_a_prescale;
    reg [23:0] _5370;
    wire [23:0] _5371;
    wire [23:0] _5402;
    wire [23:0] _5403;
    wire [3:0] _4519 = 4'b0011;
    wire _4520;
    wire _4521;
    wire [23:0] _5404;
    wire [23:0] _5405;
    wire [23:0] _5408;
    wire [23:0] _148;
    reg [23:0] seq_a_sched_s;
    wire [23:0] _5409;
    wire _5410;
    wire _5411;
    wire _5415;
    wire _5416;
    wire _149;
    reg seq_a_far;
    wire _4497;
    wire [3:0] _4493 = 4'b0010;
    wire _4494;
    wire _4495;
    wire _4496;
    wire _4498;
    wire _4499;
    wire [3:0] _4490 = 4'b0010;
    wire _4491;
    wire _4492;
    wire _4500;
    wire _4488;
    wire [3:0] _4485 = 4'b0001;
    wire [3:0] _2483;
    wire _4486;
    wire _4487;
    wire _4489;
    wire _4501;
    wire _4518;
    wire _4561;
    wire _4567;
    wire _4568;
    wire _4569;
    wire _4571;
    wire _4573;
    wire [15:0] _5418;
    wire [15:0] _5419;
    wire [15:0] _150;
    reg [15:0] seq_a_ir;
    wire [3:0] _2157;
    wire _2159;
    wire _2164;
    wire _2200;
    wire _2204;
    wire _2241;
    wire _2270;
    wire _2438;
    wire _2463;
    wire _2480;
    wire _2481;
    wire _2482;
    wire _5421;
    wire _5422;
    wire _151;
    reg seq_a_running;
    wire _2521;
    wire _2522;
    wire _2527;
    wire _2530;
    wire [1:0] _5423 = 2'b00;
    wire [2:0] _5424;
    wire [2:0] _5425;
    wire [2:0] _5426;
    wire [2:0] _152;
    reg [2:0] queue_a_count;
    wire [2:0] _205 = 3'b000;
    wire _228;
    wire _256;
    wire _5434;
    wire _5439;
    wire _5441;
    wire _5453;
    wire _5465;
    wire _5477;
    wire _5478;
    wire _299 = 1'b0;
    wire _298 = 1'b0;
    wire _296;
    wire _297;
    reg ctrl_bit3;
    wire _223 = 1'b0;
    wire _222 = 1'b0;
    wire _220;
    wire _221;
    reg ctrl_bit0;
    wire _5427;
    wire _5479;
    wire _153;
    reg _5430;
    wire _5486 = 1'b0;
    wire _5485 = 1'b0;
    wire [5:0] _5526 = 6'b101000;
    wire _5527;
    wire _5528;
    wire [5:0] _5522 = 6'b000000;
    wire _5523;
    wire _5524;
    wire _5518 = 1'b0;
    wire _5517 = 1'b0;
    reg _5519;
    wire _5520;
    wire _5521;
    wire _5525;
    wire _5529;
    wire [5:0] _5512 = 6'b101000;
    wire _5513;
    wire _5514;
    wire _5515;
    wire _5516;
    wire _5530;
    wire _5483 = 1'b0;
    wire _5482 = 1'b0;
    wire _5480;
    wire [6:0] _214 = 7'b1000000;
    wire _215;
    wire _216;
    wire _5481;
    reg ctrl_bit4;
    wire _154;
    wire _5531;
    wire _155;
    reg _5487;
    wire [31:0] _5633;
    wire [31:0] _5623 = 32'b00000000000000000000000000000000;
    wire [6:0] _3500 = 7'b1000010;
    wire _3501;
    wire _3502;
    wire [23:0] _3499 = 24'b000000000000000000000000;
    wire [23:0] _3498 = 24'b000000000000000000000000;
    wire [23:0] _3497;
    reg [23:0] _3503;
    wire [7:0] _5621 = 8'b00000000;
    wire [31:0] _5622;
    wire [6:0] _4360 = 7'b1000001;
    wire _4361;
    wire _208 = 1'b0;
    wire _207 = 1'b0;
    wire _5536;
    wire _5537;
    wire _5538;
    wire _156;
    reg spi_wr;
    wire _4362;
    wire [11:0] _4359 = 12'b000000000000;
    wire [11:0] _4358 = 12'b000000000000;
    wire [31:0] _218 = 32'b00000000000000000000000000000000;
    wire [31:0] _217 = 32'b00000000000000000000000000000000;
    wire [5:0] _5532 = 6'b100111;
    wire _5533;
    wire _5535;
    wire [31:0] _5551;
    wire [31:0] _5552;
    wire [31:0] _5553;
    wire [31:0] _157;
    reg [31:0] spi_wdata;
    wire [11:0] _4357;
    reg [11:0] _4363;
    wire [19:0] _5619 = 20'b00000000000000000000;
    wire [31:0] _5620;
    wire [31:0] _5618 = 32'b00000000000000000000000000000000;
    wire [31:0] _5617 = 32'b00000000000000000000000000000000;
    wire [31:0] _5616 = 32'b00000000000000000000000000000000;
    wire [31:0] _5615 = 32'b00000000000000000000000000000000;
    wire [31:0] _5614 = 32'b00000000000000000000000000000000;
    wire [31:0] _5613 = 32'b00000000000000000000000000000000;
    wire [31:0] _5612 = 32'b00000000000000000000000000000000;
    wire [31:0] _5611 = 32'b00000000000000000000000000000000;
    wire [31:0] _5610 = 32'b00000000000000000000000000000000;
    wire [31:0] _5609 = 32'b00000000000000000000000000000000;
    wire [31:0] _5608 = 32'b00000000000000000000000000000000;
    wire [31:0] _5607 = 32'b00000000000000000000000000000000;
    wire [31:0] _5606 = 32'b00000000000000000000000000000000;
    wire [31:0] _5605 = 32'b00000000000000000000000000000000;
    wire [31:0] _5604 = 32'b00000000000000000000000000000000;
    wire [31:0] _5603 = 32'b00000000000000000000000000000000;
    wire [31:0] _5602 = 32'b00000000000000000000000000000000;
    wire [31:0] _5601 = 32'b00000000000000000000000000000000;
    wire [31:0] _5600 = 32'b00000000000000000000000000000000;
    wire [31:0] _5599 = 32'b00000000000000000000000000000000;
    wire [31:0] _5598 = 32'b00000000000000000000000000000000;
    wire [31:0] _5597 = 32'b00000000000000000000000000000000;
    wire [31:0] _5596 = 32'b00000000000000000000000000000000;
    wire [31:0] _5595 = 32'b00000000000000000000000000000000;
    wire [31:0] _5594 = 32'b00000000000000000000000000000000;
    wire [31:0] _5593 = 32'b00000000000000000000000000000000;
    wire [31:0] _5592 = 32'b00000000000000000000000000000000;
    wire [31:0] _5591 = 32'b00000000000000000000000000000000;
    wire [31:0] _5590 = 32'b00000000000000000000000000000000;
    wire [31:0] _5589 = 32'b00000000000000000000000000000000;
    wire [31:0] _5588 = 32'b00000000000000000000000000000000;
    wire [31:0] _5587 = 32'b00000000000000000000000000000000;
    wire [31:0] _5586 = 32'b00000000000000000000000000000000;
    wire [31:0] _5585 = 32'b00000000000000000000000000000000;
    wire [31:0] _5584 = 32'b00000000000000000000000000000000;
    wire [31:0] _5583 = 32'b00000000000000000000000000000000;
    wire [31:0] _5582 = 32'b00000000000000000000000000000000;
    wire [31:0] _5581 = 32'b00000000000000000000000000000000;
    wire [31:0] _5580 = 32'b00000000000000000000000000000000;
    wire [31:0] _5579 = 32'b00000000000000000000000000000000;
    wire [31:0] _5578 = 32'b00000000000000000000000000000000;
    wire [31:0] _5577 = 32'b00000000000000000000000000000000;
    wire [31:0] _5576 = 32'b00000000000000000000000000000000;
    wire [31:0] _5575 = 32'b00000000000000000000000000000000;
    wire [31:0] _5574 = 32'b00000000000000000000000000000000;
    wire [31:0] _5573 = 32'b00000000000000000000000000000000;
    wire [31:0] _5572 = 32'b00000000000000000000000000000000;
    wire [31:0] _5571 = 32'b00000000000000000000000000000000;
    wire [31:0] _5570 = 32'b00000000000000000000000000000000;
    wire [31:0] _5569 = 32'b00000000000000000000000000000000;
    wire [31:0] _5568 = 32'b00000000000000000000000000000000;
    wire [31:0] _5567 = 32'b00000000000000000000000000000000;
    wire [31:0] _5566 = 32'b00000000000000000000000000000000;
    wire [31:0] _5565 = 32'b00000000000000000000000000000000;
    wire [31:0] _5564 = 32'b00000000000000000000000000000000;
    wire [31:0] _5563 = 32'b00000000000000000000000000000000;
    wire [31:0] _5562 = 32'b00000000000000000000000000000000;
    wire [31:0] _5561 = 32'b00000000000000000000000000000000;
    wire [31:0] _5560 = 32'b00000000000000000000000000000000;
    wire [31:0] _5559 = 32'b00000000000000000000000000000000;
    wire [31:0] _5558 = 32'b00000000000000000000000000000000;
    wire [31:0] _5557 = 32'b00000000000000000000000000000000;
    wire [31:0] _5556 = 32'b00000000000000000000000000000000;
    wire [31:0] _5555 = 32'b00000000000000000000000000000000;
    wire [31:0] _5554 = 32'b00000000000000000000000000000000;
    wire [6:0] _213;
    reg [31:0] _5701;
    wire [31:0] _158;
    wire _5720;
    wire _5718 = 1'b0;
    wire _5717 = 1'b0;
    wire _5704;
    wire gnd = 1'b0;
    wire _5705;
    wire _5706;
    wire _159;
    reg spi_load;
    wire _5721;
    wire [31:0] _5725;
    wire [31:0] _5729;
    wire [31:0] _5730;
    wire [31:0] _160;
    reg [31:0] spi_out;
    wire _5749;
    wire [7:0] _211 = 8'b00000000;
    wire [7:0] _210 = 8'b00000000;
    wire _5548 = 1'b0;
    wire _5547 = 1'b0;
    wire _5545 = 1'b0;
    wire _5544 = 1'b0;
    wire _5543;
    reg _5546;
    reg _5549;
    wire [31:0] _5540 = 32'b00000000000000000000000000000000;
    wire [31:0] _5539 = 32'b00000000000000000000000000000000;
    wire [31:0] _5731;
    wire [31:0] _5732;
    wire [31:0] _161;
    reg [31:0] spi_shift_in;
    wire [30:0] _5542;
    wire [31:0] _5550;
    wire [7:0] _5733;
    wire [5:0] _5702 = 6'b000111;
    wire _5703;
    wire [7:0] _5734;
    wire [7:0] _5735;
    wire [7:0] _5736;
    wire [7:0] _162;
    reg [7:0] spi_cmd;
    wire _5534;
    wire _5715;
    wire [5:0] _5711 = 6'b001000;
    wire [5:0] _5510 = 6'b000000;
    wire [5:0] _5509 = 6'b000000;
    wire [5:0] _5744 = 6'b000000;
    wire [5:0] _5740 = 6'b000001;
    wire [5:0] _5741;
    wire [5:0] _5737 = 6'b111111;
    wire _5738;
    wire _5739;
    wire [5:0] _5742;
    wire _5507;
    wire _5498;
    wire _5499;
    wire _5508;
    wire [5:0] _5743;
    wire [5:0] _5745;
    wire [5:0] _163;
    reg [5:0] spi_bitcnt;
    wire _5712;
    wire _5713;
    wire _5709;
    wire _5496 = 1'b0;
    wire _178 = 1'b0;
    wire _177 = 1'b0;
    wire _174 = 1'b0;
    wire _173 = 1'b0;
    wire _165;
    reg _176;
    reg _179;
    wire _180;
    wire _5495 = 1'b0;
    reg _5497;
    wire _5493 = 1'b0;
    wire _5492 = 1'b0;
    wire _5490 = 1'b0;
    wire _5489 = 1'b0;
    wire _5488;
    reg _5491;
    reg _5494;
    wire _5707;
    wire _5708;
    wire _5710;
    wire _5714;
    wire _5716;
    wire _5750;
    wire _5505 = 1'b0;
    wire _5504 = 1'b0;
    wire vdd = 1'b1;
    wire _5502 = 1'b0;
    wire _5501 = 1'b0;
    wire _167;
    wire [7:0] _169;
    wire _5500;
    reg _5503;
    reg _5506;
    wire _5751;
    wire _170;
    reg spi_miso;
    wire [7:0] _5762;

    /* logic */
    assign _380 = _276 == _379;
    assign _377 = _287 == _376;
    assign _374 = _349 == _373;
    assign _371 = _360 == _370;
    assign _366 = _359 & _365;
    assign _372 = _366 ? _371 : pin0_out;
    assign _355 = _348 & _354;
    assign _375 = _355 ? _374 : _372;
    assign _293 = _286 & _292;
    assign _378 = _293 ? _377 : _375;
    assign _282 = _275 & _281;
    assign _381 = _282 ? _380 : _378;
    assign _2 = _381;
    always @(posedge _167) begin
        if (_180)
            pin0_out <= _368;
        else
            pin0_out <= _2;
    end
    assign _431 = _276 == _430;
    assign _428 = _287 == _427;
    assign _425 = _349 == _424;
    assign _422 = _360 == _421;
    assign _417 = _411 & _416;
    assign _423 = _417 ? _422 : pin1_out;
    assign _408 = _402 & _407;
    assign _426 = _408 ? _425 : _423;
    assign _399 = _393 & _398;
    assign _429 = _399 ? _428 : _426;
    assign _390 = _384 & _389;
    assign _432 = _390 ? _431 : _429;
    assign _3 = _432;
    always @(posedge _167) begin
        if (_180)
            pin1_out <= _419;
        else
            pin1_out <= _3;
    end
    assign _482 = _276 == _481;
    assign _479 = _287 == _478;
    assign _476 = _349 == _475;
    assign _473 = _360 == _472;
    assign _468 = _462 & _467;
    assign _474 = _468 ? _473 : pin2_out;
    assign _459 = _453 & _458;
    assign _477 = _459 ? _476 : _474;
    assign _450 = _444 & _449;
    assign _480 = _450 ? _479 : _477;
    assign _441 = _435 & _440;
    assign _483 = _441 ? _482 : _480;
    assign _4 = _483;
    always @(posedge _167) begin
        if (_180)
            pin2_out <= _470;
        else
            pin2_out <= _4;
    end
    assign _533 = _276 == _532;
    assign _530 = _287 == _529;
    assign _527 = _349 == _526;
    assign _524 = _360 == _523;
    assign _519 = _513 & _518;
    assign _525 = _519 ? _524 : pin3_out;
    assign _510 = _504 & _509;
    assign _528 = _510 ? _527 : _525;
    assign _501 = _495 & _500;
    assign _531 = _501 ? _530 : _528;
    assign _492 = _486 & _491;
    assign _534 = _492 ? _533 : _531;
    assign _5 = _534;
    always @(posedge _167) begin
        if (_180)
            pin3_out <= _521;
        else
            pin3_out <= _5;
    end
    assign _584 = _276 == _583;
    assign _581 = _287 == _580;
    assign _578 = _349 == _577;
    assign _575 = _360 == _574;
    assign _570 = _564 & _569;
    assign _576 = _570 ? _575 : pin4_out;
    assign _561 = _555 & _560;
    assign _579 = _561 ? _578 : _576;
    assign _552 = _546 & _551;
    assign _582 = _552 ? _581 : _579;
    assign _543 = _537 & _542;
    assign _585 = _543 ? _584 : _582;
    assign _6 = _585;
    always @(posedge _167) begin
        if (_180)
            pin4_out <= _572;
        else
            pin4_out <= _6;
    end
    assign _635 = _276 == _634;
    assign _632 = _287 == _631;
    assign _629 = _349 == _628;
    assign _626 = _360 == _625;
    assign _621 = _615 & _620;
    assign _627 = _621 ? _626 : pin5_out;
    assign _612 = _606 & _611;
    assign _630 = _612 ? _629 : _627;
    assign _603 = _597 & _602;
    assign _633 = _603 ? _632 : _630;
    assign _594 = _588 & _593;
    assign _636 = _594 ? _635 : _633;
    assign _7 = _636;
    always @(posedge _167) begin
        if (_180)
            pin5_out <= _623;
        else
            pin5_out <= _7;
    end
    assign _686 = _276 == _685;
    assign _683 = _287 == _682;
    assign _680 = _349 == _679;
    assign _677 = _360 == _676;
    assign _672 = _666 & _671;
    assign _678 = _672 ? _677 : pin6_out;
    assign _663 = _657 & _662;
    assign _681 = _663 ? _680 : _678;
    assign _654 = _648 & _653;
    assign _684 = _654 ? _683 : _681;
    assign _645 = _639 & _644;
    assign _687 = _645 ? _686 : _684;
    assign _8 = _687;
    always @(posedge _167) begin
        if (_180)
            pin6_out <= _674;
        else
            pin6_out <= _8;
    end
    assign _737 = _276 == _736;
    assign _734 = _287 == _733;
    assign _731 = _349 == _730;
    assign _728 = _360 == _727;
    assign _723 = _717 & _722;
    assign _729 = _723 ? _728 : pin7_out;
    assign _714 = _708 & _713;
    assign _732 = _714 ? _731 : _729;
    assign _705 = _699 & _704;
    assign _735 = _705 ? _734 : _732;
    assign _696 = _690 & _695;
    assign _738 = _696 ? _737 : _735;
    assign _9 = _738;
    always @(posedge _167) begin
        if (_180)
            pin7_out <= _725;
        else
            pin7_out <= _9;
    end
    assign _739 = { pin7_out, pin6_out, pin5_out, pin4_out, pin3_out, pin2_out, pin1_out, pin0_out };
    assign _5756 = _5630 == _5755;
    assign _5757 = ~ _5756;
    assign _5752 = _2730 | _2842;
    assign _5753 = _5752 | _2954;
    assign _5754 = _5753 | _3228;
    assign _5758 = { _5754, _2146, _2123, _5757, _2584, _2506, seq_a_halted };
    always @(posedge _167) begin
        if (_180)
            _5761 <= _5760;
        else
            _5761 <= _5758;
    end
    assign _5726 = spi_out[30:0];
    assign _5728 = { _5726, _5727 };
    assign _5679 = { seq_b_y, seq_b_x };
    assign _5678 = { _5677, seq_b_sched_s };
    assign _5675 = { queue_b_count, _5674, seq_b_flag, seq_b_halted, seq_b_running, seq_b_ir_pc };
    assign _5676 = { _5673, _5675 };
    assign _779 = pins_sync[7:7];
    assign _778 = pins_sync[6:6];
    assign _777 = pins_sync[5:5];
    assign _776 = pins_sync[4:4];
    assign _775 = pins_sync[3:3];
    assign _774 = pins_sync[2:2];
    assign _773 = pins_sync[1:1];
    assign _772 = pins_sync[0:0];
    always @* begin
        case (_356)
        0: _780 <= _772;
        1: _780 <= _773;
        2: _780 <= _774;
        3: _780 <= _775;
        4: _780 <= _776;
        5: _780 <= _777;
        6: _780 <= _778;
        default: _780 <= _779;
        endcase
    end
    assign _770 = pins_sync[7:7];
    assign _769 = pins_sync[6:6];
    assign _768 = pins_sync[5:5];
    assign _767 = pins_sync[4:4];
    assign _766 = pins_sync[3:3];
    assign _765 = pins_sync[2:2];
    assign _764 = pins_sync[1:1];
    assign _763 = pins_sync[0:0];
    always @* begin
        case (_345)
        0: _771 <= _763;
        1: _771 <= _764;
        2: _771 <= _765;
        3: _771 <= _766;
        4: _771 <= _767;
        5: _771 <= _768;
        6: _771 <= _769;
        default: _771 <= _770;
        endcase
    end
    assign _781 = _748 ? _780 : _771;
    assign _756 = _755[30:0];
    assign _782 = { _756, _781 };
    assign _783 = _752 ? _782 : _755;
    assign _785 = _745 ? _784 : _783;
    assign _11 = _785;
    always @(posedge _167) begin
        if (_180)
            _755 <= _754;
        else
            _755 <= _11;
    end
    assign _1136 = _1132 ? vdd : seq_b_halted;
    assign _1137 = _1117 ? vdd : _1136;
    assign _1139 = ctrl_bit3 ? gnd : _1137;
    assign _12 = _1139;
    always @(posedge _167) begin
        if (_180)
            seq_b_halted <= _1134;
        else
            seq_b_halted <= _12;
    end
    assign _1147 = _335[28:5];
    assign _1148 = _1147 - timebase;
    assign _1149 = _1148[23:23];
    assign _1150 = _344 & _1149;
    assign _1143 = _320[28:5];
    assign _1144 = _1143 - timebase;
    assign _1145 = _1144[23:23];
    assign _1146 = _329 & _1145;
    assign _1151 = _1146 | _1150;
    assign _1152 = _1142 | _1151;
    assign _1153 = ctrl_bit3 ? gnd : _1152;
    assign _13 = _1153;
    always @(posedge _167) begin
        if (_180)
            _1142 <= _1141;
        else
            _1142 <= _13;
    end
    assign _1213 = _1166 ? _1212 : queue_b_last_due;
    assign _14 = _1213;
    always @(posedge _167) begin
        if (_301)
            queue_b_last_due <= _1168;
        else
            queue_b_last_due <= _14;
    end
    assign _1222 = _1212 - queue_b_last_due;
    assign _1223 = _1222[23:23];
    assign _1217 = _1166 ? vdd : queue_b_last_valid;
    assign _15 = _1217;
    always @(posedge _167) begin
        if (_301)
            queue_b_last_valid <= _1215;
        else
            queue_b_last_valid <= _15;
    end
    assign _1221 = _1166 & queue_b_last_valid;
    assign _1224 = _1221 & _1223;
    assign _1225 = _1220 | _1224;
    assign _1226 = ctrl_bit3 ? gnd : _1225;
    assign _16 = _1226;
    always @(posedge _167) begin
        if (_180)
            _1220 <= _1219;
        else
            _1220 <= _16;
    end
    assign _1235 = _1230 == _1234;
    assign _1232 = _1230[22:22];
    assign _1230 = _1212 - timebase;
    assign _1231 = _1230[23:23];
    assign _1233 = _1231 ^ _1232;
    assign _1236 = _1233 | _1235;
    assign _1237 = _1166 & _1236;
    assign _1238 = _1229 | _1237;
    assign _1239 = ctrl_bit3 ? gnd : _1238;
    assign _17 = _1239;
    always @(posedge _167) begin
        if (_180)
            _1229 <= _1228;
        else
            _1229 <= _17;
    end
    assign _1243 = _1117 ? vdd : seq_b_trapped;
    assign _1244 = ctrl_bit3 ? gnd : _1243;
    assign _18 = _1244;
    always @(posedge _167) begin
        if (_180)
            seq_b_trapped <= _1241;
        else
            seq_b_trapped <= _18;
    end
    assign _1253 = _1247 + _1252;
    assign _1249 = _1247 == _1248;
    assign _1250 = ~ _1249;
    assign _750 = _349 == _749;
    assign _751 = _344 & _750;
    assign _747 = _360 == _746;
    assign _748 = _329 & _747;
    assign _752 = _748 | _751;
    assign _1251 = _752 & _1250;
    assign _1254 = _1251 ? _1253 : _1247;
    assign _745 = ctrl_bit2 | ctrl_bit3;
    assign _1256 = _745 ? _1255 : _1254;
    assign _19 = _1256;
    always @(posedge _167) begin
        if (_180)
            _1247 <= _1246;
        else
            _1247 <= _19;
    end
    assign _5671 = { _5668, _5430, _5669, _1247, _5670, _3405, seq_b_trapped, queue_b_count, _1229, _1220, _1142, seq_b_halted };
    assign _5667 = { _5666, _3255 };
    assign _5665 = { seq_a_y, seq_a_x };
    assign _5664 = { _5663, timebase };
    assign _5662 = { _5661, seq_a_sched_s };
    assign _5659 = { queue_a_count, _5658, seq_a_flag, seq_a_halted, seq_a_running, seq_a_ir_pc };
    assign _5660 = { _5657, _5659 };
    assign _1468 = mon0_intervals + _1467;
    assign _1465 = mon0_intervals == _1464;
    assign _1466 = ~ _1465;
    assign _1469 = _1466 ? _1468 : mon0_intervals;
    assign _1470 = _1460 ? _1469 : mon0_intervals;
    assign _1472 = ctrl_bit1 ? _1471 : _1470;
    assign _20 = _1472;
    always @(posedge _167) begin
        if (_180)
            mon0_intervals <= _1462;
        else
            mon0_intervals <= _20;
    end
    assign _1661 = mon1_intervals + _1660;
    assign _1658 = mon1_intervals == _1657;
    assign _1659 = ~ _1658;
    assign _1662 = _1659 ? _1661 : mon1_intervals;
    assign _1663 = _1653 ? _1662 : mon1_intervals;
    assign _1665 = ctrl_bit1 ? _1664 : _1663;
    assign _21 = _1665;
    always @(posedge _167) begin
        if (_180)
            mon1_intervals <= _1655;
        else
            mon1_intervals <= _21;
    end
    assign _1854 = mon2_intervals + _1853;
    assign _1851 = mon2_intervals == _1850;
    assign _1852 = ~ _1851;
    assign _1855 = _1852 ? _1854 : mon2_intervals;
    assign _1856 = _1846 ? _1855 : mon2_intervals;
    assign _1858 = ctrl_bit1 ? _1857 : _1856;
    assign _22 = _1858;
    always @(posedge _167) begin
        if (_180)
            mon2_intervals <= _1848;
        else
            mon2_intervals <= _22;
    end
    assign _2047 = mon3_intervals + _2046;
    assign _2044 = mon3_intervals == _2043;
    assign _2045 = ~ _2044;
    assign _2048 = _2045 ? _2047 : mon3_intervals;
    assign _2049 = _2039 ? _2048 : mon3_intervals;
    assign _2051 = ctrl_bit1 ? _2050 : _2049;
    assign _23 = _2051;
    always @(posedge _167) begin
        if (_180)
            mon3_intervals <= _2041;
        else
            mon3_intervals <= _23;
    end
    assign _5653 = { mon3_intervals, mon2_intervals, mon1_intervals, mon0_intervals };
    assign _2055 = mon3_count_cycles < mon3_min_seen;
    assign _2056 = _2055 ? mon3_count_cycles : mon3_min_seen;
    assign _2057 = _2039 ? _2056 : mon3_min_seen;
    assign _2059 = ctrl_bit1 ? _2058 : _2057;
    assign _24 = _2059;
    always @(posedge _167) begin
        if (_180)
            mon3_min_seen <= _2053;
        else
            mon3_min_seen <= _24;
    end
    assign _2063 = mon3_max_seen < mon3_count_cycles;
    assign _2064 = _2063 ? mon3_count_cycles : mon3_max_seen;
    assign _2039 = _1946 | _2038;
    assign _2065 = _2039 ? _2064 : mon3_max_seen;
    assign _2067 = ctrl_bit1 ? _2066 : _2065;
    assign _25 = _2067;
    always @(posedge _167) begin
        if (_180)
            mon3_max_seen <= _2061;
        else
            mon3_max_seen <= _25;
    end
    assign _5652 = { mon3_max_seen, mon3_min_seen };
    assign _2071 = mon2_count_cycles < mon2_min_seen;
    assign _2072 = _2071 ? mon2_count_cycles : mon2_min_seen;
    assign _2073 = _1846 ? _2072 : mon2_min_seen;
    assign _2075 = ctrl_bit1 ? _2074 : _2073;
    assign _26 = _2075;
    always @(posedge _167) begin
        if (_180)
            mon2_min_seen <= _2069;
        else
            mon2_min_seen <= _26;
    end
    assign _2079 = mon2_max_seen < mon2_count_cycles;
    assign _2080 = _2079 ? mon2_count_cycles : mon2_max_seen;
    assign _1846 = _1753 | _1845;
    assign _2081 = _1846 ? _2080 : mon2_max_seen;
    assign _2083 = ctrl_bit1 ? _2082 : _2081;
    assign _27 = _2083;
    always @(posedge _167) begin
        if (_180)
            mon2_max_seen <= _2077;
        else
            mon2_max_seen <= _27;
    end
    assign _5651 = { mon2_max_seen, mon2_min_seen };
    assign _2087 = mon1_count_cycles < mon1_min_seen;
    assign _2088 = _2087 ? mon1_count_cycles : mon1_min_seen;
    assign _2089 = _1653 ? _2088 : mon1_min_seen;
    assign _2091 = ctrl_bit1 ? _2090 : _2089;
    assign _28 = _2091;
    always @(posedge _167) begin
        if (_180)
            mon1_min_seen <= _2085;
        else
            mon1_min_seen <= _28;
    end
    assign _2095 = mon1_max_seen < mon1_count_cycles;
    assign _2096 = _2095 ? mon1_count_cycles : mon1_max_seen;
    assign _1653 = _1560 | _1652;
    assign _2097 = _1653 ? _2096 : mon1_max_seen;
    assign _2099 = ctrl_bit1 ? _2098 : _2097;
    assign _29 = _2099;
    always @(posedge _167) begin
        if (_180)
            mon1_max_seen <= _2093;
        else
            mon1_max_seen <= _29;
    end
    assign _5650 = { mon1_max_seen, mon1_min_seen };
    assign _2103 = mon0_count_cycles < mon0_min_seen;
    assign _2104 = _2103 ? mon0_count_cycles : mon0_min_seen;
    assign _2105 = _1460 ? _2104 : mon0_min_seen;
    assign _2107 = ctrl_bit1 ? _2106 : _2105;
    assign _30 = _2107;
    always @(posedge _167) begin
        if (_180)
            mon0_min_seen <= _2101;
        else
            mon0_min_seen <= _30;
    end
    assign _2111 = mon0_max_seen < mon0_count_cycles;
    assign _2112 = _2111 ? mon0_count_cycles : mon0_max_seen;
    assign _1460 = _1367 | _1459;
    assign _2113 = _1460 ? _2112 : mon0_max_seen;
    assign _2115 = ctrl_bit1 ? _2114 : _2113;
    assign _31 = _2115;
    always @(posedge _167) begin
        if (_180)
            mon0_max_seen <= _2109;
        else
            mon0_max_seen <= _31;
    end
    assign _5649 = { mon0_max_seen, mon0_min_seen };
    assign _5644 = { _5643, _3589 };
    assign _5635 = _169[7:3];
    always @(posedge _167) begin
        _5638 <= _5635;
    end
    always @(posedge _167) begin
        _5641 <= _5638;
    end
    assign _5642 = { _5634, _5641 };
    assign _2144 = pins_sync[7:7];
    assign _2143 = pins_sync[6:6];
    assign _2142 = pins_sync[5:5];
    assign _2141 = pins_sync[4:4];
    assign _2140 = pins_sync[3:3];
    assign _2139 = pins_sync[2:2];
    assign _2138 = pins_sync[1:1];
    assign _2137 = pins_sync[0:0];
    always @* begin
        case (_283)
        0: _2145 <= _2137;
        1: _2145 <= _2138;
        2: _2145 <= _2139;
        3: _2145 <= _2140;
        4: _2145 <= _2141;
        5: _2145 <= _2142;
        6: _2145 <= _2143;
        default: _2145 <= _2144;
        endcase
    end
    assign _2135 = pins_sync[7:7];
    assign _2134 = pins_sync[6:6];
    assign _2133 = pins_sync[5:5];
    assign _2132 = pins_sync[4:4];
    assign _2131 = pins_sync[3:3];
    assign _2130 = pins_sync[2:2];
    assign _2129 = pins_sync[1:1];
    assign _2128 = pins_sync[0:0];
    always @* begin
        case (_272)
        0: _2136 <= _2128;
        1: _2136 <= _2129;
        2: _2136 <= _2130;
        3: _2136 <= _2131;
        4: _2136 <= _2132;
        5: _2136 <= _2133;
        6: _2136 <= _2134;
        default: _2136 <= _2135;
        endcase
    end
    assign _2146 = _2119 ? _2145 : _2136;
    assign _2127 = _2126[30:0];
    assign _2147 = { _2127, _2146 };
    assign _2148 = _2123 ? _2147 : _2126;
    assign _2150 = _2116 ? _2149 : _2148;
    assign _32 = _2150;
    always @(posedge _167) begin
        if (_180)
            _2126 <= _2125;
        else
            _2126 <= _32;
    end
    assign _2501 = _2497 ? vdd : seq_a_halted;
    assign _2502 = _2482 ? vdd : _2501;
    assign _2503 = ctrl_bit0 ? gnd : _2502;
    assign _33 = _2503;
    always @(posedge _167) begin
        if (_180)
            seq_a_halted <= _2499;
        else
            seq_a_halted <= _33;
    end
    assign _2511 = _262[28:5];
    assign _2512 = _2511 - timebase;
    assign _2513 = _2512[23:23];
    assign _2514 = _271 & _2513;
    assign _2507 = _244[28:5];
    assign _2508 = _2507 - timebase;
    assign _2509 = _2508[23:23];
    assign _2510 = _256 & _2509;
    assign _2515 = _2510 | _2514;
    assign _2516 = _2506 | _2515;
    assign _2517 = ctrl_bit0 ? gnd : _2516;
    assign _34 = _2517;
    always @(posedge _167) begin
        if (_180)
            _2506 <= _2505;
        else
            _2506 <= _34;
    end
    assign _2577 = _2530 ? _2576 : queue_a_last_due;
    assign _35 = _2577;
    always @(posedge _167) begin
        if (_225)
            queue_a_last_due <= _2532;
        else
            queue_a_last_due <= _35;
    end
    assign _2586 = _2576 - queue_a_last_due;
    assign _2587 = _2586[23:23];
    assign _2581 = _2530 ? vdd : queue_a_last_valid;
    assign _36 = _2581;
    always @(posedge _167) begin
        if (_225)
            queue_a_last_valid <= _2579;
        else
            queue_a_last_valid <= _36;
    end
    assign _2585 = _2530 & queue_a_last_valid;
    assign _2588 = _2585 & _2587;
    assign _2589 = _2584 | _2588;
    assign _2590 = ctrl_bit0 ? gnd : _2589;
    assign _37 = _2590;
    always @(posedge _167) begin
        if (_180)
            _2584 <= _2583;
        else
            _2584 <= _37;
    end
    assign _2599 = _2594 == _2598;
    assign _2596 = _2594[22:22];
    assign _2594 = _2576 - timebase;
    assign _2595 = _2594[23:23];
    assign _2597 = _2595 ^ _2596;
    assign _2600 = _2597 | _2599;
    assign _2601 = _2530 & _2600;
    assign _2602 = _2593 | _2601;
    assign _2603 = ctrl_bit0 ? gnd : _2602;
    assign _38 = _2603;
    always @(posedge _167) begin
        if (_180)
            _2593 <= _2592;
        else
            _2593 <= _38;
    end
    assign _2607 = _2482 ? vdd : seq_a_trapped;
    assign _2608 = ctrl_bit0 ? gnd : _2607;
    assign _39 = _2608;
    always @(posedge _167) begin
        if (_180)
            seq_a_trapped <= _2605;
        else
            seq_a_trapped <= _39;
    end
    assign _2617 = _2611 + _2616;
    assign _2613 = _2611 == _2612;
    assign _2614 = ~ _2613;
    assign _2121 = _276 == _2120;
    assign _2122 = _271 & _2121;
    assign _2118 = _287 == _2117;
    assign _2119 = _256 & _2118;
    assign _2123 = _2119 | _2122;
    assign _2615 = _2123 & _2614;
    assign _2618 = _2615 ? _2617 : _2611;
    assign _740 = spi_wdata[2:2];
    assign _741 = _216 & _740;
    always @(posedge _167) begin
        if (_180)
            ctrl_bit2 <= _743;
        else
            ctrl_bit2 <= _741;
    end
    assign _2116 = ctrl_bit2 | ctrl_bit0;
    assign _2620 = _2116 ? _2619 : _2618;
    assign _40 = _2620;
    always @(posedge _167) begin
        if (_180)
            _2611 <= _2610;
        else
            _2611 <= _40;
    end
    assign _2728 = _1367 & _1381;
    assign _2725 = _1375[15:0];
    assign _2726 = mon0_count_cycles < _2725;
    assign _2723 = _1270[1:1];
    assign _1361 = _1353[7:7];
    assign _1360 = _1353[6:6];
    assign _1359 = _1353[5:5];
    assign _1358 = _1353[4:4];
    assign _1357 = _1353[3:3];
    assign _1356 = _1353[2:2];
    assign _1355 = _1353[1:1];
    assign _1354 = _1353[0:0];
    always @* begin
        case (_1283)
        0: _1362 <= _1354;
        1: _1362 <= _1355;
        2: _1362 <= _1356;
        3: _1362 <= _1357;
        4: _1362 <= _1358;
        5: _1362 <= _1359;
        6: _1362 <= _1360;
        default: _1362 <= _1361;
        endcase
    end
    assign _1363 = ~ _1362;
    assign _1348 = _1340[7:7];
    assign _1347 = _1340[6:6];
    assign _1346 = _1340[5:5];
    assign _1345 = _1340[4:4];
    assign _1344 = _1340[3:3];
    assign _1343 = _1340[2:2];
    assign _1342 = _1340[1:1];
    assign _1341 = _1340[0:0];
    always @* begin
        case (_1283)
        0: _1349 <= _1341;
        1: _1349 <= _1342;
        2: _1349 <= _1343;
        3: _1349 <= _1344;
        4: _1349 <= _1345;
        5: _1349 <= _1346;
        6: _1349 <= _1347;
        default: _1349 <= _1348;
        endcase
    end
    assign _1350 = ~ _1349;
    assign _1364 = _1350 & _1363;
    assign _1333 = _1270[4:4];
    assign _1334 = ~ _1333;
    assign _1365 = _1334 | _1364;
    assign _1329 = _1281[20:20];
    assign _1327 = _1292[7:7];
    assign _1326 = _1292[6:6];
    assign _1325 = _1292[5:5];
    assign _1324 = _1292[4:4];
    assign _1323 = _1292[3:3];
    assign _1322 = _1292[2:2];
    assign _1321 = _1292[1:1];
    assign _1320 = _1292[0:0];
    assign _1319 = _1281[19:17];
    always @* begin
        case (_1319)
        0: _1328 <= _1320;
        1: _1328 <= _1321;
        2: _1328 <= _1322;
        3: _1328 <= _1323;
        4: _1328 <= _1324;
        5: _1328 <= _1325;
        6: _1328 <= _1326;
        default: _1328 <= _1327;
        endcase
    end
    assign _1330 = _1328 == _1329;
    assign _1317 = _1281[16:16];
    assign _1318 = ~ _1317;
    assign _1331 = _1318 | _1330;
    assign _1315 = _1301 ^ _1311;
    assign _1313 = ~ _1311;
    assign _1314 = _1301 & _1313;
    assign _1310 = _1289[7:7];
    assign _1309 = _1289[6:6];
    assign _1308 = _1289[5:5];
    assign _1307 = _1289[4:4];
    assign _1306 = _1289[3:3];
    assign _1305 = _1289[2:2];
    assign _1304 = _1289[1:1];
    assign _1303 = _1289[0:0];
    always @* begin
        case (_1283)
        0: _1311 <= _1303;
        1: _1311 <= _1304;
        2: _1311 <= _1305;
        3: _1311 <= _1306;
        4: _1311 <= _1307;
        5: _1311 <= _1308;
        6: _1311 <= _1309;
        default: _1311 <= _1310;
        endcase
    end
    assign _1300 = _1292[7:7];
    assign _1299 = _1292[6:6];
    assign _1298 = _1292[5:5];
    assign _1297 = _1292[4:4];
    assign _1296 = _1292[3:3];
    assign _1295 = _1292[2:2];
    assign _1294 = _1292[1:1];
    assign _1293 = _1292[0:0];
    assign _1283 = _1281[13:11];
    always @* begin
        case (_1283)
        0: _1301 <= _1293;
        1: _1301 <= _1294;
        2: _1301 <= _1295;
        3: _1301 <= _1296;
        4: _1301 <= _1297;
        5: _1301 <= _1298;
        6: _1301 <= _1299;
        default: _1301 <= _1300;
        endcase
    end
    assign _1302 = ~ _1301;
    assign _1312 = _1302 & _1311;
    assign _1282 = _1281[15:14];
    always @* begin
        case (_1282)
        0: _1316 <= _1312;
        1: _1316 <= _1314;
        2: _1316 <= _1315;
        default: _1316 <= gnd;
        endcase
    end
    assign _1332 = _1316 & _1331;
    assign _1366 = _1332 & _1365;
    assign _2693 = _1281[0:0];
    assign _1458 = ~ _1457;
    assign _1383 = ~ _1367;
    assign _2716 = mon0_count_cycles + _2715;
    assign _2712 = mon0_count_cycles == _2711;
    assign _2713 = ~ _2712;
    assign _2708 = _2700 == _2707;
    assign _2704 = _2700[7:0];
    assign _2706 = _2704 == _2705;
    assign _2701 = _2700[3:0];
    assign _2703 = _2701 == _2702;
    assign _2697 = _1270[7:6];
    always @* begin
        case (_2697)
        0: _2709 <= vdd;
        1: _2709 <= _2703;
        2: _2709 <= _2706;
        default: _2709 <= _2708;
        endcase
    end
    assign _2710 = _2692 & _2709;
    assign _2714 = _2710 & _2713;
    assign _2717 = _2714 ? _2716 : mon0_count_cycles;
    assign _2719 = _2696 ? _2718 : _2717;
    assign _2720 = ctrl_bit1 ? mon0_count_cycles : _2719;
    assign _41 = _2720;
    always @(posedge _167) begin
        if (_180)
            mon0_count_cycles <= _1378;
        else
            mon0_count_cycles <= _41;
    end
    assign _1373 = _213 == _1372;
    assign _1374 = spi_wr & _1373;
    always @(posedge _167) begin
        if (_180)
            _1375 <= _1371;
        else
            if (_1374)
                _1375 <= spi_wdata;
    end
    assign _1376 = _1375[31:16];
    assign _1380 = _1376 < mon0_count_cycles;
    assign _1369 = _1270[2:2];
    assign _1381 = _1369 & _1380;
    assign _1368 = _1271 & mon0_armed;
    assign _1382 = _1368 & _1381;
    assign _1384 = _1382 & _1383;
    assign _1459 = _1384 & _1458;
    assign _1456 = ~ _1367;
    assign _1449 = _1353[7:7];
    assign _1448 = _1353[6:6];
    assign _1447 = _1353[5:5];
    assign _1446 = _1353[4:4];
    assign _1445 = _1353[3:3];
    assign _1444 = _1353[2:2];
    assign _1443 = _1353[1:1];
    assign _1442 = _1353[0:0];
    always @* begin
        case (_1389)
        0: _1450 <= _1442;
        1: _1450 <= _1443;
        2: _1450 <= _1444;
        3: _1450 <= _1445;
        4: _1450 <= _1446;
        5: _1450 <= _1447;
        6: _1450 <= _1448;
        default: _1450 <= _1449;
        endcase
    end
    assign _1451 = ~ _1450;
    assign _1439 = _1340[7:7];
    assign _1438 = _1340[6:6];
    assign _1437 = _1340[5:5];
    assign _1436 = _1340[4:4];
    assign _1435 = _1340[3:3];
    assign _1434 = _1340[2:2];
    assign _1433 = _1340[1:1];
    assign _1432 = _1340[0:0];
    always @* begin
        case (_1389)
        0: _1440 <= _1432;
        1: _1440 <= _1433;
        2: _1440 <= _1434;
        3: _1440 <= _1435;
        4: _1440 <= _1436;
        5: _1440 <= _1437;
        6: _1440 <= _1438;
        default: _1440 <= _1439;
        endcase
    end
    assign _1441 = ~ _1440;
    assign _1452 = _1441 & _1451;
    assign _1430 = _1270[5:5];
    assign _1431 = ~ _1430;
    assign _1453 = _1431 | _1452;
    assign _1426 = _1281[31:31];
    assign _1424 = _1292[7:7];
    assign _1423 = _1292[6:6];
    assign _1422 = _1292[5:5];
    assign _1421 = _1292[4:4];
    assign _1420 = _1292[3:3];
    assign _1419 = _1292[2:2];
    assign _1418 = _1292[1:1];
    assign _1417 = _1292[0:0];
    assign _1416 = _1281[30:28];
    always @* begin
        case (_1416)
        0: _1425 <= _1417;
        1: _1425 <= _1418;
        2: _1425 <= _1419;
        3: _1425 <= _1420;
        4: _1425 <= _1421;
        5: _1425 <= _1422;
        6: _1425 <= _1423;
        default: _1425 <= _1424;
        endcase
    end
    assign _1427 = _1425 == _1426;
    assign _1414 = _1281[27:27];
    assign _1415 = ~ _1414;
    assign _1428 = _1415 | _1427;
    assign _1412 = _1398 ^ _1408;
    assign _1410 = ~ _1408;
    assign _1411 = _1398 & _1410;
    assign _1407 = _1289[7:7];
    assign _1406 = _1289[6:6];
    assign _1405 = _1289[5:5];
    assign _1404 = _1289[4:4];
    assign _1403 = _1289[3:3];
    assign _1402 = _1289[2:2];
    assign _1401 = _1289[1:1];
    assign _1400 = _1289[0:0];
    always @* begin
        case (_1389)
        0: _1408 <= _1400;
        1: _1408 <= _1401;
        2: _1408 <= _1402;
        3: _1408 <= _1403;
        4: _1408 <= _1404;
        5: _1408 <= _1405;
        6: _1408 <= _1406;
        default: _1408 <= _1407;
        endcase
    end
    assign _1397 = _1292[7:7];
    assign _1396 = _1292[6:6];
    assign _1395 = _1292[5:5];
    assign _1394 = _1292[4:4];
    assign _1393 = _1292[3:3];
    assign _1392 = _1292[2:2];
    assign _1391 = _1292[1:1];
    assign _1390 = _1292[0:0];
    assign _1389 = _1281[24:22];
    always @* begin
        case (_1389)
        0: _1398 <= _1390;
        1: _1398 <= _1391;
        2: _1398 <= _1392;
        3: _1398 <= _1393;
        4: _1398 <= _1394;
        5: _1398 <= _1395;
        6: _1398 <= _1396;
        default: _1398 <= _1397;
        endcase
    end
    assign _1399 = ~ _1398;
    assign _1409 = _1399 & _1408;
    assign _1388 = _1281[26:25];
    always @* begin
        case (_1388)
        0: _1413 <= _1409;
        1: _1413 <= _1411;
        2: _1413 <= _1412;
        default: _1413 <= gnd;
        endcase
    end
    assign _1429 = _1413 & _1428;
    assign _1454 = _1429 & _1453;
    assign _1386 = _1281[21:21];
    assign _1385 = _1271 & mon0_armed;
    assign _1387 = _1385 & _1386;
    assign _1455 = _1387 & _1454;
    assign _1457 = _1455 & _1456;
    assign _2689 = _1367 | _1457;
    assign _2690 = _2689 | _1459;
    assign _2691 = ~ _2690;
    assign _2692 = mon0_armed & _2691;
    assign _2694 = _2692 & _2693;
    assign _2695 = ~ _2694;
    assign _2682 = _1353[7:7];
    assign _2681 = _1353[6:6];
    assign _2680 = _1353[5:5];
    assign _2679 = _1353[4:4];
    assign _2678 = _1353[3:3];
    assign _2677 = _1353[2:2];
    assign _2676 = _1353[1:1];
    assign _2675 = _1353[0:0];
    always @* begin
        case (_2622)
        0: _2683 <= _2675;
        1: _2683 <= _2676;
        2: _2683 <= _2677;
        3: _2683 <= _2678;
        4: _2683 <= _2679;
        5: _2683 <= _2680;
        6: _2683 <= _2681;
        default: _2683 <= _2682;
        endcase
    end
    assign _2684 = ~ _2683;
    assign _2672 = _1340[7:7];
    assign _2671 = _1340[6:6];
    assign _2670 = _1340[5:5];
    assign _2669 = _1340[4:4];
    assign _2668 = _1340[3:3];
    assign _2667 = _1340[2:2];
    assign _2666 = _1340[1:1];
    assign _2665 = _1340[0:0];
    always @* begin
        case (_2622)
        0: _2673 <= _2665;
        1: _2673 <= _2666;
        2: _2673 <= _2667;
        3: _2673 <= _2668;
        4: _2673 <= _2669;
        5: _2673 <= _2670;
        6: _2673 <= _2671;
        default: _2673 <= _2672;
        endcase
    end
    assign _2674 = ~ _2673;
    assign _2685 = _2674 & _2684;
    assign _2663 = _1270[3:3];
    assign _2664 = ~ _2663;
    assign _2686 = _2664 | _2685;
    assign _2659 = _1281[10:10];
    assign _2657 = _1292[7:7];
    assign _2656 = _1292[6:6];
    assign _2655 = _1292[5:5];
    assign _2654 = _1292[4:4];
    assign _2653 = _1292[3:3];
    assign _2652 = _1292[2:2];
    assign _2651 = _1292[1:1];
    assign _2650 = _1292[0:0];
    assign _2649 = _1281[9:7];
    always @* begin
        case (_2649)
        0: _2658 <= _2650;
        1: _2658 <= _2651;
        2: _2658 <= _2652;
        3: _2658 <= _2653;
        4: _2658 <= _2654;
        5: _2658 <= _2655;
        6: _2658 <= _2656;
        default: _2658 <= _2657;
        endcase
    end
    assign _2660 = _2658 == _2659;
    assign _2647 = _1281[6:6];
    assign _2648 = ~ _2647;
    assign _2661 = _2648 | _2660;
    assign _2645 = _2631 ^ _2641;
    assign _2643 = ~ _2641;
    assign _2644 = _2631 & _2643;
    assign _2640 = _1289[7:7];
    assign _2639 = _1289[6:6];
    assign _2638 = _1289[5:5];
    assign _2637 = _1289[4:4];
    assign _2636 = _1289[3:3];
    assign _2635 = _1289[2:2];
    assign _2634 = _1289[1:1];
    assign _2633 = _1289[0:0];
    always @* begin
        case (_2622)
        0: _2641 <= _2633;
        1: _2641 <= _2634;
        2: _2641 <= _2635;
        3: _2641 <= _2636;
        4: _2641 <= _2637;
        5: _2641 <= _2638;
        6: _2641 <= _2639;
        default: _2641 <= _2640;
        endcase
    end
    assign _2630 = _1292[7:7];
    assign _2629 = _1292[6:6];
    assign _2628 = _1292[5:5];
    assign _2627 = _1292[4:4];
    assign _2626 = _1292[3:3];
    assign _2625 = _1292[2:2];
    assign _2624 = _1292[1:1];
    assign _2623 = _1292[0:0];
    assign _2622 = _1281[3:1];
    always @* begin
        case (_2622)
        0: _2631 <= _2623;
        1: _2631 <= _2624;
        2: _2631 <= _2625;
        3: _2631 <= _2626;
        4: _2631 <= _2627;
        5: _2631 <= _2628;
        6: _2631 <= _2629;
        default: _2631 <= _2630;
        endcase
    end
    assign _2632 = ~ _2631;
    assign _2642 = _2632 & _2641;
    assign _1279 = _213 == _1278;
    assign _1280 = spi_wr & _1279;
    always @(posedge _167) begin
        if (_180)
            _1281 <= _1277;
        else
            if (_1280)
                _1281 <= spi_wdata;
    end
    assign _2621 = _1281[5:4];
    always @* begin
        case (_2621)
        0: _2646 <= _2642;
        1: _2646 <= _2644;
        2: _2646 <= _2645;
        default: _2646 <= gnd;
        endcase
    end
    assign _2662 = _2646 & _2661;
    assign _2687 = _2662 & _2686;
    assign _2688 = _1271 & _2687;
    assign _2696 = _2688 & _2695;
    assign _2721 = _2696 ? vdd : _2692;
    assign _2722 = ctrl_bit1 ? gnd : _2721;
    assign _42 = _2722;
    always @(posedge _167) begin
        if (_180)
            mon0_armed <= _1273;
        else
            mon0_armed <= _42;
    end
    assign _1267 = _213 == _1266;
    assign _1268 = spi_wr & _1267;
    assign _1263 = spi_wdata[7:0];
    always @(posedge _167) begin
        if (_180)
            _1269 <= _1265;
        else
            if (_1268)
                _1269 <= _1263;
    end
    assign _1270 = { _1262, _1269 };
    assign _1271 = _1270[0:0];
    assign _1275 = _1271 & mon0_armed;
    assign _1367 = _1275 & _1366;
    assign _2724 = _1367 & _2723;
    assign _2727 = _2724 & _2726;
    assign _2729 = _2727 | _2728;
    assign _2730 = _2729 | _1459;
    assign _2734 = _2730 ? vdd : mon0_sticky;
    assign _2735 = ctrl_bit1 ? gnd : _2734;
    assign _43 = _2735;
    always @(posedge _167) begin
        if (_180)
            mon0_sticky <= _2732;
        else
            mon0_sticky <= _43;
    end
    assign _2840 = _1560 & _1574;
    assign _2837 = _1568[15:0];
    assign _2838 = mon1_count_cycles < _2837;
    assign _2835 = _1481[1:1];
    assign _1554 = _1353[7:7];
    assign _1553 = _1353[6:6];
    assign _1552 = _1353[5:5];
    assign _1551 = _1353[4:4];
    assign _1550 = _1353[3:3];
    assign _1549 = _1353[2:2];
    assign _1548 = _1353[1:1];
    assign _1547 = _1353[0:0];
    always @* begin
        case (_1494)
        0: _1555 <= _1547;
        1: _1555 <= _1548;
        2: _1555 <= _1549;
        3: _1555 <= _1550;
        4: _1555 <= _1551;
        5: _1555 <= _1552;
        6: _1555 <= _1553;
        default: _1555 <= _1554;
        endcase
    end
    assign _1556 = ~ _1555;
    assign _1544 = _1340[7:7];
    assign _1543 = _1340[6:6];
    assign _1542 = _1340[5:5];
    assign _1541 = _1340[4:4];
    assign _1540 = _1340[3:3];
    assign _1539 = _1340[2:2];
    assign _1538 = _1340[1:1];
    assign _1537 = _1340[0:0];
    always @* begin
        case (_1494)
        0: _1545 <= _1537;
        1: _1545 <= _1538;
        2: _1545 <= _1539;
        3: _1545 <= _1540;
        4: _1545 <= _1541;
        5: _1545 <= _1542;
        6: _1545 <= _1543;
        default: _1545 <= _1544;
        endcase
    end
    assign _1546 = ~ _1545;
    assign _1557 = _1546 & _1556;
    assign _1535 = _1481[4:4];
    assign _1536 = ~ _1535;
    assign _1558 = _1536 | _1557;
    assign _1531 = _1492[20:20];
    assign _1529 = _1292[7:7];
    assign _1528 = _1292[6:6];
    assign _1527 = _1292[5:5];
    assign _1526 = _1292[4:4];
    assign _1525 = _1292[3:3];
    assign _1524 = _1292[2:2];
    assign _1523 = _1292[1:1];
    assign _1522 = _1292[0:0];
    assign _1521 = _1492[19:17];
    always @* begin
        case (_1521)
        0: _1530 <= _1522;
        1: _1530 <= _1523;
        2: _1530 <= _1524;
        3: _1530 <= _1525;
        4: _1530 <= _1526;
        5: _1530 <= _1527;
        6: _1530 <= _1528;
        default: _1530 <= _1529;
        endcase
    end
    assign _1532 = _1530 == _1531;
    assign _1519 = _1492[16:16];
    assign _1520 = ~ _1519;
    assign _1533 = _1520 | _1532;
    assign _1517 = _1503 ^ _1513;
    assign _1515 = ~ _1513;
    assign _1516 = _1503 & _1515;
    assign _1512 = _1289[7:7];
    assign _1511 = _1289[6:6];
    assign _1510 = _1289[5:5];
    assign _1509 = _1289[4:4];
    assign _1508 = _1289[3:3];
    assign _1507 = _1289[2:2];
    assign _1506 = _1289[1:1];
    assign _1505 = _1289[0:0];
    always @* begin
        case (_1494)
        0: _1513 <= _1505;
        1: _1513 <= _1506;
        2: _1513 <= _1507;
        3: _1513 <= _1508;
        4: _1513 <= _1509;
        5: _1513 <= _1510;
        6: _1513 <= _1511;
        default: _1513 <= _1512;
        endcase
    end
    assign _1502 = _1292[7:7];
    assign _1501 = _1292[6:6];
    assign _1500 = _1292[5:5];
    assign _1499 = _1292[4:4];
    assign _1498 = _1292[3:3];
    assign _1497 = _1292[2:2];
    assign _1496 = _1292[1:1];
    assign _1495 = _1292[0:0];
    assign _1494 = _1492[13:11];
    always @* begin
        case (_1494)
        0: _1503 <= _1495;
        1: _1503 <= _1496;
        2: _1503 <= _1497;
        3: _1503 <= _1498;
        4: _1503 <= _1499;
        5: _1503 <= _1500;
        6: _1503 <= _1501;
        default: _1503 <= _1502;
        endcase
    end
    assign _1504 = ~ _1503;
    assign _1514 = _1504 & _1513;
    assign _1493 = _1492[15:14];
    always @* begin
        case (_1493)
        0: _1518 <= _1514;
        1: _1518 <= _1516;
        2: _1518 <= _1517;
        default: _1518 <= gnd;
        endcase
    end
    assign _1534 = _1518 & _1533;
    assign _1559 = _1534 & _1558;
    assign _2808 = _1492[0:0];
    assign _1651 = ~ _1650;
    assign _1576 = ~ _1560;
    assign _2828 = mon1_count_cycles + _2827;
    assign _2824 = mon1_count_cycles == _2823;
    assign _2825 = ~ _2824;
    assign _2820 = _2700 == _2819;
    assign _2816 = _2700[7:0];
    assign _2818 = _2816 == _2817;
    assign _2813 = _2700[3:0];
    assign _2815 = _2813 == _2814;
    assign _2812 = _1481[7:6];
    always @* begin
        case (_2812)
        0: _2821 <= vdd;
        1: _2821 <= _2815;
        2: _2821 <= _2818;
        default: _2821 <= _2820;
        endcase
    end
    assign _2822 = _2807 & _2821;
    assign _2826 = _2822 & _2825;
    assign _2829 = _2826 ? _2828 : mon1_count_cycles;
    assign _2831 = _2811 ? _2830 : _2829;
    assign _2832 = ctrl_bit1 ? mon1_count_cycles : _2831;
    assign _44 = _2832;
    always @(posedge _167) begin
        if (_180)
            mon1_count_cycles <= _1571;
        else
            mon1_count_cycles <= _44;
    end
    assign _1566 = _213 == _1565;
    assign _1567 = spi_wr & _1566;
    always @(posedge _167) begin
        if (_180)
            _1568 <= _1564;
        else
            if (_1567)
                _1568 <= spi_wdata;
    end
    assign _1569 = _1568[31:16];
    assign _1573 = _1569 < mon1_count_cycles;
    assign _1562 = _1481[2:2];
    assign _1574 = _1562 & _1573;
    assign _1561 = _1482 & mon1_armed;
    assign _1575 = _1561 & _1574;
    assign _1577 = _1575 & _1576;
    assign _1652 = _1577 & _1651;
    assign _1649 = ~ _1560;
    assign _1642 = _1353[7:7];
    assign _1641 = _1353[6:6];
    assign _1640 = _1353[5:5];
    assign _1639 = _1353[4:4];
    assign _1638 = _1353[3:3];
    assign _1637 = _1353[2:2];
    assign _1636 = _1353[1:1];
    assign _1635 = _1353[0:0];
    always @* begin
        case (_1582)
        0: _1643 <= _1635;
        1: _1643 <= _1636;
        2: _1643 <= _1637;
        3: _1643 <= _1638;
        4: _1643 <= _1639;
        5: _1643 <= _1640;
        6: _1643 <= _1641;
        default: _1643 <= _1642;
        endcase
    end
    assign _1644 = ~ _1643;
    assign _1632 = _1340[7:7];
    assign _1631 = _1340[6:6];
    assign _1630 = _1340[5:5];
    assign _1629 = _1340[4:4];
    assign _1628 = _1340[3:3];
    assign _1627 = _1340[2:2];
    assign _1626 = _1340[1:1];
    assign _1625 = _1340[0:0];
    always @* begin
        case (_1582)
        0: _1633 <= _1625;
        1: _1633 <= _1626;
        2: _1633 <= _1627;
        3: _1633 <= _1628;
        4: _1633 <= _1629;
        5: _1633 <= _1630;
        6: _1633 <= _1631;
        default: _1633 <= _1632;
        endcase
    end
    assign _1634 = ~ _1633;
    assign _1645 = _1634 & _1644;
    assign _1623 = _1481[5:5];
    assign _1624 = ~ _1623;
    assign _1646 = _1624 | _1645;
    assign _1619 = _1492[31:31];
    assign _1617 = _1292[7:7];
    assign _1616 = _1292[6:6];
    assign _1615 = _1292[5:5];
    assign _1614 = _1292[4:4];
    assign _1613 = _1292[3:3];
    assign _1612 = _1292[2:2];
    assign _1611 = _1292[1:1];
    assign _1610 = _1292[0:0];
    assign _1609 = _1492[30:28];
    always @* begin
        case (_1609)
        0: _1618 <= _1610;
        1: _1618 <= _1611;
        2: _1618 <= _1612;
        3: _1618 <= _1613;
        4: _1618 <= _1614;
        5: _1618 <= _1615;
        6: _1618 <= _1616;
        default: _1618 <= _1617;
        endcase
    end
    assign _1620 = _1618 == _1619;
    assign _1607 = _1492[27:27];
    assign _1608 = ~ _1607;
    assign _1621 = _1608 | _1620;
    assign _1605 = _1591 ^ _1601;
    assign _1603 = ~ _1601;
    assign _1604 = _1591 & _1603;
    assign _1600 = _1289[7:7];
    assign _1599 = _1289[6:6];
    assign _1598 = _1289[5:5];
    assign _1597 = _1289[4:4];
    assign _1596 = _1289[3:3];
    assign _1595 = _1289[2:2];
    assign _1594 = _1289[1:1];
    assign _1593 = _1289[0:0];
    always @* begin
        case (_1582)
        0: _1601 <= _1593;
        1: _1601 <= _1594;
        2: _1601 <= _1595;
        3: _1601 <= _1596;
        4: _1601 <= _1597;
        5: _1601 <= _1598;
        6: _1601 <= _1599;
        default: _1601 <= _1600;
        endcase
    end
    assign _1590 = _1292[7:7];
    assign _1589 = _1292[6:6];
    assign _1588 = _1292[5:5];
    assign _1587 = _1292[4:4];
    assign _1586 = _1292[3:3];
    assign _1585 = _1292[2:2];
    assign _1584 = _1292[1:1];
    assign _1583 = _1292[0:0];
    assign _1582 = _1492[24:22];
    always @* begin
        case (_1582)
        0: _1591 <= _1583;
        1: _1591 <= _1584;
        2: _1591 <= _1585;
        3: _1591 <= _1586;
        4: _1591 <= _1587;
        5: _1591 <= _1588;
        6: _1591 <= _1589;
        default: _1591 <= _1590;
        endcase
    end
    assign _1592 = ~ _1591;
    assign _1602 = _1592 & _1601;
    assign _1581 = _1492[26:25];
    always @* begin
        case (_1581)
        0: _1606 <= _1602;
        1: _1606 <= _1604;
        2: _1606 <= _1605;
        default: _1606 <= gnd;
        endcase
    end
    assign _1622 = _1606 & _1621;
    assign _1647 = _1622 & _1646;
    assign _1579 = _1492[21:21];
    assign _1578 = _1482 & mon1_armed;
    assign _1580 = _1578 & _1579;
    assign _1648 = _1580 & _1647;
    assign _1650 = _1648 & _1649;
    assign _2804 = _1560 | _1650;
    assign _2805 = _2804 | _1652;
    assign _2806 = ~ _2805;
    assign _2807 = mon1_armed & _2806;
    assign _2809 = _2807 & _2808;
    assign _2810 = ~ _2809;
    assign _2797 = _1353[7:7];
    assign _2796 = _1353[6:6];
    assign _2795 = _1353[5:5];
    assign _2794 = _1353[4:4];
    assign _2793 = _1353[3:3];
    assign _2792 = _1353[2:2];
    assign _2791 = _1353[1:1];
    assign _2790 = _1353[0:0];
    always @* begin
        case (_2737)
        0: _2798 <= _2790;
        1: _2798 <= _2791;
        2: _2798 <= _2792;
        3: _2798 <= _2793;
        4: _2798 <= _2794;
        5: _2798 <= _2795;
        6: _2798 <= _2796;
        default: _2798 <= _2797;
        endcase
    end
    assign _2799 = ~ _2798;
    assign _2787 = _1340[7:7];
    assign _2786 = _1340[6:6];
    assign _2785 = _1340[5:5];
    assign _2784 = _1340[4:4];
    assign _2783 = _1340[3:3];
    assign _2782 = _1340[2:2];
    assign _2781 = _1340[1:1];
    assign _2780 = _1340[0:0];
    always @* begin
        case (_2737)
        0: _2788 <= _2780;
        1: _2788 <= _2781;
        2: _2788 <= _2782;
        3: _2788 <= _2783;
        4: _2788 <= _2784;
        5: _2788 <= _2785;
        6: _2788 <= _2786;
        default: _2788 <= _2787;
        endcase
    end
    assign _2789 = ~ _2788;
    assign _2800 = _2789 & _2799;
    assign _2778 = _1481[3:3];
    assign _2779 = ~ _2778;
    assign _2801 = _2779 | _2800;
    assign _2774 = _1492[10:10];
    assign _2772 = _1292[7:7];
    assign _2771 = _1292[6:6];
    assign _2770 = _1292[5:5];
    assign _2769 = _1292[4:4];
    assign _2768 = _1292[3:3];
    assign _2767 = _1292[2:2];
    assign _2766 = _1292[1:1];
    assign _2765 = _1292[0:0];
    assign _2764 = _1492[9:7];
    always @* begin
        case (_2764)
        0: _2773 <= _2765;
        1: _2773 <= _2766;
        2: _2773 <= _2767;
        3: _2773 <= _2768;
        4: _2773 <= _2769;
        5: _2773 <= _2770;
        6: _2773 <= _2771;
        default: _2773 <= _2772;
        endcase
    end
    assign _2775 = _2773 == _2774;
    assign _2762 = _1492[6:6];
    assign _2763 = ~ _2762;
    assign _2776 = _2763 | _2775;
    assign _2760 = _2746 ^ _2756;
    assign _2758 = ~ _2756;
    assign _2759 = _2746 & _2758;
    assign _2755 = _1289[7:7];
    assign _2754 = _1289[6:6];
    assign _2753 = _1289[5:5];
    assign _2752 = _1289[4:4];
    assign _2751 = _1289[3:3];
    assign _2750 = _1289[2:2];
    assign _2749 = _1289[1:1];
    assign _2748 = _1289[0:0];
    always @* begin
        case (_2737)
        0: _2756 <= _2748;
        1: _2756 <= _2749;
        2: _2756 <= _2750;
        3: _2756 <= _2751;
        4: _2756 <= _2752;
        5: _2756 <= _2753;
        6: _2756 <= _2754;
        default: _2756 <= _2755;
        endcase
    end
    assign _2745 = _1292[7:7];
    assign _2744 = _1292[6:6];
    assign _2743 = _1292[5:5];
    assign _2742 = _1292[4:4];
    assign _2741 = _1292[3:3];
    assign _2740 = _1292[2:2];
    assign _2739 = _1292[1:1];
    assign _2738 = _1292[0:0];
    assign _2737 = _1492[3:1];
    always @* begin
        case (_2737)
        0: _2746 <= _2738;
        1: _2746 <= _2739;
        2: _2746 <= _2740;
        3: _2746 <= _2741;
        4: _2746 <= _2742;
        5: _2746 <= _2743;
        6: _2746 <= _2744;
        default: _2746 <= _2745;
        endcase
    end
    assign _2747 = ~ _2746;
    assign _2757 = _2747 & _2756;
    assign _1490 = _213 == _1489;
    assign _1491 = spi_wr & _1490;
    always @(posedge _167) begin
        if (_180)
            _1492 <= _1488;
        else
            if (_1491)
                _1492 <= spi_wdata;
    end
    assign _2736 = _1492[5:4];
    always @* begin
        case (_2736)
        0: _2761 <= _2757;
        1: _2761 <= _2759;
        2: _2761 <= _2760;
        default: _2761 <= gnd;
        endcase
    end
    assign _2777 = _2761 & _2776;
    assign _2802 = _2777 & _2801;
    assign _2803 = _1482 & _2802;
    assign _2811 = _2803 & _2810;
    assign _2833 = _2811 ? vdd : _2807;
    assign _2834 = ctrl_bit1 ? gnd : _2833;
    assign _45 = _2834;
    always @(posedge _167) begin
        if (_180)
            mon1_armed <= _1484;
        else
            mon1_armed <= _45;
    end
    assign _1478 = _213 == _1477;
    assign _1479 = spi_wr & _1478;
    assign _1474 = spi_wdata[7:0];
    always @(posedge _167) begin
        if (_180)
            _1480 <= _1476;
        else
            if (_1479)
                _1480 <= _1474;
    end
    assign _1481 = { _1473, _1480 };
    assign _1482 = _1481[0:0];
    assign _1486 = _1482 & mon1_armed;
    assign _1560 = _1486 & _1559;
    assign _2836 = _1560 & _2835;
    assign _2839 = _2836 & _2838;
    assign _2841 = _2839 | _2840;
    assign _2842 = _2841 | _1652;
    assign _2846 = _2842 ? vdd : mon1_sticky;
    assign _2847 = ctrl_bit1 ? gnd : _2846;
    assign _46 = _2847;
    always @(posedge _167) begin
        if (_180)
            mon1_sticky <= _2844;
        else
            mon1_sticky <= _46;
    end
    assign _2952 = _1753 & _1767;
    assign _2949 = _1761[15:0];
    assign _2950 = mon2_count_cycles < _2949;
    assign _2947 = _1674[1:1];
    assign _1747 = _1353[7:7];
    assign _1746 = _1353[6:6];
    assign _1745 = _1353[5:5];
    assign _1744 = _1353[4:4];
    assign _1743 = _1353[3:3];
    assign _1742 = _1353[2:2];
    assign _1741 = _1353[1:1];
    assign _1740 = _1353[0:0];
    always @* begin
        case (_1687)
        0: _1748 <= _1740;
        1: _1748 <= _1741;
        2: _1748 <= _1742;
        3: _1748 <= _1743;
        4: _1748 <= _1744;
        5: _1748 <= _1745;
        6: _1748 <= _1746;
        default: _1748 <= _1747;
        endcase
    end
    assign _1749 = ~ _1748;
    assign _1737 = _1340[7:7];
    assign _1736 = _1340[6:6];
    assign _1735 = _1340[5:5];
    assign _1734 = _1340[4:4];
    assign _1733 = _1340[3:3];
    assign _1732 = _1340[2:2];
    assign _1731 = _1340[1:1];
    assign _1730 = _1340[0:0];
    always @* begin
        case (_1687)
        0: _1738 <= _1730;
        1: _1738 <= _1731;
        2: _1738 <= _1732;
        3: _1738 <= _1733;
        4: _1738 <= _1734;
        5: _1738 <= _1735;
        6: _1738 <= _1736;
        default: _1738 <= _1737;
        endcase
    end
    assign _1739 = ~ _1738;
    assign _1750 = _1739 & _1749;
    assign _1728 = _1674[4:4];
    assign _1729 = ~ _1728;
    assign _1751 = _1729 | _1750;
    assign _1724 = _1685[20:20];
    assign _1722 = _1292[7:7];
    assign _1721 = _1292[6:6];
    assign _1720 = _1292[5:5];
    assign _1719 = _1292[4:4];
    assign _1718 = _1292[3:3];
    assign _1717 = _1292[2:2];
    assign _1716 = _1292[1:1];
    assign _1715 = _1292[0:0];
    assign _1714 = _1685[19:17];
    always @* begin
        case (_1714)
        0: _1723 <= _1715;
        1: _1723 <= _1716;
        2: _1723 <= _1717;
        3: _1723 <= _1718;
        4: _1723 <= _1719;
        5: _1723 <= _1720;
        6: _1723 <= _1721;
        default: _1723 <= _1722;
        endcase
    end
    assign _1725 = _1723 == _1724;
    assign _1712 = _1685[16:16];
    assign _1713 = ~ _1712;
    assign _1726 = _1713 | _1725;
    assign _1710 = _1696 ^ _1706;
    assign _1708 = ~ _1706;
    assign _1709 = _1696 & _1708;
    assign _1705 = _1289[7:7];
    assign _1704 = _1289[6:6];
    assign _1703 = _1289[5:5];
    assign _1702 = _1289[4:4];
    assign _1701 = _1289[3:3];
    assign _1700 = _1289[2:2];
    assign _1699 = _1289[1:1];
    assign _1698 = _1289[0:0];
    always @* begin
        case (_1687)
        0: _1706 <= _1698;
        1: _1706 <= _1699;
        2: _1706 <= _1700;
        3: _1706 <= _1701;
        4: _1706 <= _1702;
        5: _1706 <= _1703;
        6: _1706 <= _1704;
        default: _1706 <= _1705;
        endcase
    end
    assign _1695 = _1292[7:7];
    assign _1694 = _1292[6:6];
    assign _1693 = _1292[5:5];
    assign _1692 = _1292[4:4];
    assign _1691 = _1292[3:3];
    assign _1690 = _1292[2:2];
    assign _1689 = _1292[1:1];
    assign _1688 = _1292[0:0];
    assign _1687 = _1685[13:11];
    always @* begin
        case (_1687)
        0: _1696 <= _1688;
        1: _1696 <= _1689;
        2: _1696 <= _1690;
        3: _1696 <= _1691;
        4: _1696 <= _1692;
        5: _1696 <= _1693;
        6: _1696 <= _1694;
        default: _1696 <= _1695;
        endcase
    end
    assign _1697 = ~ _1696;
    assign _1707 = _1697 & _1706;
    assign _1686 = _1685[15:14];
    always @* begin
        case (_1686)
        0: _1711 <= _1707;
        1: _1711 <= _1709;
        2: _1711 <= _1710;
        default: _1711 <= gnd;
        endcase
    end
    assign _1727 = _1711 & _1726;
    assign _1752 = _1727 & _1751;
    assign _2920 = _1685[0:0];
    assign _1844 = ~ _1843;
    assign _1769 = ~ _1753;
    assign _2940 = mon2_count_cycles + _2939;
    assign _2936 = mon2_count_cycles == _2935;
    assign _2937 = ~ _2936;
    assign _2932 = _2700 == _2931;
    assign _2928 = _2700[7:0];
    assign _2930 = _2928 == _2929;
    assign _2925 = _2700[3:0];
    assign _2927 = _2925 == _2926;
    assign _2924 = _1674[7:6];
    always @* begin
        case (_2924)
        0: _2933 <= vdd;
        1: _2933 <= _2927;
        2: _2933 <= _2930;
        default: _2933 <= _2932;
        endcase
    end
    assign _2934 = _2919 & _2933;
    assign _2938 = _2934 & _2937;
    assign _2941 = _2938 ? _2940 : mon2_count_cycles;
    assign _2943 = _2923 ? _2942 : _2941;
    assign _2944 = ctrl_bit1 ? mon2_count_cycles : _2943;
    assign _47 = _2944;
    always @(posedge _167) begin
        if (_180)
            mon2_count_cycles <= _1764;
        else
            mon2_count_cycles <= _47;
    end
    assign _1759 = _213 == _1758;
    assign _1760 = spi_wr & _1759;
    always @(posedge _167) begin
        if (_180)
            _1761 <= _1757;
        else
            if (_1760)
                _1761 <= spi_wdata;
    end
    assign _1762 = _1761[31:16];
    assign _1766 = _1762 < mon2_count_cycles;
    assign _1755 = _1674[2:2];
    assign _1767 = _1755 & _1766;
    assign _1754 = _1675 & mon2_armed;
    assign _1768 = _1754 & _1767;
    assign _1770 = _1768 & _1769;
    assign _1845 = _1770 & _1844;
    assign _1842 = ~ _1753;
    assign _1835 = _1353[7:7];
    assign _1834 = _1353[6:6];
    assign _1833 = _1353[5:5];
    assign _1832 = _1353[4:4];
    assign _1831 = _1353[3:3];
    assign _1830 = _1353[2:2];
    assign _1829 = _1353[1:1];
    assign _1828 = _1353[0:0];
    always @* begin
        case (_1775)
        0: _1836 <= _1828;
        1: _1836 <= _1829;
        2: _1836 <= _1830;
        3: _1836 <= _1831;
        4: _1836 <= _1832;
        5: _1836 <= _1833;
        6: _1836 <= _1834;
        default: _1836 <= _1835;
        endcase
    end
    assign _1837 = ~ _1836;
    assign _1825 = _1340[7:7];
    assign _1824 = _1340[6:6];
    assign _1823 = _1340[5:5];
    assign _1822 = _1340[4:4];
    assign _1821 = _1340[3:3];
    assign _1820 = _1340[2:2];
    assign _1819 = _1340[1:1];
    assign _1818 = _1340[0:0];
    always @* begin
        case (_1775)
        0: _1826 <= _1818;
        1: _1826 <= _1819;
        2: _1826 <= _1820;
        3: _1826 <= _1821;
        4: _1826 <= _1822;
        5: _1826 <= _1823;
        6: _1826 <= _1824;
        default: _1826 <= _1825;
        endcase
    end
    assign _1827 = ~ _1826;
    assign _1838 = _1827 & _1837;
    assign _1816 = _1674[5:5];
    assign _1817 = ~ _1816;
    assign _1839 = _1817 | _1838;
    assign _1812 = _1685[31:31];
    assign _1810 = _1292[7:7];
    assign _1809 = _1292[6:6];
    assign _1808 = _1292[5:5];
    assign _1807 = _1292[4:4];
    assign _1806 = _1292[3:3];
    assign _1805 = _1292[2:2];
    assign _1804 = _1292[1:1];
    assign _1803 = _1292[0:0];
    assign _1802 = _1685[30:28];
    always @* begin
        case (_1802)
        0: _1811 <= _1803;
        1: _1811 <= _1804;
        2: _1811 <= _1805;
        3: _1811 <= _1806;
        4: _1811 <= _1807;
        5: _1811 <= _1808;
        6: _1811 <= _1809;
        default: _1811 <= _1810;
        endcase
    end
    assign _1813 = _1811 == _1812;
    assign _1800 = _1685[27:27];
    assign _1801 = ~ _1800;
    assign _1814 = _1801 | _1813;
    assign _1798 = _1784 ^ _1794;
    assign _1796 = ~ _1794;
    assign _1797 = _1784 & _1796;
    assign _1793 = _1289[7:7];
    assign _1792 = _1289[6:6];
    assign _1791 = _1289[5:5];
    assign _1790 = _1289[4:4];
    assign _1789 = _1289[3:3];
    assign _1788 = _1289[2:2];
    assign _1787 = _1289[1:1];
    assign _1786 = _1289[0:0];
    always @* begin
        case (_1775)
        0: _1794 <= _1786;
        1: _1794 <= _1787;
        2: _1794 <= _1788;
        3: _1794 <= _1789;
        4: _1794 <= _1790;
        5: _1794 <= _1791;
        6: _1794 <= _1792;
        default: _1794 <= _1793;
        endcase
    end
    assign _1783 = _1292[7:7];
    assign _1782 = _1292[6:6];
    assign _1781 = _1292[5:5];
    assign _1780 = _1292[4:4];
    assign _1779 = _1292[3:3];
    assign _1778 = _1292[2:2];
    assign _1777 = _1292[1:1];
    assign _1776 = _1292[0:0];
    assign _1775 = _1685[24:22];
    always @* begin
        case (_1775)
        0: _1784 <= _1776;
        1: _1784 <= _1777;
        2: _1784 <= _1778;
        3: _1784 <= _1779;
        4: _1784 <= _1780;
        5: _1784 <= _1781;
        6: _1784 <= _1782;
        default: _1784 <= _1783;
        endcase
    end
    assign _1785 = ~ _1784;
    assign _1795 = _1785 & _1794;
    assign _1774 = _1685[26:25];
    always @* begin
        case (_1774)
        0: _1799 <= _1795;
        1: _1799 <= _1797;
        2: _1799 <= _1798;
        default: _1799 <= gnd;
        endcase
    end
    assign _1815 = _1799 & _1814;
    assign _1840 = _1815 & _1839;
    assign _1772 = _1685[21:21];
    assign _1771 = _1675 & mon2_armed;
    assign _1773 = _1771 & _1772;
    assign _1841 = _1773 & _1840;
    assign _1843 = _1841 & _1842;
    assign _2916 = _1753 | _1843;
    assign _2917 = _2916 | _1845;
    assign _2918 = ~ _2917;
    assign _2919 = mon2_armed & _2918;
    assign _2921 = _2919 & _2920;
    assign _2922 = ~ _2921;
    assign _2909 = _1353[7:7];
    assign _2908 = _1353[6:6];
    assign _2907 = _1353[5:5];
    assign _2906 = _1353[4:4];
    assign _2905 = _1353[3:3];
    assign _2904 = _1353[2:2];
    assign _2903 = _1353[1:1];
    assign _2902 = _1353[0:0];
    always @* begin
        case (_2849)
        0: _2910 <= _2902;
        1: _2910 <= _2903;
        2: _2910 <= _2904;
        3: _2910 <= _2905;
        4: _2910 <= _2906;
        5: _2910 <= _2907;
        6: _2910 <= _2908;
        default: _2910 <= _2909;
        endcase
    end
    assign _2911 = ~ _2910;
    assign _2899 = _1340[7:7];
    assign _2898 = _1340[6:6];
    assign _2897 = _1340[5:5];
    assign _2896 = _1340[4:4];
    assign _2895 = _1340[3:3];
    assign _2894 = _1340[2:2];
    assign _2893 = _1340[1:1];
    assign _2892 = _1340[0:0];
    always @* begin
        case (_2849)
        0: _2900 <= _2892;
        1: _2900 <= _2893;
        2: _2900 <= _2894;
        3: _2900 <= _2895;
        4: _2900 <= _2896;
        5: _2900 <= _2897;
        6: _2900 <= _2898;
        default: _2900 <= _2899;
        endcase
    end
    assign _2901 = ~ _2900;
    assign _2912 = _2901 & _2911;
    assign _2890 = _1674[3:3];
    assign _2891 = ~ _2890;
    assign _2913 = _2891 | _2912;
    assign _2886 = _1685[10:10];
    assign _2884 = _1292[7:7];
    assign _2883 = _1292[6:6];
    assign _2882 = _1292[5:5];
    assign _2881 = _1292[4:4];
    assign _2880 = _1292[3:3];
    assign _2879 = _1292[2:2];
    assign _2878 = _1292[1:1];
    assign _2877 = _1292[0:0];
    assign _2876 = _1685[9:7];
    always @* begin
        case (_2876)
        0: _2885 <= _2877;
        1: _2885 <= _2878;
        2: _2885 <= _2879;
        3: _2885 <= _2880;
        4: _2885 <= _2881;
        5: _2885 <= _2882;
        6: _2885 <= _2883;
        default: _2885 <= _2884;
        endcase
    end
    assign _2887 = _2885 == _2886;
    assign _2874 = _1685[6:6];
    assign _2875 = ~ _2874;
    assign _2888 = _2875 | _2887;
    assign _2872 = _2858 ^ _2868;
    assign _2870 = ~ _2868;
    assign _2871 = _2858 & _2870;
    assign _2867 = _1289[7:7];
    assign _2866 = _1289[6:6];
    assign _2865 = _1289[5:5];
    assign _2864 = _1289[4:4];
    assign _2863 = _1289[3:3];
    assign _2862 = _1289[2:2];
    assign _2861 = _1289[1:1];
    assign _2860 = _1289[0:0];
    always @* begin
        case (_2849)
        0: _2868 <= _2860;
        1: _2868 <= _2861;
        2: _2868 <= _2862;
        3: _2868 <= _2863;
        4: _2868 <= _2864;
        5: _2868 <= _2865;
        6: _2868 <= _2866;
        default: _2868 <= _2867;
        endcase
    end
    assign _2857 = _1292[7:7];
    assign _2856 = _1292[6:6];
    assign _2855 = _1292[5:5];
    assign _2854 = _1292[4:4];
    assign _2853 = _1292[3:3];
    assign _2852 = _1292[2:2];
    assign _2851 = _1292[1:1];
    assign _2850 = _1292[0:0];
    assign _2849 = _1685[3:1];
    always @* begin
        case (_2849)
        0: _2858 <= _2850;
        1: _2858 <= _2851;
        2: _2858 <= _2852;
        3: _2858 <= _2853;
        4: _2858 <= _2854;
        5: _2858 <= _2855;
        6: _2858 <= _2856;
        default: _2858 <= _2857;
        endcase
    end
    assign _2859 = ~ _2858;
    assign _2869 = _2859 & _2868;
    assign _1683 = _213 == _1682;
    assign _1684 = spi_wr & _1683;
    always @(posedge _167) begin
        if (_180)
            _1685 <= _1681;
        else
            if (_1684)
                _1685 <= spi_wdata;
    end
    assign _2848 = _1685[5:4];
    always @* begin
        case (_2848)
        0: _2873 <= _2869;
        1: _2873 <= _2871;
        2: _2873 <= _2872;
        default: _2873 <= gnd;
        endcase
    end
    assign _2889 = _2873 & _2888;
    assign _2914 = _2889 & _2913;
    assign _2915 = _1675 & _2914;
    assign _2923 = _2915 & _2922;
    assign _2945 = _2923 ? vdd : _2919;
    assign _2946 = ctrl_bit1 ? gnd : _2945;
    assign _48 = _2946;
    always @(posedge _167) begin
        if (_180)
            mon2_armed <= _1677;
        else
            mon2_armed <= _48;
    end
    assign _1671 = _213 == _1670;
    assign _1672 = spi_wr & _1671;
    assign _1667 = spi_wdata[7:0];
    always @(posedge _167) begin
        if (_180)
            _1673 <= _1669;
        else
            if (_1672)
                _1673 <= _1667;
    end
    assign _1674 = { _1666, _1673 };
    assign _1675 = _1674[0:0];
    assign _1679 = _1675 & mon2_armed;
    assign _1753 = _1679 & _1752;
    assign _2948 = _1753 & _2947;
    assign _2951 = _2948 & _2950;
    assign _2953 = _2951 | _2952;
    assign _2954 = _2953 | _1845;
    assign _2958 = _2954 ? vdd : mon2_sticky;
    assign _2959 = ctrl_bit1 ? gnd : _2958;
    assign _49 = _2959;
    always @(posedge _167) begin
        if (_180)
            mon2_sticky <= _2956;
        else
            mon2_sticky <= _49;
    end
    assign _3226 = _1946 & _1960;
    assign _3223 = _1954[15:0];
    assign _3224 = mon3_count_cycles < _3223;
    assign _3221 = _1867[1:1];
    assign _1940 = _1353[7:7];
    assign _1939 = _1353[6:6];
    assign _1938 = _1353[5:5];
    assign _1937 = _1353[4:4];
    assign _1936 = _1353[3:3];
    assign _1935 = _1353[2:2];
    assign _1934 = _1353[1:1];
    assign _1933 = _1353[0:0];
    always @* begin
        case (_1880)
        0: _1941 <= _1933;
        1: _1941 <= _1934;
        2: _1941 <= _1935;
        3: _1941 <= _1936;
        4: _1941 <= _1937;
        5: _1941 <= _1938;
        6: _1941 <= _1939;
        default: _1941 <= _1940;
        endcase
    end
    assign _1942 = ~ _1941;
    assign _1930 = _1340[7:7];
    assign _1929 = _1340[6:6];
    assign _1928 = _1340[5:5];
    assign _1927 = _1340[4:4];
    assign _1926 = _1340[3:3];
    assign _1925 = _1340[2:2];
    assign _1924 = _1340[1:1];
    assign _1923 = _1340[0:0];
    always @* begin
        case (_1880)
        0: _1931 <= _1923;
        1: _1931 <= _1924;
        2: _1931 <= _1925;
        3: _1931 <= _1926;
        4: _1931 <= _1927;
        5: _1931 <= _1928;
        6: _1931 <= _1929;
        default: _1931 <= _1930;
        endcase
    end
    assign _1932 = ~ _1931;
    assign _1943 = _1932 & _1942;
    assign _1921 = _1867[4:4];
    assign _1922 = ~ _1921;
    assign _1944 = _1922 | _1943;
    assign _1917 = _1878[20:20];
    assign _1915 = _1292[7:7];
    assign _1914 = _1292[6:6];
    assign _1913 = _1292[5:5];
    assign _1912 = _1292[4:4];
    assign _1911 = _1292[3:3];
    assign _1910 = _1292[2:2];
    assign _1909 = _1292[1:1];
    assign _1908 = _1292[0:0];
    assign _1907 = _1878[19:17];
    always @* begin
        case (_1907)
        0: _1916 <= _1908;
        1: _1916 <= _1909;
        2: _1916 <= _1910;
        3: _1916 <= _1911;
        4: _1916 <= _1912;
        5: _1916 <= _1913;
        6: _1916 <= _1914;
        default: _1916 <= _1915;
        endcase
    end
    assign _1918 = _1916 == _1917;
    assign _1905 = _1878[16:16];
    assign _1906 = ~ _1905;
    assign _1919 = _1906 | _1918;
    assign _1903 = _1889 ^ _1899;
    assign _1901 = ~ _1899;
    assign _1902 = _1889 & _1901;
    assign _1898 = _1289[7:7];
    assign _1897 = _1289[6:6];
    assign _1896 = _1289[5:5];
    assign _1895 = _1289[4:4];
    assign _1894 = _1289[3:3];
    assign _1893 = _1289[2:2];
    assign _1892 = _1289[1:1];
    assign _1891 = _1289[0:0];
    always @* begin
        case (_1880)
        0: _1899 <= _1891;
        1: _1899 <= _1892;
        2: _1899 <= _1893;
        3: _1899 <= _1894;
        4: _1899 <= _1895;
        5: _1899 <= _1896;
        6: _1899 <= _1897;
        default: _1899 <= _1898;
        endcase
    end
    assign _1888 = _1292[7:7];
    assign _1887 = _1292[6:6];
    assign _1886 = _1292[5:5];
    assign _1885 = _1292[4:4];
    assign _1884 = _1292[3:3];
    assign _1883 = _1292[2:2];
    assign _1882 = _1292[1:1];
    assign _1881 = _1292[0:0];
    assign _1880 = _1878[13:11];
    always @* begin
        case (_1880)
        0: _1889 <= _1881;
        1: _1889 <= _1882;
        2: _1889 <= _1883;
        3: _1889 <= _1884;
        4: _1889 <= _1885;
        5: _1889 <= _1886;
        6: _1889 <= _1887;
        default: _1889 <= _1888;
        endcase
    end
    assign _1890 = ~ _1889;
    assign _1900 = _1890 & _1899;
    assign _1879 = _1878[15:14];
    always @* begin
        case (_1879)
        0: _1904 <= _1900;
        1: _1904 <= _1902;
        2: _1904 <= _1903;
        default: _1904 <= gnd;
        endcase
    end
    assign _1920 = _1904 & _1919;
    assign _1945 = _1920 & _1944;
    assign _3034 = _1878[0:0];
    assign _2037 = ~ _2036;
    assign _1962 = ~ _1946;
    assign _3054 = mon3_count_cycles + _3053;
    assign _3050 = mon3_count_cycles == _3049;
    assign _3051 = ~ _3050;
    assign _3046 = _2700 == _3045;
    assign _3042 = _2700[7:0];
    assign _3044 = _3042 == _3043;
    assign _2961 = _2700 + _2960;
    assign _50 = _2961;
    always @(posedge _167) begin
        if (_180)
            _2700 <= _2699;
        else
            _2700 <= _50;
    end
    assign _3039 = _2700[3:0];
    assign _3041 = _3039 == _3040;
    assign _3038 = _1867[7:6];
    always @* begin
        case (_3038)
        0: _3047 <= vdd;
        1: _3047 <= _3041;
        2: _3047 <= _3044;
        default: _3047 <= _3046;
        endcase
    end
    assign _3048 = _3033 & _3047;
    assign _3052 = _3048 & _3051;
    assign _3055 = _3052 ? _3054 : mon3_count_cycles;
    assign _3057 = _3037 ? _3056 : _3055;
    assign _3058 = ctrl_bit1 ? mon3_count_cycles : _3057;
    assign _51 = _3058;
    always @(posedge _167) begin
        if (_180)
            mon3_count_cycles <= _1957;
        else
            mon3_count_cycles <= _51;
    end
    assign _1952 = _213 == _1951;
    assign _1953 = spi_wr & _1952;
    always @(posedge _167) begin
        if (_180)
            _1954 <= _1950;
        else
            if (_1953)
                _1954 <= spi_wdata;
    end
    assign _1955 = _1954[31:16];
    assign _1959 = _1955 < mon3_count_cycles;
    assign _1948 = _1867[2:2];
    assign _1960 = _1948 & _1959;
    assign _1947 = _1868 & mon3_armed;
    assign _1961 = _1947 & _1960;
    assign _1963 = _1961 & _1962;
    assign _2038 = _1963 & _2037;
    assign _2035 = ~ _1946;
    assign _2028 = _1353[7:7];
    assign _2027 = _1353[6:6];
    assign _2026 = _1353[5:5];
    assign _2025 = _1353[4:4];
    assign _2024 = _1353[3:3];
    assign _2023 = _1353[2:2];
    assign _2022 = _1353[1:1];
    assign _2021 = _1353[0:0];
    always @* begin
        case (_1968)
        0: _2029 <= _2021;
        1: _2029 <= _2022;
        2: _2029 <= _2023;
        3: _2029 <= _2024;
        4: _2029 <= _2025;
        5: _2029 <= _2026;
        6: _2029 <= _2027;
        default: _2029 <= _2028;
        endcase
    end
    assign _2030 = ~ _2029;
    assign _2018 = _1340[7:7];
    assign _2017 = _1340[6:6];
    assign _2016 = _1340[5:5];
    assign _2015 = _1340[4:4];
    assign _2014 = _1340[3:3];
    assign _2013 = _1340[2:2];
    assign _2012 = _1340[1:1];
    assign _2011 = _1340[0:0];
    always @* begin
        case (_1968)
        0: _2019 <= _2011;
        1: _2019 <= _2012;
        2: _2019 <= _2013;
        3: _2019 <= _2014;
        4: _2019 <= _2015;
        5: _2019 <= _2016;
        6: _2019 <= _2017;
        default: _2019 <= _2018;
        endcase
    end
    assign _2020 = ~ _2019;
    assign _2031 = _2020 & _2030;
    assign _2009 = _1867[5:5];
    assign _2010 = ~ _2009;
    assign _2032 = _2010 | _2031;
    assign _2005 = _1878[31:31];
    assign _2003 = _1292[7:7];
    assign _2002 = _1292[6:6];
    assign _2001 = _1292[5:5];
    assign _2000 = _1292[4:4];
    assign _1999 = _1292[3:3];
    assign _1998 = _1292[2:2];
    assign _1997 = _1292[1:1];
    assign _1996 = _1292[0:0];
    assign _1995 = _1878[30:28];
    always @* begin
        case (_1995)
        0: _2004 <= _1996;
        1: _2004 <= _1997;
        2: _2004 <= _1998;
        3: _2004 <= _1999;
        4: _2004 <= _2000;
        5: _2004 <= _2001;
        6: _2004 <= _2002;
        default: _2004 <= _2003;
        endcase
    end
    assign _2006 = _2004 == _2005;
    assign _1993 = _1878[27:27];
    assign _1994 = ~ _1993;
    assign _2007 = _1994 | _2006;
    assign _1991 = _1977 ^ _1987;
    assign _1989 = ~ _1987;
    assign _1990 = _1977 & _1989;
    assign _1986 = _1289[7:7];
    assign _1985 = _1289[6:6];
    assign _1984 = _1289[5:5];
    assign _1983 = _1289[4:4];
    assign _1982 = _1289[3:3];
    assign _1981 = _1289[2:2];
    assign _1980 = _1289[1:1];
    assign _1979 = _1289[0:0];
    always @* begin
        case (_1968)
        0: _1987 <= _1979;
        1: _1987 <= _1980;
        2: _1987 <= _1981;
        3: _1987 <= _1982;
        4: _1987 <= _1983;
        5: _1987 <= _1984;
        6: _1987 <= _1985;
        default: _1987 <= _1986;
        endcase
    end
    assign _1976 = _1292[7:7];
    assign _1975 = _1292[6:6];
    assign _1974 = _1292[5:5];
    assign _1973 = _1292[4:4];
    assign _1972 = _1292[3:3];
    assign _1971 = _1292[2:2];
    assign _1970 = _1292[1:1];
    assign _1969 = _1292[0:0];
    assign _1968 = _1878[24:22];
    always @* begin
        case (_1968)
        0: _1977 <= _1969;
        1: _1977 <= _1970;
        2: _1977 <= _1971;
        3: _1977 <= _1972;
        4: _1977 <= _1973;
        5: _1977 <= _1974;
        6: _1977 <= _1975;
        default: _1977 <= _1976;
        endcase
    end
    assign _1978 = ~ _1977;
    assign _1988 = _1978 & _1987;
    assign _1967 = _1878[26:25];
    always @* begin
        case (_1967)
        0: _1992 <= _1988;
        1: _1992 <= _1990;
        2: _1992 <= _1991;
        default: _1992 <= gnd;
        endcase
    end
    assign _2008 = _1992 & _2007;
    assign _2033 = _2008 & _2032;
    assign _1965 = _1878[21:21];
    assign _1964 = _1868 & mon3_armed;
    assign _1966 = _1964 & _1965;
    assign _2034 = _1966 & _2033;
    assign _2036 = _2034 & _2035;
    assign _3030 = _1946 | _2036;
    assign _3031 = _3030 | _2038;
    assign _3032 = ~ _3031;
    assign _3033 = mon3_armed & _3032;
    assign _3035 = _3033 & _3034;
    assign _3036 = ~ _3035;
    assign _3023 = _1353[7:7];
    assign _3022 = _1353[6:6];
    assign _3021 = _1353[5:5];
    assign _3020 = _1353[4:4];
    assign _3019 = _1353[3:3];
    assign _3018 = _1353[2:2];
    assign _3017 = _1353[1:1];
    always @(posedge _167) begin
        if (_180)
            _1353 <= _1352;
        else
            _1353 <= _1340;
    end
    assign _3016 = _1353[0:0];
    always @* begin
        case (_2963)
        0: _3024 <= _3016;
        1: _3024 <= _3017;
        2: _3024 <= _3018;
        3: _3024 <= _3019;
        4: _3024 <= _3020;
        5: _3024 <= _3021;
        6: _3024 <= _3022;
        default: _3024 <= _3023;
        endcase
    end
    assign _3025 = ~ _3024;
    assign _3013 = _1340[7:7];
    assign _3012 = _1340[6:6];
    assign _3011 = _1340[5:5];
    assign _3010 = _1340[4:4];
    assign _3009 = _1340[3:3];
    assign _3008 = _1340[2:2];
    assign _3007 = _1340[1:1];
    assign _3072 = _360 == _3071;
    assign _364 = _360 == _363;
    assign _362 = _360 == _361;
    assign _365 = _362 | _364;
    assign _3073 = _365 | _3072;
    assign _358 = _356 == _357;
    assign _359 = _329 & _358;
    assign _3074 = _359 & _3073;
    assign _3075 = _3074 ? _365 : pin0_oe;
    assign _3068 = _349 == _3067;
    assign _353 = _349 == _352;
    assign _351 = _349 == _350;
    assign _354 = _351 | _353;
    assign _3069 = _354 | _3068;
    assign _347 = _345 == _346;
    assign _348 = _344 & _347;
    assign _3070 = _348 & _3069;
    assign _3076 = _3070 ? _354 : _3075;
    assign _3064 = _287 == _3063;
    assign _291 = _287 == _290;
    assign _289 = _287 == _288;
    assign _292 = _289 | _291;
    assign _3065 = _292 | _3064;
    assign _285 = _283 == _284;
    assign _286 = _256 & _285;
    assign _3066 = _286 & _3065;
    assign _3077 = _3066 ? _292 : _3076;
    assign _3060 = _276 == _3059;
    assign _280 = _276 == _279;
    assign _278 = _276 == _277;
    assign _281 = _278 | _280;
    assign _3061 = _281 | _3060;
    assign _274 = _272 == _273;
    assign _275 = _271 & _274;
    assign _3062 = _275 & _3061;
    assign _3078 = _3062 ? _281 : _3077;
    assign _52 = _3078;
    always @(posedge _167) begin
        if (_180)
            pin0_oe <= _202;
        else
            pin0_oe <= _52;
    end
    assign _3092 = _360 == _3091;
    assign _415 = _360 == _414;
    assign _413 = _360 == _412;
    assign _416 = _413 | _415;
    assign _3093 = _416 | _3092;
    assign _410 = _356 == _409;
    assign _411 = _329 & _410;
    assign _3094 = _411 & _3093;
    assign _3095 = _3094 ? _416 : pin1_oe;
    assign _3088 = _349 == _3087;
    assign _406 = _349 == _405;
    assign _404 = _349 == _403;
    assign _407 = _404 | _406;
    assign _3089 = _407 | _3088;
    assign _401 = _345 == _400;
    assign _402 = _344 & _401;
    assign _3090 = _402 & _3089;
    assign _3096 = _3090 ? _407 : _3095;
    assign _3084 = _287 == _3083;
    assign _397 = _287 == _396;
    assign _395 = _287 == _394;
    assign _398 = _395 | _397;
    assign _3085 = _398 | _3084;
    assign _392 = _283 == _391;
    assign _393 = _256 & _392;
    assign _3086 = _393 & _3085;
    assign _3097 = _3086 ? _398 : _3096;
    assign _3080 = _276 == _3079;
    assign _388 = _276 == _387;
    assign _386 = _276 == _385;
    assign _389 = _386 | _388;
    assign _3081 = _389 | _3080;
    assign _383 = _272 == _382;
    assign _384 = _271 & _383;
    assign _3082 = _384 & _3081;
    assign _3098 = _3082 ? _389 : _3097;
    assign _53 = _3098;
    always @(posedge _167) begin
        if (_180)
            pin1_oe <= _199;
        else
            pin1_oe <= _53;
    end
    assign _3112 = _360 == _3111;
    assign _466 = _360 == _465;
    assign _464 = _360 == _463;
    assign _467 = _464 | _466;
    assign _3113 = _467 | _3112;
    assign _461 = _356 == _460;
    assign _462 = _329 & _461;
    assign _3114 = _462 & _3113;
    assign _3115 = _3114 ? _467 : pin2_oe;
    assign _3108 = _349 == _3107;
    assign _457 = _349 == _456;
    assign _455 = _349 == _454;
    assign _458 = _455 | _457;
    assign _3109 = _458 | _3108;
    assign _452 = _345 == _451;
    assign _453 = _344 & _452;
    assign _3110 = _453 & _3109;
    assign _3116 = _3110 ? _458 : _3115;
    assign _3104 = _287 == _3103;
    assign _448 = _287 == _447;
    assign _446 = _287 == _445;
    assign _449 = _446 | _448;
    assign _3105 = _449 | _3104;
    assign _443 = _283 == _442;
    assign _444 = _256 & _443;
    assign _3106 = _444 & _3105;
    assign _3117 = _3106 ? _449 : _3116;
    assign _3100 = _276 == _3099;
    assign _439 = _276 == _438;
    assign _437 = _276 == _436;
    assign _440 = _437 | _439;
    assign _3101 = _440 | _3100;
    assign _434 = _272 == _433;
    assign _435 = _271 & _434;
    assign _3102 = _435 & _3101;
    assign _3118 = _3102 ? _440 : _3117;
    assign _54 = _3118;
    always @(posedge _167) begin
        if (_180)
            pin2_oe <= _196;
        else
            pin2_oe <= _54;
    end
    assign _3132 = _360 == _3131;
    assign _517 = _360 == _516;
    assign _515 = _360 == _514;
    assign _518 = _515 | _517;
    assign _3133 = _518 | _3132;
    assign _512 = _356 == _511;
    assign _513 = _329 & _512;
    assign _3134 = _513 & _3133;
    assign _3135 = _3134 ? _518 : pin3_oe;
    assign _3128 = _349 == _3127;
    assign _508 = _349 == _507;
    assign _506 = _349 == _505;
    assign _509 = _506 | _508;
    assign _3129 = _509 | _3128;
    assign _503 = _345 == _502;
    assign _504 = _344 & _503;
    assign _3130 = _504 & _3129;
    assign _3136 = _3130 ? _509 : _3135;
    assign _3124 = _287 == _3123;
    assign _499 = _287 == _498;
    assign _497 = _287 == _496;
    assign _500 = _497 | _499;
    assign _3125 = _500 | _3124;
    assign _494 = _283 == _493;
    assign _495 = _256 & _494;
    assign _3126 = _495 & _3125;
    assign _3137 = _3126 ? _500 : _3136;
    assign _3120 = _276 == _3119;
    assign _490 = _276 == _489;
    assign _488 = _276 == _487;
    assign _491 = _488 | _490;
    assign _3121 = _491 | _3120;
    assign _485 = _272 == _484;
    assign _486 = _271 & _485;
    assign _3122 = _486 & _3121;
    assign _3138 = _3122 ? _491 : _3137;
    assign _55 = _3138;
    always @(posedge _167) begin
        if (_180)
            pin3_oe <= _193;
        else
            pin3_oe <= _55;
    end
    assign _3152 = _360 == _3151;
    assign _568 = _360 == _567;
    assign _566 = _360 == _565;
    assign _569 = _566 | _568;
    assign _3153 = _569 | _3152;
    assign _563 = _356 == _562;
    assign _564 = _329 & _563;
    assign _3154 = _564 & _3153;
    assign _3155 = _3154 ? _569 : pin4_oe;
    assign _3148 = _349 == _3147;
    assign _559 = _349 == _558;
    assign _557 = _349 == _556;
    assign _560 = _557 | _559;
    assign _3149 = _560 | _3148;
    assign _554 = _345 == _553;
    assign _555 = _344 & _554;
    assign _3150 = _555 & _3149;
    assign _3156 = _3150 ? _560 : _3155;
    assign _3144 = _287 == _3143;
    assign _550 = _287 == _549;
    assign _548 = _287 == _547;
    assign _551 = _548 | _550;
    assign _3145 = _551 | _3144;
    assign _545 = _283 == _544;
    assign _546 = _256 & _545;
    assign _3146 = _546 & _3145;
    assign _3157 = _3146 ? _551 : _3156;
    assign _3140 = _276 == _3139;
    assign _541 = _276 == _540;
    assign _539 = _276 == _538;
    assign _542 = _539 | _541;
    assign _3141 = _542 | _3140;
    assign _536 = _272 == _535;
    assign _537 = _271 & _536;
    assign _3142 = _537 & _3141;
    assign _3158 = _3142 ? _542 : _3157;
    assign _56 = _3158;
    always @(posedge _167) begin
        if (_180)
            pin4_oe <= _190;
        else
            pin4_oe <= _56;
    end
    assign _3172 = _360 == _3171;
    assign _619 = _360 == _618;
    assign _617 = _360 == _616;
    assign _620 = _617 | _619;
    assign _3173 = _620 | _3172;
    assign _614 = _356 == _613;
    assign _615 = _329 & _614;
    assign _3174 = _615 & _3173;
    assign _3175 = _3174 ? _620 : pin5_oe;
    assign _3168 = _349 == _3167;
    assign _610 = _349 == _609;
    assign _608 = _349 == _607;
    assign _611 = _608 | _610;
    assign _3169 = _611 | _3168;
    assign _605 = _345 == _604;
    assign _606 = _344 & _605;
    assign _3170 = _606 & _3169;
    assign _3176 = _3170 ? _611 : _3175;
    assign _3164 = _287 == _3163;
    assign _601 = _287 == _600;
    assign _599 = _287 == _598;
    assign _602 = _599 | _601;
    assign _3165 = _602 | _3164;
    assign _596 = _283 == _595;
    assign _597 = _256 & _596;
    assign _3166 = _597 & _3165;
    assign _3177 = _3166 ? _602 : _3176;
    assign _3160 = _276 == _3159;
    assign _592 = _276 == _591;
    assign _590 = _276 == _589;
    assign _593 = _590 | _592;
    assign _3161 = _593 | _3160;
    assign _587 = _272 == _586;
    assign _588 = _271 & _587;
    assign _3162 = _588 & _3161;
    assign _3178 = _3162 ? _593 : _3177;
    assign _57 = _3178;
    always @(posedge _167) begin
        if (_180)
            pin5_oe <= _187;
        else
            pin5_oe <= _57;
    end
    assign _3192 = _360 == _3191;
    assign _670 = _360 == _669;
    assign _668 = _360 == _667;
    assign _671 = _668 | _670;
    assign _3193 = _671 | _3192;
    assign _665 = _356 == _664;
    assign _666 = _329 & _665;
    assign _3194 = _666 & _3193;
    assign _3195 = _3194 ? _671 : pin6_oe;
    assign _3188 = _349 == _3187;
    assign _661 = _349 == _660;
    assign _659 = _349 == _658;
    assign _662 = _659 | _661;
    assign _3189 = _662 | _3188;
    assign _656 = _345 == _655;
    assign _657 = _344 & _656;
    assign _3190 = _657 & _3189;
    assign _3196 = _3190 ? _662 : _3195;
    assign _3184 = _287 == _3183;
    assign _652 = _287 == _651;
    assign _650 = _287 == _649;
    assign _653 = _650 | _652;
    assign _3185 = _653 | _3184;
    assign _647 = _283 == _646;
    assign _648 = _256 & _647;
    assign _3186 = _648 & _3185;
    assign _3197 = _3186 ? _653 : _3196;
    assign _3180 = _276 == _3179;
    assign _643 = _276 == _642;
    assign _641 = _276 == _640;
    assign _644 = _641 | _643;
    assign _3181 = _644 | _3180;
    assign _638 = _272 == _637;
    assign _639 = _271 & _638;
    assign _3182 = _639 & _3181;
    assign _3198 = _3182 ? _644 : _3197;
    assign _58 = _3198;
    always @(posedge _167) begin
        if (_180)
            pin6_oe <= _184;
        else
            pin6_oe <= _58;
    end
    assign _3212 = _360 == _3211;
    assign _721 = _360 == _720;
    assign _719 = _360 == _718;
    assign _722 = _719 | _721;
    assign _3213 = _722 | _3212;
    assign _716 = _356 == _715;
    assign _717 = _329 & _716;
    assign _3214 = _717 & _3213;
    assign _3215 = _3214 ? _722 : pin7_oe;
    assign _3208 = _349 == _3207;
    assign _712 = _349 == _711;
    assign _710 = _349 == _709;
    assign _713 = _710 | _712;
    assign _3209 = _713 | _3208;
    assign _707 = _345 == _706;
    assign _708 = _344 & _707;
    assign _3210 = _708 & _3209;
    assign _3216 = _3210 ? _713 : _3215;
    assign _3204 = _287 == _3203;
    assign _703 = _287 == _702;
    assign _701 = _287 == _700;
    assign _704 = _701 | _703;
    assign _3205 = _704 | _3204;
    assign _698 = _283 == _697;
    assign _699 = _256 & _698;
    assign _3206 = _699 & _3205;
    assign _3217 = _3206 ? _704 : _3216;
    assign _3200 = _276 == _3199;
    assign _694 = _276 == _693;
    assign _692 = _276 == _691;
    assign _695 = _692 | _694;
    assign _3201 = _695 | _3200;
    assign _689 = _272 == _688;
    assign _690 = _271 & _689;
    assign _3202 = _690 & _3201;
    assign _3218 = _3202 ? _695 : _3217;
    assign _59 = _3218;
    always @(posedge _167) begin
        if (_180)
            pin7_oe <= _181;
        else
            pin7_oe <= _59;
    end
    assign _204 = { pin7_oe, pin6_oe, pin5_oe, pin4_oe, pin3_oe, pin2_oe, pin1_oe, pin0_oe };
    always @(posedge _167) begin
        if (_180)
            _1337 <= _1336;
        else
            _1337 <= _204;
    end
    always @(posedge _167) begin
        if (_180)
            _1340 <= _1339;
        else
            _1340 <= _1337;
    end
    assign _3006 = _1340[0:0];
    always @* begin
        case (_2963)
        0: _3014 <= _3006;
        1: _3014 <= _3007;
        2: _3014 <= _3008;
        3: _3014 <= _3009;
        4: _3014 <= _3010;
        5: _3014 <= _3011;
        6: _3014 <= _3012;
        default: _3014 <= _3013;
        endcase
    end
    assign _3015 = ~ _3014;
    assign _3026 = _3015 & _3025;
    assign _3004 = _1867[3:3];
    assign _3005 = ~ _3004;
    assign _3027 = _3005 | _3026;
    assign _3000 = _1878[10:10];
    assign _2998 = _1292[7:7];
    assign _2997 = _1292[6:6];
    assign _2996 = _1292[5:5];
    assign _2995 = _1292[4:4];
    assign _2994 = _1292[3:3];
    assign _2993 = _1292[2:2];
    assign _2992 = _1292[1:1];
    assign _2991 = _1292[0:0];
    assign _2990 = _1878[9:7];
    always @* begin
        case (_2990)
        0: _2999 <= _2991;
        1: _2999 <= _2992;
        2: _2999 <= _2993;
        3: _2999 <= _2994;
        4: _2999 <= _2995;
        5: _2999 <= _2996;
        6: _2999 <= _2997;
        default: _2999 <= _2998;
        endcase
    end
    assign _3001 = _2999 == _3000;
    assign _2988 = _1878[6:6];
    assign _2989 = ~ _2988;
    assign _3002 = _2989 | _3001;
    assign _2986 = _2972 ^ _2982;
    assign _2984 = ~ _2982;
    assign _2985 = _2972 & _2984;
    assign _2981 = _1289[7:7];
    assign _2980 = _1289[6:6];
    assign _2979 = _1289[5:5];
    assign _2978 = _1289[4:4];
    assign _2977 = _1289[3:3];
    assign _2976 = _1289[2:2];
    assign _2975 = _1289[1:1];
    assign _2974 = _1289[0:0];
    always @* begin
        case (_2963)
        0: _2982 <= _2974;
        1: _2982 <= _2975;
        2: _2982 <= _2976;
        3: _2982 <= _2977;
        4: _2982 <= _2978;
        5: _2982 <= _2979;
        6: _2982 <= _2980;
        default: _2982 <= _2981;
        endcase
    end
    assign _2971 = _1292[7:7];
    assign _2970 = _1292[6:6];
    assign _2969 = _1292[5:5];
    assign _2968 = _1292[4:4];
    assign _2967 = _1292[3:3];
    assign _2966 = _1292[2:2];
    assign _2965 = _1292[1:1];
    always @(posedge _167) begin
        _1286 <= _142;
    end
    always @(posedge _167) begin
        _1289 <= _1286;
    end
    always @(posedge _167) begin
        if (_180)
            _1292 <= _1291;
        else
            _1292 <= _1289;
    end
    assign _2964 = _1292[0:0];
    assign _2963 = _1878[3:1];
    always @* begin
        case (_2963)
        0: _2972 <= _2964;
        1: _2972 <= _2965;
        2: _2972 <= _2966;
        3: _2972 <= _2967;
        4: _2972 <= _2968;
        5: _2972 <= _2969;
        6: _2972 <= _2970;
        default: _2972 <= _2971;
        endcase
    end
    assign _2973 = ~ _2972;
    assign _2983 = _2973 & _2982;
    assign _1876 = _213 == _1875;
    assign _1877 = spi_wr & _1876;
    always @(posedge _167) begin
        if (_180)
            _1878 <= _1874;
        else
            if (_1877)
                _1878 <= spi_wdata;
    end
    assign _2962 = _1878[5:4];
    always @* begin
        case (_2962)
        0: _2987 <= _2983;
        1: _2987 <= _2985;
        2: _2987 <= _2986;
        default: _2987 <= gnd;
        endcase
    end
    assign _3003 = _2987 & _3002;
    assign _3028 = _3003 & _3027;
    assign _3029 = _1868 & _3028;
    assign _3037 = _3029 & _3036;
    assign _3219 = _3037 ? vdd : _3033;
    assign _3220 = ctrl_bit1 ? gnd : _3219;
    assign _60 = _3220;
    always @(posedge _167) begin
        if (_180)
            mon3_armed <= _1870;
        else
            mon3_armed <= _60;
    end
    assign _1864 = _213 == _1863;
    assign _1865 = spi_wr & _1864;
    assign _1860 = spi_wdata[7:0];
    always @(posedge _167) begin
        if (_180)
            _1866 <= _1862;
        else
            if (_1865)
                _1866 <= _1860;
    end
    assign _1867 = { _1859, _1866 };
    assign _1868 = _1867[0:0];
    assign _1872 = _1868 & mon3_armed;
    assign _1946 = _1872 & _1945;
    assign _3222 = _1946 & _3221;
    assign _3225 = _3222 & _3224;
    assign _3227 = _3225 | _3226;
    assign _3228 = _3227 | _2038;
    assign _3232 = _3228 ? vdd : mon3_sticky;
    assign _1257 = spi_wdata[1:1];
    assign _1258 = _216 & _1257;
    always @(posedge _167) begin
        if (_180)
            ctrl_bit1 <= _1260;
        else
            ctrl_bit1 <= _1258;
    end
    assign _3233 = ctrl_bit1 ? gnd : _3232;
    assign _61 = _3233;
    always @(posedge _167) begin
        if (_180)
            mon3_sticky <= _3230;
        else
            mon3_sticky <= _61;
    end
    assign _5630 = { mon3_sticky, mon2_sticky, mon1_sticky, mon0_sticky };
    assign _63 = ena;
    always @(posedge _167) begin
        _5626 <= _63;
    end
    always @(posedge _167) begin
        _5629 <= _5626;
    end
    assign _5475 = _272 == _345;
    assign _5471 = _349 == _5470;
    assign _5472 = ~ _5471;
    assign _5473 = _344 & _5472;
    assign _5467 = _276 == _5466;
    assign _5468 = ~ _5467;
    assign _5469 = _271 & _5468;
    assign _5474 = _5469 & _5473;
    assign _5476 = _5474 & _5475;
    assign _272 = _262[4:2];
    assign _5463 = _272 == _356;
    assign _5459 = _360 == _5458;
    assign _5460 = ~ _5459;
    assign _5461 = _329 & _5460;
    assign _276 = _262[1:0];
    assign _5455 = _276 == _5454;
    assign _5456 = ~ _5455;
    assign _5457 = _271 & _5456;
    assign _5462 = _5457 & _5461;
    assign _5464 = _5462 & _5463;
    assign _345 = _335[4:2];
    assign _5451 = _283 == _345;
    assign _349 = _335[1:0];
    assign _5447 = _349 == _5446;
    assign _5448 = ~ _5447;
    assign _5449 = _344 & _5448;
    assign _5443 = _287 == _5442;
    assign _5444 = ~ _5443;
    assign _5445 = _256 & _5444;
    assign _5450 = _5445 & _5449;
    assign _5452 = _5450 & _5451;
    assign _356 = _320[4:2];
    assign _283 = _244[4:2];
    assign _5440 = _283 == _356;
    assign _360 = _320[1:0];
    assign _5436 = _360 == _5435;
    assign _5437 = ~ _5436;
    assign _324 = _320[28:5];
    assign _325 = _324 - timebase;
    assign _327 = _325 == _326;
    always @* begin
        case (queue_b_read_ptr)
        0: _320 <= queue_b_entry0;
        1: _320 <= queue_b_entry1;
        2: _320 <= queue_b_entry2;
        default: _320 <= queue_b_entry3;
        endcase
    end
    assign _321 = _320[28:5];
    assign _322 = _321 - timebase;
    assign _323 = _322[23:23];
    assign _328 = _323 | _327;
    assign _339 = _335[28:5];
    assign _340 = _339 - timebase;
    assign _342 = _340 == _341;
    assign _3238 = queue_b_write_ptr == _3237;
    assign _3367 = _3238 ? _3366 : queue_b_entry3;
    assign _3368 = _1166 ? _3367 : queue_b_entry3;
    assign _64 = _3368;
    always @(posedge _167) begin
        if (_301)
            queue_b_entry3 <= _318;
        else
            queue_b_entry3 <= _64;
    end
    assign _3370 = queue_b_write_ptr == _3369;
    assign _3371 = _3370 ? _3366 : queue_b_entry2;
    assign _3372 = _1166 ? _3371 : queue_b_entry2;
    assign _65 = _3372;
    always @(posedge _167) begin
        if (_301)
            queue_b_entry2 <= _315;
        else
            queue_b_entry2 <= _65;
    end
    assign _3374 = queue_b_write_ptr == _3373;
    assign _3375 = _3374 ? _3366 : queue_b_entry1;
    assign _3376 = _1166 ? _3375 : queue_b_entry1;
    assign _66 = _3376;
    always @(posedge _167) begin
        if (_301)
            queue_b_entry1 <= _312;
        else
            queue_b_entry1 <= _66;
    end
    assign _3360 = _3328 == _3359;
    assign _3361 = ~ _3360;
    assign _3358 = _3328 == _3357;
    assign _3362 = _3355 ? _3361 : _3358;
    assign _3356 = _3355 ^ _3320;
    assign _3363 = _3315 ? _3362 : _3356;
    assign _3364 = _3363 ? _3339 : _3311;
    assign _3347 = _3295 ? _3346 : _3345;
    assign _3342 = _3328 == _3341;
    assign _3343 = _3342 ? _3339 : _3311;
    assign _3336 = seq_b_coder[3:3];
    assign _3339 = _3336 ? _3338 : _3337;
    assign _3332 = _3328 == _3331;
    assign _3333 = ~ _3332;
    assign _3475 = _3248 ? _3365 : seq_b_shadow_clk;
    assign _3476 = _3474 ? _3475 : seq_b_shadow_clk;
    assign _3477 = _1163 ? _3476 : seq_b_shadow_clk;
    assign _3478 = _3465 ? _3477 : seq_b_shadow_clk;
    assign _3480 = ctrl_bit3 ? _3479 : _3478;
    assign _67 = _3480;
    always @(posedge _167) begin
        if (_180)
            seq_b_shadow_clk <= _3326;
        else
            seq_b_shadow_clk <= _67;
    end
    assign _3481 = _3248 ? seq_b_shadow_data : _3365;
    assign _3472 = _3239 == _3471;
    assign _3469 = _3239 == _3468;
    assign _3467 = _3239 == _3466;
    assign _3470 = _3467 | _3469;
    assign _3473 = _3470 | _3472;
    assign _3474 = ~ _3473;
    assign _3482 = _3474 ? _3481 : seq_b_shadow_data;
    assign _3483 = _1163 ? _3482 : seq_b_shadow_data;
    assign _3484 = _3465 ? _3483 : seq_b_shadow_data;
    assign _3486 = ctrl_bit3 ? _3485 : _3484;
    assign _68 = _3486;
    always @(posedge _167) begin
        if (_180)
            seq_b_shadow_data <= _3323;
        else
            seq_b_shadow_data <= _68;
    end
    assign _3328 = _3248 ? seq_b_shadow_clk : seq_b_shadow_data;
    assign _3330 = _3328 == _3329;
    assign _3334 = _3319 ? _3333 : _3330;
    assign _3320 = seq_b_coder[2:2];
    assign _3321 = _3319 ^ _3320;
    assign _3315 = seq_b_coder[0:0];
    assign _3335 = _3315 ? _3334 : _3321;
    assign _3340 = _3335 ? _3339 : _3311;
    assign _3344 = _3300 ? _3343 : _3340;
    assign _3348 = _3298 ? _3347 : _3344;
    assign _3314 = _3306 ? _3313 : _3312;
    assign _3349 = _3304 ? _3348 : _3314;
    assign _3308 = _3239 == _3307;
    assign _3306 = _3239 == _3305;
    assign _3309 = _3306 | _3308;
    assign _3302 = _3239 == _3301;
    assign _3300 = _3239 == _3299;
    assign _3303 = _3300 | _3302;
    assign _3297 = _3239 == _3296;
    assign _3295 = _3239 == _3294;
    assign _3298 = _3295 | _3297;
    assign _3304 = _3298 | _3303;
    assign _3310 = _3304 | _3309;
    assign _3350 = _3310 ? _3349 : _3311;
    assign _3365 = _3293 ? _3364 : _3350;
    assign _3261 = _3241 ? _3260 : _3259;
    assign _3258 = _3248 ? _3257 : _3256;
    assign _3245 = _3239 == _3244;
    assign _3243 = _3239 == _3242;
    assign _3246 = _3243 | _3245;
    assign _3241 = _3239 == _3240;
    assign _3247 = _3241 | _3246;
    assign _3262 = _3247 ? _3261 : _3258;
    assign _1208 = _1201[17:0];
    assign _1210 = { _1208, _1209 };
    assign _1205 = _1201[19:0];
    assign _1207 = { _1205, _1206 };
    assign _1202 = _1201[21:0];
    assign _1204 = { _1202, _1203 };
    assign _1199 = { _1197, _1196 };
    assign _3492 = _3490 == _3491;
    assign _3488 = _1118 == _3487;
    assign _3489 = _1115 & _3488;
    assign _3493 = _3489 & _3492;
    assign _3495 = _3493 ? _3494 : seq_b_k3;
    assign _3496 = _3465 ? _3495 : seq_b_k3;
    assign _3505 = ctrl_bit3 ? _3504 : _3496;
    assign _69 = _3505;
    always @(posedge _167) begin
        if (_180)
            seq_b_k3 <= _1188;
        else
            seq_b_k3 <= _69;
    end
    assign _3510 = _3490 == _3509;
    assign _3507 = _1118 == _3506;
    assign _3508 = _1115 & _3507;
    assign _3511 = _3508 & _3510;
    assign _3512 = _3511 ? _3494 : seq_b_k2;
    assign _3513 = _3465 ? _3512 : seq_b_k2;
    assign _3515 = ctrl_bit3 ? _3514 : _3513;
    assign _70 = _3515;
    always @(posedge _167) begin
        if (_180)
            seq_b_k2 <= _1185;
        else
            seq_b_k2 <= _70;
    end
    assign _3520 = _3490 == _3519;
    assign _3517 = _1118 == _3516;
    assign _3518 = _1115 & _3517;
    assign _3521 = _3518 & _3520;
    assign _3522 = _3521 ? _3494 : seq_b_k1;
    assign _3523 = _3465 ? _3522 : seq_b_k1;
    assign _3525 = ctrl_bit3 ? _3524 : _3523;
    assign _71 = _3525;
    always @(posedge _167) begin
        if (_180)
            seq_b_k1 <= _1182;
        else
            seq_b_k1 <= _71;
    end
    assign _1179 = seq_b_ir[4:3];
    always @* begin
        case (_1179)
        0: _1190 <= _1180;
        1: _1190 <= seq_b_k1;
        2: _1190 <= seq_b_k2;
        default: _1190 <= seq_b_k3;
        endcase
    end
    assign _1191 = _1190[7:7];
    assign _1192 = { _1191, _1191 };
    assign _1193 = { _1192, _1190 };
    assign _1177 = seq_b_ir[11:6];
    assign _1178 = { _1176, _1177 };
    assign _1194 = _1178 + _1193;
    assign _1195 = _1194[9:9];
    assign _1196 = { _1195, _1195 };
    assign _1197 = { _1196, _1196 };
    assign _1198 = { _1197, _1197 };
    assign _1200 = { _1198, _1199 };
    assign _1201 = { _1200, _1194 };
    always @* begin
        case (seq_b_prescale)
        0: _1211 <= _1201;
        1: _1211 <= _1204;
        2: _1211 <= _1207;
        default: _1211 <= _1210;
        endcase
    end
    assign _1212 = seq_b_sched_s + _1211;
    assign _3366 = { _1212, _3262, _3365 };
    assign _3527 = queue_b_write_ptr + _3526;
    assign _3528 = _1166 ? _3527 : queue_b_write_ptr;
    assign _72 = _3528;
    always @(posedge _167) begin
        if (_301)
            queue_b_write_ptr <= _3235;
        else
            queue_b_write_ptr <= _72;
    end
    assign _3530 = queue_b_write_ptr == _3529;
    assign _3531 = _3530 ? _3366 : queue_b_entry0;
    assign _3532 = _1166 ? _3531 : queue_b_entry0;
    assign _73 = _3532;
    always @(posedge _167) begin
        if (_301)
            queue_b_entry0 <= _309;
        else
            queue_b_entry0 <= _73;
    end
    assign _301 = _180 | ctrl_bit3;
    assign _3538 = _3537[1:0];
    assign _3539 = queue_b_read_ptr + _3538;
    assign _74 = _3539;
    always @(posedge _167) begin
        if (_301)
            queue_b_read_ptr <= _306;
        else
            queue_b_read_ptr <= _74;
    end
    assign _334 = queue_b_read_ptr + _333;
    always @* begin
        case (_334)
        0: _335 <= queue_b_entry0;
        1: _335 <= queue_b_entry1;
        2: _335 <= queue_b_entry2;
        default: _335 <= queue_b_entry3;
        endcase
    end
    assign _336 = _335[28:5];
    assign _337 = _336 - timebase;
    assign _338 = _337[23:23];
    assign _343 = _338 | _342;
    assign _331 = _330 < queue_b_count;
    assign _332 = _329 & _331;
    assign _344 = _332 & _343;
    assign _3536 = { _3535, _344 };
    assign _3534 = { _3533, _329 };
    assign _3537 = _3534 + _3536;
    assign _1162 = ~ seq_b_far;
    assign _1165 = queue_b_count < _1164;
    assign _75 = _1165;
    assign _1155 = _1118 == _1154;
    assign _1156 = _1115 & _1155;
    assign _1132 = seq_b_running & _1131;
    assign _4335 = _1132 ? gnd : seq_b_running;
    assign _1111 = seq_b_ir & _1110;
    assign _1113 = _1111 == _1112;
    assign _1106 = seq_b_ir[10:10];
    assign _1108 = _1106 == _1107;
    assign _1102 = seq_b_ir[11:11];
    assign _1104 = _1102 == _1103;
    assign _1099 = seq_b_ir[15:12];
    assign _1101 = _1099 == _1100;
    assign _1105 = _1101 & _1104;
    assign _1109 = _1105 & _1108;
    assign _1114 = _1109 & _1113;
    assign _1094 = seq_b_ir & _1093;
    assign _1096 = _1094 == _1095;
    assign _1088 = seq_b_ir[11:9];
    assign _1090 = _1088 == _1089;
    assign _1084 = seq_b_ir[11:9];
    assign _1086 = _1084 == _1085;
    assign _1080 = seq_b_ir[11:9];
    assign _1082 = _1080 == _1081;
    assign _1077 = seq_b_ir[11:9];
    assign _1079 = _1077 == _1078;
    assign _1083 = _1079 | _1082;
    assign _1087 = _1083 | _1086;
    assign _1091 = _1087 | _1090;
    assign _1074 = seq_b_ir[15:12];
    assign _1076 = _1074 == _1075;
    assign _1092 = _1076 & _1091;
    assign _1097 = _1092 & _1096;
    assign _1068 = seq_b_ir[11:8];
    assign _1070 = _1068 == _1069;
    assign _1064 = seq_b_ir[11:8];
    assign _1066 = _1064 == _1065;
    assign _1060 = seq_b_ir[11:8];
    assign _1062 = _1060 == _1061;
    assign _1054 = seq_b_ir[7:0];
    assign _1056 = _1054 == _1055;
    assign _1050 = seq_b_ir[7:0];
    assign _1052 = _1050 == _1051;
    assign _1046 = seq_b_ir[7:0];
    assign _1048 = _1046 == _1047;
    assign _1042 = seq_b_ir[7:0];
    assign _1044 = _1042 == _1043;
    assign _1038 = seq_b_ir[7:0];
    assign _1040 = _1038 == _1039;
    assign _1034 = seq_b_ir[7:0];
    assign _1036 = _1034 == _1035;
    assign _1030 = seq_b_ir[7:0];
    assign _1032 = _1030 == _1031;
    assign _1026 = seq_b_ir[7:0];
    assign _1028 = _1026 == _1027;
    assign _1022 = seq_b_ir[7:0];
    assign _1024 = _1022 == _1023;
    assign _1018 = seq_b_ir[7:0];
    assign _1020 = _1018 == _1019;
    assign _1014 = seq_b_ir[7:0];
    assign _1016 = _1014 == _1015;
    assign _1010 = seq_b_ir[7:0];
    assign _1012 = _1010 == _1011;
    assign _1006 = seq_b_ir[7:0];
    assign _1008 = _1006 == _1007;
    assign _1002 = seq_b_ir[7:0];
    assign _1004 = _1002 == _1003;
    assign _998 = seq_b_ir[7:0];
    assign _1000 = _998 == _999;
    assign _994 = seq_b_ir[7:0];
    assign _996 = _994 == _995;
    assign _990 = seq_b_ir[7:0];
    assign _992 = _990 == _991;
    assign _986 = seq_b_ir[7:0];
    assign _988 = _986 == _987;
    assign _982 = seq_b_ir[7:0];
    assign _984 = _982 == _983;
    assign _978 = seq_b_ir[7:0];
    assign _980 = _978 == _979;
    assign _974 = seq_b_ir[7:0];
    assign _976 = _974 == _975;
    assign _970 = seq_b_ir[7:0];
    assign _972 = _970 == _971;
    assign _966 = seq_b_ir[7:0];
    assign _968 = _966 == _967;
    assign _962 = seq_b_ir[7:0];
    assign _964 = _962 == _963;
    assign _958 = seq_b_ir[7:0];
    assign _960 = _958 == _959;
    assign _954 = seq_b_ir[7:0];
    assign _956 = _954 == _955;
    assign _950 = seq_b_ir[7:0];
    assign _952 = _950 == _951;
    assign _946 = seq_b_ir[7:0];
    assign _948 = _946 == _947;
    assign _942 = seq_b_ir[7:0];
    assign _944 = _942 == _943;
    assign _938 = seq_b_ir[7:0];
    assign _940 = _938 == _939;
    assign _934 = seq_b_ir[7:0];
    assign _936 = _934 == _935;
    assign _931 = seq_b_ir[7:0];
    assign _933 = _931 == _932;
    assign _937 = _933 | _936;
    assign _941 = _937 | _940;
    assign _945 = _941 | _944;
    assign _949 = _945 | _948;
    assign _953 = _949 | _952;
    assign _957 = _953 | _956;
    assign _961 = _957 | _960;
    assign _965 = _961 | _964;
    assign _969 = _965 | _968;
    assign _973 = _969 | _972;
    assign _977 = _973 | _976;
    assign _981 = _977 | _980;
    assign _985 = _981 | _984;
    assign _989 = _985 | _988;
    assign _993 = _989 | _992;
    assign _997 = _993 | _996;
    assign _1001 = _997 | _1000;
    assign _1005 = _1001 | _1004;
    assign _1009 = _1005 | _1008;
    assign _1013 = _1009 | _1012;
    assign _1017 = _1013 | _1016;
    assign _1021 = _1017 | _1020;
    assign _1025 = _1021 | _1024;
    assign _1029 = _1025 | _1028;
    assign _1033 = _1029 | _1032;
    assign _1037 = _1033 | _1036;
    assign _1041 = _1037 | _1040;
    assign _1045 = _1041 | _1044;
    assign _1049 = _1045 | _1048;
    assign _1053 = _1049 | _1052;
    assign _1057 = _1053 | _1056;
    assign _928 = seq_b_ir[11:8];
    assign _930 = _928 == _929;
    assign _1058 = _930 & _1057;
    assign _924 = seq_b_ir[11:8];
    assign _926 = _924 == _925;
    assign _920 = seq_b_ir[11:8];
    assign _922 = _920 == _921;
    assign _916 = seq_b_ir[11:8];
    assign _918 = _916 == _917;
    assign _912 = seq_b_ir[11:8];
    assign _914 = _912 == _913;
    assign _909 = seq_b_ir[11:8];
    assign _911 = _909 == _910;
    assign _915 = _911 | _914;
    assign _919 = _915 | _918;
    assign _923 = _919 | _922;
    assign _927 = _923 | _926;
    assign _1059 = _927 | _1058;
    assign _1063 = _1059 | _1062;
    assign _1067 = _1063 | _1066;
    assign _1071 = _1067 | _1070;
    assign _906 = seq_b_ir[15:12];
    assign _908 = _906 == _907;
    assign _1072 = _908 & _1071;
    assign _901 = seq_b_ir & _900;
    assign _903 = _901 == _902;
    assign _895 = seq_b_ir[11:8];
    assign _897 = _895 == _896;
    assign _891 = seq_b_ir[11:8];
    assign _893 = _891 == _892;
    assign _887 = seq_b_ir[11:8];
    assign _889 = _887 == _888;
    assign _883 = seq_b_ir[11:8];
    assign _885 = _883 == _884;
    assign _880 = seq_b_ir[11:8];
    assign _882 = _880 == _881;
    assign _886 = _882 | _885;
    assign _890 = _886 | _889;
    assign _894 = _890 | _893;
    assign _898 = _894 | _897;
    assign _877 = seq_b_ir[15:12];
    assign _879 = _877 == _878;
    assign _899 = _879 & _898;
    assign _904 = _899 & _903;
    assign _872 = seq_b_ir & _871;
    assign _874 = _872 == _873;
    assign _866 = seq_b_ir[7:6];
    assign _868 = _866 == _867;
    assign _862 = seq_b_ir[7:6];
    assign _864 = _862 == _863;
    assign _859 = seq_b_ir[7:6];
    assign _861 = _859 == _860;
    assign _865 = _861 | _864;
    assign _869 = _865 | _868;
    assign _854 = seq_b_ir[11:9];
    assign _856 = _854 == _855;
    assign _850 = seq_b_ir[11:9];
    assign _852 = _850 == _851;
    assign _846 = seq_b_ir[11:9];
    assign _848 = _846 == _847;
    assign _843 = seq_b_ir[11:9];
    assign _845 = _843 == _844;
    assign _849 = _845 | _848;
    assign _853 = _849 | _852;
    assign _857 = _853 | _856;
    assign _840 = seq_b_ir[15:12];
    assign _842 = _840 == _841;
    assign _858 = _842 & _857;
    assign _870 = _858 & _869;
    assign _875 = _870 & _874;
    assign _836 = seq_b_ir[15:12];
    assign _838 = _836 == _837;
    assign _830 = seq_b_ir[2:0];
    assign _832 = _830 == _831;
    assign _826 = seq_b_ir[2:0];
    assign _828 = _826 == _827;
    assign _822 = seq_b_ir[2:0];
    assign _824 = _822 == _823;
    assign _818 = seq_b_ir[2:0];
    assign _820 = _818 == _819;
    assign _814 = seq_b_ir[2:0];
    assign _816 = _814 == _815;
    assign _810 = seq_b_ir[2:0];
    assign _812 = _810 == _811;
    assign _806 = seq_b_ir[2:0];
    assign _808 = _806 == _807;
    assign _803 = seq_b_ir[2:0];
    assign _805 = _803 == _804;
    assign _809 = _805 | _808;
    assign _813 = _809 | _812;
    assign _817 = _813 | _816;
    assign _821 = _817 | _820;
    assign _825 = _821 | _824;
    assign _829 = _825 | _828;
    assign _833 = _829 | _832;
    assign _800 = seq_b_ir[15:12];
    assign _802 = _800 == _801;
    assign _834 = _802 & _833;
    assign _796 = seq_b_ir & _795;
    assign _798 = _796 == _797;
    assign _3593 = ctrl_bit3 ? _3592 : _3582;
    assign _3594 = _3593[4:0];
    always @* begin
        case (_3594)
        0: _3792 <= imem_32;
        1: _3792 <= imem_33;
        2: _3792 <= imem_34;
        3: _3792 <= imem_35;
        4: _3792 <= imem_36;
        5: _3792 <= imem_37;
        6: _3792 <= imem_38;
        7: _3792 <= imem_39;
        8: _3792 <= imem_40;
        9: _3792 <= imem_41;
        10: _3792 <= imem_42;
        11: _3792 <= imem_43;
        12: _3792 <= imem_44;
        13: _3792 <= imem_45;
        14: _3792 <= imem_46;
        15: _3792 <= imem_47;
        16: _3792 <= imem_48;
        17: _3792 <= imem_49;
        18: _3792 <= imem_50;
        19: _3792 <= imem_51;
        20: _3792 <= imem_52;
        21: _3792 <= imem_53;
        22: _3792 <= imem_54;
        23: _3792 <= imem_55;
        24: _3792 <= imem_56;
        25: _3792 <= imem_57;
        26: _3792 <= imem_58;
        27: _3792 <= imem_59;
        28: _3792 <= imem_60;
        29: _3792 <= imem_61;
        30: _3792 <= imem_62;
        default: _3792 <= imem_63;
        endcase
    end
    assign _76 = _3792;
    assign _4332 = _4166 ? _76 : seq_b_ir;
    assign _3464 = ~ _1117;
    assign _3590 = _3589[13:8];
    assign _3592 = _3590 | _3591;
    assign _3581 = seq_b_ir_pc + _3580;
    assign _3576 = pins_sync[7:7];
    assign _3575 = pins_sync[6:6];
    assign _3574 = pins_sync[5:5];
    assign _3573 = pins_sync[4:4];
    assign _3572 = pins_sync[3:3];
    assign _3571 = pins_sync[2:2];
    assign _3570 = pins_sync[1:1];
    assign _3569 = pins_sync[0:0];
    always @* begin
        case (_3260)
        0: _3577 <= _3569;
        1: _3577 <= _3570;
        2: _3577 <= _3571;
        3: _3577 <= _3572;
        4: _3577 <= _3573;
        5: _3577 <= _3574;
        6: _3577 <= _3575;
        default: _3577 <= _3576;
        endcase
    end
    assign _3566 = _1122 == _3565;
    assign _3567 = _1121 & _3566;
    assign _3568 = _3567 & seq_b_caught_up;
    assign _3578 = _3568 & _3577;
    assign _3793 = ~ _3430;
    assign _3794 = _3413 ? _3793 : seq_b_flag;
    assign _3795 = _3465 ? _3794 : seq_b_flag;
    assign _3796 = ctrl_bit3 ? gnd : _3795;
    assign _77 = _3796;
    always @(posedge _167) begin
        if (_180)
            seq_b_flag <= _3561;
        else
            seq_b_flag <= _77;
    end
    assign _3558 = _1122 == _3557;
    assign _3559 = _1121 & _3558;
    assign _3563 = _3559 & seq_b_flag;
    assign _3552 = seq_b_y == _3551;
    assign _3553 = ~ _3552;
    assign _3550 = _1122 == _3549;
    assign _3554 = _3550 & _3553;
    assign _3545 = seq_b_x == _3544;
    assign _3546 = ~ _3545;
    assign _3543 = _1122 == _3542;
    assign _3547 = _3543 & _3546;
    assign _3541 = _1122 == _3540;
    assign _3548 = _3541 | _3547;
    assign _3555 = _3548 | _3554;
    assign _3556 = _1121 & _3555;
    assign _3564 = _3556 | _3563;
    assign _3579 = _3564 | _3578;
    assign _3582 = _3579 ? _1126 : _3581;
    assign _3290 = _3239 == _3289;
    assign _3287 = _3239 == _3286;
    assign _3284 = _3239 == _3283;
    assign _3281 = _3239 == _3280;
    assign _3279 = _3239 == _3278;
    assign _3282 = _3279 | _3281;
    assign _3285 = _3282 | _3284;
    assign _3288 = _3285 | _3287;
    assign _3291 = _3288 | _3290;
    assign _3248 = seq_b_ir[5:5];
    assign _3277 = ~ _3248;
    assign _3292 = _3277 & _3291;
    assign _3274 = seq_b_stuff_run == _3273;
    assign _4150 = seq_b_stuff_run + _4149;
    assign _4147 = _3807 == seq_b_stuff_last;
    assign _4151 = _4147 ? _4150 : _4148;
    assign _4145 = seq_b_stuff_run + _4144;
    assign _3808 = _3806 ? _3807 : seq_b_stuff_last;
    assign _3809 = _1163 ? _3808 : seq_b_stuff_last;
    assign _3811 = _3802 ? _3810 : _3809;
    assign _3812 = _3465 ? _3811 : seq_b_stuff_last;
    assign _3814 = ctrl_bit3 ? _3813 : _3812;
    assign _78 = _3814;
    always @(posedge _167) begin
        if (_180)
            seq_b_stuff_last <= _3352;
        else
            seq_b_stuff_last <= _78;
    end
    assign _3354 = ~ seq_b_stuff_last;
    assign _3355 = _3267 & _3354;
    assign _4133 = _4090[14:0];
    assign _4135 = { _4133, _4134 };
    assign _4130 = _4090[13:0];
    assign _4132 = { _4130, _4131 };
    assign _4127 = _4090[12:0];
    assign _4129 = { _4127, _4128 };
    assign _4124 = _4090[11:0];
    assign _4126 = { _4124, _4125 };
    assign _4121 = _4090[10:0];
    assign _4123 = { _4121, _4122 };
    assign _4118 = _4090[9:0];
    assign _4120 = { _4118, _4119 };
    assign _4115 = _4090[8:0];
    assign _4117 = { _4115, _4116 };
    assign _4112 = _4090[7:0];
    assign _4114 = { _4112, _4113 };
    assign _4109 = _4090[6:0];
    assign _4111 = { _4109, _4110 };
    assign _4106 = _4090[5:0];
    assign _4108 = { _4106, _4107 };
    assign _4103 = _4090[4:0];
    assign _4105 = { _4103, _4104 };
    assign _4100 = _4090[3:0];
    assign _4102 = { _4100, _4101 };
    assign _4097 = _4090[2:0];
    assign _4099 = { _4097, _4098 };
    assign _4094 = _4090[1:0];
    assign _4096 = { _4094, _4095 };
    assign _3840 = _3838 ? _3839 : seq_b_crc_corrupt;
    assign _3828 = seq_b_ir[11:9];
    assign _3830 = _3828 == _3829;
    assign _3826 = _1118 == _3825;
    assign _3827 = _1115 & _3826;
    assign _3831 = _3827 & _3830;
    assign _3842 = _3831 ? _3841 : _3840;
    assign _3844 = _3824 ? _3843 : _3842;
    assign _3845 = _3465 ? _3844 : seq_b_crc_corrupt;
    assign _3847 = ctrl_bit3 ? _3846 : _3845;
    assign _79 = _3847;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc_corrupt <= _3816;
        else
            seq_b_crc_corrupt <= _79;
    end
    assign _4087 = { _4086, seq_b_crc_corrupt };
    assign _3851 = seq_b_osr[10:10];
    assign _3852 = _3838 ? _3851 : seq_b_crc_inv;
    assign _3853 = _3465 ? _3852 : seq_b_crc_inv;
    assign _3854 = ctrl_bit3 ? seq_b_crc_inv : _3853;
    assign _80 = _3854;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc_inv <= _3849;
        else
            seq_b_crc_inv <= _80;
    end
    assign _4085 = seq_b_crc_inv ? _3963 : _4084;
    assign _4088 = _4085 ^ _4087;
    assign _4017 = _3970 < _4016;
    assign _4018 = ~ _4017;
    assign _4014 = _3970 < _4013;
    assign _4015 = ~ _4014;
    assign _4011 = _3970 < _4010;
    assign _4012 = ~ _4011;
    assign _4008 = _3970 < _4007;
    assign _4009 = ~ _4008;
    assign _4005 = _3970 < _4004;
    assign _4006 = ~ _4005;
    assign _4002 = _3970 < _4001;
    assign _4003 = ~ _4002;
    assign _3999 = _3970 < _3998;
    assign _4000 = ~ _3999;
    assign _3996 = _3970 < _3995;
    assign _3997 = ~ _3996;
    assign _3993 = _3970 < _3992;
    assign _3994 = ~ _3993;
    assign _3990 = _3970 < _3989;
    assign _3991 = ~ _3990;
    assign _3987 = _3970 < _3986;
    assign _3988 = ~ _3987;
    assign _3984 = _3970 < _3983;
    assign _3985 = ~ _3984;
    assign _3981 = _3970 < _3980;
    assign _3982 = ~ _3981;
    assign _3978 = _3970 < _3977;
    assign _3979 = ~ _3978;
    assign _3975 = _3970 < _3974;
    assign _3976 = ~ _3975;
    assign _3970 = seq_b_osr[15:12];
    assign _3972 = _3970 < _3971;
    assign _3973 = ~ _3972;
    assign _4019 = { _3973, _3976, _3979, _3982, _3985, _3988, _3991, _3994, _3997, _4000, _4003, _4006, _4009, _4012, _4015, _4018 };
    assign _3968 = seq_b_osr[11:11];
    assign _4020 = _3968 ? _4019 : _3969;
    assign _3961 = seq_b_crc_width_m1 < _3960;
    assign _3962 = ~ _3961;
    assign _3958 = seq_b_crc_width_m1 < _3957;
    assign _3959 = ~ _3958;
    assign _3955 = seq_b_crc_width_m1 < _3954;
    assign _3956 = ~ _3955;
    assign _3952 = seq_b_crc_width_m1 < _3951;
    assign _3953 = ~ _3952;
    assign _3949 = seq_b_crc_width_m1 < _3948;
    assign _3950 = ~ _3949;
    assign _3946 = seq_b_crc_width_m1 < _3945;
    assign _3947 = ~ _3946;
    assign _3943 = seq_b_crc_width_m1 < _3942;
    assign _3944 = ~ _3943;
    assign _3940 = seq_b_crc_width_m1 < _3939;
    assign _3941 = ~ _3940;
    assign _3937 = seq_b_crc_width_m1 < _3936;
    assign _3938 = ~ _3937;
    assign _3934 = seq_b_crc_width_m1 < _3933;
    assign _3935 = ~ _3934;
    assign _3931 = seq_b_crc_width_m1 < _3930;
    assign _3932 = ~ _3931;
    assign _3928 = seq_b_crc_width_m1 < _3927;
    assign _3929 = ~ _3928;
    assign _3925 = seq_b_crc_width_m1 < _3924;
    assign _3926 = ~ _3925;
    assign _3922 = seq_b_crc_width_m1 < _3921;
    assign _3923 = ~ _3922;
    assign _3919 = seq_b_crc_width_m1 < _3918;
    assign _3920 = ~ _3919;
    assign _3916 = seq_b_crc_width_m1 < _3915;
    assign _3917 = ~ _3916;
    assign _3963 = { _3917, _3920, _3923, _3926, _3929, _3932, _3935, _3938, _3941, _3944, _3947, _3950, _3953, _3956, _3959, _3962 };
    assign _3858 = seq_b_osr[31:16];
    assign _3859 = _3838 ? _3858 : seq_b_crc_poly;
    assign _3860 = _3465 ? _3859 : seq_b_crc_poly;
    assign _3861 = ctrl_bit3 ? seq_b_crc_poly : _3860;
    assign _81 = _3861;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc_poly <= _3856;
        else
            seq_b_crc_poly <= _81;
    end
    assign _3909 = seq_b_crc[15:15];
    assign _3908 = seq_b_crc[14:14];
    assign _3907 = seq_b_crc[13:13];
    assign _3906 = seq_b_crc[12:12];
    assign _3905 = seq_b_crc[11:11];
    assign _3904 = seq_b_crc[10:10];
    assign _3903 = seq_b_crc[9:9];
    assign _3902 = seq_b_crc[8:8];
    assign _3901 = seq_b_crc[7:7];
    assign _3900 = seq_b_crc[6:6];
    assign _3899 = seq_b_crc[5:5];
    assign _3898 = seq_b_crc[4:4];
    assign _3897 = seq_b_crc[3:3];
    assign _3896 = seq_b_crc[2:2];
    assign _3895 = seq_b_crc[1:1];
    assign _3894 = seq_b_crc[0:0];
    always @* begin
        case (seq_b_crc_width_m1)
        0: _3910 <= _3894;
        1: _3910 <= _3895;
        2: _3910 <= _3896;
        3: _3910 <= _3897;
        4: _3910 <= _3898;
        5: _3910 <= _3899;
        6: _3910 <= _3900;
        7: _3910 <= _3901;
        8: _3910 <= _3902;
        9: _3910 <= _3903;
        10: _3910 <= _3904;
        11: _3910 <= _3905;
        12: _3910 <= _3906;
        13: _3910 <= _3907;
        14: _3910 <= _3908;
        default: _3910 <= _3909;
        endcase
    end
    assign _3911 = _3910 ^ _3319;
    assign _3913 = _3911 ? seq_b_crc_poly : _3912;
    assign _3888 = seq_b_crc[14:0];
    assign _3890 = { _3888, _3889 };
    assign _3914 = _3890 ^ _3913;
    assign _3964 = _3914 & _3963;
    assign _3873 = _3838 ? _3872 : seq_b_crc_feed;
    assign _3868 = seq_b_ir[11:9];
    assign _3870 = _3868 == _3869;
    assign _3866 = _1118 == _3865;
    assign _3867 = _1115 & _3866;
    assign _3871 = _3867 & _3870;
    assign _3875 = _3871 ? _3874 : _3873;
    assign _3877 = _3824 ? _3876 : _3875;
    assign _3878 = _3465 ? _3877 : seq_b_crc_feed;
    assign _3880 = ctrl_bit3 ? _3879 : _3878;
    assign _82 = _3880;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc_feed <= _3863;
        else
            seq_b_crc_feed <= _82;
    end
    assign _3965 = seq_b_crc_feed ? _3964 : seq_b_crc;
    assign _3966 = _3887 ? _3965 : seq_b_crc;
    assign _3967 = _1163 ? _3966 : seq_b_crc;
    assign _4021 = _3838 ? _4020 : _3967;
    assign _4022 = _3465 ? _4021 : seq_b_crc;
    assign _4023 = ctrl_bit3 ? seq_b_crc : _4022;
    assign _83 = _4023;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc <= _3882;
        else
            seq_b_crc <= _83;
    end
    assign _4089 = seq_b_crc ^ _4088;
    assign _4090 = _4089 & _3963;
    assign _4091 = _4090[0:0];
    assign _4093 = { _4091, _4092 };
    assign _4024 = seq_b_osr[15:12];
    assign _3835 = seq_b_ir[11:9];
    assign _3837 = _3835 == _3836;
    assign _3833 = _1118 == _3832;
    assign _3834 = _1115 & _3833;
    assign _3838 = _3834 & _3837;
    assign _4025 = _3838 ? _4024 : seq_b_crc_width_m1;
    assign _4026 = _3465 ? _4025 : seq_b_crc_width_m1;
    assign _4027 = ctrl_bit3 ? seq_b_crc_width_m1 : _4026;
    assign _84 = _4027;
    always @(posedge _167) begin
        if (_180)
            seq_b_crc_width_m1 <= _3892;
        else
            seq_b_crc_width_m1 <= _84;
    end
    always @* begin
        case (seq_b_crc_width_m1)
        0: _4136 <= _4093;
        1: _4136 <= _4096;
        2: _4136 <= _4099;
        3: _4136 <= _4102;
        4: _4136 <= _4105;
        5: _4136 <= _4108;
        6: _4136 <= _4111;
        7: _4136 <= _4114;
        8: _4136 <= _4117;
        9: _4136 <= _4120;
        10: _4136 <= _4123;
        11: _4136 <= _4126;
        12: _4136 <= _4129;
        13: _4136 <= _4132;
        14: _4136 <= _4135;
        default: _4136 <= _4090;
        endcase
    end
    assign _4138 = { _4136, _4137 };
    assign _4038 = _4036 == _4037;
    assign _4039 = _4033 & _4038;
    assign _4043 = _4039 ? spi_wdata : _4042;
    assign _85 = _4043;
    always @(posedge _167) begin
        if (_180)
            _4042 <= _4041;
        else
            _4042 <= _85;
    end
    assign _4045 = _4036 == _4044;
    assign _4046 = _4033 & _4045;
    assign _4050 = _4046 ? spi_wdata : _4049;
    assign _86 = _4050;
    always @(posedge _167) begin
        if (_180)
            _4049 <= _4048;
        else
            _4049 <= _86;
    end
    assign _4052 = _4036 == _4051;
    assign _4053 = _4033 & _4052;
    assign _4057 = _4053 ? spi_wdata : _4056;
    assign _87 = _4057;
    always @(posedge _167) begin
        if (_180)
            _4056 <= _4055;
        else
            _4056 <= _87;
    end
    assign _4059 = _4036 + _4058;
    assign _4060 = _4033 ? _4059 : _4036;
    assign _88 = _4060;
    always @(posedge _167) begin
        if (_180)
            _4036 <= _4035;
        else
            _4036 <= _88;
    end
    assign _4062 = _4036 == _4061;
    assign _4063 = _4033 & _4062;
    assign _4067 = _4063 ? spi_wdata : _4066;
    assign _89 = _4067;
    always @(posedge _167) begin
        if (_180)
            _4066 <= _4065;
        else
            _4066 <= _89;
    end
    assign _4075 = _4073 + _4074;
    assign _4076 = _4070 ? _4075 : _4073;
    assign _90 = _4076;
    always @(posedge _167) begin
        if (_180)
            _4073 <= _4072;
        else
            _4073 <= _90;
    end
    always @* begin
        case (_4073)
        0: _4082 <= _4066;
        1: _4082 <= _4056;
        2: _4082 <= _4049;
        default: _4082 <= _4042;
        endcase
    end
    assign _4077 = seq_b_osr[30:0];
    assign _4079 = { _4077, _4078 };
    assign _3886 = ~ _3293;
    assign _3885 = _3239 == _3884;
    assign _3887 = _3885 & _3886;
    assign _4080 = _3887 ? _4079 : seq_b_osr;
    assign _4081 = _1163 ? _4080 : seq_b_osr;
    assign _4083 = _3407 ? _4082 : _4081;
    assign _3821 = seq_b_ir[11:9];
    assign _3823 = _3821 == _3822;
    assign _3819 = _1118 == _3818;
    assign _3820 = _1115 & _3819;
    assign _3824 = _3820 & _3823;
    assign _4139 = _3824 ? _4138 : _4083;
    assign _4140 = _3465 ? _4139 : seq_b_osr;
    assign _4142 = ctrl_bit3 ? _4141 : _4140;
    assign _91 = _4142;
    always @(posedge _167) begin
        if (_180)
            seq_b_osr <= _3317;
        else
            seq_b_osr <= _91;
    end
    assign _3319 = seq_b_osr[31:31];
    assign _3807 = _3293 ? _3355 : _3319;
    assign _4146 = _3807 ? _4145 : _4143;
    assign _4152 = _3267 ? _4151 : _4146;
    assign _3239 = seq_b_ir[2:0];
    assign _3804 = _3239 == _3803;
    assign _3805 = _3293 | _3804;
    assign _3806 = _3266 & _3805;
    assign _4153 = _3806 ? _4152 : seq_b_stuff_run;
    assign _4154 = _1163 ? _4153 : seq_b_stuff_run;
    assign _4156 = _3802 ? _4155 : _4154;
    assign _4157 = _3465 ? _4156 : seq_b_stuff_run;
    assign _4159 = ctrl_bit3 ? _4158 : _4157;
    assign _92 = _4159;
    always @(posedge _167) begin
        if (_180)
            seq_b_stuff_run <= _3269;
        else
            seq_b_stuff_run <= _92;
    end
    assign _3272 = seq_b_stuff_run == _3271;
    assign _3267 = seq_b_coder[5:5];
    assign _3275 = _3267 ? _3274 : _3272;
    assign _4160 = _3494[5:0];
    assign _3801 = _3490 == _3800;
    assign _3798 = _1118 == _3797;
    assign _3799 = _1115 & _3798;
    assign _3802 = _3799 & _3801;
    assign _4161 = _3802 ? _4160 : seq_b_coder;
    assign _4162 = _3465 ? _4161 : seq_b_coder;
    assign _4164 = ctrl_bit3 ? _4163 : _4162;
    assign _93 = _4164;
    always @(posedge _167) begin
        if (_180)
            seq_b_coder <= _3264;
        else
            seq_b_coder <= _93;
    end
    assign _3266 = seq_b_coder[4:4];
    assign _3276 = _3266 & _3275;
    assign _3293 = _3276 & _3292;
    assign _4165 = _1163 & _3293;
    assign _4166 = ~ _4165;
    assign _4167 = _4166 ? _3582 : seq_b_ir_pc;
    assign _4168 = _3465 ? _4167 : seq_b_ir_pc;
    assign _4169 = ctrl_bit3 ? _3592 : _4168;
    assign _94 = _4169;
    always @(posedge _167) begin
        if (_180)
            seq_b_ir_pc <= _1128;
        else
            seq_b_ir_pc <= _94;
    end
    assign _1126 = seq_b_ir[5:0];
    assign _1130 = _1126 == seq_b_ir_pc;
    assign _1124 = _1122 == _1123;
    assign _1125 = _1121 & _1124;
    assign _1131 = _1125 & _1130;
    assign _3462 = ~ _1131;
    assign _3457 = ~ seq_b_caught_up;
    assign _3455 = _1122 == _3454;
    assign _3456 = _1121 & _3455;
    assign _3458 = _3456 & _3457;
    assign _4195 = seq_b_y[7:0];
    assign _4196 = { _3494, _4195 };
    assign _4193 = { _4192, _3494 };
    assign _4190 = seq_b_y - _4189;
    assign _4186 = seq_b_y == _4185;
    assign _4187 = ~ _4186;
    assign _4183 = _1122 == _4182;
    assign _4184 = _1121 & _4183;
    assign _4188 = _4184 & _4187;
    assign _4191 = _4188 ? _4190 : seq_b_y;
    assign _4180 = _3490 == _4179;
    assign _4177 = _1118 == _4176;
    assign _4178 = _1115 & _4177;
    assign _4181 = _4178 & _4180;
    assign _4194 = _4181 ? _4193 : _4191;
    assign _4174 = _3490 == _4173;
    assign _4171 = _1118 == _4170;
    assign _4172 = _1115 & _4171;
    assign _4175 = _4172 & _4174;
    assign _4197 = _4175 ? _4196 : _4194;
    assign _4198 = _3465 ? _4197 : seq_b_y;
    assign _4200 = ctrl_bit3 ? _4199 : _4198;
    assign _95 = _4200;
    always @(posedge _167) begin
        if (_180)
            seq_b_y <= _3443;
        else
            seq_b_y <= _95;
    end
    assign _4226 = seq_b_x[7:0];
    assign _4227 = { _3494, _4226 };
    assign _4224 = { _4223, _3494 };
    assign _4221 = seq_b_x - _4220;
    assign _4217 = seq_b_x == _4216;
    assign _4218 = ~ _4217;
    assign _1122 = seq_b_ir[11:8];
    assign _4214 = _1122 == _4213;
    assign _1120 = _1118 == _1119;
    assign _1121 = _1115 & _1120;
    assign _4215 = _1121 & _4214;
    assign _4219 = _4215 & _4218;
    assign _4222 = _4219 ? _4221 : seq_b_x;
    assign _4211 = _3490 == _4210;
    assign _4208 = _1118 == _4207;
    assign _4209 = _1115 & _4208;
    assign _4212 = _4209 & _4211;
    assign _4225 = _4212 ? _4224 : _4222;
    assign _4205 = _3490 == _4204;
    assign _4202 = _1118 == _4201;
    assign _4203 = _1115 & _4202;
    assign _4206 = _4203 & _4205;
    assign _4228 = _4206 ? _4227 : _4225;
    assign _4229 = _3465 ? _4228 : seq_b_x;
    assign _4231 = ctrl_bit3 ? _4230 : _4229;
    assign _96 = _4231;
    always @(posedge _167) begin
        if (_180)
            seq_b_x <= _3440;
        else
            seq_b_x <= _96;
    end
    always @* begin
        case (_3431)
        0: _3446 <= _3438;
        1: _3446 <= seq_b_x;
        2: _3446 <= seq_b_y;
        default: _3446 <= _3445;
        endcase
    end
    assign _4238 = seq_b_wait_count + _4237;
    assign _4234 = ~ _3450;
    assign _4232 = seq_b_running & _3413;
    assign _4233 = _4232 & seq_b_caught_up;
    assign _4235 = _4233 & _4234;
    assign _4239 = _4235 ? _4238 : _4236;
    assign _4241 = ctrl_bit3 ? _4240 : _4239;
    assign _97 = _4241;
    always @(posedge _167) begin
        if (_180)
            seq_b_wait_count <= _3436;
        else
            seq_b_wait_count <= _97;
    end
    assign _3447 = seq_b_wait_count == _3446;
    assign _3431 = seq_b_ir[7:6];
    assign _3433 = _3431 == _3432;
    assign _3434 = ~ _3433;
    assign _3448 = _3434 & _3447;
    assign _3429 = seq_b_ir[8:8];
    assign _3427 = pins_sync[7:7];
    assign _3426 = pins_sync[6:6];
    assign _3425 = pins_sync[5:5];
    assign _3424 = pins_sync[4:4];
    assign _3423 = pins_sync[3:3];
    assign _3422 = pins_sync[2:2];
    assign _3421 = pins_sync[1:1];
    assign _3420 = pins_sync[0:0];
    assign _3259 = _3255[11:9];
    assign _3257 = _3255[5:3];
    assign _3256 = _3255[2:0];
    assign _3253 = _213 == _3252;
    assign _3254 = spi_wr & _3253;
    assign _3249 = spi_wdata[11:0];
    always @(posedge _167) begin
        if (_180)
            _3255 <= _3251;
        else
            if (_3254)
                _3255 <= _3249;
    end
    assign _3260 = _3255[8:6];
    assign _3417 = seq_b_ir[11:9];
    assign _3418 = _3417[1:0];
    always @* begin
        case (_3418)
        0: _3419 <= _3260;
        1: _3419 <= _3256;
        2: _3419 <= _3257;
        default: _3419 <= _3259;
        endcase
    end
    always @* begin
        case (_3419)
        0: _3428 <= _3420;
        1: _3428 <= _3421;
        2: _3428 <= _3422;
        3: _3428 <= _3423;
        4: _3428 <= _3424;
        5: _3428 <= _3425;
        6: _3428 <= _3426;
        default: _3428 <= _3427;
        endcase
    end
    assign _3430 = _3428 == _3429;
    assign _3449 = _3430 | _3448;
    assign _4294 = _4291 == _4293;
    assign _4290 = timebase + _4289;
    assign _4291 = _4288 - _4290;
    assign _4292 = _4291[23:23];
    assign _4295 = _4292 | _4294;
    assign _4273 = _4270 == _4272;
    assign _4269 = timebase + _4268;
    assign _4270 = _4267 - _4269;
    assign _4271 = _4270[23:23];
    assign _4274 = _4271 | _4273;
    assign _4296 = _4242 ? _4295 : _4274;
    assign _4297 = _4244 ? _4296 : vdd;
    assign _4252 = _4249 == _4251;
    assign _4248 = timebase + _4247;
    assign _4249 = seq_b_sched_s - _4248;
    assign _4250 = _4249[23:23];
    assign _4253 = _4250 | _4252;
    assign _4245 = _3465 & _3413;
    assign _4243 = _3465 & _3390;
    assign _4242 = _3465 & _1163;
    assign _4244 = _4242 | _4243;
    assign _4246 = _4244 | _4245;
    assign _4298 = _4246 ? _4297 : _4253;
    assign _4299 = ctrl_bit3 ? gnd : _4298;
    assign _98 = _4299;
    always @(posedge _167) begin
        if (_180)
            seq_b_caught_up <= _3415;
        else
            seq_b_caught_up <= _98;
    end
    assign _3450 = seq_b_caught_up & _3449;
    assign _3451 = ~ _3450;
    assign _3452 = _3413 & _3451;
    assign _4069 = _4068 < _3405;
    assign _99 = _3407;
    assign _4070 = _99 & _4069;
    assign _4304 = { _4303, _4070 };
    assign _4032 = _3405 < _4031;
    assign _4029 = _213 == _4028;
    assign _4030 = spi_wr & _4029;
    assign _4033 = _4030 & _4032;
    assign _4301 = { _4300, _4033 };
    assign _4302 = _3405 + _4301;
    assign _4305 = _4302 - _4304;
    assign _100 = _4305;
    always @(posedge _167) begin
        if (_180)
            _3405 <= _3404;
        else
            _3405 <= _100;
    end
    assign _3406 = _3402 < _3405;
    assign _3401 = seq_b_running & _3400;
    assign _3407 = _3401 & _3406;
    assign _3408 = ~ _3407;
    assign _3397 = seq_b_ir[11:11];
    assign _3399 = _3397 == _3398;
    assign _3395 = _1118 == _3394;
    assign _3396 = _1115 & _3395;
    assign _3400 = _3396 & _3399;
    assign _3409 = _3400 & _3408;
    assign _4328 = _4324[21:21];
    assign _4327 = _4324[22:22];
    assign _4329 = _4327 | _4328;
    assign _4322 = timebase + _4321;
    assign _4263 = _4256[17:0];
    assign _4265 = { _4263, _4264 };
    assign _4260 = _4256[19:0];
    assign _4262 = { _4260, _4261 };
    assign _4257 = _4256[21:0];
    assign _4259 = { _4257, _4258 };
    assign _4255 = seq_b_ir[11:0];
    assign _4256 = { _4254, _4255 };
    always @* begin
        case (seq_b_prescale)
        0: _4266 <= _4256;
        1: _4266 <= _4259;
        2: _4266 <= _4262;
        default: _4266 <= _4265;
        endcase
    end
    assign _4267 = seq_b_sched_s + _4266;
    assign _4284 = _4277[17:0];
    assign _4286 = { _4284, _4285 };
    assign _4281 = _4277[19:0];
    assign _4283 = { _4281, _4282 };
    assign _4278 = _4277[21:0];
    assign _4280 = { _4278, _4279 };
    assign _4276 = seq_b_ir[11:6];
    assign _4277 = { _4275, _4276 };
    assign _3494 = seq_b_ir[7:0];
    assign _4312 = _3494[1:0];
    assign _3490 = seq_b_ir[11:8];
    assign _4310 = _3490 == _4309;
    assign _4307 = _1118 == _4306;
    assign _4308 = _1115 & _4307;
    assign _4311 = _4308 & _4310;
    assign _4313 = _4311 ? _4312 : seq_b_prescale;
    assign _4314 = _3465 ? _4313 : seq_b_prescale;
    assign _4316 = ctrl_bit3 ? _4315 : _4314;
    assign _101 = _4316;
    always @(posedge _167) begin
        if (_180)
            seq_b_prescale <= _1174;
        else
            seq_b_prescale <= _101;
    end
    always @* begin
        case (seq_b_prescale)
        0: _4287 <= _4277;
        1: _4287 <= _4280;
        2: _4287 <= _4283;
        default: _4287 <= _4286;
        endcase
    end
    assign _4288 = seq_b_sched_s + _4287;
    assign _4317 = _1163 ? _4288 : seq_b_sched_s;
    assign _4318 = _3390 ? _4267 : _4317;
    assign _3412 = _1118 == _3411;
    assign _3413 = _1115 & _3412;
    assign _4319 = _3413 ? timebase : _4318;
    assign _4320 = _3465 ? _4319 : seq_b_sched_s;
    assign _4323 = ctrl_bit3 ? _4322 : _4320;
    assign _102 = _4323;
    always @(posedge _167) begin
        if (_180)
            seq_b_sched_s <= _1171;
        else
            seq_b_sched_s <= _102;
    end
    assign _4324 = seq_b_sched_s - timebase;
    assign _4325 = _4324[23:23];
    assign _4326 = ~ _4325;
    assign _4330 = _4326 & _4329;
    assign _4331 = ctrl_bit3 ? gnd : _4330;
    assign _103 = _4331;
    always @(posedge _167) begin
        if (_180)
            seq_b_far <= _1160;
        else
            seq_b_far <= _103;
    end
    assign _3389 = ~ seq_b_far;
    assign _3386 = _1118 == _3385;
    assign _3387 = _1115 & _3386;
    assign _3388 = seq_b_running & _3387;
    assign _3390 = _3388 & _3389;
    assign _3391 = ~ _3390;
    assign _3383 = _1118 == _3382;
    assign _3384 = _1115 & _3383;
    assign _3392 = _3384 & _3391;
    assign _3380 = ~ _1163;
    assign _1118 = seq_b_ir[15:12];
    assign _3378 = _1118 == _3377;
    assign _3379 = _1115 & _3378;
    assign _3381 = _3379 & _3380;
    assign _3393 = _3381 | _3392;
    assign _3410 = _3393 | _3409;
    assign _3453 = _3410 | _3452;
    assign _3459 = _3453 | _3458;
    assign _3460 = ~ _3459;
    assign _3461 = seq_b_running & _3460;
    assign _3463 = _3461 & _3462;
    assign _3465 = _3463 & _3464;
    assign _4333 = _3465 ? _4332 : seq_b_ir;
    assign _4334 = ctrl_bit3 ? _76 : _4333;
    assign _104 = _4334;
    always @(posedge _167) begin
        if (_180)
            seq_b_ir <= _790;
        else
            seq_b_ir <= _104;
    end
    assign _792 = seq_b_ir[15:12];
    assign _794 = _792 == _793;
    assign _799 = _794 & _798;
    assign _835 = _799 | _834;
    assign _839 = _835 | _838;
    assign _876 = _839 | _875;
    assign _905 = _876 | _904;
    assign _1073 = _905 | _1072;
    assign _1098 = _1073 | _1097;
    assign _1115 = _1098 | _1114;
    assign _1116 = ~ _1115;
    assign _1117 = seq_b_running & _1116;
    assign _4336 = _1117 ? gnd : _4335;
    assign _4337 = ctrl_bit3 ? vdd : _4336;
    assign _105 = _4337;
    always @(posedge _167) begin
        if (_180)
            seq_b_running <= _787;
        else
            seq_b_running <= _105;
    end
    assign _1157 = seq_b_running & _1156;
    assign _1158 = _1157 & _75;
    assign _1163 = _1158 & _1162;
    assign _1166 = _1163 & _1165;
    assign _4339 = { _4338, _1166 };
    assign _4340 = queue_b_count + _4339;
    assign _4341 = _4340 - _3537;
    assign _106 = _4341;
    always @(posedge _167) begin
        if (_301)
            queue_b_count <= _302;
        else
            queue_b_count <= _106;
    end
    assign _304 = _294 < queue_b_count;
    assign _329 = _304 & _328;
    assign _5438 = _329 & _5437;
    assign _287 = _244[1:0];
    assign _5432 = _287 == _5431;
    assign _5433 = ~ _5432;
    assign _251 = _244[28:5];
    assign _252 = _251 - timebase;
    assign _254 = _252 == _253;
    always @* begin
        case (queue_a_read_ptr)
        0: _244 <= queue_a_entry0;
        1: _244 <= queue_a_entry1;
        2: _244 <= queue_a_entry2;
        default: _244 <= queue_a_entry3;
        endcase
    end
    assign _245 = _244[28:5];
    assign _249 = _245 - timebase;
    assign _250 = _249[23:23];
    assign _255 = _250 | _254;
    assign _266 = _262[28:5];
    assign _267 = _266 - timebase;
    assign _269 = _267 == _268;
    assign _4346 = queue_a_write_ptr == _4345;
    assign _4475 = _4346 ? _4474 : queue_a_entry3;
    assign _4476 = _2530 ? _4475 : queue_a_entry3;
    assign _107 = _4476;
    always @(posedge _167) begin
        if (_225)
            queue_a_entry3 <= _242;
        else
            queue_a_entry3 <= _107;
    end
    assign _4478 = queue_a_write_ptr == _4477;
    assign _4479 = _4478 ? _4474 : queue_a_entry2;
    assign _4480 = _2530 ? _4479 : queue_a_entry2;
    assign _108 = _4480;
    always @(posedge _167) begin
        if (_225)
            queue_a_entry2 <= _239;
        else
            queue_a_entry2 <= _108;
    end
    assign _4482 = queue_a_write_ptr == _4481;
    assign _4483 = _4482 ? _4474 : queue_a_entry1;
    assign _4484 = _2530 ? _4483 : queue_a_entry1;
    assign _109 = _4484;
    always @(posedge _167) begin
        if (_225)
            queue_a_entry1 <= _236;
        else
            queue_a_entry1 <= _109;
    end
    assign _4468 = _4436 == _4467;
    assign _4469 = ~ _4468;
    assign _4466 = _4436 == _4465;
    assign _4470 = _4463 ? _4469 : _4466;
    assign _4464 = _4463 ^ _4428;
    assign _4471 = _4423 ? _4470 : _4464;
    assign _4472 = _4471 ? _4447 : _4419;
    assign _4455 = _4403 ? _4454 : _4453;
    assign _4450 = _4436 == _4449;
    assign _4451 = _4450 ? _4447 : _4419;
    assign _4444 = seq_a_coder[3:3];
    assign _4447 = _4444 ? _4446 : _4445;
    assign _4440 = _4436 == _4439;
    assign _4441 = ~ _4440;
    assign _4583 = _4356 ? _4473 : seq_a_shadow_clk;
    assign _4584 = _4582 ? _4583 : seq_a_shadow_clk;
    assign _4585 = _2527 ? _4584 : seq_a_shadow_clk;
    assign _4586 = _4573 ? _4585 : seq_a_shadow_clk;
    assign _4588 = ctrl_bit0 ? _4587 : _4586;
    assign _110 = _4588;
    always @(posedge _167) begin
        if (_180)
            seq_a_shadow_clk <= _4434;
        else
            seq_a_shadow_clk <= _110;
    end
    assign _4589 = _4356 ? seq_a_shadow_data : _4473;
    assign _4580 = _4347 == _4579;
    assign _4577 = _4347 == _4576;
    assign _4575 = _4347 == _4574;
    assign _4578 = _4575 | _4577;
    assign _4581 = _4578 | _4580;
    assign _4582 = ~ _4581;
    assign _4590 = _4582 ? _4589 : seq_a_shadow_data;
    assign _4591 = _2527 ? _4590 : seq_a_shadow_data;
    assign _4592 = _4573 ? _4591 : seq_a_shadow_data;
    assign _4594 = ctrl_bit0 ? _4593 : _4592;
    assign _111 = _4594;
    always @(posedge _167) begin
        if (_180)
            seq_a_shadow_data <= _4431;
        else
            seq_a_shadow_data <= _111;
    end
    assign _4436 = _4356 ? seq_a_shadow_clk : seq_a_shadow_data;
    assign _4438 = _4436 == _4437;
    assign _4442 = _4427 ? _4441 : _4438;
    assign _4428 = seq_a_coder[2:2];
    assign _4429 = _4427 ^ _4428;
    assign _4423 = seq_a_coder[0:0];
    assign _4443 = _4423 ? _4442 : _4429;
    assign _4448 = _4443 ? _4447 : _4419;
    assign _4452 = _4408 ? _4451 : _4448;
    assign _4456 = _4406 ? _4455 : _4452;
    assign _4422 = _4414 ? _4421 : _4420;
    assign _4457 = _4412 ? _4456 : _4422;
    assign _4416 = _4347 == _4415;
    assign _4414 = _4347 == _4413;
    assign _4417 = _4414 | _4416;
    assign _4410 = _4347 == _4409;
    assign _4408 = _4347 == _4407;
    assign _4411 = _4408 | _4410;
    assign _4405 = _4347 == _4404;
    assign _4403 = _4347 == _4402;
    assign _4406 = _4403 | _4405;
    assign _4412 = _4406 | _4411;
    assign _4418 = _4412 | _4417;
    assign _4458 = _4418 ? _4457 : _4419;
    assign _4473 = _4401 ? _4472 : _4458;
    assign _4369 = _4349 ? _4368 : _4367;
    assign _4366 = _4356 ? _4365 : _4364;
    assign _4353 = _4347 == _4352;
    assign _4351 = _4347 == _4350;
    assign _4354 = _4351 | _4353;
    assign _4349 = _4347 == _4348;
    assign _4355 = _4349 | _4354;
    assign _4370 = _4355 ? _4369 : _4366;
    assign _2572 = _2565[17:0];
    assign _2574 = { _2572, _2573 };
    assign _2569 = _2565[19:0];
    assign _2571 = { _2569, _2570 };
    assign _2566 = _2565[21:0];
    assign _2568 = { _2566, _2567 };
    assign _2563 = { _2561, _2560 };
    assign _3504 = _3503[23:16];
    assign _4600 = _4598 == _4599;
    assign _4596 = _2483 == _4595;
    assign _4597 = _2480 & _4596;
    assign _4601 = _4597 & _4600;
    assign _4603 = _4601 ? _4602 : seq_a_k3;
    assign _4604 = _4573 ? _4603 : seq_a_k3;
    assign _4605 = ctrl_bit0 ? _3504 : _4604;
    assign _112 = _4605;
    always @(posedge _167) begin
        if (_180)
            seq_a_k3 <= _2552;
        else
            seq_a_k3 <= _112;
    end
    assign _3514 = _3503[15:8];
    assign _4610 = _4598 == _4609;
    assign _4607 = _2483 == _4606;
    assign _4608 = _2480 & _4607;
    assign _4611 = _4608 & _4610;
    assign _4612 = _4611 ? _4602 : seq_a_k2;
    assign _4613 = _4573 ? _4612 : seq_a_k2;
    assign _4614 = ctrl_bit0 ? _3514 : _4613;
    assign _113 = _4614;
    always @(posedge _167) begin
        if (_180)
            seq_a_k2 <= _2549;
        else
            seq_a_k2 <= _113;
    end
    assign _3524 = _3503[7:0];
    assign _4619 = _4598 == _4618;
    assign _4616 = _2483 == _4615;
    assign _4617 = _2480 & _4616;
    assign _4620 = _4617 & _4619;
    assign _4621 = _4620 ? _4602 : seq_a_k1;
    assign _4622 = _4573 ? _4621 : seq_a_k1;
    assign _4623 = ctrl_bit0 ? _3524 : _4622;
    assign _114 = _4623;
    always @(posedge _167) begin
        if (_180)
            seq_a_k1 <= _2546;
        else
            seq_a_k1 <= _114;
    end
    assign _2543 = seq_a_ir[4:3];
    always @* begin
        case (_2543)
        0: _2554 <= _2544;
        1: _2554 <= seq_a_k1;
        2: _2554 <= seq_a_k2;
        default: _2554 <= seq_a_k3;
        endcase
    end
    assign _2555 = _2554[7:7];
    assign _2556 = { _2555, _2555 };
    assign _2557 = { _2556, _2554 };
    assign _2541 = seq_a_ir[11:6];
    assign _2542 = { _2540, _2541 };
    assign _2558 = _2542 + _2557;
    assign _2559 = _2558[9:9];
    assign _2560 = { _2559, _2559 };
    assign _2561 = { _2560, _2560 };
    assign _2562 = { _2561, _2561 };
    assign _2564 = { _2562, _2563 };
    assign _2565 = { _2564, _2558 };
    always @* begin
        case (seq_a_prescale)
        0: _2575 <= _2565;
        1: _2575 <= _2568;
        2: _2575 <= _2571;
        default: _2575 <= _2574;
        endcase
    end
    assign _2576 = seq_a_sched_s + _2575;
    assign _4474 = { _2576, _4370, _4473 };
    assign _4625 = queue_a_write_ptr + _4624;
    assign _4626 = _2530 ? _4625 : queue_a_write_ptr;
    assign _115 = _4626;
    always @(posedge _167) begin
        if (_225)
            queue_a_write_ptr <= _4343;
        else
            queue_a_write_ptr <= _115;
    end
    assign _4628 = queue_a_write_ptr == _4627;
    assign _4629 = _4628 ? _4474 : queue_a_entry0;
    assign _4630 = _2530 ? _4629 : queue_a_entry0;
    assign _116 = _4630;
    always @(posedge _167) begin
        if (_225)
            queue_a_entry0 <= _233;
        else
            queue_a_entry0 <= _116;
    end
    assign _225 = _180 | ctrl_bit0;
    assign _4636 = _4635[1:0];
    assign _4637 = queue_a_read_ptr + _4636;
    assign _117 = _4637;
    always @(posedge _167) begin
        if (_225)
            queue_a_read_ptr <= _230;
        else
            queue_a_read_ptr <= _117;
    end
    assign _261 = queue_a_read_ptr + _260;
    always @* begin
        case (_261)
        0: _262 <= queue_a_entry0;
        1: _262 <= queue_a_entry1;
        2: _262 <= queue_a_entry2;
        default: _262 <= queue_a_entry3;
        endcase
    end
    assign _263 = _262[28:5];
    assign _264 = _263 - timebase;
    assign _265 = _264[23:23];
    assign _270 = _265 | _269;
    assign _258 = _257 < queue_a_count;
    assign _259 = _256 & _258;
    assign _271 = _259 & _270;
    assign _4634 = { _4633, _271 };
    assign _4632 = { _4631, _256 };
    assign _4635 = _4632 + _4634;
    assign _2526 = ~ seq_a_far;
    assign _2529 = queue_a_count < _2528;
    assign _118 = _2529;
    assign _2519 = _2483 == _2518;
    assign _2520 = _2480 & _2519;
    assign _2497 = seq_a_running & _2496;
    assign _5420 = _2497 ? gnd : seq_a_running;
    assign _2476 = seq_a_ir & _2475;
    assign _2478 = _2476 == _2477;
    assign _2471 = seq_a_ir[10:10];
    assign _2473 = _2471 == _2472;
    assign _2467 = seq_a_ir[11:11];
    assign _2469 = _2467 == _2468;
    assign _2464 = seq_a_ir[15:12];
    assign _2466 = _2464 == _2465;
    assign _2470 = _2466 & _2469;
    assign _2474 = _2470 & _2473;
    assign _2479 = _2474 & _2478;
    assign _2459 = seq_a_ir & _2458;
    assign _2461 = _2459 == _2460;
    assign _2453 = seq_a_ir[11:9];
    assign _2455 = _2453 == _2454;
    assign _2449 = seq_a_ir[11:9];
    assign _2451 = _2449 == _2450;
    assign _2445 = seq_a_ir[11:9];
    assign _2447 = _2445 == _2446;
    assign _2442 = seq_a_ir[11:9];
    assign _2444 = _2442 == _2443;
    assign _2448 = _2444 | _2447;
    assign _2452 = _2448 | _2451;
    assign _2456 = _2452 | _2455;
    assign _2439 = seq_a_ir[15:12];
    assign _2441 = _2439 == _2440;
    assign _2457 = _2441 & _2456;
    assign _2462 = _2457 & _2461;
    assign _2433 = seq_a_ir[11:8];
    assign _2435 = _2433 == _2434;
    assign _2429 = seq_a_ir[11:8];
    assign _2431 = _2429 == _2430;
    assign _2425 = seq_a_ir[11:8];
    assign _2427 = _2425 == _2426;
    assign _2419 = seq_a_ir[7:0];
    assign _2421 = _2419 == _2420;
    assign _2415 = seq_a_ir[7:0];
    assign _2417 = _2415 == _2416;
    assign _2411 = seq_a_ir[7:0];
    assign _2413 = _2411 == _2412;
    assign _2407 = seq_a_ir[7:0];
    assign _2409 = _2407 == _2408;
    assign _2403 = seq_a_ir[7:0];
    assign _2405 = _2403 == _2404;
    assign _2399 = seq_a_ir[7:0];
    assign _2401 = _2399 == _2400;
    assign _2395 = seq_a_ir[7:0];
    assign _2397 = _2395 == _2396;
    assign _2391 = seq_a_ir[7:0];
    assign _2393 = _2391 == _2392;
    assign _2387 = seq_a_ir[7:0];
    assign _2389 = _2387 == _2388;
    assign _2383 = seq_a_ir[7:0];
    assign _2385 = _2383 == _2384;
    assign _2379 = seq_a_ir[7:0];
    assign _2381 = _2379 == _2380;
    assign _2375 = seq_a_ir[7:0];
    assign _2377 = _2375 == _2376;
    assign _2371 = seq_a_ir[7:0];
    assign _2373 = _2371 == _2372;
    assign _2367 = seq_a_ir[7:0];
    assign _2369 = _2367 == _2368;
    assign _2363 = seq_a_ir[7:0];
    assign _2365 = _2363 == _2364;
    assign _2359 = seq_a_ir[7:0];
    assign _2361 = _2359 == _2360;
    assign _2355 = seq_a_ir[7:0];
    assign _2357 = _2355 == _2356;
    assign _2351 = seq_a_ir[7:0];
    assign _2353 = _2351 == _2352;
    assign _2347 = seq_a_ir[7:0];
    assign _2349 = _2347 == _2348;
    assign _2343 = seq_a_ir[7:0];
    assign _2345 = _2343 == _2344;
    assign _2339 = seq_a_ir[7:0];
    assign _2341 = _2339 == _2340;
    assign _2335 = seq_a_ir[7:0];
    assign _2337 = _2335 == _2336;
    assign _2331 = seq_a_ir[7:0];
    assign _2333 = _2331 == _2332;
    assign _2327 = seq_a_ir[7:0];
    assign _2329 = _2327 == _2328;
    assign _2323 = seq_a_ir[7:0];
    assign _2325 = _2323 == _2324;
    assign _2319 = seq_a_ir[7:0];
    assign _2321 = _2319 == _2320;
    assign _2315 = seq_a_ir[7:0];
    assign _2317 = _2315 == _2316;
    assign _2311 = seq_a_ir[7:0];
    assign _2313 = _2311 == _2312;
    assign _2307 = seq_a_ir[7:0];
    assign _2309 = _2307 == _2308;
    assign _2303 = seq_a_ir[7:0];
    assign _2305 = _2303 == _2304;
    assign _2299 = seq_a_ir[7:0];
    assign _2301 = _2299 == _2300;
    assign _2296 = seq_a_ir[7:0];
    assign _2298 = _2296 == _2297;
    assign _2302 = _2298 | _2301;
    assign _2306 = _2302 | _2305;
    assign _2310 = _2306 | _2309;
    assign _2314 = _2310 | _2313;
    assign _2318 = _2314 | _2317;
    assign _2322 = _2318 | _2321;
    assign _2326 = _2322 | _2325;
    assign _2330 = _2326 | _2329;
    assign _2334 = _2330 | _2333;
    assign _2338 = _2334 | _2337;
    assign _2342 = _2338 | _2341;
    assign _2346 = _2342 | _2345;
    assign _2350 = _2346 | _2349;
    assign _2354 = _2350 | _2353;
    assign _2358 = _2354 | _2357;
    assign _2362 = _2358 | _2361;
    assign _2366 = _2362 | _2365;
    assign _2370 = _2366 | _2369;
    assign _2374 = _2370 | _2373;
    assign _2378 = _2374 | _2377;
    assign _2382 = _2378 | _2381;
    assign _2386 = _2382 | _2385;
    assign _2390 = _2386 | _2389;
    assign _2394 = _2390 | _2393;
    assign _2398 = _2394 | _2397;
    assign _2402 = _2398 | _2401;
    assign _2406 = _2402 | _2405;
    assign _2410 = _2406 | _2409;
    assign _2414 = _2410 | _2413;
    assign _2418 = _2414 | _2417;
    assign _2422 = _2418 | _2421;
    assign _2293 = seq_a_ir[11:8];
    assign _2295 = _2293 == _2294;
    assign _2423 = _2295 & _2422;
    assign _2289 = seq_a_ir[11:8];
    assign _2291 = _2289 == _2290;
    assign _2285 = seq_a_ir[11:8];
    assign _2287 = _2285 == _2286;
    assign _2281 = seq_a_ir[11:8];
    assign _2283 = _2281 == _2282;
    assign _2277 = seq_a_ir[11:8];
    assign _2279 = _2277 == _2278;
    assign _2274 = seq_a_ir[11:8];
    assign _2276 = _2274 == _2275;
    assign _2280 = _2276 | _2279;
    assign _2284 = _2280 | _2283;
    assign _2288 = _2284 | _2287;
    assign _2292 = _2288 | _2291;
    assign _2424 = _2292 | _2423;
    assign _2428 = _2424 | _2427;
    assign _2432 = _2428 | _2431;
    assign _2436 = _2432 | _2435;
    assign _2271 = seq_a_ir[15:12];
    assign _2273 = _2271 == _2272;
    assign _2437 = _2273 & _2436;
    assign _2266 = seq_a_ir & _2265;
    assign _2268 = _2266 == _2267;
    assign _2260 = seq_a_ir[11:8];
    assign _2262 = _2260 == _2261;
    assign _2256 = seq_a_ir[11:8];
    assign _2258 = _2256 == _2257;
    assign _2252 = seq_a_ir[11:8];
    assign _2254 = _2252 == _2253;
    assign _2248 = seq_a_ir[11:8];
    assign _2250 = _2248 == _2249;
    assign _2245 = seq_a_ir[11:8];
    assign _2247 = _2245 == _2246;
    assign _2251 = _2247 | _2250;
    assign _2255 = _2251 | _2254;
    assign _2259 = _2255 | _2258;
    assign _2263 = _2259 | _2262;
    assign _2242 = seq_a_ir[15:12];
    assign _2244 = _2242 == _2243;
    assign _2264 = _2244 & _2263;
    assign _2269 = _2264 & _2268;
    assign _2237 = seq_a_ir & _2236;
    assign _2239 = _2237 == _2238;
    assign _2231 = seq_a_ir[7:6];
    assign _2233 = _2231 == _2232;
    assign _2227 = seq_a_ir[7:6];
    assign _2229 = _2227 == _2228;
    assign _2224 = seq_a_ir[7:6];
    assign _2226 = _2224 == _2225;
    assign _2230 = _2226 | _2229;
    assign _2234 = _2230 | _2233;
    assign _2219 = seq_a_ir[11:9];
    assign _2221 = _2219 == _2220;
    assign _2215 = seq_a_ir[11:9];
    assign _2217 = _2215 == _2216;
    assign _2211 = seq_a_ir[11:9];
    assign _2213 = _2211 == _2212;
    assign _2208 = seq_a_ir[11:9];
    assign _2210 = _2208 == _2209;
    assign _2214 = _2210 | _2213;
    assign _2218 = _2214 | _2217;
    assign _2222 = _2218 | _2221;
    assign _2205 = seq_a_ir[15:12];
    assign _2207 = _2205 == _2206;
    assign _2223 = _2207 & _2222;
    assign _2235 = _2223 & _2234;
    assign _2240 = _2235 & _2239;
    assign _2201 = seq_a_ir[15:12];
    assign _2203 = _2201 == _2202;
    assign _2195 = seq_a_ir[2:0];
    assign _2197 = _2195 == _2196;
    assign _2191 = seq_a_ir[2:0];
    assign _2193 = _2191 == _2192;
    assign _2187 = seq_a_ir[2:0];
    assign _2189 = _2187 == _2188;
    assign _2183 = seq_a_ir[2:0];
    assign _2185 = _2183 == _2184;
    assign _2179 = seq_a_ir[2:0];
    assign _2181 = _2179 == _2180;
    assign _2175 = seq_a_ir[2:0];
    assign _2177 = _2175 == _2176;
    assign _2171 = seq_a_ir[2:0];
    assign _2173 = _2171 == _2172;
    assign _2168 = seq_a_ir[2:0];
    assign _2170 = _2168 == _2169;
    assign _2174 = _2170 | _2173;
    assign _2178 = _2174 | _2177;
    assign _2182 = _2178 | _2181;
    assign _2186 = _2182 | _2185;
    assign _2190 = _2186 | _2189;
    assign _2194 = _2190 | _2193;
    assign _2198 = _2194 | _2197;
    assign _2165 = seq_a_ir[15:12];
    assign _2167 = _2165 == _2166;
    assign _2199 = _2167 & _2198;
    assign _2161 = seq_a_ir & _2160;
    assign _2163 = _2161 == _2162;
    assign _3789 = _3601 == _3788;
    assign _3790 = _3600 & _3789;
    always @(posedge _167) begin
        if (_3790)
            imem_63 <= _3595;
    end
    assign _3783 = _3601 == _3782;
    assign _3784 = _3600 & _3783;
    always @(posedge _167) begin
        if (_3784)
            imem_62 <= _3595;
    end
    assign _3777 = _3601 == _3776;
    assign _3778 = _3600 & _3777;
    always @(posedge _167) begin
        if (_3778)
            imem_61 <= _3595;
    end
    assign _3771 = _3601 == _3770;
    assign _3772 = _3600 & _3771;
    always @(posedge _167) begin
        if (_3772)
            imem_60 <= _3595;
    end
    assign _3765 = _3601 == _3764;
    assign _3766 = _3600 & _3765;
    always @(posedge _167) begin
        if (_3766)
            imem_59 <= _3595;
    end
    assign _3759 = _3601 == _3758;
    assign _3760 = _3600 & _3759;
    always @(posedge _167) begin
        if (_3760)
            imem_58 <= _3595;
    end
    assign _3753 = _3601 == _3752;
    assign _3754 = _3600 & _3753;
    always @(posedge _167) begin
        if (_3754)
            imem_57 <= _3595;
    end
    assign _3747 = _3601 == _3746;
    assign _3748 = _3600 & _3747;
    always @(posedge _167) begin
        if (_3748)
            imem_56 <= _3595;
    end
    assign _3741 = _3601 == _3740;
    assign _3742 = _3600 & _3741;
    always @(posedge _167) begin
        if (_3742)
            imem_55 <= _3595;
    end
    assign _3735 = _3601 == _3734;
    assign _3736 = _3600 & _3735;
    always @(posedge _167) begin
        if (_3736)
            imem_54 <= _3595;
    end
    assign _3729 = _3601 == _3728;
    assign _3730 = _3600 & _3729;
    always @(posedge _167) begin
        if (_3730)
            imem_53 <= _3595;
    end
    assign _3723 = _3601 == _3722;
    assign _3724 = _3600 & _3723;
    always @(posedge _167) begin
        if (_3724)
            imem_52 <= _3595;
    end
    assign _3717 = _3601 == _3716;
    assign _3718 = _3600 & _3717;
    always @(posedge _167) begin
        if (_3718)
            imem_51 <= _3595;
    end
    assign _3711 = _3601 == _3710;
    assign _3712 = _3600 & _3711;
    always @(posedge _167) begin
        if (_3712)
            imem_50 <= _3595;
    end
    assign _3705 = _3601 == _3704;
    assign _3706 = _3600 & _3705;
    always @(posedge _167) begin
        if (_3706)
            imem_49 <= _3595;
    end
    assign _3699 = _3601 == _3698;
    assign _3700 = _3600 & _3699;
    always @(posedge _167) begin
        if (_3700)
            imem_48 <= _3595;
    end
    assign _3693 = _3601 == _3692;
    assign _3694 = _3600 & _3693;
    always @(posedge _167) begin
        if (_3694)
            imem_47 <= _3595;
    end
    assign _3687 = _3601 == _3686;
    assign _3688 = _3600 & _3687;
    always @(posedge _167) begin
        if (_3688)
            imem_46 <= _3595;
    end
    assign _3681 = _3601 == _3680;
    assign _3682 = _3600 & _3681;
    always @(posedge _167) begin
        if (_3682)
            imem_45 <= _3595;
    end
    assign _3675 = _3601 == _3674;
    assign _3676 = _3600 & _3675;
    always @(posedge _167) begin
        if (_3676)
            imem_44 <= _3595;
    end
    assign _3669 = _3601 == _3668;
    assign _3670 = _3600 & _3669;
    always @(posedge _167) begin
        if (_3670)
            imem_43 <= _3595;
    end
    assign _3663 = _3601 == _3662;
    assign _3664 = _3600 & _3663;
    always @(posedge _167) begin
        if (_3664)
            imem_42 <= _3595;
    end
    assign _3657 = _3601 == _3656;
    assign _3658 = _3600 & _3657;
    always @(posedge _167) begin
        if (_3658)
            imem_41 <= _3595;
    end
    assign _3651 = _3601 == _3650;
    assign _3652 = _3600 & _3651;
    always @(posedge _167) begin
        if (_3652)
            imem_40 <= _3595;
    end
    assign _3645 = _3601 == _3644;
    assign _3646 = _3600 & _3645;
    always @(posedge _167) begin
        if (_3646)
            imem_39 <= _3595;
    end
    assign _3639 = _3601 == _3638;
    assign _3640 = _3600 & _3639;
    always @(posedge _167) begin
        if (_3640)
            imem_38 <= _3595;
    end
    assign _3633 = _3601 == _3632;
    assign _3634 = _3600 & _3633;
    always @(posedge _167) begin
        if (_3634)
            imem_37 <= _3595;
    end
    assign _3627 = _3601 == _3626;
    assign _3628 = _3600 & _3627;
    always @(posedge _167) begin
        if (_3628)
            imem_36 <= _3595;
    end
    assign _3621 = _3601 == _3620;
    assign _3622 = _3600 & _3621;
    always @(posedge _167) begin
        if (_3622)
            imem_35 <= _3595;
    end
    assign _3615 = _3601 == _3614;
    assign _3616 = _3600 & _3615;
    always @(posedge _167) begin
        if (_3616)
            imem_34 <= _3595;
    end
    assign _3609 = _3601 == _3608;
    assign _3610 = _3600 & _3609;
    always @(posedge _167) begin
        if (_3610)
            imem_33 <= _3595;
    end
    assign _3603 = _3601 == _3602;
    assign _3604 = _3600 & _3603;
    always @(posedge _167) begin
        if (_3604)
            imem_32 <= _3595;
    end
    assign _4872 = _3601 == _4871;
    assign _4873 = _3600 & _4872;
    always @(posedge _167) begin
        if (_4873)
            imem_31 <= _3595;
    end
    assign _4866 = _3601 == _4865;
    assign _4867 = _3600 & _4866;
    always @(posedge _167) begin
        if (_4867)
            imem_30 <= _3595;
    end
    assign _4860 = _3601 == _4859;
    assign _4861 = _3600 & _4860;
    always @(posedge _167) begin
        if (_4861)
            imem_29 <= _3595;
    end
    assign _4854 = _3601 == _4853;
    assign _4855 = _3600 & _4854;
    always @(posedge _167) begin
        if (_4855)
            imem_28 <= _3595;
    end
    assign _4848 = _3601 == _4847;
    assign _4849 = _3600 & _4848;
    always @(posedge _167) begin
        if (_4849)
            imem_27 <= _3595;
    end
    assign _4842 = _3601 == _4841;
    assign _4843 = _3600 & _4842;
    always @(posedge _167) begin
        if (_4843)
            imem_26 <= _3595;
    end
    assign _4836 = _3601 == _4835;
    assign _4837 = _3600 & _4836;
    always @(posedge _167) begin
        if (_4837)
            imem_25 <= _3595;
    end
    assign _4830 = _3601 == _4829;
    assign _4831 = _3600 & _4830;
    always @(posedge _167) begin
        if (_4831)
            imem_24 <= _3595;
    end
    assign _4824 = _3601 == _4823;
    assign _4825 = _3600 & _4824;
    always @(posedge _167) begin
        if (_4825)
            imem_23 <= _3595;
    end
    assign _4818 = _3601 == _4817;
    assign _4819 = _3600 & _4818;
    always @(posedge _167) begin
        if (_4819)
            imem_22 <= _3595;
    end
    assign _4812 = _3601 == _4811;
    assign _4813 = _3600 & _4812;
    always @(posedge _167) begin
        if (_4813)
            imem_21 <= _3595;
    end
    assign _4806 = _3601 == _4805;
    assign _4807 = _3600 & _4806;
    always @(posedge _167) begin
        if (_4807)
            imem_20 <= _3595;
    end
    assign _4800 = _3601 == _4799;
    assign _4801 = _3600 & _4800;
    always @(posedge _167) begin
        if (_4801)
            imem_19 <= _3595;
    end
    assign _4794 = _3601 == _4793;
    assign _4795 = _3600 & _4794;
    always @(posedge _167) begin
        if (_4795)
            imem_18 <= _3595;
    end
    assign _4788 = _3601 == _4787;
    assign _4789 = _3600 & _4788;
    always @(posedge _167) begin
        if (_4789)
            imem_17 <= _3595;
    end
    assign _4782 = _3601 == _4781;
    assign _4783 = _3600 & _4782;
    always @(posedge _167) begin
        if (_4783)
            imem_16 <= _3595;
    end
    assign _4776 = _3601 == _4775;
    assign _4777 = _3600 & _4776;
    always @(posedge _167) begin
        if (_4777)
            imem_15 <= _3595;
    end
    assign _4770 = _3601 == _4769;
    assign _4771 = _3600 & _4770;
    always @(posedge _167) begin
        if (_4771)
            imem_14 <= _3595;
    end
    assign _4764 = _3601 == _4763;
    assign _4765 = _3600 & _4764;
    always @(posedge _167) begin
        if (_4765)
            imem_13 <= _3595;
    end
    assign _4758 = _3601 == _4757;
    assign _4759 = _3600 & _4758;
    always @(posedge _167) begin
        if (_4759)
            imem_12 <= _3595;
    end
    assign _4752 = _3601 == _4751;
    assign _4753 = _3600 & _4752;
    always @(posedge _167) begin
        if (_4753)
            imem_11 <= _3595;
    end
    assign _4746 = _3601 == _4745;
    assign _4747 = _3600 & _4746;
    always @(posedge _167) begin
        if (_4747)
            imem_10 <= _3595;
    end
    assign _4740 = _3601 == _4739;
    assign _4741 = _3600 & _4740;
    always @(posedge _167) begin
        if (_4741)
            imem_09 <= _3595;
    end
    assign _4734 = _3601 == _4733;
    assign _4735 = _3600 & _4734;
    always @(posedge _167) begin
        if (_4735)
            imem_08 <= _3595;
    end
    assign _4728 = _3601 == _4727;
    assign _4729 = _3600 & _4728;
    always @(posedge _167) begin
        if (_4729)
            imem_07 <= _3595;
    end
    assign _4722 = _3601 == _4721;
    assign _4723 = _3600 & _4722;
    always @(posedge _167) begin
        if (_4723)
            imem_06 <= _3595;
    end
    assign _4716 = _3601 == _4715;
    assign _4717 = _3600 & _4716;
    always @(posedge _167) begin
        if (_4717)
            imem_05 <= _3595;
    end
    assign _4710 = _3601 == _4709;
    assign _4711 = _3600 & _4710;
    always @(posedge _167) begin
        if (_4711)
            imem_04 <= _3595;
    end
    assign _4704 = _3601 == _4703;
    assign _4705 = _3600 & _4704;
    always @(posedge _167) begin
        if (_4705)
            imem_03 <= _3595;
    end
    assign _4698 = _3601 == _4697;
    assign _4699 = _3600 & _4698;
    always @(posedge _167) begin
        if (_4699)
            imem_02 <= _3595;
    end
    assign _4692 = _3601 == _4691;
    assign _4693 = _3600 & _4692;
    always @(posedge _167) begin
        if (_4693)
            imem_01 <= _3595;
    end
    assign _3601 = _213[5:0];
    assign _4686 = _3601 == _4685;
    assign _3599 = _213 < _3598;
    assign _3600 = spi_wr & _3599;
    assign _4687 = _3600 & _4686;
    assign _3595 = spi_wdata[15:0];
    always @(posedge _167) begin
        if (_4687)
            imem_00 <= _3595;
    end
    assign _4682 = ctrl_bit0 ? _4681 : _4680;
    always @* begin
        case (_4682)
        0: _4875 <= imem_00;
        1: _4875 <= imem_01;
        2: _4875 <= imem_02;
        3: _4875 <= imem_03;
        4: _4875 <= imem_04;
        5: _4875 <= imem_05;
        6: _4875 <= imem_06;
        7: _4875 <= imem_07;
        8: _4875 <= imem_08;
        9: _4875 <= imem_09;
        10: _4875 <= imem_10;
        11: _4875 <= imem_11;
        12: _4875 <= imem_12;
        13: _4875 <= imem_13;
        14: _4875 <= imem_14;
        15: _4875 <= imem_15;
        16: _4875 <= imem_16;
        17: _4875 <= imem_17;
        18: _4875 <= imem_18;
        19: _4875 <= imem_19;
        20: _4875 <= imem_20;
        21: _4875 <= imem_21;
        22: _4875 <= imem_22;
        23: _4875 <= imem_23;
        24: _4875 <= imem_24;
        25: _4875 <= imem_25;
        26: _4875 <= imem_26;
        27: _4875 <= imem_27;
        28: _4875 <= imem_28;
        29: _4875 <= imem_29;
        30: _4875 <= imem_30;
        31: _4875 <= imem_31;
        32: _4875 <= imem_32;
        33: _4875 <= imem_33;
        34: _4875 <= imem_34;
        35: _4875 <= imem_35;
        36: _4875 <= imem_36;
        37: _4875 <= imem_37;
        38: _4875 <= imem_38;
        39: _4875 <= imem_39;
        40: _4875 <= imem_40;
        41: _4875 <= imem_41;
        42: _4875 <= imem_42;
        43: _4875 <= imem_43;
        44: _4875 <= imem_44;
        45: _4875 <= imem_45;
        46: _4875 <= imem_46;
        47: _4875 <= imem_47;
        48: _4875 <= imem_48;
        49: _4875 <= imem_49;
        50: _4875 <= imem_50;
        51: _4875 <= imem_51;
        52: _4875 <= imem_52;
        53: _4875 <= imem_53;
        54: _4875 <= imem_54;
        55: _4875 <= imem_55;
        56: _4875 <= imem_56;
        57: _4875 <= imem_57;
        58: _4875 <= imem_58;
        59: _4875 <= imem_59;
        60: _4875 <= imem_60;
        61: _4875 <= imem_61;
        62: _4875 <= imem_62;
        default: _4875 <= imem_63;
        endcase
    end
    assign _119 = _4875;
    assign _5417 = _5249 ? _119 : seq_a_ir;
    assign _4572 = ~ _2482;
    assign _3587 = _213 == _3586;
    assign _3588 = spi_wr & _3587;
    assign _3583 = spi_wdata[13:0];
    always @(posedge _167) begin
        if (_180)
            _3589 <= _3585;
        else
            if (_3588)
                _3589 <= _3583;
    end
    assign _4681 = _3589[5:0];
    assign _4679 = seq_a_ir_pc + _4678;
    assign _4674 = pins_sync[7:7];
    assign _4673 = pins_sync[6:6];
    assign _4672 = pins_sync[5:5];
    assign _4671 = pins_sync[4:4];
    assign _4670 = pins_sync[3:3];
    assign _4669 = pins_sync[2:2];
    assign _4668 = pins_sync[1:1];
    assign _4667 = pins_sync[0:0];
    always @* begin
        case (_4368)
        0: _4675 <= _4667;
        1: _4675 <= _4668;
        2: _4675 <= _4669;
        3: _4675 <= _4670;
        4: _4675 <= _4671;
        5: _4675 <= _4672;
        6: _4675 <= _4673;
        default: _4675 <= _4674;
        endcase
    end
    assign _4664 = _2487 == _4663;
    assign _4665 = _2486 & _4664;
    assign _4666 = _4665 & seq_a_caught_up;
    assign _4676 = _4666 & _4675;
    assign _4876 = ~ _4538;
    assign _4877 = _4521 ? _4876 : seq_a_flag;
    assign _4878 = _4573 ? _4877 : seq_a_flag;
    assign _4879 = ctrl_bit0 ? gnd : _4878;
    assign _120 = _4879;
    always @(posedge _167) begin
        if (_180)
            seq_a_flag <= _4659;
        else
            seq_a_flag <= _120;
    end
    assign _4656 = _2487 == _4655;
    assign _4657 = _2486 & _4656;
    assign _4661 = _4657 & seq_a_flag;
    assign _4650 = seq_a_y == _4649;
    assign _4651 = ~ _4650;
    assign _4648 = _2487 == _4647;
    assign _4652 = _4648 & _4651;
    assign _4643 = seq_a_x == _4642;
    assign _4644 = ~ _4643;
    assign _4641 = _2487 == _4640;
    assign _4645 = _4641 & _4644;
    assign _4639 = _2487 == _4638;
    assign _4646 = _4639 | _4645;
    assign _4653 = _4646 | _4652;
    assign _4654 = _2486 & _4653;
    assign _4662 = _4654 | _4661;
    assign _4677 = _4662 | _4676;
    assign _4680 = _4677 ? _2491 : _4679;
    assign _4398 = _4347 == _4397;
    assign _4395 = _4347 == _4394;
    assign _4392 = _4347 == _4391;
    assign _4389 = _4347 == _4388;
    assign _4387 = _4347 == _4386;
    assign _4390 = _4387 | _4389;
    assign _4393 = _4390 | _4392;
    assign _4396 = _4393 | _4395;
    assign _4399 = _4396 | _4398;
    assign _4356 = seq_a_ir[5:5];
    assign _4385 = ~ _4356;
    assign _4400 = _4385 & _4399;
    assign _4382 = seq_a_stuff_run == _4381;
    assign _5233 = seq_a_stuff_run + _5232;
    assign _5230 = _4890 == seq_a_stuff_last;
    assign _5234 = _5230 ? _5233 : _5231;
    assign _5228 = seq_a_stuff_run + _5227;
    assign _4891 = _4889 ? _4890 : seq_a_stuff_last;
    assign _4892 = _2527 ? _4891 : seq_a_stuff_last;
    assign _4894 = _4885 ? _4893 : _4892;
    assign _4895 = _4573 ? _4894 : seq_a_stuff_last;
    assign _4897 = ctrl_bit0 ? _4896 : _4895;
    assign _121 = _4897;
    always @(posedge _167) begin
        if (_180)
            seq_a_stuff_last <= _4460;
        else
            seq_a_stuff_last <= _121;
    end
    assign _4462 = ~ seq_a_stuff_last;
    assign _4463 = _4375 & _4462;
    assign _5216 = _5173[14:0];
    assign _5218 = { _5216, _5217 };
    assign _5213 = _5173[13:0];
    assign _5215 = { _5213, _5214 };
    assign _5210 = _5173[12:0];
    assign _5212 = { _5210, _5211 };
    assign _5207 = _5173[11:0];
    assign _5209 = { _5207, _5208 };
    assign _5204 = _5173[10:0];
    assign _5206 = { _5204, _5205 };
    assign _5201 = _5173[9:0];
    assign _5203 = { _5201, _5202 };
    assign _5198 = _5173[8:0];
    assign _5200 = { _5198, _5199 };
    assign _5195 = _5173[7:0];
    assign _5197 = { _5195, _5196 };
    assign _5192 = _5173[6:0];
    assign _5194 = { _5192, _5193 };
    assign _5189 = _5173[5:0];
    assign _5191 = { _5189, _5190 };
    assign _5186 = _5173[4:0];
    assign _5188 = { _5186, _5187 };
    assign _5183 = _5173[3:0];
    assign _5185 = { _5183, _5184 };
    assign _5180 = _5173[2:0];
    assign _5182 = { _5180, _5181 };
    assign _5177 = _5173[1:0];
    assign _5179 = { _5177, _5178 };
    assign _4923 = _4921 ? _4922 : seq_a_crc_corrupt;
    assign _4911 = seq_a_ir[11:9];
    assign _4913 = _4911 == _4912;
    assign _4909 = _2483 == _4908;
    assign _4910 = _2480 & _4909;
    assign _4914 = _4910 & _4913;
    assign _4925 = _4914 ? _4924 : _4923;
    assign _4927 = _4907 ? _4926 : _4925;
    assign _4928 = _4573 ? _4927 : seq_a_crc_corrupt;
    assign _4930 = ctrl_bit0 ? _4929 : _4928;
    assign _122 = _4930;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc_corrupt <= _4899;
        else
            seq_a_crc_corrupt <= _122;
    end
    assign _5170 = { _5169, seq_a_crc_corrupt };
    assign _4934 = seq_a_osr[10:10];
    assign _4935 = _4921 ? _4934 : seq_a_crc_inv;
    assign _4936 = _4573 ? _4935 : seq_a_crc_inv;
    assign _4937 = ctrl_bit0 ? seq_a_crc_inv : _4936;
    assign _123 = _4937;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc_inv <= _4932;
        else
            seq_a_crc_inv <= _123;
    end
    assign _5168 = seq_a_crc_inv ? _5046 : _5167;
    assign _5171 = _5168 ^ _5170;
    assign _5100 = _5053 < _5099;
    assign _5101 = ~ _5100;
    assign _5097 = _5053 < _5096;
    assign _5098 = ~ _5097;
    assign _5094 = _5053 < _5093;
    assign _5095 = ~ _5094;
    assign _5091 = _5053 < _5090;
    assign _5092 = ~ _5091;
    assign _5088 = _5053 < _5087;
    assign _5089 = ~ _5088;
    assign _5085 = _5053 < _5084;
    assign _5086 = ~ _5085;
    assign _5082 = _5053 < _5081;
    assign _5083 = ~ _5082;
    assign _5079 = _5053 < _5078;
    assign _5080 = ~ _5079;
    assign _5076 = _5053 < _5075;
    assign _5077 = ~ _5076;
    assign _5073 = _5053 < _5072;
    assign _5074 = ~ _5073;
    assign _5070 = _5053 < _5069;
    assign _5071 = ~ _5070;
    assign _5067 = _5053 < _5066;
    assign _5068 = ~ _5067;
    assign _5064 = _5053 < _5063;
    assign _5065 = ~ _5064;
    assign _5061 = _5053 < _5060;
    assign _5062 = ~ _5061;
    assign _5058 = _5053 < _5057;
    assign _5059 = ~ _5058;
    assign _5053 = seq_a_osr[15:12];
    assign _5055 = _5053 < _5054;
    assign _5056 = ~ _5055;
    assign _5102 = { _5056, _5059, _5062, _5065, _5068, _5071, _5074, _5077, _5080, _5083, _5086, _5089, _5092, _5095, _5098, _5101 };
    assign _5051 = seq_a_osr[11:11];
    assign _5103 = _5051 ? _5102 : _5052;
    assign _5044 = seq_a_crc_width_m1 < _5043;
    assign _5045 = ~ _5044;
    assign _5041 = seq_a_crc_width_m1 < _5040;
    assign _5042 = ~ _5041;
    assign _5038 = seq_a_crc_width_m1 < _5037;
    assign _5039 = ~ _5038;
    assign _5035 = seq_a_crc_width_m1 < _5034;
    assign _5036 = ~ _5035;
    assign _5032 = seq_a_crc_width_m1 < _5031;
    assign _5033 = ~ _5032;
    assign _5029 = seq_a_crc_width_m1 < _5028;
    assign _5030 = ~ _5029;
    assign _5026 = seq_a_crc_width_m1 < _5025;
    assign _5027 = ~ _5026;
    assign _5023 = seq_a_crc_width_m1 < _5022;
    assign _5024 = ~ _5023;
    assign _5020 = seq_a_crc_width_m1 < _5019;
    assign _5021 = ~ _5020;
    assign _5017 = seq_a_crc_width_m1 < _5016;
    assign _5018 = ~ _5017;
    assign _5014 = seq_a_crc_width_m1 < _5013;
    assign _5015 = ~ _5014;
    assign _5011 = seq_a_crc_width_m1 < _5010;
    assign _5012 = ~ _5011;
    assign _5008 = seq_a_crc_width_m1 < _5007;
    assign _5009 = ~ _5008;
    assign _5005 = seq_a_crc_width_m1 < _5004;
    assign _5006 = ~ _5005;
    assign _5002 = seq_a_crc_width_m1 < _5001;
    assign _5003 = ~ _5002;
    assign _4999 = seq_a_crc_width_m1 < _4998;
    assign _5000 = ~ _4999;
    assign _5046 = { _5000, _5003, _5006, _5009, _5012, _5015, _5018, _5021, _5024, _5027, _5030, _5033, _5036, _5039, _5042, _5045 };
    assign _4941 = seq_a_osr[31:16];
    assign _4942 = _4921 ? _4941 : seq_a_crc_poly;
    assign _4943 = _4573 ? _4942 : seq_a_crc_poly;
    assign _4944 = ctrl_bit0 ? seq_a_crc_poly : _4943;
    assign _124 = _4944;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc_poly <= _4939;
        else
            seq_a_crc_poly <= _124;
    end
    assign _4992 = seq_a_crc[15:15];
    assign _4991 = seq_a_crc[14:14];
    assign _4990 = seq_a_crc[13:13];
    assign _4989 = seq_a_crc[12:12];
    assign _4988 = seq_a_crc[11:11];
    assign _4987 = seq_a_crc[10:10];
    assign _4986 = seq_a_crc[9:9];
    assign _4985 = seq_a_crc[8:8];
    assign _4984 = seq_a_crc[7:7];
    assign _4983 = seq_a_crc[6:6];
    assign _4982 = seq_a_crc[5:5];
    assign _4981 = seq_a_crc[4:4];
    assign _4980 = seq_a_crc[3:3];
    assign _4979 = seq_a_crc[2:2];
    assign _4978 = seq_a_crc[1:1];
    assign _4977 = seq_a_crc[0:0];
    always @* begin
        case (seq_a_crc_width_m1)
        0: _4993 <= _4977;
        1: _4993 <= _4978;
        2: _4993 <= _4979;
        3: _4993 <= _4980;
        4: _4993 <= _4981;
        5: _4993 <= _4982;
        6: _4993 <= _4983;
        7: _4993 <= _4984;
        8: _4993 <= _4985;
        9: _4993 <= _4986;
        10: _4993 <= _4987;
        11: _4993 <= _4988;
        12: _4993 <= _4989;
        13: _4993 <= _4990;
        14: _4993 <= _4991;
        default: _4993 <= _4992;
        endcase
    end
    assign _4994 = _4993 ^ _4427;
    assign _4996 = _4994 ? seq_a_crc_poly : _4995;
    assign _4971 = seq_a_crc[14:0];
    assign _4973 = { _4971, _4972 };
    assign _4997 = _4973 ^ _4996;
    assign _5047 = _4997 & _5046;
    assign _4956 = _4921 ? _4955 : seq_a_crc_feed;
    assign _4951 = seq_a_ir[11:9];
    assign _4953 = _4951 == _4952;
    assign _4949 = _2483 == _4948;
    assign _4950 = _2480 & _4949;
    assign _4954 = _4950 & _4953;
    assign _4958 = _4954 ? _4957 : _4956;
    assign _4960 = _4907 ? _4959 : _4958;
    assign _4961 = _4573 ? _4960 : seq_a_crc_feed;
    assign _4963 = ctrl_bit0 ? _4962 : _4961;
    assign _125 = _4963;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc_feed <= _4946;
        else
            seq_a_crc_feed <= _125;
    end
    assign _5048 = seq_a_crc_feed ? _5047 : seq_a_crc;
    assign _5049 = _4970 ? _5048 : seq_a_crc;
    assign _5050 = _2527 ? _5049 : seq_a_crc;
    assign _5104 = _4921 ? _5103 : _5050;
    assign _5105 = _4573 ? _5104 : seq_a_crc;
    assign _5106 = ctrl_bit0 ? seq_a_crc : _5105;
    assign _126 = _5106;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc <= _4965;
        else
            seq_a_crc <= _126;
    end
    assign _5172 = seq_a_crc ^ _5171;
    assign _5173 = _5172 & _5046;
    assign _5174 = _5173[0:0];
    assign _5176 = { _5174, _5175 };
    assign _5107 = seq_a_osr[15:12];
    assign _4918 = seq_a_ir[11:9];
    assign _4920 = _4918 == _4919;
    assign _4916 = _2483 == _4915;
    assign _4917 = _2480 & _4916;
    assign _4921 = _4917 & _4920;
    assign _5108 = _4921 ? _5107 : seq_a_crc_width_m1;
    assign _5109 = _4573 ? _5108 : seq_a_crc_width_m1;
    assign _5110 = ctrl_bit0 ? seq_a_crc_width_m1 : _5109;
    assign _127 = _5110;
    always @(posedge _167) begin
        if (_180)
            seq_a_crc_width_m1 <= _4975;
        else
            seq_a_crc_width_m1 <= _127;
    end
    always @* begin
        case (seq_a_crc_width_m1)
        0: _5219 <= _5176;
        1: _5219 <= _5179;
        2: _5219 <= _5182;
        3: _5219 <= _5185;
        4: _5219 <= _5188;
        5: _5219 <= _5191;
        6: _5219 <= _5194;
        7: _5219 <= _5197;
        8: _5219 <= _5200;
        9: _5219 <= _5203;
        10: _5219 <= _5206;
        11: _5219 <= _5209;
        12: _5219 <= _5212;
        13: _5219 <= _5215;
        14: _5219 <= _5218;
        default: _5219 <= _5173;
        endcase
    end
    assign _5221 = { _5219, _5220 };
    assign _5121 = _5119 == _5120;
    assign _5122 = _5116 & _5121;
    assign _5126 = _5122 ? spi_wdata : _5125;
    assign _128 = _5126;
    always @(posedge _167) begin
        if (_180)
            _5125 <= _5124;
        else
            _5125 <= _128;
    end
    assign _5128 = _5119 == _5127;
    assign _5129 = _5116 & _5128;
    assign _5133 = _5129 ? spi_wdata : _5132;
    assign _129 = _5133;
    always @(posedge _167) begin
        if (_180)
            _5132 <= _5131;
        else
            _5132 <= _129;
    end
    assign _5135 = _5119 == _5134;
    assign _5136 = _5116 & _5135;
    assign _5140 = _5136 ? spi_wdata : _5139;
    assign _130 = _5140;
    always @(posedge _167) begin
        if (_180)
            _5139 <= _5138;
        else
            _5139 <= _130;
    end
    assign _5142 = _5119 + _5141;
    assign _5143 = _5116 ? _5142 : _5119;
    assign _131 = _5143;
    always @(posedge _167) begin
        if (_180)
            _5119 <= _5118;
        else
            _5119 <= _131;
    end
    assign _5145 = _5119 == _5144;
    assign _5146 = _5116 & _5145;
    assign _5150 = _5146 ? spi_wdata : _5149;
    assign _132 = _5150;
    always @(posedge _167) begin
        if (_180)
            _5149 <= _5148;
        else
            _5149 <= _132;
    end
    assign _5158 = _5156 + _5157;
    assign _5159 = _5153 ? _5158 : _5156;
    assign _133 = _5159;
    always @(posedge _167) begin
        if (_180)
            _5156 <= _5155;
        else
            _5156 <= _133;
    end
    always @* begin
        case (_5156)
        0: _5165 <= _5149;
        1: _5165 <= _5139;
        2: _5165 <= _5132;
        default: _5165 <= _5125;
        endcase
    end
    assign _5160 = seq_a_osr[30:0];
    assign _5162 = { _5160, _5161 };
    assign _4969 = ~ _4401;
    assign _4968 = _4347 == _4967;
    assign _4970 = _4968 & _4969;
    assign _5163 = _4970 ? _5162 : seq_a_osr;
    assign _5164 = _2527 ? _5163 : seq_a_osr;
    assign _5166 = _4515 ? _5165 : _5164;
    assign _4904 = seq_a_ir[11:9];
    assign _4906 = _4904 == _4905;
    assign _4902 = _2483 == _4901;
    assign _4903 = _2480 & _4902;
    assign _4907 = _4903 & _4906;
    assign _5222 = _4907 ? _5221 : _5166;
    assign _5223 = _4573 ? _5222 : seq_a_osr;
    assign _5225 = ctrl_bit0 ? _5224 : _5223;
    assign _134 = _5225;
    always @(posedge _167) begin
        if (_180)
            seq_a_osr <= _4425;
        else
            seq_a_osr <= _134;
    end
    assign _4427 = seq_a_osr[31:31];
    assign _4890 = _4401 ? _4463 : _4427;
    assign _5229 = _4890 ? _5228 : _5226;
    assign _5235 = _4375 ? _5234 : _5229;
    assign _4347 = seq_a_ir[2:0];
    assign _4887 = _4347 == _4886;
    assign _4888 = _4401 | _4887;
    assign _4889 = _4374 & _4888;
    assign _5236 = _4889 ? _5235 : seq_a_stuff_run;
    assign _5237 = _2527 ? _5236 : seq_a_stuff_run;
    assign _5239 = _4885 ? _5238 : _5237;
    assign _5240 = _4573 ? _5239 : seq_a_stuff_run;
    assign _5242 = ctrl_bit0 ? _5241 : _5240;
    assign _135 = _5242;
    always @(posedge _167) begin
        if (_180)
            seq_a_stuff_run <= _4377;
        else
            seq_a_stuff_run <= _135;
    end
    assign _4380 = seq_a_stuff_run == _4379;
    assign _4375 = seq_a_coder[5:5];
    assign _4383 = _4375 ? _4382 : _4380;
    assign _5243 = _4602[5:0];
    assign _4884 = _4598 == _4883;
    assign _4881 = _2483 == _4880;
    assign _4882 = _2480 & _4881;
    assign _4885 = _4882 & _4884;
    assign _5244 = _4885 ? _5243 : seq_a_coder;
    assign _5245 = _4573 ? _5244 : seq_a_coder;
    assign _5247 = ctrl_bit0 ? _5246 : _5245;
    assign _136 = _5247;
    always @(posedge _167) begin
        if (_180)
            seq_a_coder <= _4372;
        else
            seq_a_coder <= _136;
    end
    assign _4374 = seq_a_coder[4:4];
    assign _4384 = _4374 & _4383;
    assign _4401 = _4384 & _4400;
    assign _5248 = _2527 & _4401;
    assign _5249 = ~ _5248;
    assign _5250 = _5249 ? _4680 : seq_a_ir_pc;
    assign _5251 = _4573 ? _5250 : seq_a_ir_pc;
    assign _5252 = ctrl_bit0 ? _4681 : _5251;
    assign _137 = _5252;
    always @(posedge _167) begin
        if (_180)
            seq_a_ir_pc <= _2493;
        else
            seq_a_ir_pc <= _137;
    end
    assign _2491 = seq_a_ir[5:0];
    assign _2495 = _2491 == seq_a_ir_pc;
    assign _2489 = _2487 == _2488;
    assign _2490 = _2486 & _2489;
    assign _2496 = _2490 & _2495;
    assign _4570 = ~ _2496;
    assign _4565 = ~ seq_a_caught_up;
    assign _4563 = _2487 == _4562;
    assign _4564 = _2486 & _4563;
    assign _4566 = _4564 & _4565;
    assign _5278 = seq_a_y[7:0];
    assign _5279 = { _4602, _5278 };
    assign _5276 = { _5275, _4602 };
    assign _5273 = seq_a_y - _5272;
    assign _5269 = seq_a_y == _5268;
    assign _5270 = ~ _5269;
    assign _5266 = _2487 == _5265;
    assign _5267 = _2486 & _5266;
    assign _5271 = _5267 & _5270;
    assign _5274 = _5271 ? _5273 : seq_a_y;
    assign _5263 = _4598 == _5262;
    assign _5260 = _2483 == _5259;
    assign _5261 = _2480 & _5260;
    assign _5264 = _5261 & _5263;
    assign _5277 = _5264 ? _5276 : _5274;
    assign _5257 = _4598 == _5256;
    assign _5254 = _2483 == _5253;
    assign _5255 = _2480 & _5254;
    assign _5258 = _5255 & _5257;
    assign _5280 = _5258 ? _5279 : _5277;
    assign _5281 = _4573 ? _5280 : seq_a_y;
    assign _5283 = ctrl_bit0 ? _5282 : _5281;
    assign _138 = _5283;
    always @(posedge _167) begin
        if (_180)
            seq_a_y <= _4551;
        else
            seq_a_y <= _138;
    end
    assign _5309 = seq_a_x[7:0];
    assign _5310 = { _4602, _5309 };
    assign _5307 = { _5306, _4602 };
    assign _5304 = seq_a_x - _5303;
    assign _5300 = seq_a_x == _5299;
    assign _5301 = ~ _5300;
    assign _2487 = seq_a_ir[11:8];
    assign _5297 = _2487 == _5296;
    assign _2485 = _2483 == _2484;
    assign _2486 = _2480 & _2485;
    assign _5298 = _2486 & _5297;
    assign _5302 = _5298 & _5301;
    assign _5305 = _5302 ? _5304 : seq_a_x;
    assign _5294 = _4598 == _5293;
    assign _5291 = _2483 == _5290;
    assign _5292 = _2480 & _5291;
    assign _5295 = _5292 & _5294;
    assign _5308 = _5295 ? _5307 : _5305;
    assign _5288 = _4598 == _5287;
    assign _5285 = _2483 == _5284;
    assign _5286 = _2480 & _5285;
    assign _5289 = _5286 & _5288;
    assign _5311 = _5289 ? _5310 : _5308;
    assign _5312 = _4573 ? _5311 : seq_a_x;
    assign _5314 = ctrl_bit0 ? _5313 : _5312;
    assign _139 = _5314;
    always @(posedge _167) begin
        if (_180)
            seq_a_x <= _4548;
        else
            seq_a_x <= _139;
    end
    always @* begin
        case (_4539)
        0: _4554 <= _4546;
        1: _4554 <= seq_a_x;
        2: _4554 <= seq_a_y;
        default: _4554 <= _4553;
        endcase
    end
    assign _5321 = seq_a_wait_count + _5320;
    assign _5317 = ~ _4558;
    assign _5315 = seq_a_running & _4521;
    assign _5316 = _5315 & seq_a_caught_up;
    assign _5318 = _5316 & _5317;
    assign _5322 = _5318 ? _5321 : _5319;
    assign _5324 = ctrl_bit0 ? _5323 : _5322;
    assign _140 = _5324;
    always @(posedge _167) begin
        if (_180)
            seq_a_wait_count <= _4544;
        else
            seq_a_wait_count <= _140;
    end
    assign _4555 = seq_a_wait_count == _4554;
    assign _4539 = seq_a_ir[7:6];
    assign _4541 = _4539 == _4540;
    assign _4542 = ~ _4541;
    assign _4556 = _4542 & _4555;
    assign _4537 = seq_a_ir[8:8];
    assign _4535 = pins_sync[7:7];
    assign _4534 = pins_sync[6:6];
    assign _4533 = pins_sync[5:5];
    assign _4532 = pins_sync[4:4];
    assign _4531 = pins_sync[3:3];
    assign _4530 = pins_sync[2:2];
    assign _4529 = pins_sync[1:1];
    assign _142 = uio_in;
    always @(posedge _167) begin
        pins_sync1 <= _142;
    end
    always @(posedge _167) begin
        pins_sync <= pins_sync1;
    end
    assign _4528 = pins_sync[0:0];
    assign _4367 = _4363[11:9];
    assign _4365 = _4363[5:3];
    assign _4364 = _4363[2:0];
    assign _4368 = _4363[8:6];
    assign _4525 = seq_a_ir[11:9];
    assign _4526 = _4525[1:0];
    always @* begin
        case (_4526)
        0: _4527 <= _4368;
        1: _4527 <= _4364;
        2: _4527 <= _4365;
        default: _4527 <= _4367;
        endcase
    end
    always @* begin
        case (_4527)
        0: _4536 <= _4528;
        1: _4536 <= _4529;
        2: _4536 <= _4530;
        3: _4536 <= _4531;
        4: _4536 <= _4532;
        5: _4536 <= _4533;
        6: _4536 <= _4534;
        default: _4536 <= _4535;
        endcase
    end
    assign _4538 = _4536 == _4537;
    assign _4557 = _4538 | _4556;
    assign _5377 = _5374 == _5376;
    assign _5373 = timebase + _5372;
    assign _5374 = _5371 - _5373;
    assign _5375 = _5374[23:23];
    assign _5378 = _5375 | _5377;
    assign _5356 = _5353 == _5355;
    assign _5352 = timebase + _5351;
    assign _5353 = _5350 - _5352;
    assign _5354 = _5353[23:23];
    assign _5357 = _5354 | _5356;
    assign _5379 = _5325 ? _5378 : _5357;
    assign _5380 = _5327 ? _5379 : vdd;
    assign _5335 = _5332 == _5334;
    assign _5331 = timebase + _5330;
    assign _5332 = seq_a_sched_s - _5331;
    assign _5333 = _5332[23:23];
    assign _5336 = _5333 | _5335;
    assign _5328 = _4573 & _4521;
    assign _5326 = _4573 & _4498;
    assign _5325 = _4573 & _2527;
    assign _5327 = _5325 | _5326;
    assign _5329 = _5327 | _5328;
    assign _5381 = _5329 ? _5380 : _5336;
    assign _5382 = ctrl_bit0 ? gnd : _5381;
    assign _143 = _5382;
    always @(posedge _167) begin
        if (_180)
            seq_a_caught_up <= _4523;
        else
            seq_a_caught_up <= _143;
    end
    assign _4558 = seq_a_caught_up & _4557;
    assign _4559 = ~ _4558;
    assign _4560 = _4521 & _4559;
    assign _5152 = _5151 < _4513;
    assign _144 = _4515;
    assign _5153 = _144 & _5152;
    assign _5387 = { _5386, _5153 };
    assign _5115 = _4513 < _5114;
    assign _5112 = _213 == _5111;
    assign _5113 = spi_wr & _5112;
    assign _5116 = _5113 & _5115;
    assign _5384 = { _5383, _5116 };
    assign _5385 = _4513 + _5384;
    assign _5388 = _5385 - _5387;
    assign _145 = _5388;
    always @(posedge _167) begin
        if (_180)
            _4513 <= _4512;
        else
            _4513 <= _145;
    end
    assign _4514 = _4510 < _4513;
    assign _4509 = seq_a_running & _4508;
    assign _4515 = _4509 & _4514;
    assign _4516 = ~ _4515;
    assign _4505 = seq_a_ir[11:11];
    assign _4507 = _4505 == _4506;
    assign _4503 = _2483 == _4502;
    assign _4504 = _2480 & _4503;
    assign _4508 = _4504 & _4507;
    assign _4517 = _4508 & _4516;
    assign _5413 = _5409[21:21];
    assign _5412 = _5409[22:22];
    assign _5414 = _5412 | _5413;
    assign _5407 = timebase + _5406;
    assign _5390 = timebase + _5389;
    assign _146 = _5390;
    always @(posedge _167) begin
        if (_180)
            timebase <= _247;
        else
            timebase <= _146;
    end
    assign _5346 = _5339[17:0];
    assign _5348 = { _5346, _5347 };
    assign _5343 = _5339[19:0];
    assign _5345 = { _5343, _5344 };
    assign _5340 = _5339[21:0];
    assign _5342 = { _5340, _5341 };
    assign _5338 = seq_a_ir[11:0];
    assign _5339 = { _5337, _5338 };
    always @* begin
        case (seq_a_prescale)
        0: _5349 <= _5339;
        1: _5349 <= _5342;
        2: _5349 <= _5345;
        default: _5349 <= _5348;
        endcase
    end
    assign _5350 = seq_a_sched_s + _5349;
    assign _5367 = _5360[17:0];
    assign _5369 = { _5367, _5368 };
    assign _5364 = _5360[19:0];
    assign _5366 = { _5364, _5365 };
    assign _5361 = _5360[21:0];
    assign _5363 = { _5361, _5362 };
    assign _5359 = seq_a_ir[11:6];
    assign _5360 = { _5358, _5359 };
    assign _4602 = seq_a_ir[7:0];
    assign _5397 = _4602[1:0];
    assign _4598 = seq_a_ir[11:8];
    assign _5395 = _4598 == _5394;
    assign _5392 = _2483 == _5391;
    assign _5393 = _2480 & _5392;
    assign _5396 = _5393 & _5395;
    assign _5398 = _5396 ? _5397 : seq_a_prescale;
    assign _5399 = _4573 ? _5398 : seq_a_prescale;
    assign _5401 = ctrl_bit0 ? _5400 : _5399;
    assign _147 = _5401;
    always @(posedge _167) begin
        if (_180)
            seq_a_prescale <= _2538;
        else
            seq_a_prescale <= _147;
    end
    always @* begin
        case (seq_a_prescale)
        0: _5370 <= _5360;
        1: _5370 <= _5363;
        2: _5370 <= _5366;
        default: _5370 <= _5369;
        endcase
    end
    assign _5371 = seq_a_sched_s + _5370;
    assign _5402 = _2527 ? _5371 : seq_a_sched_s;
    assign _5403 = _4498 ? _5350 : _5402;
    assign _4520 = _2483 == _4519;
    assign _4521 = _2480 & _4520;
    assign _5404 = _4521 ? timebase : _5403;
    assign _5405 = _4573 ? _5404 : seq_a_sched_s;
    assign _5408 = ctrl_bit0 ? _5407 : _5405;
    assign _148 = _5408;
    always @(posedge _167) begin
        if (_180)
            seq_a_sched_s <= _2535;
        else
            seq_a_sched_s <= _148;
    end
    assign _5409 = seq_a_sched_s - timebase;
    assign _5410 = _5409[23:23];
    assign _5411 = ~ _5410;
    assign _5415 = _5411 & _5414;
    assign _5416 = ctrl_bit0 ? gnd : _5415;
    assign _149 = _5416;
    always @(posedge _167) begin
        if (_180)
            seq_a_far <= _2524;
        else
            seq_a_far <= _149;
    end
    assign _4497 = ~ seq_a_far;
    assign _4494 = _2483 == _4493;
    assign _4495 = _2480 & _4494;
    assign _4496 = seq_a_running & _4495;
    assign _4498 = _4496 & _4497;
    assign _4499 = ~ _4498;
    assign _4491 = _2483 == _4490;
    assign _4492 = _2480 & _4491;
    assign _4500 = _4492 & _4499;
    assign _4488 = ~ _2527;
    assign _2483 = seq_a_ir[15:12];
    assign _4486 = _2483 == _4485;
    assign _4487 = _2480 & _4486;
    assign _4489 = _4487 & _4488;
    assign _4501 = _4489 | _4500;
    assign _4518 = _4501 | _4517;
    assign _4561 = _4518 | _4560;
    assign _4567 = _4561 | _4566;
    assign _4568 = ~ _4567;
    assign _4569 = seq_a_running & _4568;
    assign _4571 = _4569 & _4570;
    assign _4573 = _4571 & _4572;
    assign _5418 = _4573 ? _5417 : seq_a_ir;
    assign _5419 = ctrl_bit0 ? _119 : _5418;
    assign _150 = _5419;
    always @(posedge _167) begin
        if (_180)
            seq_a_ir <= _2155;
        else
            seq_a_ir <= _150;
    end
    assign _2157 = seq_a_ir[15:12];
    assign _2159 = _2157 == _2158;
    assign _2164 = _2159 & _2163;
    assign _2200 = _2164 | _2199;
    assign _2204 = _2200 | _2203;
    assign _2241 = _2204 | _2240;
    assign _2270 = _2241 | _2269;
    assign _2438 = _2270 | _2437;
    assign _2463 = _2438 | _2462;
    assign _2480 = _2463 | _2479;
    assign _2481 = ~ _2480;
    assign _2482 = seq_a_running & _2481;
    assign _5421 = _2482 ? gnd : _5420;
    assign _5422 = ctrl_bit0 ? vdd : _5421;
    assign _151 = _5422;
    always @(posedge _167) begin
        if (_180)
            seq_a_running <= _2152;
        else
            seq_a_running <= _151;
    end
    assign _2521 = seq_a_running & _2520;
    assign _2522 = _2521 & _118;
    assign _2527 = _2522 & _2526;
    assign _2530 = _2527 & _2529;
    assign _5424 = { _5423, _2530 };
    assign _5425 = queue_a_count + _5424;
    assign _5426 = _5425 - _4635;
    assign _152 = _5426;
    always @(posedge _167) begin
        if (_225)
            queue_a_count <= _226;
        else
            queue_a_count <= _152;
    end
    assign _228 = _205 < queue_a_count;
    assign _256 = _228 & _255;
    assign _5434 = _256 & _5433;
    assign _5439 = _5434 & _5438;
    assign _5441 = _5439 & _5440;
    assign _5453 = _5441 | _5452;
    assign _5465 = _5453 | _5464;
    assign _5477 = _5465 | _5476;
    assign _5478 = _5430 | _5477;
    assign _296 = spi_wdata[3:3];
    assign _297 = _216 & _296;
    always @(posedge _167) begin
        if (_180)
            ctrl_bit3 <= _299;
        else
            ctrl_bit3 <= _297;
    end
    assign _220 = spi_wdata[0:0];
    assign _221 = _216 & _220;
    always @(posedge _167) begin
        if (_180)
            ctrl_bit0 <= _223;
        else
            ctrl_bit0 <= _221;
    end
    assign _5427 = ctrl_bit0 | ctrl_bit3;
    assign _5479 = _5427 ? gnd : _5478;
    assign _153 = _5479;
    always @(posedge _167) begin
        if (_180)
            _5430 <= _5429;
        else
            _5430 <= _153;
    end
    assign _5527 = spi_bitcnt == _5526;
    assign _5528 = ~ _5527;
    assign _5523 = spi_bitcnt == _5522;
    assign _5524 = ~ _5523;
    always @(posedge _167) begin
        if (_180)
            _5519 <= _5518;
        else
            _5519 <= _5506;
    end
    assign _5520 = ~ _5519;
    assign _5521 = _5506 & _5520;
    assign _5525 = _5521 & _5524;
    assign _5529 = _5525 & _5528;
    assign _5513 = spi_bitcnt < _5512;
    assign _5514 = ~ _5513;
    assign _5515 = _5508 & _5514;
    assign _5516 = _5487 | _5515;
    assign _5530 = _5516 | _5529;
    assign _5480 = spi_wdata[4:4];
    assign _215 = _213 == _214;
    assign _216 = spi_wr & _215;
    assign _5481 = _216 & _5480;
    always @(posedge _167) begin
        if (_180)
            ctrl_bit4 <= _5483;
        else
            ctrl_bit4 <= _5481;
    end
    assign _154 = ctrl_bit4;
    assign _5531 = _154 ? gnd : _5530;
    assign _155 = _5531;
    always @(posedge _167) begin
        if (_180)
            _5487 <= _5486;
        else
            _5487 <= _155;
    end
    assign _5633 = { gnd, _5487, _5430, _5629, _5630, _5631, _2611, _5632, _4513, seq_a_trapped, queue_a_count, _2593, _2584, _2506, seq_a_halted };
    assign _3501 = _213 == _3500;
    assign _3502 = spi_wr & _3501;
    assign _3497 = spi_wdata[23:0];
    always @(posedge _167) begin
        if (_180)
            _3503 <= _3499;
        else
            if (_3502)
                _3503 <= _3497;
    end
    assign _5622 = { _5621, _3503 };
    assign _4361 = _213 == _4360;
    assign _5536 = _5535 ? vdd : gnd;
    assign _5537 = _5508 ? _5536 : gnd;
    assign _5538 = _5506 ? gnd : _5537;
    assign _156 = _5538;
    always @(posedge _167) begin
        if (_180)
            spi_wr <= _208;
        else
            spi_wr <= _156;
    end
    assign _4362 = spi_wr & _4361;
    assign _5533 = spi_bitcnt == _5532;
    assign _5535 = _5533 & _5534;
    assign _5551 = _5535 ? _5550 : spi_wdata;
    assign _5552 = _5508 ? _5551 : spi_wdata;
    assign _5553 = _5506 ? spi_wdata : _5552;
    assign _157 = _5553;
    always @(posedge _167) begin
        if (_180)
            spi_wdata <= _218;
        else
            spi_wdata <= _157;
    end
    assign _4357 = spi_wdata[11:0];
    always @(posedge _167) begin
        if (_180)
            _4363 <= _4359;
        else
            if (_4362)
                _4363 <= _4357;
    end
    assign _5620 = { _5619, _4363 };
    assign _213 = spi_cmd[6:0];
    always @* begin
        case (_213)
        0: _5701 <= _5554;
        1: _5701 <= _5555;
        2: _5701 <= _5556;
        3: _5701 <= _5557;
        4: _5701 <= _5558;
        5: _5701 <= _5559;
        6: _5701 <= _5560;
        7: _5701 <= _5561;
        8: _5701 <= _5562;
        9: _5701 <= _5563;
        10: _5701 <= _5564;
        11: _5701 <= _5565;
        12: _5701 <= _5566;
        13: _5701 <= _5567;
        14: _5701 <= _5568;
        15: _5701 <= _5569;
        16: _5701 <= _5570;
        17: _5701 <= _5571;
        18: _5701 <= _5572;
        19: _5701 <= _5573;
        20: _5701 <= _5574;
        21: _5701 <= _5575;
        22: _5701 <= _5576;
        23: _5701 <= _5577;
        24: _5701 <= _5578;
        25: _5701 <= _5579;
        26: _5701 <= _5580;
        27: _5701 <= _5581;
        28: _5701 <= _5582;
        29: _5701 <= _5583;
        30: _5701 <= _5584;
        31: _5701 <= _5585;
        32: _5701 <= _5586;
        33: _5701 <= _5587;
        34: _5701 <= _5588;
        35: _5701 <= _5589;
        36: _5701 <= _5590;
        37: _5701 <= _5591;
        38: _5701 <= _5592;
        39: _5701 <= _5593;
        40: _5701 <= _5594;
        41: _5701 <= _5595;
        42: _5701 <= _5596;
        43: _5701 <= _5597;
        44: _5701 <= _5598;
        45: _5701 <= _5599;
        46: _5701 <= _5600;
        47: _5701 <= _5601;
        48: _5701 <= _5602;
        49: _5701 <= _5603;
        50: _5701 <= _5604;
        51: _5701 <= _5605;
        52: _5701 <= _5606;
        53: _5701 <= _5607;
        54: _5701 <= _5608;
        55: _5701 <= _5609;
        56: _5701 <= _5610;
        57: _5701 <= _5611;
        58: _5701 <= _5612;
        59: _5701 <= _5613;
        60: _5701 <= _5614;
        61: _5701 <= _5615;
        62: _5701 <= _5616;
        63: _5701 <= _5617;
        64: _5701 <= _5618;
        65: _5701 <= _5620;
        66: _5701 <= _5622;
        67: _5701 <= _5623;
        68: _5701 <= _5633;
        69: _5701 <= _2126;
        70: _5701 <= _5642;
        71: _5701 <= _5644;
        72: _5701 <= _1281;
        73: _5701 <= _1375;
        74: _5701 <= _1270;
        75: _5701 <= _1492;
        76: _5701 <= _1568;
        77: _5701 <= _1481;
        78: _5701 <= _1685;
        79: _5701 <= _1761;
        80: _5701 <= _1674;
        81: _5701 <= _1878;
        82: _5701 <= _1954;
        83: _5701 <= _1867;
        84: _5701 <= _5645;
        85: _5701 <= _5646;
        86: _5701 <= _5647;
        87: _5701 <= _5648;
        88: _5701 <= _5649;
        89: _5701 <= _5650;
        90: _5701 <= _5651;
        91: _5701 <= _5652;
        92: _5701 <= _5653;
        93: _5701 <= _5654;
        94: _5701 <= _5655;
        95: _5701 <= _5656;
        96: _5701 <= _5660;
        97: _5701 <= _5662;
        98: _5701 <= _5664;
        99: _5701 <= _5665;
        100: _5701 <= _5667;
        101: _5701 <= _5671;
        102: _5701 <= _5672;
        103: _5701 <= _755;
        104: _5701 <= _5676;
        105: _5701 <= _5678;
        106: _5701 <= _5679;
        107: _5701 <= _5680;
        108: _5701 <= _5681;
        109: _5701 <= _5682;
        110: _5701 <= _5683;
        111: _5701 <= _5684;
        112: _5701 <= _5685;
        113: _5701 <= _5686;
        114: _5701 <= _5687;
        115: _5701 <= _5688;
        116: _5701 <= _5689;
        117: _5701 <= _5690;
        118: _5701 <= _5691;
        119: _5701 <= _5692;
        120: _5701 <= _5693;
        121: _5701 <= _5694;
        122: _5701 <= _5695;
        123: _5701 <= _5696;
        124: _5701 <= _5697;
        125: _5701 <= _5698;
        126: _5701 <= _5699;
        default: _5701 <= _5700;
        endcase
    end
    assign _158 = _5701;
    assign _5720 = ~ _5534;
    assign _5704 = _5703 ? vdd : gnd;
    assign _5705 = _5508 ? _5704 : gnd;
    assign _5706 = _5506 ? gnd : _5705;
    assign _159 = _5706;
    always @(posedge _167) begin
        if (_180)
            spi_load <= _5718;
        else
            spi_load <= _159;
    end
    assign _5721 = spi_load & _5720;
    assign _5725 = _5721 ? _158 : spi_out;
    assign _5729 = _5716 ? _5728 : _5725;
    assign _5730 = _5506 ? spi_out : _5729;
    assign _160 = _5730;
    always @(posedge _167) begin
        if (_180)
            spi_out <= _5723;
        else
            spi_out <= _160;
    end
    assign _5749 = spi_out[31:31];
    assign _5543 = _169[2:2];
    always @(posedge _167) begin
        _5546 <= _5543;
    end
    always @(posedge _167) begin
        _5549 <= _5546;
    end
    assign _5731 = _5508 ? _5550 : spi_shift_in;
    assign _5732 = _5506 ? spi_shift_in : _5731;
    assign _161 = _5732;
    always @(posedge _167) begin
        if (_180)
            spi_shift_in <= _5540;
        else
            spi_shift_in <= _161;
    end
    assign _5542 = spi_shift_in[30:0];
    assign _5550 = { _5542, _5549 };
    assign _5733 = _5550[7:0];
    assign _5703 = spi_bitcnt == _5702;
    assign _5734 = _5703 ? _5733 : spi_cmd;
    assign _5735 = _5508 ? _5734 : spi_cmd;
    assign _5736 = _5506 ? spi_cmd : _5735;
    assign _162 = _5736;
    always @(posedge _167) begin
        if (_180)
            spi_cmd <= _211;
        else
            spi_cmd <= _162;
    end
    assign _5534 = spi_cmd[7:7];
    assign _5715 = ~ _5534;
    assign _5741 = spi_bitcnt + _5740;
    assign _5738 = spi_bitcnt == _5737;
    assign _5739 = ~ _5738;
    assign _5742 = _5739 ? _5741 : spi_bitcnt;
    assign _5507 = ~ _5506;
    assign _5498 = ~ _5497;
    assign _5499 = _5494 & _5498;
    assign _5508 = _5499 & _5507;
    assign _5743 = _5508 ? _5742 : spi_bitcnt;
    assign _5745 = _5506 ? _5744 : _5743;
    assign _163 = _5745;
    always @(posedge _167) begin
        if (_180)
            spi_bitcnt <= _5510;
        else
            spi_bitcnt <= _163;
    end
    assign _5712 = spi_bitcnt < _5711;
    assign _5713 = ~ _5712;
    assign _5709 = ~ _5506;
    assign _165 = rst_n;
    always @(posedge _167) begin
        _176 <= _165;
    end
    always @(posedge _167) begin
        _179 <= _176;
    end
    assign _180 = ~ _179;
    always @(posedge _167) begin
        if (_180)
            _5497 <= _5496;
        else
            _5497 <= _5494;
    end
    assign _5488 = _169[0:0];
    always @(posedge _167) begin
        _5491 <= _5488;
    end
    always @(posedge _167) begin
        _5494 <= _5491;
    end
    assign _5707 = ~ _5494;
    assign _5708 = _5707 & _5497;
    assign _5710 = _5708 & _5709;
    assign _5714 = _5710 & _5713;
    assign _5716 = _5714 & _5715;
    assign _5750 = _5716 ? _5749 : spi_miso;
    assign _167 = clk;
    assign _169 = ui_in;
    assign _5500 = _169[1:1];
    always @(posedge _167) begin
        _5503 <= _5500;
    end
    always @(posedge _167) begin
        _5506 <= _5503;
    end
    assign _5751 = _5506 ? spi_miso : _5750;
    assign _170 = _5751;
    always @(posedge _167) begin
        if (_180)
            spi_miso <= _5747;
        else
            spi_miso <= _170;
    end
    assign _5762 = { spi_miso, _5761 };

    /* aliases */

    /* output assignments */
    assign uo_out = _5762;
    assign uio_out = _739;
    assign uio_oe = _204;

endmodule
