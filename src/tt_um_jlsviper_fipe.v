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
    wire _346 = 1'b0;
    wire _345 = 1'b0;
    wire [1:0] _357 = 2'b01;
    wire _358;
    wire [1:0] _354 = 2'b01;
    wire _355;
    wire [1:0] _351 = 2'b01;
    wire _352;
    wire [1:0] _348 = 2'b01;
    wire _349;
    wire _344;
    wire _350;
    wire _333;
    wire _353;
    wire _274;
    wire _356;
    wire _263;
    wire _359;
    wire _2;
    reg pin0_out;
    wire _397 = 1'b0;
    wire _396 = 1'b0;
    wire [1:0] _408 = 2'b01;
    wire _409;
    wire [1:0] _405 = 2'b01;
    wire _406;
    wire [1:0] _402 = 2'b01;
    wire _403;
    wire [1:0] _399 = 2'b01;
    wire _400;
    wire _395;
    wire _401;
    wire _386;
    wire _404;
    wire _377;
    wire _407;
    wire _368;
    wire _410;
    wire _3;
    reg pin1_out;
    wire _448 = 1'b0;
    wire _447 = 1'b0;
    wire [1:0] _459 = 2'b01;
    wire _460;
    wire [1:0] _456 = 2'b01;
    wire _457;
    wire [1:0] _453 = 2'b01;
    wire _454;
    wire [1:0] _450 = 2'b01;
    wire _451;
    wire _446;
    wire _452;
    wire _437;
    wire _455;
    wire _428;
    wire _458;
    wire _419;
    wire _461;
    wire _4;
    reg pin2_out;
    wire _499 = 1'b0;
    wire _498 = 1'b0;
    wire [1:0] _510 = 2'b01;
    wire _511;
    wire [1:0] _507 = 2'b01;
    wire _508;
    wire [1:0] _504 = 2'b01;
    wire _505;
    wire [1:0] _501 = 2'b01;
    wire _502;
    wire _497;
    wire _503;
    wire _488;
    wire _506;
    wire _479;
    wire _509;
    wire _470;
    wire _512;
    wire _5;
    reg pin3_out;
    wire _550 = 1'b0;
    wire _549 = 1'b0;
    wire [1:0] _561 = 2'b01;
    wire _562;
    wire [1:0] _558 = 2'b01;
    wire _559;
    wire [1:0] _555 = 2'b01;
    wire _556;
    wire [1:0] _552 = 2'b01;
    wire _553;
    wire _548;
    wire _554;
    wire _539;
    wire _557;
    wire _530;
    wire _560;
    wire _521;
    wire _563;
    wire _6;
    reg pin4_out;
    wire _601 = 1'b0;
    wire _600 = 1'b0;
    wire [1:0] _612 = 2'b01;
    wire _613;
    wire [1:0] _609 = 2'b01;
    wire _610;
    wire [1:0] _606 = 2'b01;
    wire _607;
    wire [1:0] _603 = 2'b01;
    wire _604;
    wire _599;
    wire _605;
    wire _590;
    wire _608;
    wire _581;
    wire _611;
    wire _572;
    wire _614;
    wire _7;
    reg pin5_out;
    wire _652 = 1'b0;
    wire _651 = 1'b0;
    wire [1:0] _663 = 2'b01;
    wire _664;
    wire [1:0] _660 = 2'b01;
    wire _661;
    wire [1:0] _657 = 2'b01;
    wire _658;
    wire [1:0] _654 = 2'b01;
    wire _655;
    wire _650;
    wire _656;
    wire _641;
    wire _659;
    wire _632;
    wire _662;
    wire _623;
    wire _665;
    wire _8;
    reg pin6_out;
    wire _703 = 1'b0;
    wire _702 = 1'b0;
    wire [1:0] _714 = 2'b01;
    wire _715;
    wire [1:0] _711 = 2'b01;
    wire _712;
    wire [1:0] _708 = 2'b01;
    wire _709;
    wire [1:0] _705 = 2'b01;
    wire _706;
    wire _701;
    wire _707;
    wire _692;
    wire _710;
    wire _683;
    wire _713;
    wire _674;
    wire _716;
    wire _9;
    reg pin7_out;
    wire [7:0] _717;
    wire [6:0] _4721 = 7'b0000000;
    wire [6:0] _4720 = 7'b0000000;
    wire [3:0] _4716 = 4'b0000;
    wire _4717;
    wire _4718;
    wire _4713;
    wire _4714;
    wire _4715;
    wire [6:0] _4719;
    reg [6:0] _4722;
    wire _4708 = 1'b0;
    wire _4707 = 1'b0;
    wire [31:0] _4684 = 32'b00000000000000000000000000000000;
    wire [31:0] _4683 = 32'b00000000000000000000000000000000;
    wire _4688 = 1'b0;
    wire [30:0] _4687;
    wire [31:0] _4689;
    wire [31:0] _4661 = 32'b01000110010010010101000001000101;
    wire [31:0] _4660 = 32'b00000000000000000000000000000000;
    wire [31:0] _4659 = 32'b00000000000000000000000000000000;
    wire [31:0] _4658 = 32'b00000000000000000000000000000000;
    wire [31:0] _4657 = 32'b00000000000000000000000000000000;
    wire [31:0] _4656 = 32'b00000000000000000000000000000000;
    wire [31:0] _4655 = 32'b00000000000000000000000000000000;
    wire [31:0] _4654 = 32'b00000000000000000000000000000000;
    wire [31:0] _4653 = 32'b00000000000000000000000000000000;
    wire [31:0] _4652 = 32'b00000000000000000000000000000000;
    wire [31:0] _4651 = 32'b00000000000000000000000000000000;
    wire [31:0] _4650 = 32'b00000000000000000000000000000000;
    wire [31:0] _4649 = 32'b00000000000000000000000000000000;
    wire [31:0] _4648 = 32'b00000000000000000000000000000000;
    wire [31:0] _4647 = 32'b00000000000000000000000000000000;
    wire [31:0] _4646 = 32'b00000000000000000000000000000000;
    wire [31:0] _4645 = 32'b00000000000000000000000000000000;
    wire [31:0] _4644 = 32'b00000000000000000000000000000000;
    wire [31:0] _4643 = 32'b00000000000000000000000000000000;
    wire [31:0] _4642 = 32'b00000000000000000000000000000000;
    wire [31:0] _4641 = 32'b00000000000000000000000000000000;
    wire [31:0] _4640;
    wire [7:0] _4638 = 8'b00000000;
    wire [31:0] _4639;
    wire [2:0] _4635 = 3'b000;
    wire [14:0] _4636;
    wire [16:0] _4634 = 17'b00000000000000000;
    wire [31:0] _4637;
    wire [31:0] _729 = 32'b00000000000000000000000000000000;
    wire [31:0] _728 = 32'b00000000000000000000000000000000;
    wire [31:0] _759 = 32'b00000000000000000000000000000000;
    wire _754;
    wire _753;
    wire _752;
    wire _751;
    wire _750;
    wire _749;
    wire _748;
    wire _747;
    reg _755;
    wire _745;
    wire _744;
    wire _743;
    wire _742;
    wire _741;
    wire _740;
    wire _739;
    wire _738;
    reg _746;
    wire _756;
    wire [30:0] _731;
    wire [31:0] _757;
    wire [31:0] _758;
    wire [31:0] _760;
    wire [31:0] _11;
    reg [31:0] _730;
    wire [31:0] _4633 = 32'b00000000000000000000000000000000;
    wire _956 = 1'b0;
    wire _955 = 1'b0;
    wire _958;
    wire _959;
    wire _961;
    wire _12;
    reg seq_b_halted;
    wire _963 = 1'b0;
    wire _962 = 1'b0;
    wire [23:0] _969;
    wire [23:0] _970;
    wire _971;
    wire _972;
    wire [23:0] _965;
    wire [23:0] _966;
    wire _967;
    wire _968;
    wire _973;
    wire _974;
    wire _975;
    wire _13;
    reg _964;
    wire _1041 = 1'b0;
    wire _1040 = 1'b0;
    wire [23:0] _990 = 24'b000000000000000000000000;
    wire [23:0] _989 = 24'b000000000000000000000000;
    wire [23:0] _1035;
    wire [23:0] _14;
    reg [23:0] queue_b_last_due;
    wire [23:0] _1044;
    wire _1045;
    wire _1037 = 1'b0;
    wire _1036 = 1'b0;
    wire _1039;
    wire _15;
    reg queue_b_last_valid;
    wire _1043;
    wire _1046;
    wire _1047;
    wire _1048;
    wire _16;
    reg _1042;
    wire _1050 = 1'b0;
    wire _1049 = 1'b0;
    wire [23:0] _1056 = 24'b110000000000000000000000;
    wire _1057;
    wire _1054;
    wire [23:0] _1052;
    wire _1053;
    wire _1055;
    wire _1058;
    wire _1059;
    wire _1060;
    wire _1061;
    wire _17;
    reg _1051;
    wire _1063 = 1'b0;
    wire _1062 = 1'b0;
    wire _1065;
    wire _1066;
    wire _18;
    reg seq_b_trapped;
    wire [4:0] _4631 = 5'b00000;
    wire [5:0] _1068 = 6'b000000;
    wire [5:0] _1067 = 6'b000000;
    wire [5:0] _1077 = 6'b000000;
    wire [5:0] _1074 = 6'b000001;
    wire [5:0] _1075;
    wire [5:0] _1070 = 6'b111111;
    wire _1071;
    wire _1072;
    wire [1:0] _724 = 2'b11;
    wire _725;
    wire _726;
    wire [1:0] _721 = 2'b11;
    wire _722;
    wire _723;
    wire _727;
    wire _1073;
    wire [5:0] _1076;
    wire _720;
    wire [5:0] _1078;
    wire [5:0] _19;
    reg [5:0] _1069;
    wire [6:0] _4630 = 7'b0000000;
    wire [1:0] _4629 = 2'b00;
    wire [31:0] _4632;
    wire [19:0] _4627 = 20'b00000000000000000000;
    wire [31:0] _4628;
    wire [31:0] _4626;
    wire [7:0] _4624 = 8'b00000000;
    wire [31:0] _4625;
    wire [7:0] _4622 = 8'b00000000;
    wire [31:0] _4623;
    wire [2:0] _4619 = 3'b000;
    wire [14:0] _4620;
    wire [16:0] _4618 = 17'b00000000000000000;
    wire [31:0] _4621;
    wire [31:0] _4617 = 32'b00000000000000000000000000000000;
    wire [31:0] _4616 = 32'b00000000000000000000000000000000;
    wire [31:0] _4615 = 32'b00000000000000000000000000000000;
    wire [7:0] _1281 = 8'b00000000;
    wire [7:0] _1280 = 8'b00000000;
    wire [7:0] _1290 = 8'b00000000;
    wire [7:0] _1286 = 8'b00000001;
    wire [7:0] _1287;
    wire [7:0] _1283 = 8'b11111111;
    wire _1284;
    wire _1285;
    wire [7:0] _1288;
    wire [7:0] _1289;
    wire [7:0] _1291;
    wire [7:0] _20;
    reg [7:0] mon0_intervals;
    wire [7:0] _1474 = 8'b00000000;
    wire [7:0] _1473 = 8'b00000000;
    wire [7:0] _1483 = 8'b00000000;
    wire [7:0] _1479 = 8'b00000001;
    wire [7:0] _1480;
    wire [7:0] _1476 = 8'b11111111;
    wire _1477;
    wire _1478;
    wire [7:0] _1481;
    wire [7:0] _1482;
    wire [7:0] _1484;
    wire [7:0] _21;
    reg [7:0] mon1_intervals;
    wire [7:0] _1667 = 8'b00000000;
    wire [7:0] _1666 = 8'b00000000;
    wire [7:0] _1676 = 8'b00000000;
    wire [7:0] _1672 = 8'b00000001;
    wire [7:0] _1673;
    wire [7:0] _1669 = 8'b11111111;
    wire _1670;
    wire _1671;
    wire [7:0] _1674;
    wire [7:0] _1675;
    wire [7:0] _1677;
    wire [7:0] _22;
    reg [7:0] mon2_intervals;
    wire [7:0] _1860 = 8'b00000000;
    wire [7:0] _1859 = 8'b00000000;
    wire [7:0] _1869 = 8'b00000000;
    wire [7:0] _1865 = 8'b00000001;
    wire [7:0] _1866;
    wire [7:0] _1862 = 8'b11111111;
    wire _1863;
    wire _1864;
    wire [7:0] _1867;
    wire [7:0] _1868;
    wire [7:0] _1870;
    wire [7:0] _23;
    reg [7:0] mon3_intervals;
    wire [31:0] _4614;
    wire [15:0] _1872 = 16'b0000000000000000;
    wire [15:0] _1871 = 16'b0000000000000000;
    wire [15:0] _1877 = 16'b1111111111111111;
    wire _1874;
    wire [15:0] _1875;
    wire [15:0] _1876;
    wire [15:0] _1878;
    wire [15:0] _24;
    reg [15:0] mon3_min_seen;
    wire [15:0] _1880 = 16'b0000000000000000;
    wire [15:0] _1879 = 16'b0000000000000000;
    wire [15:0] _1885 = 16'b0000000000000000;
    wire _1882;
    wire [15:0] _1883;
    wire _1858;
    wire [15:0] _1884;
    wire [15:0] _1886;
    wire [15:0] _25;
    reg [15:0] mon3_max_seen;
    wire [31:0] _4613;
    wire [15:0] _1888 = 16'b0000000000000000;
    wire [15:0] _1887 = 16'b0000000000000000;
    wire [15:0] _1893 = 16'b1111111111111111;
    wire _1890;
    wire [15:0] _1891;
    wire [15:0] _1892;
    wire [15:0] _1894;
    wire [15:0] _26;
    reg [15:0] mon2_min_seen;
    wire [15:0] _1896 = 16'b0000000000000000;
    wire [15:0] _1895 = 16'b0000000000000000;
    wire [15:0] _1901 = 16'b0000000000000000;
    wire _1898;
    wire [15:0] _1899;
    wire _1665;
    wire [15:0] _1900;
    wire [15:0] _1902;
    wire [15:0] _27;
    reg [15:0] mon2_max_seen;
    wire [31:0] _4612;
    wire [15:0] _1904 = 16'b0000000000000000;
    wire [15:0] _1903 = 16'b0000000000000000;
    wire [15:0] _1909 = 16'b1111111111111111;
    wire _1906;
    wire [15:0] _1907;
    wire [15:0] _1908;
    wire [15:0] _1910;
    wire [15:0] _28;
    reg [15:0] mon1_min_seen;
    wire [15:0] _1912 = 16'b0000000000000000;
    wire [15:0] _1911 = 16'b0000000000000000;
    wire [15:0] _1917 = 16'b0000000000000000;
    wire _1914;
    wire [15:0] _1915;
    wire _1472;
    wire [15:0] _1916;
    wire [15:0] _1918;
    wire [15:0] _29;
    reg [15:0] mon1_max_seen;
    wire [31:0] _4611;
    wire [15:0] _1920 = 16'b0000000000000000;
    wire [15:0] _1919 = 16'b0000000000000000;
    wire [15:0] _1925 = 16'b1111111111111111;
    wire _1922;
    wire [15:0] _1923;
    wire [15:0] _1924;
    wire [15:0] _1926;
    wire [15:0] _30;
    reg [15:0] mon0_min_seen;
    wire [15:0] _1928 = 16'b0000000000000000;
    wire [15:0] _1927 = 16'b0000000000000000;
    wire [15:0] _1933 = 16'b0000000000000000;
    wire _1930;
    wire [15:0] _1931;
    wire _1279;
    wire [15:0] _1932;
    wire [15:0] _1934;
    wire [15:0] _31;
    reg [15:0] mon0_max_seen;
    wire [31:0] _4610;
    wire [31:0] _4609 = 32'b00000000000000000000000000000000;
    wire [31:0] _4608 = 32'b00000000000000000000000000000000;
    wire [31:0] _4607 = 32'b00000000000000000000000000000000;
    wire [31:0] _4606 = 32'b00000000000000000000000000000000;
    wire [17:0] _4604 = 18'b000000000000000000;
    wire [31:0] _4605;
    wire [4:0] _4601 = 5'b00000;
    wire [4:0] _4600 = 5'b00000;
    wire [4:0] _4598 = 5'b00000;
    wire [4:0] _4597 = 5'b00000;
    wire [4:0] _4596;
    reg [4:0] _4599;
    reg [4:0] _4602;
    wire [26:0] _4595 = 27'b000000000000000000000000000;
    wire [31:0] _4603;
    wire [31:0] _1944 = 32'b00000000000000000000000000000000;
    wire [31:0] _1943 = 32'b00000000000000000000000000000000;
    wire [31:0] _1968 = 32'b00000000000000000000000000000000;
    wire _1963;
    wire _1962;
    wire _1961;
    wire _1960;
    wire _1959;
    wire _1958;
    wire _1957;
    wire _1956;
    reg _1964;
    wire _1954;
    wire _1953;
    wire _1952;
    wire _1951;
    wire _1950;
    wire _1949;
    wire _1948;
    wire _1947;
    reg _1955;
    wire _1965;
    wire [30:0] _1946;
    wire [31:0] _1966;
    wire [31:0] _1967;
    wire [31:0] _1969;
    wire [31:0] _32;
    reg [31:0] _1945;
    wire _2165 = 1'b0;
    wire _2164 = 1'b0;
    wire _2167;
    wire _2168;
    wire _2169;
    wire _33;
    reg seq_a_halted;
    wire _2171 = 1'b0;
    wire _2170 = 1'b0;
    wire [23:0] _2177;
    wire [23:0] _2178;
    wire _2179;
    wire _2180;
    wire [23:0] _2173;
    wire [23:0] _2174;
    wire _2175;
    wire _2176;
    wire _2181;
    wire _2182;
    wire _2183;
    wire _34;
    reg _2172;
    wire _2249 = 1'b0;
    wire _2248 = 1'b0;
    wire [23:0] _2198 = 24'b000000000000000000000000;
    wire [23:0] _2197 = 24'b000000000000000000000000;
    wire [23:0] _2243;
    wire [23:0] _35;
    reg [23:0] queue_a_last_due;
    wire [23:0] _2252;
    wire _2253;
    wire _2245 = 1'b0;
    wire _2244 = 1'b0;
    wire _2247;
    wire _36;
    reg queue_a_last_valid;
    wire _2251;
    wire _2254;
    wire _2255;
    wire _2256;
    wire _37;
    reg _2250;
    wire _2258 = 1'b0;
    wire _2257 = 1'b0;
    wire [23:0] _2264 = 24'b110000000000000000000000;
    wire _2265;
    wire _2262;
    wire [23:0] _2260;
    wire _2261;
    wire _2263;
    wire _2266;
    wire _2267;
    wire _2268;
    wire _2269;
    wire _38;
    reg _2259;
    wire _2271 = 1'b0;
    wire _2270 = 1'b0;
    wire _2273;
    wire _2274;
    wire _39;
    reg seq_a_trapped;
    wire [4:0] _4593 = 5'b00000;
    wire [5:0] _2276 = 6'b000000;
    wire [5:0] _2275 = 6'b000000;
    wire [5:0] _2285 = 6'b000000;
    wire [5:0] _2282 = 6'b000001;
    wire [5:0] _2283;
    wire [5:0] _2278 = 6'b111111;
    wire _2279;
    wire _2280;
    wire [1:0] _1939 = 2'b11;
    wire _1940;
    wire _1941;
    wire [1:0] _1936 = 2'b11;
    wire _1937;
    wire _1938;
    wire _1942;
    wire _2281;
    wire [5:0] _2284;
    wire _718;
    wire _719;
    wire _1935;
    wire [5:0] _2286;
    wire [5:0] _40;
    reg [5:0] _2277;
    wire [1:0] _4592 = 2'b00;
    wire _2398 = 1'b0;
    wire _2397 = 1'b0;
    wire _2394;
    wire [15:0] _2391;
    wire _2392;
    wire _2389;
    wire _1180;
    wire _1179;
    wire _1178;
    wire _1177;
    wire _1176;
    wire _1175;
    wire _1174;
    wire _1173;
    reg _1181;
    wire _1182;
    wire _1167;
    wire _1166;
    wire _1165;
    wire _1164;
    wire _1163;
    wire _1162;
    wire _1161;
    wire _1160;
    reg _1168;
    wire _1169;
    wire _1183;
    wire _1152;
    wire _1153;
    wire _1184;
    wire _1148;
    wire _1146;
    wire _1145;
    wire _1144;
    wire _1143;
    wire _1142;
    wire _1141;
    wire _1140;
    wire _1139;
    wire [2:0] _1138;
    reg _1147;
    wire _1149;
    wire _1136;
    wire _1137;
    wire _1150;
    wire _1134;
    wire _1132;
    wire _1133;
    wire _1129;
    wire _1128;
    wire _1127;
    wire _1126;
    wire _1125;
    wire _1124;
    wire _1123;
    wire _1122;
    reg _1130;
    wire _1119;
    wire _1118;
    wire _1117;
    wire _1116;
    wire _1115;
    wire _1114;
    wire _1113;
    wire _1112;
    wire [2:0] _1102;
    reg _1120;
    wire _1121;
    wire _1131;
    wire [1:0] _1101;
    reg _1135;
    wire _1151;
    wire _1185;
    wire _1092 = 1'b0;
    wire _1091 = 1'b0;
    wire _2359;
    wire _1277;
    wire _1202;
    wire [15:0] _1197 = 16'b0000000000000000;
    wire [15:0] _1196 = 16'b0000000000000000;
    wire [15:0] _2384 = 16'b0000000000000001;
    wire [15:0] _2381 = 16'b0000000000000001;
    wire [15:0] _2382;
    wire [15:0] _2377 = 16'b1111111111111111;
    wire _2378;
    wire _2379;
    wire [11:0] _2373 = 12'b111111111111;
    wire _2374;
    wire [7:0] _2371 = 8'b11111111;
    wire [7:0] _2370;
    wire _2372;
    wire [3:0] _2368 = 4'b1111;
    wire [3:0] _2367;
    wire _2369;
    wire [1:0] _2363;
    reg _2375;
    wire _2376;
    wire _2380;
    wire [15:0] _2383;
    wire [15:0] _2385;
    wire [15:0] _2386;
    wire [15:0] _41;
    reg [15:0] mon0_count_cycles;
    wire [6:0] _1191 = 7'b1001001;
    wire _1192;
    wire _1193;
    wire [31:0] _1190 = 32'b00000000000000000000000000000000;
    wire [31:0] _1189 = 32'b00000000000000000000000000000000;
    reg [31:0] _1194;
    wire [15:0] _1195;
    wire _1199;
    wire _1188;
    wire _1200;
    wire _1187;
    wire _1201;
    wire _1203;
    wire _1278;
    wire _1275;
    wire _1268;
    wire _1267;
    wire _1266;
    wire _1265;
    wire _1264;
    wire _1263;
    wire _1262;
    wire _1261;
    reg _1269;
    wire _1270;
    wire _1258;
    wire _1257;
    wire _1256;
    wire _1255;
    wire _1254;
    wire _1253;
    wire _1252;
    wire _1251;
    reg _1259;
    wire _1260;
    wire _1271;
    wire _1249;
    wire _1250;
    wire _1272;
    wire _1245;
    wire _1243;
    wire _1242;
    wire _1241;
    wire _1240;
    wire _1239;
    wire _1238;
    wire _1237;
    wire _1236;
    wire [2:0] _1235;
    reg _1244;
    wire _1246;
    wire _1233;
    wire _1234;
    wire _1247;
    wire _1231;
    wire _1229;
    wire _1230;
    wire _1226;
    wire _1225;
    wire _1224;
    wire _1223;
    wire _1222;
    wire _1221;
    wire _1220;
    wire _1219;
    reg _1227;
    wire _1216;
    wire _1215;
    wire _1214;
    wire _1213;
    wire _1212;
    wire _1211;
    wire _1210;
    wire _1209;
    wire [2:0] _1208;
    reg _1217;
    wire _1218;
    wire _1228;
    wire [1:0] _1207;
    reg _1232;
    wire _1248;
    wire _1273;
    wire _1205;
    wire _1204;
    wire _1206;
    wire _1274;
    wire _1276;
    wire _2355;
    wire _2356;
    wire _2357;
    wire _2358;
    wire _2360;
    wire _2361;
    wire _2348;
    wire _2347;
    wire _2346;
    wire _2345;
    wire _2344;
    wire _2343;
    wire _2342;
    wire _2341;
    reg _2349;
    wire _2350;
    wire _2338;
    wire _2337;
    wire _2336;
    wire _2335;
    wire _2334;
    wire _2333;
    wire _2332;
    wire _2331;
    reg _2339;
    wire _2340;
    wire _2351;
    wire _2329;
    wire _2330;
    wire _2352;
    wire _2325;
    wire _2323;
    wire _2322;
    wire _2321;
    wire _2320;
    wire _2319;
    wire _2318;
    wire _2317;
    wire _2316;
    wire [2:0] _2315;
    reg _2324;
    wire _2326;
    wire _2313;
    wire _2314;
    wire _2327;
    wire _2311;
    wire _2309;
    wire _2310;
    wire _2306;
    wire _2305;
    wire _2304;
    wire _2303;
    wire _2302;
    wire _2301;
    wire _2300;
    wire _2299;
    reg _2307;
    wire _2296;
    wire _2295;
    wire _2294;
    wire _2293;
    wire _2292;
    wire _2291;
    wire _2290;
    wire _2289;
    wire [2:0] _2288;
    reg _2297;
    wire _2298;
    wire _2308;
    wire [6:0] _1097 = 7'b1001000;
    wire _1098;
    wire _1099;
    wire [31:0] _1096 = 32'b00000000000000000000000000000000;
    wire [31:0] _1095 = 32'b00000000000000000000000000000000;
    reg [31:0] _1100;
    wire [1:0] _2287;
    reg _2312;
    wire _2328;
    wire _2353;
    wire _2354;
    wire _2362;
    wire _2387;
    wire _2388;
    wire _42;
    reg mon0_armed;
    wire [6:0] _1085 = 7'b1001010;
    wire _1086;
    wire _1087;
    wire [7:0] _1084 = 8'b00000000;
    wire [7:0] _1083 = 8'b00000000;
    wire [7:0] _1082;
    reg [7:0] _1088;
    wire [23:0] _1081 = 24'b000000000000000000000000;
    wire [31:0] _1089;
    wire _1090;
    wire _1094;
    wire _1186;
    wire _2390;
    wire _2393;
    wire _2395;
    wire _2396;
    wire _2400;
    wire _2401;
    wire _43;
    reg mon0_sticky;
    wire _2510 = 1'b0;
    wire _2509 = 1'b0;
    wire _2506;
    wire [15:0] _2503;
    wire _2504;
    wire _2501;
    wire _1373;
    wire _1372;
    wire _1371;
    wire _1370;
    wire _1369;
    wire _1368;
    wire _1367;
    wire _1366;
    reg _1374;
    wire _1375;
    wire _1363;
    wire _1362;
    wire _1361;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    reg _1364;
    wire _1365;
    wire _1376;
    wire _1354;
    wire _1355;
    wire _1377;
    wire _1350;
    wire _1348;
    wire _1347;
    wire _1346;
    wire _1345;
    wire _1344;
    wire _1343;
    wire _1342;
    wire _1341;
    wire [2:0] _1340;
    reg _1349;
    wire _1351;
    wire _1338;
    wire _1339;
    wire _1352;
    wire _1336;
    wire _1334;
    wire _1335;
    wire _1331;
    wire _1330;
    wire _1329;
    wire _1328;
    wire _1327;
    wire _1326;
    wire _1325;
    wire _1324;
    reg _1332;
    wire _1321;
    wire _1320;
    wire _1319;
    wire _1318;
    wire _1317;
    wire _1316;
    wire _1315;
    wire _1314;
    wire [2:0] _1313;
    reg _1322;
    wire _1323;
    wire _1333;
    wire [1:0] _1312;
    reg _1337;
    wire _1353;
    wire _1378;
    wire _1303 = 1'b0;
    wire _1302 = 1'b0;
    wire _2474;
    wire _1470;
    wire _1395;
    wire [15:0] _1390 = 16'b0000000000000000;
    wire [15:0] _1389 = 16'b0000000000000000;
    wire [15:0] _2496 = 16'b0000000000000001;
    wire [15:0] _2493 = 16'b0000000000000001;
    wire [15:0] _2494;
    wire [15:0] _2489 = 16'b1111111111111111;
    wire _2490;
    wire _2491;
    wire [11:0] _2485 = 12'b111111111111;
    wire _2486;
    wire [7:0] _2483 = 8'b11111111;
    wire [7:0] _2482;
    wire _2484;
    wire [3:0] _2480 = 4'b1111;
    wire [3:0] _2479;
    wire _2481;
    wire [1:0] _2478;
    reg _2487;
    wire _2488;
    wire _2492;
    wire [15:0] _2495;
    wire [15:0] _2497;
    wire [15:0] _2498;
    wire [15:0] _44;
    reg [15:0] mon1_count_cycles;
    wire [6:0] _1384 = 7'b1001100;
    wire _1385;
    wire _1386;
    wire [31:0] _1383 = 32'b00000000000000000000000000000000;
    wire [31:0] _1382 = 32'b00000000000000000000000000000000;
    reg [31:0] _1387;
    wire [15:0] _1388;
    wire _1392;
    wire _1381;
    wire _1393;
    wire _1380;
    wire _1394;
    wire _1396;
    wire _1471;
    wire _1468;
    wire _1461;
    wire _1460;
    wire _1459;
    wire _1458;
    wire _1457;
    wire _1456;
    wire _1455;
    wire _1454;
    reg _1462;
    wire _1463;
    wire _1451;
    wire _1450;
    wire _1449;
    wire _1448;
    wire _1447;
    wire _1446;
    wire _1445;
    wire _1444;
    reg _1452;
    wire _1453;
    wire _1464;
    wire _1442;
    wire _1443;
    wire _1465;
    wire _1438;
    wire _1436;
    wire _1435;
    wire _1434;
    wire _1433;
    wire _1432;
    wire _1431;
    wire _1430;
    wire _1429;
    wire [2:0] _1428;
    reg _1437;
    wire _1439;
    wire _1426;
    wire _1427;
    wire _1440;
    wire _1424;
    wire _1422;
    wire _1423;
    wire _1419;
    wire _1418;
    wire _1417;
    wire _1416;
    wire _1415;
    wire _1414;
    wire _1413;
    wire _1412;
    reg _1420;
    wire _1409;
    wire _1408;
    wire _1407;
    wire _1406;
    wire _1405;
    wire _1404;
    wire _1403;
    wire _1402;
    wire [2:0] _1401;
    reg _1410;
    wire _1411;
    wire _1421;
    wire [1:0] _1400;
    reg _1425;
    wire _1441;
    wire _1466;
    wire _1398;
    wire _1397;
    wire _1399;
    wire _1467;
    wire _1469;
    wire _2470;
    wire _2471;
    wire _2472;
    wire _2473;
    wire _2475;
    wire _2476;
    wire _2463;
    wire _2462;
    wire _2461;
    wire _2460;
    wire _2459;
    wire _2458;
    wire _2457;
    wire _2456;
    reg _2464;
    wire _2465;
    wire _2453;
    wire _2452;
    wire _2451;
    wire _2450;
    wire _2449;
    wire _2448;
    wire _2447;
    wire _2446;
    reg _2454;
    wire _2455;
    wire _2466;
    wire _2444;
    wire _2445;
    wire _2467;
    wire _2440;
    wire _2438;
    wire _2437;
    wire _2436;
    wire _2435;
    wire _2434;
    wire _2433;
    wire _2432;
    wire _2431;
    wire [2:0] _2430;
    reg _2439;
    wire _2441;
    wire _2428;
    wire _2429;
    wire _2442;
    wire _2426;
    wire _2424;
    wire _2425;
    wire _2421;
    wire _2420;
    wire _2419;
    wire _2418;
    wire _2417;
    wire _2416;
    wire _2415;
    wire _2414;
    reg _2422;
    wire _2411;
    wire _2410;
    wire _2409;
    wire _2408;
    wire _2407;
    wire _2406;
    wire _2405;
    wire _2404;
    wire [2:0] _2403;
    reg _2412;
    wire _2413;
    wire _2423;
    wire [6:0] _1308 = 7'b1001011;
    wire _1309;
    wire _1310;
    wire [31:0] _1307 = 32'b00000000000000000000000000000000;
    wire [31:0] _1306 = 32'b00000000000000000000000000000000;
    reg [31:0] _1311;
    wire [1:0] _2402;
    reg _2427;
    wire _2443;
    wire _2468;
    wire _2469;
    wire _2477;
    wire _2499;
    wire _2500;
    wire _45;
    reg mon1_armed;
    wire [6:0] _1296 = 7'b1001101;
    wire _1297;
    wire _1298;
    wire [7:0] _1295 = 8'b00000000;
    wire [7:0] _1294 = 8'b00000000;
    wire [7:0] _1293;
    reg [7:0] _1299;
    wire [23:0] _1292 = 24'b000000000000000000000000;
    wire [31:0] _1300;
    wire _1301;
    wire _1305;
    wire _1379;
    wire _2502;
    wire _2505;
    wire _2507;
    wire _2508;
    wire _2512;
    wire _2513;
    wire _46;
    reg mon1_sticky;
    wire _2622 = 1'b0;
    wire _2621 = 1'b0;
    wire _2618;
    wire [15:0] _2615;
    wire _2616;
    wire _2613;
    wire _1566;
    wire _1565;
    wire _1564;
    wire _1563;
    wire _1562;
    wire _1561;
    wire _1560;
    wire _1559;
    reg _1567;
    wire _1568;
    wire _1556;
    wire _1555;
    wire _1554;
    wire _1553;
    wire _1552;
    wire _1551;
    wire _1550;
    wire _1549;
    reg _1557;
    wire _1558;
    wire _1569;
    wire _1547;
    wire _1548;
    wire _1570;
    wire _1543;
    wire _1541;
    wire _1540;
    wire _1539;
    wire _1538;
    wire _1537;
    wire _1536;
    wire _1535;
    wire _1534;
    wire [2:0] _1533;
    reg _1542;
    wire _1544;
    wire _1531;
    wire _1532;
    wire _1545;
    wire _1529;
    wire _1527;
    wire _1528;
    wire _1524;
    wire _1523;
    wire _1522;
    wire _1521;
    wire _1520;
    wire _1519;
    wire _1518;
    wire _1517;
    reg _1525;
    wire _1514;
    wire _1513;
    wire _1512;
    wire _1511;
    wire _1510;
    wire _1509;
    wire _1508;
    wire _1507;
    wire [2:0] _1506;
    reg _1515;
    wire _1516;
    wire _1526;
    wire [1:0] _1505;
    reg _1530;
    wire _1546;
    wire _1571;
    wire _1496 = 1'b0;
    wire _1495 = 1'b0;
    wire _2586;
    wire _1663;
    wire _1588;
    wire [15:0] _1583 = 16'b0000000000000000;
    wire [15:0] _1582 = 16'b0000000000000000;
    wire [15:0] _2608 = 16'b0000000000000001;
    wire [15:0] _2605 = 16'b0000000000000001;
    wire [15:0] _2606;
    wire [15:0] _2601 = 16'b1111111111111111;
    wire _2602;
    wire _2603;
    wire [11:0] _2597 = 12'b111111111111;
    wire _2598;
    wire [7:0] _2595 = 8'b11111111;
    wire [7:0] _2594;
    wire _2596;
    wire [3:0] _2592 = 4'b1111;
    wire [3:0] _2591;
    wire _2593;
    wire [1:0] _2590;
    reg _2599;
    wire _2600;
    wire _2604;
    wire [15:0] _2607;
    wire [15:0] _2609;
    wire [15:0] _2610;
    wire [15:0] _47;
    reg [15:0] mon2_count_cycles;
    wire [6:0] _1577 = 7'b1001111;
    wire _1578;
    wire _1579;
    wire [31:0] _1576 = 32'b00000000000000000000000000000000;
    wire [31:0] _1575 = 32'b00000000000000000000000000000000;
    reg [31:0] _1580;
    wire [15:0] _1581;
    wire _1585;
    wire _1574;
    wire _1586;
    wire _1573;
    wire _1587;
    wire _1589;
    wire _1664;
    wire _1661;
    wire _1654;
    wire _1653;
    wire _1652;
    wire _1651;
    wire _1650;
    wire _1649;
    wire _1648;
    wire _1647;
    reg _1655;
    wire _1656;
    wire _1644;
    wire _1643;
    wire _1642;
    wire _1641;
    wire _1640;
    wire _1639;
    wire _1638;
    wire _1637;
    reg _1645;
    wire _1646;
    wire _1657;
    wire _1635;
    wire _1636;
    wire _1658;
    wire _1631;
    wire _1629;
    wire _1628;
    wire _1627;
    wire _1626;
    wire _1625;
    wire _1624;
    wire _1623;
    wire _1622;
    wire [2:0] _1621;
    reg _1630;
    wire _1632;
    wire _1619;
    wire _1620;
    wire _1633;
    wire _1617;
    wire _1615;
    wire _1616;
    wire _1612;
    wire _1611;
    wire _1610;
    wire _1609;
    wire _1608;
    wire _1607;
    wire _1606;
    wire _1605;
    reg _1613;
    wire _1602;
    wire _1601;
    wire _1600;
    wire _1599;
    wire _1598;
    wire _1597;
    wire _1596;
    wire _1595;
    wire [2:0] _1594;
    reg _1603;
    wire _1604;
    wire _1614;
    wire [1:0] _1593;
    reg _1618;
    wire _1634;
    wire _1659;
    wire _1591;
    wire _1590;
    wire _1592;
    wire _1660;
    wire _1662;
    wire _2582;
    wire _2583;
    wire _2584;
    wire _2585;
    wire _2587;
    wire _2588;
    wire _2575;
    wire _2574;
    wire _2573;
    wire _2572;
    wire _2571;
    wire _2570;
    wire _2569;
    wire _2568;
    reg _2576;
    wire _2577;
    wire _2565;
    wire _2564;
    wire _2563;
    wire _2562;
    wire _2561;
    wire _2560;
    wire _2559;
    wire _2558;
    reg _2566;
    wire _2567;
    wire _2578;
    wire _2556;
    wire _2557;
    wire _2579;
    wire _2552;
    wire _2550;
    wire _2549;
    wire _2548;
    wire _2547;
    wire _2546;
    wire _2545;
    wire _2544;
    wire _2543;
    wire [2:0] _2542;
    reg _2551;
    wire _2553;
    wire _2540;
    wire _2541;
    wire _2554;
    wire _2538;
    wire _2536;
    wire _2537;
    wire _2533;
    wire _2532;
    wire _2531;
    wire _2530;
    wire _2529;
    wire _2528;
    wire _2527;
    wire _2526;
    reg _2534;
    wire _2523;
    wire _2522;
    wire _2521;
    wire _2520;
    wire _2519;
    wire _2518;
    wire _2517;
    wire _2516;
    wire [2:0] _2515;
    reg _2524;
    wire _2525;
    wire _2535;
    wire [6:0] _1501 = 7'b1001110;
    wire _1502;
    wire _1503;
    wire [31:0] _1500 = 32'b00000000000000000000000000000000;
    wire [31:0] _1499 = 32'b00000000000000000000000000000000;
    reg [31:0] _1504;
    wire [1:0] _2514;
    reg _2539;
    wire _2555;
    wire _2580;
    wire _2581;
    wire _2589;
    wire _2611;
    wire _2612;
    wire _48;
    reg mon2_armed;
    wire [6:0] _1489 = 7'b1010000;
    wire _1490;
    wire _1491;
    wire [7:0] _1488 = 8'b00000000;
    wire [7:0] _1487 = 8'b00000000;
    wire [7:0] _1486;
    reg [7:0] _1492;
    wire [23:0] _1485 = 24'b000000000000000000000000;
    wire [31:0] _1493;
    wire _1494;
    wire _1498;
    wire _1572;
    wire _2614;
    wire _2617;
    wire _2619;
    wire _2620;
    wire _2624;
    wire _2625;
    wire _49;
    reg mon2_sticky;
    wire _2896 = 1'b0;
    wire _2895 = 1'b0;
    wire _2892;
    wire [15:0] _2889;
    wire _2890;
    wire _2887;
    wire _1759;
    wire _1758;
    wire _1757;
    wire _1756;
    wire _1755;
    wire _1754;
    wire _1753;
    wire _1752;
    reg _1760;
    wire _1761;
    wire _1749;
    wire _1748;
    wire _1747;
    wire _1746;
    wire _1745;
    wire _1744;
    wire _1743;
    wire _1742;
    reg _1750;
    wire _1751;
    wire _1762;
    wire _1740;
    wire _1741;
    wire _1763;
    wire _1736;
    wire _1734;
    wire _1733;
    wire _1732;
    wire _1731;
    wire _1730;
    wire _1729;
    wire _1728;
    wire _1727;
    wire [2:0] _1726;
    reg _1735;
    wire _1737;
    wire _1724;
    wire _1725;
    wire _1738;
    wire _1722;
    wire _1720;
    wire _1721;
    wire _1717;
    wire _1716;
    wire _1715;
    wire _1714;
    wire _1713;
    wire _1712;
    wire _1711;
    wire _1710;
    reg _1718;
    wire _1707;
    wire _1706;
    wire _1705;
    wire _1704;
    wire _1703;
    wire _1702;
    wire _1701;
    wire _1700;
    wire [2:0] _1699;
    reg _1708;
    wire _1709;
    wire _1719;
    wire [1:0] _1698;
    reg _1723;
    wire _1739;
    wire _1764;
    wire _1689 = 1'b0;
    wire _1688 = 1'b0;
    wire _2700;
    wire _1856;
    wire _1781;
    wire [15:0] _1776 = 16'b0000000000000000;
    wire [15:0] _1775 = 16'b0000000000000000;
    wire [15:0] _2722 = 16'b0000000000000001;
    wire [15:0] _2719 = 16'b0000000000000001;
    wire [15:0] _2720;
    wire [15:0] _2715 = 16'b1111111111111111;
    wire _2716;
    wire _2717;
    wire [11:0] _2711 = 12'b111111111111;
    wire _2712;
    wire [7:0] _2709 = 8'b11111111;
    wire [7:0] _2708;
    wire _2710;
    wire [3:0] _2706 = 4'b1111;
    wire [11:0] _2365 = 12'b000000000000;
    wire [11:0] _2364 = 12'b000000000000;
    wire [11:0] _2626 = 12'b000000000001;
    wire [11:0] _2627;
    wire [11:0] _50;
    reg [11:0] _2366;
    wire [3:0] _2705;
    wire _2707;
    wire [1:0] _2704;
    reg _2713;
    wire _2714;
    wire _2718;
    wire [15:0] _2721;
    wire [15:0] _2723;
    wire [15:0] _2724;
    wire [15:0] _51;
    reg [15:0] mon3_count_cycles;
    wire [6:0] _1770 = 7'b1010010;
    wire _1771;
    wire _1772;
    wire [31:0] _1769 = 32'b00000000000000000000000000000000;
    wire [31:0] _1768 = 32'b00000000000000000000000000000000;
    reg [31:0] _1773;
    wire [15:0] _1774;
    wire _1778;
    wire _1767;
    wire _1779;
    wire _1766;
    wire _1780;
    wire _1782;
    wire _1857;
    wire _1854;
    wire _1847;
    wire _1846;
    wire _1845;
    wire _1844;
    wire _1843;
    wire _1842;
    wire _1841;
    wire _1840;
    reg _1848;
    wire _1849;
    wire _1837;
    wire _1836;
    wire _1835;
    wire _1834;
    wire _1833;
    wire _1832;
    wire _1831;
    wire _1830;
    reg _1838;
    wire _1839;
    wire _1850;
    wire _1828;
    wire _1829;
    wire _1851;
    wire _1824;
    wire _1822;
    wire _1821;
    wire _1820;
    wire _1819;
    wire _1818;
    wire _1817;
    wire _1816;
    wire _1815;
    wire [2:0] _1814;
    reg _1823;
    wire _1825;
    wire _1812;
    wire _1813;
    wire _1826;
    wire _1810;
    wire _1808;
    wire _1809;
    wire _1805;
    wire _1804;
    wire _1803;
    wire _1802;
    wire _1801;
    wire _1800;
    wire _1799;
    wire _1798;
    reg _1806;
    wire _1795;
    wire _1794;
    wire _1793;
    wire _1792;
    wire _1791;
    wire _1790;
    wire _1789;
    wire _1788;
    wire [2:0] _1787;
    reg _1796;
    wire _1797;
    wire _1807;
    wire [1:0] _1786;
    reg _1811;
    wire _1827;
    wire _1852;
    wire _1784;
    wire _1783;
    wire _1785;
    wire _1853;
    wire _1855;
    wire _2696;
    wire _2697;
    wire _2698;
    wire _2699;
    wire _2701;
    wire _2702;
    wire _2689;
    wire _2688;
    wire _2687;
    wire _2686;
    wire _2685;
    wire _2684;
    wire _2683;
    wire [7:0] _1171 = 8'b00000000;
    wire [7:0] _1170 = 8'b00000000;
    reg [7:0] _1172;
    wire _2682;
    reg _2690;
    wire _2691;
    wire _2679;
    wire _2678;
    wire _2677;
    wire _2676;
    wire _2675;
    wire _2674;
    wire _2673;
    wire [7:0] _1158 = 8'b00000000;
    wire [7:0] _1157 = 8'b00000000;
    wire [7:0] _1155 = 8'b00000000;
    wire [7:0] _1154 = 8'b00000000;
    wire _186 = 1'b0;
    wire _185 = 1'b0;
    wire [1:0] _2737 = 2'b10;
    wire _2738;
    wire [1:0] _341 = 2'b01;
    wire _342;
    wire [1:0] _339 = 2'b00;
    wire _340;
    wire _343;
    wire _2739;
    wire [2:0] _335 = 3'b000;
    wire _336;
    wire _337;
    wire _2740;
    wire _2741;
    wire [1:0] _2733 = 2'b10;
    wire _2734;
    wire [1:0] _330 = 2'b01;
    wire _331;
    wire [1:0] _328 = 2'b00;
    wire _329;
    wire _332;
    wire _2735;
    wire [2:0] _324 = 3'b000;
    wire _325;
    wire _326;
    wire _2736;
    wire _2742;
    wire [1:0] _2729 = 2'b10;
    wire _2730;
    wire [1:0] _271 = 2'b01;
    wire _272;
    wire [1:0] _269 = 2'b00;
    wire _270;
    wire _273;
    wire _2731;
    wire [2:0] _265 = 3'b000;
    wire _266;
    wire _267;
    wire _2732;
    wire _2743;
    wire [1:0] _2725 = 2'b10;
    wire _2726;
    wire [1:0] _260 = 2'b01;
    wire _261;
    wire [1:0] _258 = 2'b00;
    wire _259;
    wire _262;
    wire _2727;
    wire [2:0] _254 = 3'b000;
    wire _255;
    wire _256;
    wire _2728;
    wire _2744;
    wire _52;
    reg pin0_oe;
    wire _183 = 1'b0;
    wire _182 = 1'b0;
    wire [1:0] _2757 = 2'b10;
    wire _2758;
    wire [1:0] _392 = 2'b01;
    wire _393;
    wire [1:0] _390 = 2'b00;
    wire _391;
    wire _394;
    wire _2759;
    wire [2:0] _387 = 3'b001;
    wire _388;
    wire _389;
    wire _2760;
    wire _2761;
    wire [1:0] _2753 = 2'b10;
    wire _2754;
    wire [1:0] _383 = 2'b01;
    wire _384;
    wire [1:0] _381 = 2'b00;
    wire _382;
    wire _385;
    wire _2755;
    wire [2:0] _378 = 3'b001;
    wire _379;
    wire _380;
    wire _2756;
    wire _2762;
    wire [1:0] _2749 = 2'b10;
    wire _2750;
    wire [1:0] _374 = 2'b01;
    wire _375;
    wire [1:0] _372 = 2'b00;
    wire _373;
    wire _376;
    wire _2751;
    wire [2:0] _369 = 3'b001;
    wire _370;
    wire _371;
    wire _2752;
    wire _2763;
    wire [1:0] _2745 = 2'b10;
    wire _2746;
    wire [1:0] _365 = 2'b01;
    wire _366;
    wire [1:0] _363 = 2'b00;
    wire _364;
    wire _367;
    wire _2747;
    wire [2:0] _360 = 3'b001;
    wire _361;
    wire _362;
    wire _2748;
    wire _2764;
    wire _53;
    reg pin1_oe;
    wire _180 = 1'b0;
    wire _179 = 1'b0;
    wire [1:0] _2777 = 2'b10;
    wire _2778;
    wire [1:0] _443 = 2'b01;
    wire _444;
    wire [1:0] _441 = 2'b00;
    wire _442;
    wire _445;
    wire _2779;
    wire [2:0] _438 = 3'b010;
    wire _439;
    wire _440;
    wire _2780;
    wire _2781;
    wire [1:0] _2773 = 2'b10;
    wire _2774;
    wire [1:0] _434 = 2'b01;
    wire _435;
    wire [1:0] _432 = 2'b00;
    wire _433;
    wire _436;
    wire _2775;
    wire [2:0] _429 = 3'b010;
    wire _430;
    wire _431;
    wire _2776;
    wire _2782;
    wire [1:0] _2769 = 2'b10;
    wire _2770;
    wire [1:0] _425 = 2'b01;
    wire _426;
    wire [1:0] _423 = 2'b00;
    wire _424;
    wire _427;
    wire _2771;
    wire [2:0] _420 = 3'b010;
    wire _421;
    wire _422;
    wire _2772;
    wire _2783;
    wire [1:0] _2765 = 2'b10;
    wire _2766;
    wire [1:0] _416 = 2'b01;
    wire _417;
    wire [1:0] _414 = 2'b00;
    wire _415;
    wire _418;
    wire _2767;
    wire [2:0] _411 = 3'b010;
    wire _412;
    wire _413;
    wire _2768;
    wire _2784;
    wire _54;
    reg pin2_oe;
    wire _177 = 1'b0;
    wire _176 = 1'b0;
    wire [1:0] _2797 = 2'b10;
    wire _2798;
    wire [1:0] _494 = 2'b01;
    wire _495;
    wire [1:0] _492 = 2'b00;
    wire _493;
    wire _496;
    wire _2799;
    wire [2:0] _489 = 3'b011;
    wire _490;
    wire _491;
    wire _2800;
    wire _2801;
    wire [1:0] _2793 = 2'b10;
    wire _2794;
    wire [1:0] _485 = 2'b01;
    wire _486;
    wire [1:0] _483 = 2'b00;
    wire _484;
    wire _487;
    wire _2795;
    wire [2:0] _480 = 3'b011;
    wire _481;
    wire _482;
    wire _2796;
    wire _2802;
    wire [1:0] _2789 = 2'b10;
    wire _2790;
    wire [1:0] _476 = 2'b01;
    wire _477;
    wire [1:0] _474 = 2'b00;
    wire _475;
    wire _478;
    wire _2791;
    wire [2:0] _471 = 3'b011;
    wire _472;
    wire _473;
    wire _2792;
    wire _2803;
    wire [1:0] _2785 = 2'b10;
    wire _2786;
    wire [1:0] _467 = 2'b01;
    wire _468;
    wire [1:0] _465 = 2'b00;
    wire _466;
    wire _469;
    wire _2787;
    wire [2:0] _462 = 3'b011;
    wire _463;
    wire _464;
    wire _2788;
    wire _2804;
    wire _55;
    reg pin3_oe;
    wire _174 = 1'b0;
    wire _173 = 1'b0;
    wire [1:0] _2817 = 2'b10;
    wire _2818;
    wire [1:0] _545 = 2'b01;
    wire _546;
    wire [1:0] _543 = 2'b00;
    wire _544;
    wire _547;
    wire _2819;
    wire [2:0] _540 = 3'b100;
    wire _541;
    wire _542;
    wire _2820;
    wire _2821;
    wire [1:0] _2813 = 2'b10;
    wire _2814;
    wire [1:0] _536 = 2'b01;
    wire _537;
    wire [1:0] _534 = 2'b00;
    wire _535;
    wire _538;
    wire _2815;
    wire [2:0] _531 = 3'b100;
    wire _532;
    wire _533;
    wire _2816;
    wire _2822;
    wire [1:0] _2809 = 2'b10;
    wire _2810;
    wire [1:0] _527 = 2'b01;
    wire _528;
    wire [1:0] _525 = 2'b00;
    wire _526;
    wire _529;
    wire _2811;
    wire [2:0] _522 = 3'b100;
    wire _523;
    wire _524;
    wire _2812;
    wire _2823;
    wire [1:0] _2805 = 2'b10;
    wire _2806;
    wire [1:0] _518 = 2'b01;
    wire _519;
    wire [1:0] _516 = 2'b00;
    wire _517;
    wire _520;
    wire _2807;
    wire [2:0] _513 = 3'b100;
    wire _514;
    wire _515;
    wire _2808;
    wire _2824;
    wire _56;
    reg pin4_oe;
    wire _171 = 1'b0;
    wire _170 = 1'b0;
    wire [1:0] _2837 = 2'b10;
    wire _2838;
    wire [1:0] _596 = 2'b01;
    wire _597;
    wire [1:0] _594 = 2'b00;
    wire _595;
    wire _598;
    wire _2839;
    wire [2:0] _591 = 3'b101;
    wire _592;
    wire _593;
    wire _2840;
    wire _2841;
    wire [1:0] _2833 = 2'b10;
    wire _2834;
    wire [1:0] _587 = 2'b01;
    wire _588;
    wire [1:0] _585 = 2'b00;
    wire _586;
    wire _589;
    wire _2835;
    wire [2:0] _582 = 3'b101;
    wire _583;
    wire _584;
    wire _2836;
    wire _2842;
    wire [1:0] _2829 = 2'b10;
    wire _2830;
    wire [1:0] _578 = 2'b01;
    wire _579;
    wire [1:0] _576 = 2'b00;
    wire _577;
    wire _580;
    wire _2831;
    wire [2:0] _573 = 3'b101;
    wire _574;
    wire _575;
    wire _2832;
    wire _2843;
    wire [1:0] _2825 = 2'b10;
    wire _2826;
    wire [1:0] _569 = 2'b01;
    wire _570;
    wire [1:0] _567 = 2'b00;
    wire _568;
    wire _571;
    wire _2827;
    wire [2:0] _564 = 3'b101;
    wire _565;
    wire _566;
    wire _2828;
    wire _2844;
    wire _57;
    reg pin5_oe;
    wire _168 = 1'b0;
    wire _167 = 1'b0;
    wire [1:0] _2857 = 2'b10;
    wire _2858;
    wire [1:0] _647 = 2'b01;
    wire _648;
    wire [1:0] _645 = 2'b00;
    wire _646;
    wire _649;
    wire _2859;
    wire [2:0] _642 = 3'b110;
    wire _643;
    wire _644;
    wire _2860;
    wire _2861;
    wire [1:0] _2853 = 2'b10;
    wire _2854;
    wire [1:0] _638 = 2'b01;
    wire _639;
    wire [1:0] _636 = 2'b00;
    wire _637;
    wire _640;
    wire _2855;
    wire [2:0] _633 = 3'b110;
    wire _634;
    wire _635;
    wire _2856;
    wire _2862;
    wire [1:0] _2849 = 2'b10;
    wire _2850;
    wire [1:0] _629 = 2'b01;
    wire _630;
    wire [1:0] _627 = 2'b00;
    wire _628;
    wire _631;
    wire _2851;
    wire [2:0] _624 = 3'b110;
    wire _625;
    wire _626;
    wire _2852;
    wire _2863;
    wire [1:0] _2845 = 2'b10;
    wire _2846;
    wire [1:0] _620 = 2'b01;
    wire _621;
    wire [1:0] _618 = 2'b00;
    wire _619;
    wire _622;
    wire _2847;
    wire [2:0] _615 = 3'b110;
    wire _616;
    wire _617;
    wire _2848;
    wire _2864;
    wire _58;
    reg pin6_oe;
    wire _165 = 1'b0;
    wire _156 = 1'b0;
    wire [1:0] _2877 = 2'b10;
    wire _2878;
    wire [1:0] _698 = 2'b01;
    wire _699;
    wire [1:0] _696 = 2'b00;
    wire _697;
    wire _700;
    wire _2879;
    wire [2:0] _693 = 3'b111;
    wire _694;
    wire _695;
    wire _2880;
    wire _2881;
    wire [1:0] _2873 = 2'b10;
    wire _2874;
    wire [1:0] _689 = 2'b01;
    wire _690;
    wire [1:0] _687 = 2'b00;
    wire _688;
    wire _691;
    wire _2875;
    wire [2:0] _684 = 3'b111;
    wire _685;
    wire _686;
    wire _2876;
    wire _2882;
    wire [1:0] _2869 = 2'b10;
    wire _2870;
    wire [1:0] _680 = 2'b01;
    wire _681;
    wire [1:0] _678 = 2'b00;
    wire _679;
    wire _682;
    wire _2871;
    wire [2:0] _675 = 3'b111;
    wire _676;
    wire _677;
    wire _2872;
    wire _2883;
    wire [1:0] _2865 = 2'b10;
    wire _2866;
    wire [1:0] _671 = 2'b01;
    wire _672;
    wire [1:0] _669 = 2'b00;
    wire _670;
    wire _673;
    wire _2867;
    wire [2:0] _666 = 3'b111;
    wire _667;
    wire _668;
    wire _2868;
    wire _2884;
    wire _59;
    reg pin7_oe;
    wire [7:0] _188;
    reg [7:0] _1156;
    reg [7:0] _1159;
    wire _2672;
    reg _2680;
    wire _2681;
    wire _2692;
    wire _2670;
    wire _2671;
    wire _2693;
    wire _2666;
    wire _2664;
    wire _2663;
    wire _2662;
    wire _2661;
    wire _2660;
    wire _2659;
    wire _2658;
    wire _2657;
    wire [2:0] _2656;
    reg _2665;
    wire _2667;
    wire _2654;
    wire _2655;
    wire _2668;
    wire _2652;
    wire _2650;
    wire _2651;
    wire _2647;
    wire _2646;
    wire _2645;
    wire _2644;
    wire _2643;
    wire _2642;
    wire _2641;
    wire _2640;
    reg _2648;
    wire _2637;
    wire _2636;
    wire _2635;
    wire _2634;
    wire _2633;
    wire _2632;
    wire _2631;
    wire [7:0] _1110 = 8'b00000000;
    wire [7:0] _1109 = 8'b00000000;
    wire [7:0] _1107 = 8'b00000000;
    wire [7:0] _1106 = 8'b00000000;
    wire [7:0] _1104 = 8'b00000000;
    wire [7:0] _1103 = 8'b00000000;
    reg [7:0] _1105;
    reg [7:0] _1108;
    reg [7:0] _1111;
    wire _2630;
    wire [2:0] _2629;
    reg _2638;
    wire _2639;
    wire _2649;
    wire [6:0] _1694 = 7'b1010001;
    wire _1695;
    wire _1696;
    wire [31:0] _1693 = 32'b00000000000000000000000000000000;
    wire [31:0] _1692 = 32'b00000000000000000000000000000000;
    reg [31:0] _1697;
    wire [1:0] _2628;
    reg _2653;
    wire _2669;
    wire _2694;
    wire _2695;
    wire _2703;
    wire _2885;
    wire _2886;
    wire _60;
    reg mon3_armed;
    wire [6:0] _1682 = 7'b1010011;
    wire _1683;
    wire _1684;
    wire [7:0] _1681 = 8'b00000000;
    wire [7:0] _1680 = 8'b00000000;
    wire [7:0] _1679;
    reg [7:0] _1685;
    wire [23:0] _1678 = 24'b000000000000000000000000;
    wire [31:0] _1686;
    wire _1687;
    wire _1691;
    wire _1765;
    wire _2888;
    wire _2891;
    wire _2893;
    wire _2894;
    wire _2898;
    wire _1079;
    wire _1080;
    wire _2899;
    wire _61;
    reg mon3_sticky;
    wire [3:0] _4591;
    wire _4589 = 1'b0;
    wire _4588 = 1'b0;
    wire _4586 = 1'b0;
    wire _4585 = 1'b0;
    wire _63;
    reg _4587;
    reg _4590;
    wire _4393 = 1'b0;
    wire _4392 = 1'b0;
    wire _4439;
    wire [1:0] _4434 = 2'b11;
    wire _4435;
    wire _4436;
    wire _4437;
    wire [1:0] _4430 = 2'b11;
    wire _4431;
    wire _4432;
    wire _4433;
    wire _4438;
    wire _4440;
    wire [2:0] _253;
    wire _4427;
    wire [1:0] _4422 = 2'b11;
    wire _4423;
    wire _4424;
    wire _4425;
    wire [1:0] _4418 = 2'b11;
    wire [1:0] _257;
    wire _4419;
    wire _4420;
    wire _4421;
    wire _4426;
    wire _4428;
    wire [2:0] _323;
    wire _4415;
    wire [1:0] _4410 = 2'b11;
    wire [1:0] _327;
    wire _4411;
    wire _4412;
    wire _4413;
    wire [1:0] _4406 = 2'b11;
    wire _4407;
    wire _4408;
    wire _4409;
    wire _4414;
    wire _4416;
    wire [2:0] _334;
    wire [2:0] _264;
    wire _4404;
    wire [1:0] _4399 = 2'b11;
    wire [1:0] _338;
    wire _4400;
    wire _4401;
    wire [23:0] _304 = 24'b000000000000000000000000;
    wire [23:0] _302;
    wire [23:0] _303;
    wire _305;
    reg [28:0] _298;
    wire [23:0] _299;
    wire [23:0] _300;
    wire _301;
    wire _306;
    wire [2:0] _280 = 3'b000;
    wire [2:0] _276 = 3'b000;
    wire [23:0] _319 = 24'b000000000000000000000000;
    wire [23:0] _317;
    wire [23:0] _318;
    wire _320;
    wire [28:0] _296 = 29'b00000000000000000000000000000;
    wire [28:0] _295 = 29'b00000000000000000000000000000;
    wire [1:0] _2903 = 2'b11;
    wire _2904;
    wire [28:0] _2982;
    wire [28:0] _2983;
    wire [28:0] _64;
    reg [28:0] queue_b_entry3;
    wire [28:0] _293 = 29'b00000000000000000000000000000;
    wire [28:0] _292 = 29'b00000000000000000000000000000;
    wire [1:0] _2984 = 2'b10;
    wire _2985;
    wire [28:0] _2986;
    wire [28:0] _2987;
    wire [28:0] _65;
    reg [28:0] queue_b_entry2;
    wire [28:0] _290 = 29'b00000000000000000000000000000;
    wire [28:0] _289 = 29'b00000000000000000000000000000;
    wire [1:0] _2988 = 2'b01;
    wire _2989;
    wire [28:0] _2990;
    wire [28:0] _2991;
    wire [28:0] _66;
    reg [28:0] queue_b_entry1;
    wire [28:0] _287 = 29'b00000000000000000000000000000;
    wire [28:0] _286 = 29'b00000000000000000000000000000;
    wire [1:0] _2976 = 2'b01;
    wire [1:0] _2975 = 2'b10;
    wire [1:0] _2977;
    wire [1:0] _2971 = 2'b00;
    wire [1:0] _2968 = 2'b00;
    wire [1:0] _2967 = 2'b00;
    wire [1:0] _3094 = 2'b10;
    wire [1:0] _3090;
    wire [1:0] _3091;
    wire [1:0] _3092;
    wire [1:0] _3093;
    wire [1:0] _3095;
    wire [1:0] _67;
    reg [1:0] seq_b_shadow_clk;
    wire [1:0] _2965 = 2'b00;
    wire [1:0] _2964 = 2'b00;
    wire [1:0] _3100 = 2'b10;
    wire [1:0] _3096;
    wire [2:0] _3086 = 3'b111;
    wire _3087;
    wire [2:0] _3083 = 3'b110;
    wire _3084;
    wire [2:0] _3081 = 3'b101;
    wire _3082;
    wire _3085;
    wire _3088;
    wire _3089;
    wire [1:0] _3097;
    wire [1:0] _3098;
    wire [1:0] _3099;
    wire [1:0] _3101;
    wire [1:0] _68;
    reg [1:0] seq_b_shadow_data;
    wire [1:0] _2970;
    wire _2972;
    wire [1:0] _2973;
    wire [1:0] _2961 = 2'b10;
    wire [1:0] _2960 = 2'b01;
    wire _2959;
    wire [1:0] _2962;
    wire [3:0] _2955 = 4'b0000;
    wire [3:0] _2954 = 4'b0000;
    wire [3:0] _3113 = 4'b0000;
    wire [3:0] _3110;
    wire [3:0] _3106 = 4'b0101;
    wire _3107;
    wire [3:0] _3102 = 4'b0101;
    wire _3103;
    wire _3104;
    wire _3108;
    wire [3:0] _3111;
    wire [3:0] _3112;
    wire [3:0] _3114;
    wire [3:0] _69;
    reg [3:0] seq_b_coder;
    wire _2957;
    wire [31:0] _2951 = 32'b00000000000000000000000000000000;
    wire [31:0] _2950 = 32'b00000000000000000000000000000000;
    wire [31:0] _3174 = 32'b00000000000000000000000000000000;
    wire [31:0] _3128 = 32'b00000000000000000000000000000000;
    wire [31:0] _3127 = 32'b00000000000000000000000000000000;
    wire [1:0] _3124 = 2'b11;
    wire _3125;
    wire _3126;
    wire [31:0] _3130;
    wire [31:0] _70;
    reg [31:0] _3129;
    wire [31:0] _3135 = 32'b00000000000000000000000000000000;
    wire [31:0] _3134 = 32'b00000000000000000000000000000000;
    wire [1:0] _3131 = 2'b10;
    wire _3132;
    wire _3133;
    wire [31:0] _3137;
    wire [31:0] _71;
    reg [31:0] _3136;
    wire [31:0] _3142 = 32'b00000000000000000000000000000000;
    wire [31:0] _3141 = 32'b00000000000000000000000000000000;
    wire [1:0] _3138 = 2'b01;
    wire _3139;
    wire _3140;
    wire [31:0] _3144;
    wire [31:0] _72;
    reg [31:0] _3143;
    wire [31:0] _3152 = 32'b00000000000000000000000000000000;
    wire [31:0] _3151 = 32'b00000000000000000000000000000000;
    wire [1:0] _3148 = 2'b00;
    wire [1:0] _3122 = 2'b00;
    wire [1:0] _3121 = 2'b00;
    wire [1:0] _3145 = 2'b01;
    wire [1:0] _3146;
    wire [1:0] _3147;
    wire [1:0] _73;
    reg [1:0] _3123;
    wire _3149;
    wire _3150;
    wire [31:0] _3154;
    wire [31:0] _74;
    reg [31:0] _3153;
    wire [1:0] _3159 = 2'b00;
    wire [1:0] _3158 = 2'b00;
    wire [1:0] _3161 = 2'b01;
    wire [1:0] _3162;
    wire [1:0] _3163;
    wire [1:0] _75;
    reg [1:0] _3160;
    reg [31:0] _3171;
    wire _3167 = 1'b0;
    wire [30:0] _3166;
    wire [31:0] _3168;
    wire [2:0] _3164 = 3'b100;
    wire _3165;
    wire [31:0] _3169;
    wire [31:0] _3170;
    wire [31:0] _3172;
    wire [31:0] _3173;
    wire [31:0] _3175;
    wire [31:0] _76;
    reg [31:0] seq_b_osr;
    wire _2953;
    wire _2958;
    wire [1:0] _2963;
    wire [1:0] _2974;
    wire [1:0] _2978;
    wire [1:0] _2948 = 2'b11;
    wire [1:0] _2947 = 2'b01;
    wire [1:0] _2949;
    wire [1:0] _2979;
    wire [1:0] _2946 = 2'b00;
    wire [2:0] _2942 = 3'b111;
    wire _2943;
    wire [2:0] _2940 = 3'b101;
    wire _2941;
    wire _2944;
    wire [2:0] _2936 = 3'b100;
    wire _2937;
    wire [2:0] _2934 = 3'b011;
    wire _2935;
    wire _2938;
    wire [2:0] _2931 = 3'b010;
    wire _2932;
    wire [2:0] _2929 = 3'b001;
    wire _2930;
    wire _2933;
    wire _2939;
    wire _2945;
    wire [1:0] _2980;
    wire [2:0] _2927;
    wire _2914;
    wire [2:0] _2924;
    wire [2:0] _2910 = 3'b111;
    wire _2911;
    wire [2:0] _2908 = 3'b110;
    wire _2909;
    wire _2912;
    wire [2:0] _2906 = 3'b101;
    wire [2:0] _2905;
    wire _2907;
    wire _2913;
    wire [2:0] _2928;
    wire [5:0] _1031 = 6'b000000;
    wire [17:0] _1030;
    wire [23:0] _1032;
    wire [3:0] _1028 = 4'b0000;
    wire [19:0] _1027;
    wire [23:0] _1029;
    wire [1:0] _1025 = 2'b00;
    wire [21:0] _1024;
    wire [23:0] _1026;
    wire [5:0] _1021;
    wire [7:0] _1010 = 8'b00000000;
    wire [7:0] _1009 = 8'b00000000;
    wire [3:0] _3179 = 4'b0100;
    wire _3180;
    wire [3:0] _3176 = 4'b0101;
    wire _3177;
    wire _3178;
    wire _3181;
    wire [7:0] _3182;
    wire [7:0] _3183;
    wire [7:0] _3192;
    wire [7:0] _77;
    reg [7:0] seq_b_k3;
    wire [7:0] _1007 = 8'b00000000;
    wire [7:0] _1006 = 8'b00000000;
    wire [3:0] _3196 = 4'b0011;
    wire _3197;
    wire [3:0] _3193 = 4'b0101;
    wire _3194;
    wire _3195;
    wire _3198;
    wire [7:0] _3199;
    wire [7:0] _3200;
    wire [7:0] _3202;
    wire [7:0] _78;
    reg [7:0] seq_b_k2;
    wire [7:0] _1004 = 8'b00000000;
    wire [7:0] _1003 = 8'b00000000;
    wire [3:0] _3206 = 4'b0010;
    wire _3207;
    wire [3:0] _3203 = 4'b0101;
    wire _3204;
    wire _3205;
    wire _3208;
    wire [7:0] _3209;
    wire [7:0] _3210;
    wire [7:0] _3212;
    wire [7:0] _79;
    reg [7:0] seq_b_k1;
    wire [7:0] _1002 = 8'b00000000;
    wire [1:0] _1001;
    reg [7:0] _1012;
    wire _1013;
    wire [1:0] _1014;
    wire [9:0] _1015;
    wire [5:0] _999;
    wire [3:0] _998 = 4'b0000;
    wire [9:0] _1000;
    wire [9:0] _1016;
    wire _1017;
    wire [1:0] _1018;
    wire [3:0] _1019;
    wire [7:0] _1020;
    wire [13:0] _1022;
    wire [23:0] _1023;
    reg [23:0] _1033;
    wire [23:0] _1034;
    wire [28:0] _2981;
    wire [1:0] _3216 = 2'b00;
    wire [1:0] _2901 = 2'b00;
    wire [1:0] _2900 = 2'b00;
    wire [1:0] _3213 = 2'b01;
    wire [1:0] _3214;
    wire [1:0] _3215;
    wire [1:0] _80;
    reg [1:0] queue_b_write_ptr;
    wire _3217;
    wire [28:0] _3218;
    wire [28:0] _3219;
    wire [28:0] _81;
    reg [28:0] queue_b_entry0;
    wire [1:0] _311 = 2'b01;
    wire [1:0] _284 = 2'b00;
    wire _279;
    wire [1:0] _283 = 2'b00;
    wire [1:0] _3225;
    wire [1:0] _3226;
    wire [1:0] _82;
    reg [1:0] queue_b_read_ptr;
    wire [1:0] _312;
    reg [28:0] _313;
    wire [23:0] _314;
    wire [23:0] _315;
    wire _316;
    wire _321;
    wire [2:0] _308 = 3'b001;
    wire _309;
    wire _310;
    wire _322;
    wire [1:0] _3222 = 2'b00;
    wire [2:0] _3223;
    wire [1:0] _3220 = 2'b00;
    wire [2:0] _3221;
    wire [2:0] _3224;
    wire _984;
    wire [2:0] _986 = 3'b100;
    wire _987;
    wire _83;
    wire [3:0] _976 = 4'b0001;
    wire _977;
    wire _978;
    wire _762 = 1'b0;
    wire _761 = 1'b0;
    wire _954;
    wire _3650;
    wire [15:0] _934 = 16'b0000000000000000;
    wire [15:0] _932 = 16'b0000001111111111;
    wire [15:0] _933;
    wire _935;
    wire _929 = 1'b1;
    wire _928;
    wire _930;
    wire _925 = 1'b0;
    wire _924;
    wire _926;
    wire [3:0] _922 = 4'b0111;
    wire [3:0] _921;
    wire _923;
    wire _927;
    wire _931;
    wire _936;
    wire [3:0] _916 = 4'b1001;
    wire [3:0] _915;
    wire _917;
    wire [3:0] _912 = 4'b1000;
    wire [3:0] _911;
    wire _913;
    wire [3:0] _908 = 4'b0111;
    wire [3:0] _907;
    wire _909;
    wire [3:0] _904 = 4'b0101;
    wire [3:0] _903;
    wire _905;
    wire [3:0] _900 = 4'b0100;
    wire [3:0] _899;
    wire _901;
    wire [3:0] _896 = 4'b0011;
    wire [3:0] _895;
    wire _897;
    wire [3:0] _892 = 4'b0010;
    wire [3:0] _891;
    wire _893;
    wire [3:0] _888 = 4'b0001;
    wire [3:0] _887;
    wire _889;
    wire [3:0] _885 = 4'b0000;
    wire [3:0] _884;
    wire _886;
    wire _890;
    wire _894;
    wire _898;
    wire _902;
    wire _906;
    wire _910;
    wire _914;
    wire _918;
    wire [3:0] _882 = 4'b0101;
    wire [3:0] _881;
    wire _883;
    wire _919;
    wire [15:0] _877 = 16'b0000000000000000;
    wire [15:0] _875 = 16'b0000000011000000;
    wire [15:0] _876;
    wire _878;
    wire [3:0] _871 = 4'b0100;
    wire [3:0] _870;
    wire _872;
    wire [3:0] _867 = 4'b0011;
    wire [3:0] _866;
    wire _868;
    wire [3:0] _863 = 4'b0010;
    wire [3:0] _862;
    wire _864;
    wire [3:0] _859 = 4'b0001;
    wire [3:0] _858;
    wire _860;
    wire [3:0] _856 = 4'b0000;
    wire [3:0] _855;
    wire _857;
    wire _861;
    wire _865;
    wire _869;
    wire _873;
    wire [3:0] _853 = 4'b0100;
    wire [3:0] _852;
    wire _854;
    wire _874;
    wire _879;
    wire [15:0] _848 = 16'b0000000000000000;
    wire [15:0] _846 = 16'b0000000000111111;
    wire [15:0] _847;
    wire _849;
    wire [1:0] _842 = 2'b10;
    wire [1:0] _841;
    wire _843;
    wire [1:0] _838 = 2'b01;
    wire [1:0] _837;
    wire _839;
    wire [1:0] _835 = 2'b00;
    wire [1:0] _834;
    wire _836;
    wire _840;
    wire _844;
    wire [2:0] _830 = 3'b011;
    wire [2:0] _829;
    wire _831;
    wire [2:0] _826 = 3'b010;
    wire [2:0] _825;
    wire _827;
    wire [2:0] _822 = 3'b001;
    wire [2:0] _821;
    wire _823;
    wire [2:0] _819 = 3'b000;
    wire [2:0] _818;
    wire _820;
    wire _824;
    wire _828;
    wire _832;
    wire [3:0] _816 = 4'b0011;
    wire [3:0] _815;
    wire _817;
    wire _833;
    wire _845;
    wire _850;
    wire [3:0] _812 = 4'b0010;
    wire [3:0] _811;
    wire _813;
    wire [2:0] _806 = 3'b111;
    wire [2:0] _805;
    wire _807;
    wire [2:0] _802 = 3'b110;
    wire [2:0] _801;
    wire _803;
    wire [2:0] _798 = 3'b101;
    wire [2:0] _797;
    wire _799;
    wire [2:0] _794 = 3'b100;
    wire [2:0] _793;
    wire _795;
    wire [2:0] _790 = 3'b011;
    wire [2:0] _789;
    wire _791;
    wire [2:0] _786 = 3'b010;
    wire [2:0] _785;
    wire _787;
    wire [2:0] _782 = 3'b001;
    wire [2:0] _781;
    wire _783;
    wire [2:0] _779 = 3'b000;
    wire [2:0] _778;
    wire _780;
    wire _784;
    wire _788;
    wire _792;
    wire _796;
    wire _800;
    wire _804;
    wire _808;
    wire [3:0] _776 = 4'b0001;
    wire [3:0] _775;
    wire _777;
    wire _809;
    wire [15:0] _772 = 16'b0000000000000000;
    wire [15:0] _770 = 16'b0000111111111111;
    wire [15:0] _771;
    wire _773;
    wire [3:0] _768 = 4'b0000;
    wire [15:0] _765 = 16'b0000000000000000;
    wire [15:0] _764 = 16'b0000000000000000;
    wire [5:0] _3280;
    wire [4:0] _3281;
    reg [15:0] _3479;
    wire [15:0] _84;
    wire _3079;
    wire [5:0] _950 = 6'b000000;
    wire [5:0] _949 = 6'b000000;
    wire [5:0] _3278 = 6'b100000;
    wire [5:0] _3277;
    wire [5:0] _3279;
    wire [5:0] _3267 = 6'b000001;
    wire [5:0] _3268;
    wire _3263;
    wire _3262;
    wire _3261;
    wire _3260;
    wire _3259;
    wire _3258;
    wire _3257;
    wire _3256;
    reg _3264;
    wire [3:0] _3252 = 4'b0100;
    wire _3253;
    wire _3254;
    wire _3255;
    wire _3265;
    wire _3248 = 1'b0;
    wire _3247 = 1'b0;
    wire _3480;
    wire _3481;
    wire _3482;
    wire _3483;
    wire _85;
    reg seq_b_flag;
    wire [3:0] _3244 = 4'b0011;
    wire _3245;
    wire _3246;
    wire _3250;
    wire [15:0] _3238 = 16'b0000000000000000;
    wire _3239;
    wire _3240;
    wire [3:0] _3236 = 4'b0010;
    wire _3237;
    wire _3241;
    wire [15:0] _3231 = 16'b0000000000000000;
    wire _3232;
    wire _3233;
    wire [3:0] _3229 = 4'b0001;
    wire _3230;
    wire _3234;
    wire [3:0] _3227 = 4'b0000;
    wire _3228;
    wire _3235;
    wire _3242;
    wire _3243;
    wire _3251;
    wire _3266;
    wire [5:0] _3269;
    wire [5:0] _3484;
    wire [5:0] _3485;
    wire [5:0] _86;
    reg [5:0] seq_b_ir_pc;
    wire [5:0] _948;
    wire _952;
    wire [3:0] _945 = 4'b0000;
    wire _946;
    wire _947;
    wire _953;
    wire _3077;
    wire _3072;
    wire [3:0] _3069 = 4'b0100;
    wire _3070;
    wire _3071;
    wire _3073;
    wire [15:0] _3060 = 16'b1111111111111111;
    wire [15:0] _3058 = 16'b0000000000000000;
    wire [15:0] _3057 = 16'b0000000000000000;
    wire [15:0] _3515 = 16'b0000000000000000;
    wire [7:0] _3511;
    wire [15:0] _3512;
    wire [7:0] _3508 = 8'b00000000;
    wire [15:0] _3509;
    wire [15:0] _3505 = 16'b0000000000000001;
    wire [15:0] _3506;
    wire [15:0] _3501 = 16'b0000000000000000;
    wire _3502;
    wire _3503;
    wire [3:0] _3498 = 4'b0010;
    wire _3499;
    wire _3500;
    wire _3504;
    wire [15:0] _3507;
    wire [3:0] _3495 = 4'b0001;
    wire _3496;
    wire [3:0] _3492 = 4'b0101;
    wire _3493;
    wire _3494;
    wire _3497;
    wire [15:0] _3510;
    wire [3:0] _3489 = 4'b1001;
    wire _3490;
    wire [3:0] _3486 = 4'b0101;
    wire _3487;
    wire _3488;
    wire _3491;
    wire [15:0] _3513;
    wire [15:0] _3514;
    wire [15:0] _3516;
    wire [15:0] _87;
    reg [15:0] seq_b_y;
    wire [15:0] _3055 = 16'b0000000000000000;
    wire [15:0] _3054 = 16'b0000000000000000;
    wire [15:0] _3546 = 16'b0000000000000000;
    wire [7:0] _3542;
    wire [15:0] _3543;
    wire [7:0] _3539 = 8'b00000000;
    wire [15:0] _3540;
    wire [15:0] _3536 = 16'b0000000000000001;
    wire [15:0] _3537;
    wire [15:0] _3532 = 16'b0000000000000000;
    wire _3533;
    wire _3534;
    wire [3:0] _3529 = 4'b0001;
    wire [3:0] _944;
    wire _3530;
    wire [3:0] _941 = 4'b0100;
    wire _942;
    wire _943;
    wire _3531;
    wire _3535;
    wire [15:0] _3538;
    wire [3:0] _3526 = 4'b0000;
    wire _3527;
    wire [3:0] _3523 = 4'b0101;
    wire _3524;
    wire _3525;
    wire _3528;
    wire [15:0] _3541;
    wire [3:0] _3520 = 4'b1000;
    wire _3521;
    wire [3:0] _3517 = 4'b0101;
    wire _3518;
    wire _3519;
    wire _3522;
    wire [15:0] _3544;
    wire [15:0] _3545;
    wire [15:0] _3547;
    wire [15:0] _88;
    reg [15:0] seq_b_x;
    wire [15:0] _3053 = 16'b1111111111111111;
    reg [15:0] _3061;
    wire [15:0] _3051 = 16'b0000000000000000;
    wire [15:0] _3050 = 16'b0000000000000000;
    wire [15:0] _3556 = 16'b0000000000000000;
    wire [15:0] _3553 = 16'b0000000000000001;
    wire [15:0] _3554;
    wire [15:0] _3552 = 16'b0000000000000000;
    wire _3550;
    wire _3548;
    wire _3549;
    wire _3551;
    wire [15:0] _3555;
    wire [15:0] _3557;
    wire [15:0] _89;
    reg [15:0] seq_b_wait_count;
    wire _3062;
    wire [1:0] _3047 = 2'b00;
    wire [1:0] _3046;
    wire _3048;
    wire _3049;
    wire _3063;
    wire _3044;
    wire _3042;
    wire _3041;
    wire _3040;
    wire _3039;
    wire _3038;
    wire _3037;
    wire _3036;
    wire _3035;
    wire [2:0] _2925;
    wire [2:0] _2923;
    wire [2:0] _2922;
    wire [6:0] _2918 = 7'b1100100;
    wire _2919;
    wire _2920;
    wire [11:0] _2917 = 12'b000000000000;
    wire [11:0] _2916 = 12'b000000000000;
    wire [11:0] _2915;
    reg [11:0] _2921;
    wire [2:0] _2926;
    wire [2:0] _3032;
    wire [1:0] _3033;
    reg [2:0] _3034;
    reg _3043;
    wire _3045;
    wire _3064;
    wire _3030 = 1'b0;
    wire _3029 = 1'b0;
    wire [23:0] _3609 = 24'b000000000000000000000000;
    wire _3610;
    wire [23:0] _3605 = 24'b000000000000000000000001;
    wire [23:0] _3606;
    wire [23:0] _3607;
    wire _3608;
    wire _3611;
    wire [23:0] _3588 = 24'b000000000000000000000000;
    wire _3589;
    wire [23:0] _3584 = 24'b000000000000000000000001;
    wire [23:0] _3585;
    wire [23:0] _3586;
    wire _3587;
    wire _3590;
    wire _3612;
    wire _3613;
    wire [23:0] _3567 = 24'b000000000000000000000000;
    wire _3568;
    wire [23:0] _3563 = 24'b000000000000000000000001;
    wire [23:0] _3564;
    wire [23:0] _3565;
    wire _3566;
    wire _3569;
    wire _3561;
    wire _3559;
    wire _3558;
    wire _3560;
    wire _3562;
    wire _3614;
    wire _3615;
    wire _90;
    reg seq_b_caught_up;
    wire _3065;
    wire _3066;
    wire _3067;
    wire [2:0] _3019 = 3'b000;
    wire [2:0] _3018 = 3'b000;
    wire [2:0] _3155 = 3'b000;
    wire _3156;
    wire _91;
    wire _3157;
    wire [1:0] _3619 = 2'b00;
    wire [2:0] _3620;
    wire [2:0] _3118 = 3'b100;
    wire _3119;
    wire [6:0] _3115 = 7'b1100110;
    wire _3116;
    wire _3117;
    wire _3120;
    wire [1:0] _3616 = 2'b00;
    wire [2:0] _3617;
    wire [2:0] _3618;
    wire [2:0] _3621;
    wire [2:0] _92;
    reg [2:0] _3020;
    wire [2:0] _3017 = 3'b000;
    wire _3021;
    wire _3016;
    wire _3022;
    wire _3023;
    wire _3013 = 1'b0;
    wire _3012;
    wire _3014;
    wire [3:0] _3009 = 4'b0111;
    wire _3010;
    wire _3011;
    wire _3015;
    wire _3024;
    wire _982 = 1'b0;
    wire _981 = 1'b0;
    wire _3644;
    wire _3643;
    wire _3645;
    wire [23:0] _993 = 24'b000000000000000000000000;
    wire [23:0] _992 = 24'b000000000000000000000000;
    wire [23:0] _3637 = 24'b000000000000000001000000;
    wire [23:0] _3638;
    wire [5:0] _3580 = 6'b000000;
    wire [17:0] _3579;
    wire [23:0] _3581;
    wire [3:0] _3577 = 4'b0000;
    wire [19:0] _3576;
    wire [23:0] _3578;
    wire [1:0] _3574 = 2'b00;
    wire [21:0] _3573;
    wire [23:0] _3575;
    wire [11:0] _3571;
    wire [11:0] _3570 = 12'b000000000000;
    wire [23:0] _3572;
    reg [23:0] _3582;
    wire [23:0] _3583;
    wire [5:0] _3601 = 6'b000000;
    wire [17:0] _3600;
    wire [23:0] _3602;
    wire [3:0] _3598 = 4'b0000;
    wire [19:0] _3597;
    wire [23:0] _3599;
    wire [1:0] _3595 = 2'b00;
    wire [21:0] _3594;
    wire [23:0] _3596;
    wire [5:0] _3592;
    wire [17:0] _3591 = 18'b000000000000000000;
    wire [23:0] _3593;
    wire [1:0] _996 = 2'b00;
    wire [1:0] _995 = 2'b00;
    wire [1:0] _3631 = 2'b00;
    wire [7:0] _3109;
    wire [1:0] _3628;
    wire [3:0] _3625 = 4'b0111;
    wire [3:0] _3105;
    wire _3626;
    wire [3:0] _3622 = 4'b0101;
    wire _3623;
    wire _3624;
    wire _3627;
    wire [1:0] _3629;
    wire [1:0] _3630;
    wire [1:0] _3632;
    wire [1:0] _93;
    reg [1:0] seq_b_prescale;
    reg [23:0] _3603;
    wire [23:0] _3604;
    wire [23:0] _3633;
    wire [23:0] _3634;
    wire [3:0] _3026 = 4'b0011;
    wire _3027;
    wire _3028;
    wire [23:0] _3635;
    wire [23:0] _3636;
    wire [23:0] _3639;
    wire [23:0] _94;
    reg [23:0] seq_b_sched_s;
    wire [23:0] _3640;
    wire _3641;
    wire _3642;
    wire _3646;
    wire _3647;
    wire _95;
    reg seq_b_far;
    wire _3004;
    wire [3:0] _3000 = 4'b0010;
    wire _3001;
    wire _3002;
    wire _3003;
    wire _3005;
    wire _3006;
    wire [3:0] _2997 = 4'b0010;
    wire _2998;
    wire _2999;
    wire _3007;
    wire _2995;
    wire [3:0] _2992 = 4'b0001;
    wire [3:0] _940;
    wire _2993;
    wire _2994;
    wire _2996;
    wire _3008;
    wire _3025;
    wire _3068;
    wire _3074;
    wire _3075;
    wire _3076;
    wire _3078;
    wire _3080;
    wire [15:0] _3648;
    wire [15:0] _3649;
    wire [15:0] _96;
    reg [15:0] seq_b_ir;
    wire [3:0] _767;
    wire _769;
    wire _774;
    wire _810;
    wire _814;
    wire _851;
    wire _880;
    wire _920;
    wire _937;
    wire _938;
    wire _939;
    wire _3651;
    wire _3652;
    wire _97;
    reg seq_b_running;
    wire _979;
    wire _980;
    wire _985;
    wire _988;
    wire [1:0] _3653 = 2'b00;
    wire [2:0] _3654;
    wire [2:0] _3655;
    wire [2:0] _3656;
    wire [2:0] _98;
    reg [2:0] queue_b_count;
    wire [2:0] _275 = 3'b000;
    wire _282;
    wire _307;
    wire _4402;
    wire [1:0] _4395 = 2'b11;
    wire [1:0] _268;
    wire _4396;
    wire _4397;
    wire [23:0] _234 = 24'b000000000000000000000000;
    wire [23:0] _232;
    wire [23:0] _233;
    wire _235;
    reg [28:0] _225;
    wire [23:0] _226;
    wire [23:0] _230;
    wire _231;
    wire _236;
    wire [2:0] _207 = 3'b000;
    wire [2:0] _190 = 3'b000;
    wire [23:0] _249 = 24'b000000000000000000000000;
    wire [23:0] _247;
    wire [23:0] _248;
    wire _250;
    wire [28:0] _223 = 29'b00000000000000000000000000000;
    wire [28:0] _222 = 29'b00000000000000000000000000000;
    wire [1:0] _3660 = 2'b11;
    wire _3661;
    wire [28:0] _3739;
    wire [28:0] _3740;
    wire [28:0] _99;
    reg [28:0] queue_a_entry3;
    wire [28:0] _220 = 29'b00000000000000000000000000000;
    wire [28:0] _219 = 29'b00000000000000000000000000000;
    wire [1:0] _3741 = 2'b10;
    wire _3742;
    wire [28:0] _3743;
    wire [28:0] _3744;
    wire [28:0] _100;
    reg [28:0] queue_a_entry2;
    wire [28:0] _217 = 29'b00000000000000000000000000000;
    wire [28:0] _216 = 29'b00000000000000000000000000000;
    wire [1:0] _3745 = 2'b01;
    wire _3746;
    wire [28:0] _3747;
    wire [28:0] _3748;
    wire [28:0] _101;
    reg [28:0] queue_a_entry1;
    wire [28:0] _214 = 29'b00000000000000000000000000000;
    wire [28:0] _213 = 29'b00000000000000000000000000000;
    wire [1:0] _3733 = 2'b01;
    wire [1:0] _3732 = 2'b10;
    wire [1:0] _3734;
    wire [1:0] _3728 = 2'b00;
    wire [1:0] _3725 = 2'b00;
    wire [1:0] _3724 = 2'b00;
    wire [1:0] _3851 = 2'b10;
    wire [1:0] _3847;
    wire [1:0] _3848;
    wire [1:0] _3849;
    wire [1:0] _3850;
    wire [1:0] _3852;
    wire [1:0] _102;
    reg [1:0] seq_a_shadow_clk;
    wire [1:0] _3722 = 2'b00;
    wire [1:0] _3721 = 2'b00;
    wire [1:0] _3857 = 2'b10;
    wire [1:0] _3853;
    wire [2:0] _3843 = 3'b111;
    wire _3844;
    wire [2:0] _3840 = 3'b110;
    wire _3841;
    wire [2:0] _3838 = 3'b101;
    wire _3839;
    wire _3842;
    wire _3845;
    wire _3846;
    wire [1:0] _3854;
    wire [1:0] _3855;
    wire [1:0] _3856;
    wire [1:0] _3858;
    wire [1:0] _103;
    reg [1:0] seq_a_shadow_data;
    wire [1:0] _3727;
    wire _3729;
    wire [1:0] _3730;
    wire [1:0] _3718 = 2'b10;
    wire [1:0] _3717 = 2'b01;
    wire _3716;
    wire [1:0] _3719;
    wire [3:0] _3712 = 4'b0000;
    wire [3:0] _3711 = 4'b0000;
    wire [3:0] _3870 = 4'b0000;
    wire [3:0] _3867;
    wire [3:0] _3863 = 4'b0101;
    wire _3864;
    wire [3:0] _3859 = 4'b0101;
    wire _3860;
    wire _3861;
    wire _3865;
    wire [3:0] _3868;
    wire [3:0] _3869;
    wire [3:0] _3871;
    wire [3:0] _104;
    reg [3:0] seq_a_coder;
    wire _3714;
    wire [31:0] _3708 = 32'b00000000000000000000000000000000;
    wire [31:0] _3707 = 32'b00000000000000000000000000000000;
    wire [31:0] _3931 = 32'b00000000000000000000000000000000;
    wire [31:0] _3885 = 32'b00000000000000000000000000000000;
    wire [31:0] _3884 = 32'b00000000000000000000000000000000;
    wire [1:0] _3881 = 2'b11;
    wire _3882;
    wire _3883;
    wire [31:0] _3887;
    wire [31:0] _105;
    reg [31:0] _3886;
    wire [31:0] _3892 = 32'b00000000000000000000000000000000;
    wire [31:0] _3891 = 32'b00000000000000000000000000000000;
    wire [1:0] _3888 = 2'b10;
    wire _3889;
    wire _3890;
    wire [31:0] _3894;
    wire [31:0] _106;
    reg [31:0] _3893;
    wire [31:0] _3899 = 32'b00000000000000000000000000000000;
    wire [31:0] _3898 = 32'b00000000000000000000000000000000;
    wire [1:0] _3895 = 2'b01;
    wire _3896;
    wire _3897;
    wire [31:0] _3901;
    wire [31:0] _107;
    reg [31:0] _3900;
    wire [31:0] _3909 = 32'b00000000000000000000000000000000;
    wire [31:0] _3908 = 32'b00000000000000000000000000000000;
    wire [1:0] _3905 = 2'b00;
    wire [1:0] _3879 = 2'b00;
    wire [1:0] _3878 = 2'b00;
    wire [1:0] _3902 = 2'b01;
    wire [1:0] _3903;
    wire [1:0] _3904;
    wire [1:0] _108;
    reg [1:0] _3880;
    wire _3906;
    wire _3907;
    wire [31:0] _3911;
    wire [31:0] _109;
    reg [31:0] _3910;
    wire [1:0] _3916 = 2'b00;
    wire [1:0] _3915 = 2'b00;
    wire [1:0] _3918 = 2'b01;
    wire [1:0] _3919;
    wire [1:0] _3920;
    wire [1:0] _110;
    reg [1:0] _3917;
    reg [31:0] _3928;
    wire _3924 = 1'b0;
    wire [30:0] _3923;
    wire [31:0] _3925;
    wire [2:0] _3921 = 3'b100;
    wire _3922;
    wire [31:0] _3926;
    wire [31:0] _3927;
    wire [31:0] _3929;
    wire [31:0] _3930;
    wire [31:0] _3932;
    wire [31:0] _111;
    reg [31:0] seq_a_osr;
    wire _3710;
    wire _3715;
    wire [1:0] _3720;
    wire [1:0] _3731;
    wire [1:0] _3735;
    wire [1:0] _3705 = 2'b11;
    wire [1:0] _3704 = 2'b01;
    wire [1:0] _3706;
    wire [1:0] _3736;
    wire [1:0] _3703 = 2'b00;
    wire [2:0] _3699 = 3'b111;
    wire _3700;
    wire [2:0] _3697 = 3'b101;
    wire _3698;
    wire _3701;
    wire [2:0] _3693 = 3'b100;
    wire _3694;
    wire [2:0] _3691 = 3'b011;
    wire _3692;
    wire _3695;
    wire [2:0] _3688 = 3'b010;
    wire _3689;
    wire [2:0] _3686 = 3'b001;
    wire _3687;
    wire _3690;
    wire _3696;
    wire _3702;
    wire [1:0] _3737;
    wire [2:0] _3684;
    wire _3671;
    wire [2:0] _3681;
    wire [2:0] _3667 = 3'b111;
    wire _3668;
    wire [2:0] _3665 = 3'b110;
    wire _3666;
    wire _3669;
    wire [2:0] _3663 = 3'b101;
    wire [2:0] _3662;
    wire _3664;
    wire _3670;
    wire [2:0] _3685;
    wire [5:0] _2239 = 6'b000000;
    wire [17:0] _2238;
    wire [23:0] _2240;
    wire [3:0] _2236 = 4'b0000;
    wire [19:0] _2235;
    wire [23:0] _2237;
    wire [1:0] _2233 = 2'b00;
    wire [21:0] _2232;
    wire [23:0] _2234;
    wire [5:0] _2229;
    wire [7:0] _2218 = 8'b00000000;
    wire [7:0] _2217 = 8'b00000000;
    wire [7:0] _3191;
    wire [3:0] _3936 = 4'b0100;
    wire _3937;
    wire [3:0] _3933 = 4'b0101;
    wire _3934;
    wire _3935;
    wire _3938;
    wire [7:0] _3939;
    wire [7:0] _3940;
    wire [7:0] _3941;
    wire [7:0] _112;
    reg [7:0] seq_a_k3;
    wire [7:0] _2215 = 8'b00000000;
    wire [7:0] _2214 = 8'b00000000;
    wire [7:0] _3201;
    wire [3:0] _3945 = 4'b0011;
    wire _3946;
    wire [3:0] _3942 = 4'b0101;
    wire _3943;
    wire _3944;
    wire _3947;
    wire [7:0] _3948;
    wire [7:0] _3949;
    wire [7:0] _3950;
    wire [7:0] _113;
    reg [7:0] seq_a_k2;
    wire [7:0] _2212 = 8'b00000000;
    wire [7:0] _2211 = 8'b00000000;
    wire [7:0] _3211;
    wire [3:0] _3954 = 4'b0010;
    wire _3955;
    wire [3:0] _3951 = 4'b0101;
    wire _3952;
    wire _3953;
    wire _3956;
    wire [7:0] _3957;
    wire [7:0] _3958;
    wire [7:0] _3959;
    wire [7:0] _114;
    reg [7:0] seq_a_k1;
    wire [7:0] _2210 = 8'b00000000;
    wire [1:0] _2209;
    reg [7:0] _2220;
    wire _2221;
    wire [1:0] _2222;
    wire [9:0] _2223;
    wire [5:0] _2207;
    wire [3:0] _2206 = 4'b0000;
    wire [9:0] _2208;
    wire [9:0] _2224;
    wire _2225;
    wire [1:0] _2226;
    wire [3:0] _2227;
    wire [7:0] _2228;
    wire [13:0] _2230;
    wire [23:0] _2231;
    reg [23:0] _2241;
    wire [23:0] _2242;
    wire [28:0] _3738;
    wire [1:0] _3963 = 2'b00;
    wire [1:0] _3658 = 2'b00;
    wire [1:0] _3657 = 2'b00;
    wire [1:0] _3960 = 2'b01;
    wire [1:0] _3961;
    wire [1:0] _3962;
    wire [1:0] _115;
    reg [1:0] queue_a_write_ptr;
    wire _3964;
    wire [28:0] _3965;
    wire [28:0] _3966;
    wire [28:0] _116;
    reg [28:0] queue_a_entry0;
    wire [1:0] _241 = 2'b01;
    wire [1:0] _211 = 2'b00;
    wire _206;
    wire [1:0] _210 = 2'b00;
    wire [1:0] _3972;
    wire [1:0] _3973;
    wire [1:0] _117;
    reg [1:0] queue_a_read_ptr;
    wire [1:0] _242;
    reg [28:0] _243;
    wire [23:0] _244;
    wire [23:0] _245;
    wire _246;
    wire _251;
    wire [2:0] _238 = 3'b001;
    wire _239;
    wire _240;
    wire _252;
    wire [1:0] _3969 = 2'b00;
    wire [2:0] _3970;
    wire [1:0] _3967 = 2'b00;
    wire [2:0] _3968;
    wire [2:0] _3971;
    wire _2192;
    wire [2:0] _2194 = 3'b100;
    wire _2195;
    wire _118;
    wire [3:0] _2184 = 4'b0001;
    wire _2185;
    wire _2186;
    wire _1971 = 1'b0;
    wire _1970 = 1'b0;
    wire _2163;
    wire _4384;
    wire [15:0] _2143 = 16'b0000000000000000;
    wire [15:0] _2141 = 16'b0000001111111111;
    wire [15:0] _2142;
    wire _2144;
    wire _2138 = 1'b1;
    wire _2137;
    wire _2139;
    wire _2134 = 1'b0;
    wire _2133;
    wire _2135;
    wire [3:0] _2131 = 4'b0111;
    wire [3:0] _2130;
    wire _2132;
    wire _2136;
    wire _2140;
    wire _2145;
    wire [3:0] _2125 = 4'b1001;
    wire [3:0] _2124;
    wire _2126;
    wire [3:0] _2121 = 4'b1000;
    wire [3:0] _2120;
    wire _2122;
    wire [3:0] _2117 = 4'b0111;
    wire [3:0] _2116;
    wire _2118;
    wire [3:0] _2113 = 4'b0101;
    wire [3:0] _2112;
    wire _2114;
    wire [3:0] _2109 = 4'b0100;
    wire [3:0] _2108;
    wire _2110;
    wire [3:0] _2105 = 4'b0011;
    wire [3:0] _2104;
    wire _2106;
    wire [3:0] _2101 = 4'b0010;
    wire [3:0] _2100;
    wire _2102;
    wire [3:0] _2097 = 4'b0001;
    wire [3:0] _2096;
    wire _2098;
    wire [3:0] _2094 = 4'b0000;
    wire [3:0] _2093;
    wire _2095;
    wire _2099;
    wire _2103;
    wire _2107;
    wire _2111;
    wire _2115;
    wire _2119;
    wire _2123;
    wire _2127;
    wire [3:0] _2091 = 4'b0101;
    wire [3:0] _2090;
    wire _2092;
    wire _2128;
    wire [15:0] _2086 = 16'b0000000000000000;
    wire [15:0] _2084 = 16'b0000000011000000;
    wire [15:0] _2085;
    wire _2087;
    wire [3:0] _2080 = 4'b0100;
    wire [3:0] _2079;
    wire _2081;
    wire [3:0] _2076 = 4'b0011;
    wire [3:0] _2075;
    wire _2077;
    wire [3:0] _2072 = 4'b0010;
    wire [3:0] _2071;
    wire _2073;
    wire [3:0] _2068 = 4'b0001;
    wire [3:0] _2067;
    wire _2069;
    wire [3:0] _2065 = 4'b0000;
    wire [3:0] _2064;
    wire _2066;
    wire _2070;
    wire _2074;
    wire _2078;
    wire _2082;
    wire [3:0] _2062 = 4'b0100;
    wire [3:0] _2061;
    wire _2063;
    wire _2083;
    wire _2088;
    wire [15:0] _2057 = 16'b0000000000000000;
    wire [15:0] _2055 = 16'b0000000000111111;
    wire [15:0] _2056;
    wire _2058;
    wire [1:0] _2051 = 2'b10;
    wire [1:0] _2050;
    wire _2052;
    wire [1:0] _2047 = 2'b01;
    wire [1:0] _2046;
    wire _2048;
    wire [1:0] _2044 = 2'b00;
    wire [1:0] _2043;
    wire _2045;
    wire _2049;
    wire _2053;
    wire [2:0] _2039 = 3'b011;
    wire [2:0] _2038;
    wire _2040;
    wire [2:0] _2035 = 3'b010;
    wire [2:0] _2034;
    wire _2036;
    wire [2:0] _2031 = 3'b001;
    wire [2:0] _2030;
    wire _2032;
    wire [2:0] _2028 = 3'b000;
    wire [2:0] _2027;
    wire _2029;
    wire _2033;
    wire _2037;
    wire _2041;
    wire [3:0] _2025 = 4'b0011;
    wire [3:0] _2024;
    wire _2026;
    wire _2042;
    wire _2054;
    wire _2059;
    wire [3:0] _2021 = 4'b0010;
    wire [3:0] _2020;
    wire _2022;
    wire [2:0] _2015 = 3'b111;
    wire [2:0] _2014;
    wire _2016;
    wire [2:0] _2011 = 3'b110;
    wire [2:0] _2010;
    wire _2012;
    wire [2:0] _2007 = 3'b101;
    wire [2:0] _2006;
    wire _2008;
    wire [2:0] _2003 = 3'b100;
    wire [2:0] _2002;
    wire _2004;
    wire [2:0] _1999 = 3'b011;
    wire [2:0] _1998;
    wire _2000;
    wire [2:0] _1995 = 3'b010;
    wire [2:0] _1994;
    wire _1996;
    wire [2:0] _1991 = 3'b001;
    wire [2:0] _1990;
    wire _1992;
    wire [2:0] _1988 = 3'b000;
    wire [2:0] _1987;
    wire _1989;
    wire _1993;
    wire _1997;
    wire _2001;
    wire _2005;
    wire _2009;
    wire _2013;
    wire _2017;
    wire [3:0] _1985 = 4'b0001;
    wire [3:0] _1984;
    wire _1986;
    wire _2018;
    wire [15:0] _1981 = 16'b0000000000000000;
    wire [15:0] _1979 = 16'b0000111111111111;
    wire [15:0] _1980;
    wire _1982;
    wire [3:0] _1977 = 4'b0000;
    wire [15:0] _1974 = 16'b0000000000000000;
    wire [15:0] _1973 = 16'b0000000000000000;
    wire [5:0] _3475 = 6'b111111;
    wire _3476;
    wire _3477;
    wire [15:0] _3474 = 16'b0000000000000000;
    wire [15:0] _3473 = 16'b0000000000000000;
    reg [15:0] imem_63;
    wire [5:0] _3469 = 6'b111110;
    wire _3470;
    wire _3471;
    wire [15:0] _3468 = 16'b0000000000000000;
    wire [15:0] _3467 = 16'b0000000000000000;
    reg [15:0] imem_62;
    wire [5:0] _3463 = 6'b111101;
    wire _3464;
    wire _3465;
    wire [15:0] _3462 = 16'b0000000000000000;
    wire [15:0] _3461 = 16'b0000000000000000;
    reg [15:0] imem_61;
    wire [5:0] _3457 = 6'b111100;
    wire _3458;
    wire _3459;
    wire [15:0] _3456 = 16'b0000000000000000;
    wire [15:0] _3455 = 16'b0000000000000000;
    reg [15:0] imem_60;
    wire [5:0] _3451 = 6'b111011;
    wire _3452;
    wire _3453;
    wire [15:0] _3450 = 16'b0000000000000000;
    wire [15:0] _3449 = 16'b0000000000000000;
    reg [15:0] imem_59;
    wire [5:0] _3445 = 6'b111010;
    wire _3446;
    wire _3447;
    wire [15:0] _3444 = 16'b0000000000000000;
    wire [15:0] _3443 = 16'b0000000000000000;
    reg [15:0] imem_58;
    wire [5:0] _3439 = 6'b111001;
    wire _3440;
    wire _3441;
    wire [15:0] _3438 = 16'b0000000000000000;
    wire [15:0] _3437 = 16'b0000000000000000;
    reg [15:0] imem_57;
    wire [5:0] _3433 = 6'b111000;
    wire _3434;
    wire _3435;
    wire [15:0] _3432 = 16'b0000000000000000;
    wire [15:0] _3431 = 16'b0000000000000000;
    reg [15:0] imem_56;
    wire [5:0] _3427 = 6'b110111;
    wire _3428;
    wire _3429;
    wire [15:0] _3426 = 16'b0000000000000000;
    wire [15:0] _3425 = 16'b0000000000000000;
    reg [15:0] imem_55;
    wire [5:0] _3421 = 6'b110110;
    wire _3422;
    wire _3423;
    wire [15:0] _3420 = 16'b0000000000000000;
    wire [15:0] _3419 = 16'b0000000000000000;
    reg [15:0] imem_54;
    wire [5:0] _3415 = 6'b110101;
    wire _3416;
    wire _3417;
    wire [15:0] _3414 = 16'b0000000000000000;
    wire [15:0] _3413 = 16'b0000000000000000;
    reg [15:0] imem_53;
    wire [5:0] _3409 = 6'b110100;
    wire _3410;
    wire _3411;
    wire [15:0] _3408 = 16'b0000000000000000;
    wire [15:0] _3407 = 16'b0000000000000000;
    reg [15:0] imem_52;
    wire [5:0] _3403 = 6'b110011;
    wire _3404;
    wire _3405;
    wire [15:0] _3402 = 16'b0000000000000000;
    wire [15:0] _3401 = 16'b0000000000000000;
    reg [15:0] imem_51;
    wire [5:0] _3397 = 6'b110010;
    wire _3398;
    wire _3399;
    wire [15:0] _3396 = 16'b0000000000000000;
    wire [15:0] _3395 = 16'b0000000000000000;
    reg [15:0] imem_50;
    wire [5:0] _3391 = 6'b110001;
    wire _3392;
    wire _3393;
    wire [15:0] _3390 = 16'b0000000000000000;
    wire [15:0] _3389 = 16'b0000000000000000;
    reg [15:0] imem_49;
    wire [5:0] _3385 = 6'b110000;
    wire _3386;
    wire _3387;
    wire [15:0] _3384 = 16'b0000000000000000;
    wire [15:0] _3383 = 16'b0000000000000000;
    reg [15:0] imem_48;
    wire [5:0] _3379 = 6'b101111;
    wire _3380;
    wire _3381;
    wire [15:0] _3378 = 16'b0000000000000000;
    wire [15:0] _3377 = 16'b0000000000000000;
    reg [15:0] imem_47;
    wire [5:0] _3373 = 6'b101110;
    wire _3374;
    wire _3375;
    wire [15:0] _3372 = 16'b0000000000000000;
    wire [15:0] _3371 = 16'b0000000000000000;
    reg [15:0] imem_46;
    wire [5:0] _3367 = 6'b101101;
    wire _3368;
    wire _3369;
    wire [15:0] _3366 = 16'b0000000000000000;
    wire [15:0] _3365 = 16'b0000000000000000;
    reg [15:0] imem_45;
    wire [5:0] _3361 = 6'b101100;
    wire _3362;
    wire _3363;
    wire [15:0] _3360 = 16'b0000000000000000;
    wire [15:0] _3359 = 16'b0000000000000000;
    reg [15:0] imem_44;
    wire [5:0] _3355 = 6'b101011;
    wire _3356;
    wire _3357;
    wire [15:0] _3354 = 16'b0000000000000000;
    wire [15:0] _3353 = 16'b0000000000000000;
    reg [15:0] imem_43;
    wire [5:0] _3349 = 6'b101010;
    wire _3350;
    wire _3351;
    wire [15:0] _3348 = 16'b0000000000000000;
    wire [15:0] _3347 = 16'b0000000000000000;
    reg [15:0] imem_42;
    wire [5:0] _3343 = 6'b101001;
    wire _3344;
    wire _3345;
    wire [15:0] _3342 = 16'b0000000000000000;
    wire [15:0] _3341 = 16'b0000000000000000;
    reg [15:0] imem_41;
    wire [5:0] _3337 = 6'b101000;
    wire _3338;
    wire _3339;
    wire [15:0] _3336 = 16'b0000000000000000;
    wire [15:0] _3335 = 16'b0000000000000000;
    reg [15:0] imem_40;
    wire [5:0] _3331 = 6'b100111;
    wire _3332;
    wire _3333;
    wire [15:0] _3330 = 16'b0000000000000000;
    wire [15:0] _3329 = 16'b0000000000000000;
    reg [15:0] imem_39;
    wire [5:0] _3325 = 6'b100110;
    wire _3326;
    wire _3327;
    wire [15:0] _3324 = 16'b0000000000000000;
    wire [15:0] _3323 = 16'b0000000000000000;
    reg [15:0] imem_38;
    wire [5:0] _3319 = 6'b100101;
    wire _3320;
    wire _3321;
    wire [15:0] _3318 = 16'b0000000000000000;
    wire [15:0] _3317 = 16'b0000000000000000;
    reg [15:0] imem_37;
    wire [5:0] _3313 = 6'b100100;
    wire _3314;
    wire _3315;
    wire [15:0] _3312 = 16'b0000000000000000;
    wire [15:0] _3311 = 16'b0000000000000000;
    reg [15:0] imem_36;
    wire [5:0] _3307 = 6'b100011;
    wire _3308;
    wire _3309;
    wire [15:0] _3306 = 16'b0000000000000000;
    wire [15:0] _3305 = 16'b0000000000000000;
    reg [15:0] imem_35;
    wire [5:0] _3301 = 6'b100010;
    wire _3302;
    wire _3303;
    wire [15:0] _3300 = 16'b0000000000000000;
    wire [15:0] _3299 = 16'b0000000000000000;
    reg [15:0] imem_34;
    wire [5:0] _3295 = 6'b100001;
    wire _3296;
    wire _3297;
    wire [15:0] _3294 = 16'b0000000000000000;
    wire [15:0] _3293 = 16'b0000000000000000;
    reg [15:0] imem_33;
    wire [5:0] _3289 = 6'b100000;
    wire _3290;
    wire _3291;
    wire [15:0] _3284 = 16'b0000000000000000;
    wire [15:0] _3283 = 16'b0000000000000000;
    reg [15:0] imem_32;
    wire [5:0] _4207 = 6'b011111;
    wire _4208;
    wire _4209;
    wire [15:0] _4206 = 16'b0000000000000000;
    wire [15:0] _4205 = 16'b0000000000000000;
    reg [15:0] imem_31;
    wire [5:0] _4201 = 6'b011110;
    wire _4202;
    wire _4203;
    wire [15:0] _4200 = 16'b0000000000000000;
    wire [15:0] _4199 = 16'b0000000000000000;
    reg [15:0] imem_30;
    wire [5:0] _4195 = 6'b011101;
    wire _4196;
    wire _4197;
    wire [15:0] _4194 = 16'b0000000000000000;
    wire [15:0] _4193 = 16'b0000000000000000;
    reg [15:0] imem_29;
    wire [5:0] _4189 = 6'b011100;
    wire _4190;
    wire _4191;
    wire [15:0] _4188 = 16'b0000000000000000;
    wire [15:0] _4187 = 16'b0000000000000000;
    reg [15:0] imem_28;
    wire [5:0] _4183 = 6'b011011;
    wire _4184;
    wire _4185;
    wire [15:0] _4182 = 16'b0000000000000000;
    wire [15:0] _4181 = 16'b0000000000000000;
    reg [15:0] imem_27;
    wire [5:0] _4177 = 6'b011010;
    wire _4178;
    wire _4179;
    wire [15:0] _4176 = 16'b0000000000000000;
    wire [15:0] _4175 = 16'b0000000000000000;
    reg [15:0] imem_26;
    wire [5:0] _4171 = 6'b011001;
    wire _4172;
    wire _4173;
    wire [15:0] _4170 = 16'b0000000000000000;
    wire [15:0] _4169 = 16'b0000000000000000;
    reg [15:0] imem_25;
    wire [5:0] _4165 = 6'b011000;
    wire _4166;
    wire _4167;
    wire [15:0] _4164 = 16'b0000000000000000;
    wire [15:0] _4163 = 16'b0000000000000000;
    reg [15:0] imem_24;
    wire [5:0] _4159 = 6'b010111;
    wire _4160;
    wire _4161;
    wire [15:0] _4158 = 16'b0000000000000000;
    wire [15:0] _4157 = 16'b0000000000000000;
    reg [15:0] imem_23;
    wire [5:0] _4153 = 6'b010110;
    wire _4154;
    wire _4155;
    wire [15:0] _4152 = 16'b0000000000000000;
    wire [15:0] _4151 = 16'b0000000000000000;
    reg [15:0] imem_22;
    wire [5:0] _4147 = 6'b010101;
    wire _4148;
    wire _4149;
    wire [15:0] _4146 = 16'b0000000000000000;
    wire [15:0] _4145 = 16'b0000000000000000;
    reg [15:0] imem_21;
    wire [5:0] _4141 = 6'b010100;
    wire _4142;
    wire _4143;
    wire [15:0] _4140 = 16'b0000000000000000;
    wire [15:0] _4139 = 16'b0000000000000000;
    reg [15:0] imem_20;
    wire [5:0] _4135 = 6'b010011;
    wire _4136;
    wire _4137;
    wire [15:0] _4134 = 16'b0000000000000000;
    wire [15:0] _4133 = 16'b0000000000000000;
    reg [15:0] imem_19;
    wire [5:0] _4129 = 6'b010010;
    wire _4130;
    wire _4131;
    wire [15:0] _4128 = 16'b0000000000000000;
    wire [15:0] _4127 = 16'b0000000000000000;
    reg [15:0] imem_18;
    wire [5:0] _4123 = 6'b010001;
    wire _4124;
    wire _4125;
    wire [15:0] _4122 = 16'b0000000000000000;
    wire [15:0] _4121 = 16'b0000000000000000;
    reg [15:0] imem_17;
    wire [5:0] _4117 = 6'b010000;
    wire _4118;
    wire _4119;
    wire [15:0] _4116 = 16'b0000000000000000;
    wire [15:0] _4115 = 16'b0000000000000000;
    reg [15:0] imem_16;
    wire [5:0] _4111 = 6'b001111;
    wire _4112;
    wire _4113;
    wire [15:0] _4110 = 16'b0000000000000000;
    wire [15:0] _4109 = 16'b0000000000000000;
    reg [15:0] imem_15;
    wire [5:0] _4105 = 6'b001110;
    wire _4106;
    wire _4107;
    wire [15:0] _4104 = 16'b0000000000000000;
    wire [15:0] _4103 = 16'b0000000000000000;
    reg [15:0] imem_14;
    wire [5:0] _4099 = 6'b001101;
    wire _4100;
    wire _4101;
    wire [15:0] _4098 = 16'b0000000000000000;
    wire [15:0] _4097 = 16'b0000000000000000;
    reg [15:0] imem_13;
    wire [5:0] _4093 = 6'b001100;
    wire _4094;
    wire _4095;
    wire [15:0] _4092 = 16'b0000000000000000;
    wire [15:0] _4091 = 16'b0000000000000000;
    reg [15:0] imem_12;
    wire [5:0] _4087 = 6'b001011;
    wire _4088;
    wire _4089;
    wire [15:0] _4086 = 16'b0000000000000000;
    wire [15:0] _4085 = 16'b0000000000000000;
    reg [15:0] imem_11;
    wire [5:0] _4081 = 6'b001010;
    wire _4082;
    wire _4083;
    wire [15:0] _4080 = 16'b0000000000000000;
    wire [15:0] _4079 = 16'b0000000000000000;
    reg [15:0] imem_10;
    wire [5:0] _4075 = 6'b001001;
    wire _4076;
    wire _4077;
    wire [15:0] _4074 = 16'b0000000000000000;
    wire [15:0] _4073 = 16'b0000000000000000;
    reg [15:0] imem_09;
    wire [5:0] _4069 = 6'b001000;
    wire _4070;
    wire _4071;
    wire [15:0] _4068 = 16'b0000000000000000;
    wire [15:0] _4067 = 16'b0000000000000000;
    reg [15:0] imem_08;
    wire [5:0] _4063 = 6'b000111;
    wire _4064;
    wire _4065;
    wire [15:0] _4062 = 16'b0000000000000000;
    wire [15:0] _4061 = 16'b0000000000000000;
    reg [15:0] imem_07;
    wire [5:0] _4057 = 6'b000110;
    wire _4058;
    wire _4059;
    wire [15:0] _4056 = 16'b0000000000000000;
    wire [15:0] _4055 = 16'b0000000000000000;
    reg [15:0] imem_06;
    wire [5:0] _4051 = 6'b000101;
    wire _4052;
    wire _4053;
    wire [15:0] _4050 = 16'b0000000000000000;
    wire [15:0] _4049 = 16'b0000000000000000;
    reg [15:0] imem_05;
    wire [5:0] _4045 = 6'b000100;
    wire _4046;
    wire _4047;
    wire [15:0] _4044 = 16'b0000000000000000;
    wire [15:0] _4043 = 16'b0000000000000000;
    reg [15:0] imem_04;
    wire [5:0] _4039 = 6'b000011;
    wire _4040;
    wire _4041;
    wire [15:0] _4038 = 16'b0000000000000000;
    wire [15:0] _4037 = 16'b0000000000000000;
    reg [15:0] imem_03;
    wire [5:0] _4033 = 6'b000010;
    wire _4034;
    wire _4035;
    wire [15:0] _4032 = 16'b0000000000000000;
    wire [15:0] _4031 = 16'b0000000000000000;
    reg [15:0] imem_02;
    wire [5:0] _4027 = 6'b000001;
    wire _4028;
    wire _4029;
    wire [15:0] _4026 = 16'b0000000000000000;
    wire [15:0] _4025 = 16'b0000000000000000;
    reg [15:0] imem_01;
    wire [5:0] _4021 = 6'b000000;
    wire [5:0] _3288;
    wire _4022;
    wire [6:0] _3285 = 7'b1000000;
    wire _3286;
    wire _3287;
    wire _4023;
    wire [15:0] _4020 = 16'b0000000000000000;
    wire [15:0] _4019 = 16'b0000000000000000;
    wire [15:0] _3282;
    reg [15:0] imem_00;
    wire [5:0] _4018;
    reg [15:0] _4211;
    wire [15:0] _119;
    wire _3836;
    wire [5:0] _2159 = 6'b000000;
    wire [5:0] _2158 = 6'b000000;
    wire [6:0] _3273 = 7'b1000111;
    wire _3274;
    wire _3275;
    wire [13:0] _3272 = 14'b00000000000000;
    wire [13:0] _3271 = 14'b00000000000000;
    wire [13:0] _3270;
    reg [13:0] _3276;
    wire [5:0] _4017;
    wire [5:0] _4014 = 6'b000001;
    wire [5:0] _4015;
    wire _4010;
    wire _4009;
    wire _4008;
    wire _4007;
    wire _4006;
    wire _4005;
    wire _4004;
    wire _4003;
    reg _4011;
    wire [3:0] _3999 = 4'b0100;
    wire _4000;
    wire _4001;
    wire _4002;
    wire _4012;
    wire _3995 = 1'b0;
    wire _3994 = 1'b0;
    wire _4212;
    wire _4213;
    wire _4214;
    wire _4215;
    wire _120;
    reg seq_a_flag;
    wire [3:0] _3991 = 4'b0011;
    wire _3992;
    wire _3993;
    wire _3997;
    wire [15:0] _3985 = 16'b0000000000000000;
    wire _3986;
    wire _3987;
    wire [3:0] _3983 = 4'b0010;
    wire _3984;
    wire _3988;
    wire [15:0] _3978 = 16'b0000000000000000;
    wire _3979;
    wire _3980;
    wire [3:0] _3976 = 4'b0001;
    wire _3977;
    wire _3981;
    wire [3:0] _3974 = 4'b0000;
    wire _3975;
    wire _3982;
    wire _3989;
    wire _3990;
    wire _3998;
    wire _4013;
    wire [5:0] _4016;
    wire [5:0] _4216;
    wire [5:0] _4217;
    wire [5:0] _121;
    reg [5:0] seq_a_ir_pc;
    wire [5:0] _2157;
    wire _2161;
    wire [3:0] _2154 = 4'b0000;
    wire _2155;
    wire _2156;
    wire _2162;
    wire _3834;
    wire _3829;
    wire [3:0] _3826 = 4'b0100;
    wire _3827;
    wire _3828;
    wire _3830;
    wire [15:0] _3817 = 16'b1111111111111111;
    wire [15:0] _3815 = 16'b0000000000000000;
    wire [15:0] _3814 = 16'b0000000000000000;
    wire [15:0] _4247 = 16'b0000000000000000;
    wire [7:0] _4243;
    wire [15:0] _4244;
    wire [7:0] _4240 = 8'b00000000;
    wire [15:0] _4241;
    wire [15:0] _4237 = 16'b0000000000000001;
    wire [15:0] _4238;
    wire [15:0] _4233 = 16'b0000000000000000;
    wire _4234;
    wire _4235;
    wire [3:0] _4230 = 4'b0010;
    wire _4231;
    wire _4232;
    wire _4236;
    wire [15:0] _4239;
    wire [3:0] _4227 = 4'b0001;
    wire _4228;
    wire [3:0] _4224 = 4'b0101;
    wire _4225;
    wire _4226;
    wire _4229;
    wire [15:0] _4242;
    wire [3:0] _4221 = 4'b1001;
    wire _4222;
    wire [3:0] _4218 = 4'b0101;
    wire _4219;
    wire _4220;
    wire _4223;
    wire [15:0] _4245;
    wire [15:0] _4246;
    wire [15:0] _4248;
    wire [15:0] _122;
    reg [15:0] seq_a_y;
    wire [15:0] _3812 = 16'b0000000000000000;
    wire [15:0] _3811 = 16'b0000000000000000;
    wire [15:0] _4278 = 16'b0000000000000000;
    wire [7:0] _4274;
    wire [15:0] _4275;
    wire [7:0] _4271 = 8'b00000000;
    wire [15:0] _4272;
    wire [15:0] _4268 = 16'b0000000000000001;
    wire [15:0] _4269;
    wire [15:0] _4264 = 16'b0000000000000000;
    wire _4265;
    wire _4266;
    wire [3:0] _4261 = 4'b0001;
    wire [3:0] _2153;
    wire _4262;
    wire [3:0] _2150 = 4'b0100;
    wire _2151;
    wire _2152;
    wire _4263;
    wire _4267;
    wire [15:0] _4270;
    wire [3:0] _4258 = 4'b0000;
    wire _4259;
    wire [3:0] _4255 = 4'b0101;
    wire _4256;
    wire _4257;
    wire _4260;
    wire [15:0] _4273;
    wire [3:0] _4252 = 4'b1000;
    wire _4253;
    wire [3:0] _4249 = 4'b0101;
    wire _4250;
    wire _4251;
    wire _4254;
    wire [15:0] _4276;
    wire [15:0] _4277;
    wire [15:0] _4279;
    wire [15:0] _123;
    reg [15:0] seq_a_x;
    wire [15:0] _3810 = 16'b1111111111111111;
    reg [15:0] _3818;
    wire [15:0] _3808 = 16'b0000000000000000;
    wire [15:0] _3807 = 16'b0000000000000000;
    wire [15:0] _4288 = 16'b0000000000000000;
    wire [15:0] _4285 = 16'b0000000000000001;
    wire [15:0] _4286;
    wire [15:0] _4284 = 16'b0000000000000000;
    wire _4282;
    wire _4280;
    wire _4281;
    wire _4283;
    wire [15:0] _4287;
    wire [15:0] _4289;
    wire [15:0] _124;
    reg [15:0] seq_a_wait_count;
    wire _3819;
    wire [1:0] _3804 = 2'b00;
    wire [1:0] _3803;
    wire _3805;
    wire _3806;
    wire _3820;
    wire _3801;
    wire _3799;
    wire _3798;
    wire _3797;
    wire _3796;
    wire _3795;
    wire _3794;
    wire _3793;
    wire [7:0] _736 = 8'b00000000;
    wire [7:0] _735 = 8'b00000000;
    wire [7:0] _733 = 8'b00000000;
    wire [7:0] _732 = 8'b00000000;
    wire [7:0] _126;
    reg [7:0] pins_sync1;
    reg [7:0] pins_sync;
    wire _3792;
    wire [2:0] _3682;
    wire [2:0] _3680;
    wire [2:0] _3679;
    wire [2:0] _3683;
    wire [2:0] _3789;
    wire [1:0] _3790;
    reg [2:0] _3791;
    reg _3800;
    wire _3802;
    wire _3821;
    wire _3787 = 1'b0;
    wire _3786 = 1'b0;
    wire [23:0] _4341 = 24'b000000000000000000000000;
    wire _4342;
    wire [23:0] _4337 = 24'b000000000000000000000001;
    wire [23:0] _4338;
    wire [23:0] _4339;
    wire _4340;
    wire _4343;
    wire [23:0] _4320 = 24'b000000000000000000000000;
    wire _4321;
    wire [23:0] _4316 = 24'b000000000000000000000001;
    wire [23:0] _4317;
    wire [23:0] _4318;
    wire _4319;
    wire _4322;
    wire _4344;
    wire _4345;
    wire [23:0] _4299 = 24'b000000000000000000000000;
    wire _4300;
    wire [23:0] _4295 = 24'b000000000000000000000001;
    wire [23:0] _4296;
    wire [23:0] _4297;
    wire _4298;
    wire _4301;
    wire _4293;
    wire _4291;
    wire _4290;
    wire _4292;
    wire _4294;
    wire _4346;
    wire _4347;
    wire _127;
    reg seq_a_caught_up;
    wire _3822;
    wire _3823;
    wire _3824;
    wire [2:0] _3776 = 3'b000;
    wire [2:0] _3775 = 3'b000;
    wire [2:0] _3912 = 3'b000;
    wire _3913;
    wire _128;
    wire _3914;
    wire [1:0] _4351 = 2'b00;
    wire [2:0] _4352;
    wire [2:0] _3875 = 3'b100;
    wire _3876;
    wire [6:0] _3872 = 7'b1000011;
    wire _3873;
    wire _3874;
    wire _3877;
    wire [1:0] _4348 = 2'b00;
    wire [2:0] _4349;
    wire [2:0] _4350;
    wire [2:0] _4353;
    wire [2:0] _129;
    reg [2:0] _3777;
    wire [2:0] _3774 = 3'b000;
    wire _3778;
    wire _3773;
    wire _3779;
    wire _3780;
    wire _3770 = 1'b0;
    wire _3769;
    wire _3771;
    wire [3:0] _3766 = 4'b0111;
    wire _3767;
    wire _3768;
    wire _3772;
    wire _3781;
    wire _2190 = 1'b0;
    wire _2189 = 1'b0;
    wire _4378;
    wire _4377;
    wire _4379;
    wire [23:0] _2201 = 24'b000000000000000000000000;
    wire [23:0] _2200 = 24'b000000000000000000000000;
    wire [23:0] _4371 = 24'b000000000000000001000000;
    wire [23:0] _4372;
    wire [23:0] _228 = 24'b000000000000000000000000;
    wire [23:0] _227 = 24'b000000000000000000000000;
    wire [23:0] _4354 = 24'b000000000000000000000001;
    wire [23:0] _4355;
    wire [23:0] _130;
    reg [23:0] timebase;
    wire [5:0] _4312 = 6'b000000;
    wire [17:0] _4311;
    wire [23:0] _4313;
    wire [3:0] _4309 = 4'b0000;
    wire [19:0] _4308;
    wire [23:0] _4310;
    wire [1:0] _4306 = 2'b00;
    wire [21:0] _4305;
    wire [23:0] _4307;
    wire [11:0] _4303;
    wire [11:0] _4302 = 12'b000000000000;
    wire [23:0] _4304;
    reg [23:0] _4314;
    wire [23:0] _4315;
    wire [5:0] _4333 = 6'b000000;
    wire [17:0] _4332;
    wire [23:0] _4334;
    wire [3:0] _4330 = 4'b0000;
    wire [19:0] _4329;
    wire [23:0] _4331;
    wire [1:0] _4327 = 2'b00;
    wire [21:0] _4326;
    wire [23:0] _4328;
    wire [5:0] _4324;
    wire [17:0] _4323 = 18'b000000000000000000;
    wire [23:0] _4325;
    wire [1:0] _2204 = 2'b00;
    wire [1:0] _2203 = 2'b00;
    wire [1:0] _4365 = 2'b00;
    wire [7:0] _3866;
    wire [1:0] _4362;
    wire [3:0] _4359 = 4'b0111;
    wire [3:0] _3862;
    wire _4360;
    wire [3:0] _4356 = 4'b0101;
    wire _4357;
    wire _4358;
    wire _4361;
    wire [1:0] _4363;
    wire [1:0] _4364;
    wire [1:0] _4366;
    wire [1:0] _131;
    reg [1:0] seq_a_prescale;
    reg [23:0] _4335;
    wire [23:0] _4336;
    wire [23:0] _4367;
    wire [23:0] _4368;
    wire [3:0] _3783 = 4'b0011;
    wire _3784;
    wire _3785;
    wire [23:0] _4369;
    wire [23:0] _4370;
    wire [23:0] _4373;
    wire [23:0] _132;
    reg [23:0] seq_a_sched_s;
    wire [23:0] _4374;
    wire _4375;
    wire _4376;
    wire _4380;
    wire _4381;
    wire _133;
    reg seq_a_far;
    wire _3761;
    wire [3:0] _3757 = 4'b0010;
    wire _3758;
    wire _3759;
    wire _3760;
    wire _3762;
    wire _3763;
    wire [3:0] _3754 = 4'b0010;
    wire _3755;
    wire _3756;
    wire _3764;
    wire _3752;
    wire [3:0] _3749 = 4'b0001;
    wire [3:0] _2149;
    wire _3750;
    wire _3751;
    wire _3753;
    wire _3765;
    wire _3782;
    wire _3825;
    wire _3831;
    wire _3832;
    wire _3833;
    wire _3835;
    wire _3837;
    wire [15:0] _4382;
    wire [15:0] _4383;
    wire [15:0] _134;
    reg [15:0] seq_a_ir;
    wire [3:0] _1976;
    wire _1978;
    wire _1983;
    wire _2019;
    wire _2023;
    wire _2060;
    wire _2089;
    wire _2129;
    wire _2146;
    wire _2147;
    wire _2148;
    wire _4385;
    wire _4386;
    wire _135;
    reg seq_a_running;
    wire _2187;
    wire _2188;
    wire _2193;
    wire _2196;
    wire [1:0] _4387 = 2'b00;
    wire [2:0] _4388;
    wire [2:0] _4389;
    wire [2:0] _4390;
    wire [2:0] _136;
    reg [2:0] queue_a_count;
    wire [2:0] _189 = 3'b000;
    wire _209;
    wire _237;
    wire _4398;
    wire _4403;
    wire _4405;
    wire _4417;
    wire _4429;
    wire _4441;
    wire _4442;
    wire _277;
    wire _278;
    wire _204;
    wire _205;
    wire _4391;
    wire _4443;
    wire _137;
    reg _4394;
    wire _4447 = 1'b0;
    wire _4446 = 1'b0;
    wire [5:0] _4487 = 6'b101000;
    wire _4488;
    wire _4489;
    wire [5:0] _4483 = 6'b000000;
    wire _4484;
    wire _4485;
    wire _4479 = 1'b0;
    wire _4478 = 1'b0;
    reg _4480;
    wire _4481;
    wire _4482;
    wire _4486;
    wire _4490;
    wire [5:0] _4473 = 6'b101000;
    wire _4474;
    wire _4475;
    wire _4476;
    wire _4477;
    wire _4491;
    wire _4444;
    wire [6:0] _198 = 7'b1000000;
    wire _199;
    wire _200;
    wire _4445;
    wire _138;
    wire _4492;
    wire _139;
    reg _4448;
    wire [31:0] _4594;
    wire [31:0] _4584 = 32'b00000000000000000000000000000000;
    wire [6:0] _3187 = 7'b1000010;
    wire _3188;
    wire _3189;
    wire [23:0] _3186 = 24'b000000000000000000000000;
    wire [23:0] _3185 = 24'b000000000000000000000000;
    wire [23:0] _3184;
    reg [23:0] _3190;
    wire [7:0] _4582 = 8'b00000000;
    wire [31:0] _4583;
    wire [6:0] _3675 = 7'b1000001;
    wire _3676;
    wire _192 = 1'b0;
    wire _191 = 1'b0;
    wire _4497;
    wire _4498;
    wire _4499;
    wire _140;
    reg spi_wr;
    wire _3677;
    wire [11:0] _3674 = 12'b000000000000;
    wire [11:0] _3673 = 12'b000000000000;
    wire [31:0] _202 = 32'b00000000000000000000000000000000;
    wire [31:0] _201 = 32'b00000000000000000000000000000000;
    wire [5:0] _4493 = 6'b100111;
    wire _4494;
    wire _4496;
    wire [31:0] _4512;
    wire [31:0] _4513;
    wire [31:0] _4514;
    wire [31:0] _141;
    reg [31:0] spi_wdata;
    wire [11:0] _3672;
    reg [11:0] _3678;
    wire [19:0] _4580 = 20'b00000000000000000000;
    wire [31:0] _4581;
    wire [31:0] _4579 = 32'b00000000000000000000000000000000;
    wire [31:0] _4578 = 32'b00000000000000000000000000000000;
    wire [31:0] _4577 = 32'b00000000000000000000000000000000;
    wire [31:0] _4576 = 32'b00000000000000000000000000000000;
    wire [31:0] _4575 = 32'b00000000000000000000000000000000;
    wire [31:0] _4574 = 32'b00000000000000000000000000000000;
    wire [31:0] _4573 = 32'b00000000000000000000000000000000;
    wire [31:0] _4572 = 32'b00000000000000000000000000000000;
    wire [31:0] _4571 = 32'b00000000000000000000000000000000;
    wire [31:0] _4570 = 32'b00000000000000000000000000000000;
    wire [31:0] _4569 = 32'b00000000000000000000000000000000;
    wire [31:0] _4568 = 32'b00000000000000000000000000000000;
    wire [31:0] _4567 = 32'b00000000000000000000000000000000;
    wire [31:0] _4566 = 32'b00000000000000000000000000000000;
    wire [31:0] _4565 = 32'b00000000000000000000000000000000;
    wire [31:0] _4564 = 32'b00000000000000000000000000000000;
    wire [31:0] _4563 = 32'b00000000000000000000000000000000;
    wire [31:0] _4562 = 32'b00000000000000000000000000000000;
    wire [31:0] _4561 = 32'b00000000000000000000000000000000;
    wire [31:0] _4560 = 32'b00000000000000000000000000000000;
    wire [31:0] _4559 = 32'b00000000000000000000000000000000;
    wire [31:0] _4558 = 32'b00000000000000000000000000000000;
    wire [31:0] _4557 = 32'b00000000000000000000000000000000;
    wire [31:0] _4556 = 32'b00000000000000000000000000000000;
    wire [31:0] _4555 = 32'b00000000000000000000000000000000;
    wire [31:0] _4554 = 32'b00000000000000000000000000000000;
    wire [31:0] _4553 = 32'b00000000000000000000000000000000;
    wire [31:0] _4552 = 32'b00000000000000000000000000000000;
    wire [31:0] _4551 = 32'b00000000000000000000000000000000;
    wire [31:0] _4550 = 32'b00000000000000000000000000000000;
    wire [31:0] _4549 = 32'b00000000000000000000000000000000;
    wire [31:0] _4548 = 32'b00000000000000000000000000000000;
    wire [31:0] _4547 = 32'b00000000000000000000000000000000;
    wire [31:0] _4546 = 32'b00000000000000000000000000000000;
    wire [31:0] _4545 = 32'b00000000000000000000000000000000;
    wire [31:0] _4544 = 32'b00000000000000000000000000000000;
    wire [31:0] _4543 = 32'b00000000000000000000000000000000;
    wire [31:0] _4542 = 32'b00000000000000000000000000000000;
    wire [31:0] _4541 = 32'b00000000000000000000000000000000;
    wire [31:0] _4540 = 32'b00000000000000000000000000000000;
    wire [31:0] _4539 = 32'b00000000000000000000000000000000;
    wire [31:0] _4538 = 32'b00000000000000000000000000000000;
    wire [31:0] _4537 = 32'b00000000000000000000000000000000;
    wire [31:0] _4536 = 32'b00000000000000000000000000000000;
    wire [31:0] _4535 = 32'b00000000000000000000000000000000;
    wire [31:0] _4534 = 32'b00000000000000000000000000000000;
    wire [31:0] _4533 = 32'b00000000000000000000000000000000;
    wire [31:0] _4532 = 32'b00000000000000000000000000000000;
    wire [31:0] _4531 = 32'b00000000000000000000000000000000;
    wire [31:0] _4530 = 32'b00000000000000000000000000000000;
    wire [31:0] _4529 = 32'b00000000000000000000000000000000;
    wire [31:0] _4528 = 32'b00000000000000000000000000000000;
    wire [31:0] _4527 = 32'b00000000000000000000000000000000;
    wire [31:0] _4526 = 32'b00000000000000000000000000000000;
    wire [31:0] _4525 = 32'b00000000000000000000000000000000;
    wire [31:0] _4524 = 32'b00000000000000000000000000000000;
    wire [31:0] _4523 = 32'b00000000000000000000000000000000;
    wire [31:0] _4522 = 32'b00000000000000000000000000000000;
    wire [31:0] _4521 = 32'b00000000000000000000000000000000;
    wire [31:0] _4520 = 32'b00000000000000000000000000000000;
    wire [31:0] _4519 = 32'b00000000000000000000000000000000;
    wire [31:0] _4518 = 32'b00000000000000000000000000000000;
    wire [31:0] _4517 = 32'b00000000000000000000000000000000;
    wire [31:0] _4516 = 32'b00000000000000000000000000000000;
    wire [31:0] _4515 = 32'b00000000000000000000000000000000;
    wire [6:0] _197;
    reg [31:0] _4662;
    wire [31:0] _142;
    wire _4681;
    wire _4679 = 1'b0;
    wire _4678 = 1'b0;
    wire _4665;
    wire gnd = 1'b0;
    wire _4666;
    wire _4667;
    wire _143;
    reg spi_load;
    wire _4682;
    wire [31:0] _4686;
    wire [31:0] _4690;
    wire [31:0] _4691;
    wire [31:0] _144;
    reg [31:0] spi_out;
    wire _4710;
    wire [7:0] _195 = 8'b00000000;
    wire [7:0] _194 = 8'b00000000;
    wire _4509 = 1'b0;
    wire _4508 = 1'b0;
    wire _4506 = 1'b0;
    wire _4505 = 1'b0;
    wire _4504;
    reg _4507;
    reg _4510;
    wire [31:0] _4501 = 32'b00000000000000000000000000000000;
    wire [31:0] _4500 = 32'b00000000000000000000000000000000;
    wire [31:0] _4692;
    wire [31:0] _4693;
    wire [31:0] _145;
    reg [31:0] spi_shift_in;
    wire [30:0] _4503;
    wire [31:0] _4511;
    wire [7:0] _4694;
    wire [5:0] _4663 = 6'b000111;
    wire _4664;
    wire [7:0] _4695;
    wire [7:0] _4696;
    wire [7:0] _4697;
    wire [7:0] _146;
    reg [7:0] spi_cmd;
    wire _4495;
    wire _4676;
    wire [5:0] _4672 = 6'b001000;
    wire [5:0] _4471 = 6'b000000;
    wire [5:0] _4470 = 6'b000000;
    wire [5:0] _4705 = 6'b000000;
    wire [5:0] _4701 = 6'b000001;
    wire [5:0] _4702;
    wire [5:0] _4698 = 6'b111111;
    wire _4699;
    wire _4700;
    wire [5:0] _4703;
    wire _4468;
    wire _4459;
    wire _4460;
    wire _4469;
    wire [5:0] _4704;
    wire [5:0] _4706;
    wire [5:0] _147;
    reg [5:0] spi_bitcnt;
    wire _4673;
    wire _4674;
    wire _4670;
    wire _4457 = 1'b0;
    wire _162 = 1'b0;
    wire _161 = 1'b0;
    wire _158 = 1'b0;
    wire _157 = 1'b0;
    wire _149;
    reg _160;
    reg _163;
    wire _164;
    wire _4456 = 1'b0;
    reg _4458;
    wire _4454 = 1'b0;
    wire _4453 = 1'b0;
    wire _4451 = 1'b0;
    wire _4450 = 1'b0;
    wire _4449;
    reg _4452;
    reg _4455;
    wire _4668;
    wire _4669;
    wire _4671;
    wire _4675;
    wire _4677;
    wire _4711;
    wire _4466 = 1'b0;
    wire _4465 = 1'b0;
    wire vdd = 1'b1;
    wire _4463 = 1'b0;
    wire _4462 = 1'b0;
    wire _151;
    wire [7:0] _153;
    wire _4461;
    reg _4464;
    reg _4467;
    wire _4712;
    wire _154;
    reg spi_miso;
    wire [7:0] _4723;

    /* logic */
    assign _358 = _257 == _357;
    assign _355 = _268 == _354;
    assign _352 = _327 == _351;
    assign _349 = _338 == _348;
    assign _344 = _337 & _343;
    assign _350 = _344 ? _349 : pin0_out;
    assign _333 = _326 & _332;
    assign _353 = _333 ? _352 : _350;
    assign _274 = _267 & _273;
    assign _356 = _274 ? _355 : _353;
    assign _263 = _256 & _262;
    assign _359 = _263 ? _358 : _356;
    assign _2 = _359;
    always @(posedge _151) begin
        if (_164)
            pin0_out <= _346;
        else
            pin0_out <= _2;
    end
    assign _409 = _257 == _408;
    assign _406 = _268 == _405;
    assign _403 = _327 == _402;
    assign _400 = _338 == _399;
    assign _395 = _389 & _394;
    assign _401 = _395 ? _400 : pin1_out;
    assign _386 = _380 & _385;
    assign _404 = _386 ? _403 : _401;
    assign _377 = _371 & _376;
    assign _407 = _377 ? _406 : _404;
    assign _368 = _362 & _367;
    assign _410 = _368 ? _409 : _407;
    assign _3 = _410;
    always @(posedge _151) begin
        if (_164)
            pin1_out <= _397;
        else
            pin1_out <= _3;
    end
    assign _460 = _257 == _459;
    assign _457 = _268 == _456;
    assign _454 = _327 == _453;
    assign _451 = _338 == _450;
    assign _446 = _440 & _445;
    assign _452 = _446 ? _451 : pin2_out;
    assign _437 = _431 & _436;
    assign _455 = _437 ? _454 : _452;
    assign _428 = _422 & _427;
    assign _458 = _428 ? _457 : _455;
    assign _419 = _413 & _418;
    assign _461 = _419 ? _460 : _458;
    assign _4 = _461;
    always @(posedge _151) begin
        if (_164)
            pin2_out <= _448;
        else
            pin2_out <= _4;
    end
    assign _511 = _257 == _510;
    assign _508 = _268 == _507;
    assign _505 = _327 == _504;
    assign _502 = _338 == _501;
    assign _497 = _491 & _496;
    assign _503 = _497 ? _502 : pin3_out;
    assign _488 = _482 & _487;
    assign _506 = _488 ? _505 : _503;
    assign _479 = _473 & _478;
    assign _509 = _479 ? _508 : _506;
    assign _470 = _464 & _469;
    assign _512 = _470 ? _511 : _509;
    assign _5 = _512;
    always @(posedge _151) begin
        if (_164)
            pin3_out <= _499;
        else
            pin3_out <= _5;
    end
    assign _562 = _257 == _561;
    assign _559 = _268 == _558;
    assign _556 = _327 == _555;
    assign _553 = _338 == _552;
    assign _548 = _542 & _547;
    assign _554 = _548 ? _553 : pin4_out;
    assign _539 = _533 & _538;
    assign _557 = _539 ? _556 : _554;
    assign _530 = _524 & _529;
    assign _560 = _530 ? _559 : _557;
    assign _521 = _515 & _520;
    assign _563 = _521 ? _562 : _560;
    assign _6 = _563;
    always @(posedge _151) begin
        if (_164)
            pin4_out <= _550;
        else
            pin4_out <= _6;
    end
    assign _613 = _257 == _612;
    assign _610 = _268 == _609;
    assign _607 = _327 == _606;
    assign _604 = _338 == _603;
    assign _599 = _593 & _598;
    assign _605 = _599 ? _604 : pin5_out;
    assign _590 = _584 & _589;
    assign _608 = _590 ? _607 : _605;
    assign _581 = _575 & _580;
    assign _611 = _581 ? _610 : _608;
    assign _572 = _566 & _571;
    assign _614 = _572 ? _613 : _611;
    assign _7 = _614;
    always @(posedge _151) begin
        if (_164)
            pin5_out <= _601;
        else
            pin5_out <= _7;
    end
    assign _664 = _257 == _663;
    assign _661 = _268 == _660;
    assign _658 = _327 == _657;
    assign _655 = _338 == _654;
    assign _650 = _644 & _649;
    assign _656 = _650 ? _655 : pin6_out;
    assign _641 = _635 & _640;
    assign _659 = _641 ? _658 : _656;
    assign _632 = _626 & _631;
    assign _662 = _632 ? _661 : _659;
    assign _623 = _617 & _622;
    assign _665 = _623 ? _664 : _662;
    assign _8 = _665;
    always @(posedge _151) begin
        if (_164)
            pin6_out <= _652;
        else
            pin6_out <= _8;
    end
    assign _715 = _257 == _714;
    assign _712 = _268 == _711;
    assign _709 = _327 == _708;
    assign _706 = _338 == _705;
    assign _701 = _695 & _700;
    assign _707 = _701 ? _706 : pin7_out;
    assign _692 = _686 & _691;
    assign _710 = _692 ? _709 : _707;
    assign _683 = _677 & _682;
    assign _713 = _683 ? _712 : _710;
    assign _674 = _668 & _673;
    assign _716 = _674 ? _715 : _713;
    assign _9 = _716;
    always @(posedge _151) begin
        if (_164)
            pin7_out <= _703;
        else
            pin7_out <= _9;
    end
    assign _717 = { pin7_out, pin6_out, pin5_out, pin4_out, pin3_out, pin2_out, pin1_out, pin0_out };
    assign _4717 = _4591 == _4716;
    assign _4718 = ~ _4717;
    assign _4713 = _2396 | _2508;
    assign _4714 = _4713 | _2620;
    assign _4715 = _4714 | _2894;
    assign _4719 = { _4715, _1965, _1942, _4718, _2250, _2172, seq_a_halted };
    always @(posedge _151) begin
        if (_164)
            _4722 <= _4721;
        else
            _4722 <= _4719;
    end
    assign _4687 = spi_out[30:0];
    assign _4689 = { _4687, _4688 };
    assign _4640 = { seq_b_y, seq_b_x };
    assign _4639 = { _4638, seq_b_sched_s };
    assign _4636 = { queue_b_count, _4635, seq_b_flag, seq_b_halted, seq_b_running, seq_b_ir_pc };
    assign _4637 = { _4634, _4636 };
    assign _754 = pins_sync[7:7];
    assign _753 = pins_sync[6:6];
    assign _752 = pins_sync[5:5];
    assign _751 = pins_sync[4:4];
    assign _750 = pins_sync[3:3];
    assign _749 = pins_sync[2:2];
    assign _748 = pins_sync[1:1];
    assign _747 = pins_sync[0:0];
    always @* begin
        case (_334)
        0: _755 <= _747;
        1: _755 <= _748;
        2: _755 <= _749;
        3: _755 <= _750;
        4: _755 <= _751;
        5: _755 <= _752;
        6: _755 <= _753;
        default: _755 <= _754;
        endcase
    end
    assign _745 = pins_sync[7:7];
    assign _744 = pins_sync[6:6];
    assign _743 = pins_sync[5:5];
    assign _742 = pins_sync[4:4];
    assign _741 = pins_sync[3:3];
    assign _740 = pins_sync[2:2];
    assign _739 = pins_sync[1:1];
    assign _738 = pins_sync[0:0];
    always @* begin
        case (_323)
        0: _746 <= _738;
        1: _746 <= _739;
        2: _746 <= _740;
        3: _746 <= _741;
        4: _746 <= _742;
        5: _746 <= _743;
        6: _746 <= _744;
        default: _746 <= _745;
        endcase
    end
    assign _756 = _723 ? _755 : _746;
    assign _731 = _730[30:0];
    assign _757 = { _731, _756 };
    assign _758 = _727 ? _757 : _730;
    assign _760 = _720 ? _759 : _758;
    assign _11 = _760;
    always @(posedge _151) begin
        if (_164)
            _730 <= _729;
        else
            _730 <= _11;
    end
    assign _958 = _954 ? vdd : seq_b_halted;
    assign _959 = _939 ? vdd : _958;
    assign _961 = _278 ? gnd : _959;
    assign _12 = _961;
    always @(posedge _151) begin
        if (_164)
            seq_b_halted <= _956;
        else
            seq_b_halted <= _12;
    end
    assign _969 = _313[28:5];
    assign _970 = _969 - timebase;
    assign _971 = _970[23:23];
    assign _972 = _322 & _971;
    assign _965 = _298[28:5];
    assign _966 = _965 - timebase;
    assign _967 = _966[23:23];
    assign _968 = _307 & _967;
    assign _973 = _968 | _972;
    assign _974 = _964 | _973;
    assign _975 = _278 ? gnd : _974;
    assign _13 = _975;
    always @(posedge _151) begin
        if (_164)
            _964 <= _963;
        else
            _964 <= _13;
    end
    assign _1035 = _988 ? _1034 : queue_b_last_due;
    assign _14 = _1035;
    always @(posedge _151) begin
        if (_279)
            queue_b_last_due <= _990;
        else
            queue_b_last_due <= _14;
    end
    assign _1044 = _1034 - queue_b_last_due;
    assign _1045 = _1044[23:23];
    assign _1039 = _988 ? vdd : queue_b_last_valid;
    assign _15 = _1039;
    always @(posedge _151) begin
        if (_279)
            queue_b_last_valid <= _1037;
        else
            queue_b_last_valid <= _15;
    end
    assign _1043 = _988 & queue_b_last_valid;
    assign _1046 = _1043 & _1045;
    assign _1047 = _1042 | _1046;
    assign _1048 = _278 ? gnd : _1047;
    assign _16 = _1048;
    always @(posedge _151) begin
        if (_164)
            _1042 <= _1041;
        else
            _1042 <= _16;
    end
    assign _1057 = _1052 == _1056;
    assign _1054 = _1052[22:22];
    assign _1052 = _1034 - timebase;
    assign _1053 = _1052[23:23];
    assign _1055 = _1053 ^ _1054;
    assign _1058 = _1055 | _1057;
    assign _1059 = _988 & _1058;
    assign _1060 = _1051 | _1059;
    assign _1061 = _278 ? gnd : _1060;
    assign _17 = _1061;
    always @(posedge _151) begin
        if (_164)
            _1051 <= _1050;
        else
            _1051 <= _17;
    end
    assign _1065 = _939 ? vdd : seq_b_trapped;
    assign _1066 = _278 ? gnd : _1065;
    assign _18 = _1066;
    always @(posedge _151) begin
        if (_164)
            seq_b_trapped <= _1063;
        else
            seq_b_trapped <= _18;
    end
    assign _1075 = _1069 + _1074;
    assign _1071 = _1069 == _1070;
    assign _1072 = ~ _1071;
    assign _725 = _327 == _724;
    assign _726 = _322 & _725;
    assign _722 = _338 == _721;
    assign _723 = _307 & _722;
    assign _727 = _723 | _726;
    assign _1073 = _727 & _1072;
    assign _1076 = _1073 ? _1075 : _1069;
    assign _720 = _719 | _278;
    assign _1078 = _720 ? _1077 : _1076;
    assign _19 = _1078;
    always @(posedge _151) begin
        if (_164)
            _1069 <= _1068;
        else
            _1069 <= _19;
    end
    assign _4632 = { _4629, _4394, _4630, _1069, _4631, _3020, seq_b_trapped, queue_b_count, _1051, _1042, _964, seq_b_halted };
    assign _4628 = { _4627, _2921 };
    assign _4626 = { seq_a_y, seq_a_x };
    assign _4625 = { _4624, timebase };
    assign _4623 = { _4622, seq_a_sched_s };
    assign _4620 = { queue_a_count, _4619, seq_a_flag, seq_a_halted, seq_a_running, seq_a_ir_pc };
    assign _4621 = { _4618, _4620 };
    assign _1287 = mon0_intervals + _1286;
    assign _1284 = mon0_intervals == _1283;
    assign _1285 = ~ _1284;
    assign _1288 = _1285 ? _1287 : mon0_intervals;
    assign _1289 = _1279 ? _1288 : mon0_intervals;
    assign _1291 = _1080 ? _1290 : _1289;
    assign _20 = _1291;
    always @(posedge _151) begin
        if (_164)
            mon0_intervals <= _1281;
        else
            mon0_intervals <= _20;
    end
    assign _1480 = mon1_intervals + _1479;
    assign _1477 = mon1_intervals == _1476;
    assign _1478 = ~ _1477;
    assign _1481 = _1478 ? _1480 : mon1_intervals;
    assign _1482 = _1472 ? _1481 : mon1_intervals;
    assign _1484 = _1080 ? _1483 : _1482;
    assign _21 = _1484;
    always @(posedge _151) begin
        if (_164)
            mon1_intervals <= _1474;
        else
            mon1_intervals <= _21;
    end
    assign _1673 = mon2_intervals + _1672;
    assign _1670 = mon2_intervals == _1669;
    assign _1671 = ~ _1670;
    assign _1674 = _1671 ? _1673 : mon2_intervals;
    assign _1675 = _1665 ? _1674 : mon2_intervals;
    assign _1677 = _1080 ? _1676 : _1675;
    assign _22 = _1677;
    always @(posedge _151) begin
        if (_164)
            mon2_intervals <= _1667;
        else
            mon2_intervals <= _22;
    end
    assign _1866 = mon3_intervals + _1865;
    assign _1863 = mon3_intervals == _1862;
    assign _1864 = ~ _1863;
    assign _1867 = _1864 ? _1866 : mon3_intervals;
    assign _1868 = _1858 ? _1867 : mon3_intervals;
    assign _1870 = _1080 ? _1869 : _1868;
    assign _23 = _1870;
    always @(posedge _151) begin
        if (_164)
            mon3_intervals <= _1860;
        else
            mon3_intervals <= _23;
    end
    assign _4614 = { mon3_intervals, mon2_intervals, mon1_intervals, mon0_intervals };
    assign _1874 = mon3_count_cycles < mon3_min_seen;
    assign _1875 = _1874 ? mon3_count_cycles : mon3_min_seen;
    assign _1876 = _1858 ? _1875 : mon3_min_seen;
    assign _1878 = _1080 ? _1877 : _1876;
    assign _24 = _1878;
    always @(posedge _151) begin
        if (_164)
            mon3_min_seen <= _1872;
        else
            mon3_min_seen <= _24;
    end
    assign _1882 = mon3_max_seen < mon3_count_cycles;
    assign _1883 = _1882 ? mon3_count_cycles : mon3_max_seen;
    assign _1858 = _1765 | _1857;
    assign _1884 = _1858 ? _1883 : mon3_max_seen;
    assign _1886 = _1080 ? _1885 : _1884;
    assign _25 = _1886;
    always @(posedge _151) begin
        if (_164)
            mon3_max_seen <= _1880;
        else
            mon3_max_seen <= _25;
    end
    assign _4613 = { mon3_max_seen, mon3_min_seen };
    assign _1890 = mon2_count_cycles < mon2_min_seen;
    assign _1891 = _1890 ? mon2_count_cycles : mon2_min_seen;
    assign _1892 = _1665 ? _1891 : mon2_min_seen;
    assign _1894 = _1080 ? _1893 : _1892;
    assign _26 = _1894;
    always @(posedge _151) begin
        if (_164)
            mon2_min_seen <= _1888;
        else
            mon2_min_seen <= _26;
    end
    assign _1898 = mon2_max_seen < mon2_count_cycles;
    assign _1899 = _1898 ? mon2_count_cycles : mon2_max_seen;
    assign _1665 = _1572 | _1664;
    assign _1900 = _1665 ? _1899 : mon2_max_seen;
    assign _1902 = _1080 ? _1901 : _1900;
    assign _27 = _1902;
    always @(posedge _151) begin
        if (_164)
            mon2_max_seen <= _1896;
        else
            mon2_max_seen <= _27;
    end
    assign _4612 = { mon2_max_seen, mon2_min_seen };
    assign _1906 = mon1_count_cycles < mon1_min_seen;
    assign _1907 = _1906 ? mon1_count_cycles : mon1_min_seen;
    assign _1908 = _1472 ? _1907 : mon1_min_seen;
    assign _1910 = _1080 ? _1909 : _1908;
    assign _28 = _1910;
    always @(posedge _151) begin
        if (_164)
            mon1_min_seen <= _1904;
        else
            mon1_min_seen <= _28;
    end
    assign _1914 = mon1_max_seen < mon1_count_cycles;
    assign _1915 = _1914 ? mon1_count_cycles : mon1_max_seen;
    assign _1472 = _1379 | _1471;
    assign _1916 = _1472 ? _1915 : mon1_max_seen;
    assign _1918 = _1080 ? _1917 : _1916;
    assign _29 = _1918;
    always @(posedge _151) begin
        if (_164)
            mon1_max_seen <= _1912;
        else
            mon1_max_seen <= _29;
    end
    assign _4611 = { mon1_max_seen, mon1_min_seen };
    assign _1922 = mon0_count_cycles < mon0_min_seen;
    assign _1923 = _1922 ? mon0_count_cycles : mon0_min_seen;
    assign _1924 = _1279 ? _1923 : mon0_min_seen;
    assign _1926 = _1080 ? _1925 : _1924;
    assign _30 = _1926;
    always @(posedge _151) begin
        if (_164)
            mon0_min_seen <= _1920;
        else
            mon0_min_seen <= _30;
    end
    assign _1930 = mon0_max_seen < mon0_count_cycles;
    assign _1931 = _1930 ? mon0_count_cycles : mon0_max_seen;
    assign _1279 = _1186 | _1278;
    assign _1932 = _1279 ? _1931 : mon0_max_seen;
    assign _1934 = _1080 ? _1933 : _1932;
    assign _31 = _1934;
    always @(posedge _151) begin
        if (_164)
            mon0_max_seen <= _1928;
        else
            mon0_max_seen <= _31;
    end
    assign _4610 = { mon0_max_seen, mon0_min_seen };
    assign _4605 = { _4604, _3276 };
    assign _4596 = _153[7:3];
    always @(posedge _151) begin
        _4599 <= _4596;
    end
    always @(posedge _151) begin
        _4602 <= _4599;
    end
    assign _4603 = { _4595, _4602 };
    assign _1963 = pins_sync[7:7];
    assign _1962 = pins_sync[6:6];
    assign _1961 = pins_sync[5:5];
    assign _1960 = pins_sync[4:4];
    assign _1959 = pins_sync[3:3];
    assign _1958 = pins_sync[2:2];
    assign _1957 = pins_sync[1:1];
    assign _1956 = pins_sync[0:0];
    always @* begin
        case (_264)
        0: _1964 <= _1956;
        1: _1964 <= _1957;
        2: _1964 <= _1958;
        3: _1964 <= _1959;
        4: _1964 <= _1960;
        5: _1964 <= _1961;
        6: _1964 <= _1962;
        default: _1964 <= _1963;
        endcase
    end
    assign _1954 = pins_sync[7:7];
    assign _1953 = pins_sync[6:6];
    assign _1952 = pins_sync[5:5];
    assign _1951 = pins_sync[4:4];
    assign _1950 = pins_sync[3:3];
    assign _1949 = pins_sync[2:2];
    assign _1948 = pins_sync[1:1];
    assign _1947 = pins_sync[0:0];
    always @* begin
        case (_253)
        0: _1955 <= _1947;
        1: _1955 <= _1948;
        2: _1955 <= _1949;
        3: _1955 <= _1950;
        4: _1955 <= _1951;
        5: _1955 <= _1952;
        6: _1955 <= _1953;
        default: _1955 <= _1954;
        endcase
    end
    assign _1965 = _1938 ? _1964 : _1955;
    assign _1946 = _1945[30:0];
    assign _1966 = { _1946, _1965 };
    assign _1967 = _1942 ? _1966 : _1945;
    assign _1969 = _1935 ? _1968 : _1967;
    assign _32 = _1969;
    always @(posedge _151) begin
        if (_164)
            _1945 <= _1944;
        else
            _1945 <= _32;
    end
    assign _2167 = _2163 ? vdd : seq_a_halted;
    assign _2168 = _2148 ? vdd : _2167;
    assign _2169 = _205 ? gnd : _2168;
    assign _33 = _2169;
    always @(posedge _151) begin
        if (_164)
            seq_a_halted <= _2165;
        else
            seq_a_halted <= _33;
    end
    assign _2177 = _243[28:5];
    assign _2178 = _2177 - timebase;
    assign _2179 = _2178[23:23];
    assign _2180 = _252 & _2179;
    assign _2173 = _225[28:5];
    assign _2174 = _2173 - timebase;
    assign _2175 = _2174[23:23];
    assign _2176 = _237 & _2175;
    assign _2181 = _2176 | _2180;
    assign _2182 = _2172 | _2181;
    assign _2183 = _205 ? gnd : _2182;
    assign _34 = _2183;
    always @(posedge _151) begin
        if (_164)
            _2172 <= _2171;
        else
            _2172 <= _34;
    end
    assign _2243 = _2196 ? _2242 : queue_a_last_due;
    assign _35 = _2243;
    always @(posedge _151) begin
        if (_206)
            queue_a_last_due <= _2198;
        else
            queue_a_last_due <= _35;
    end
    assign _2252 = _2242 - queue_a_last_due;
    assign _2253 = _2252[23:23];
    assign _2247 = _2196 ? vdd : queue_a_last_valid;
    assign _36 = _2247;
    always @(posedge _151) begin
        if (_206)
            queue_a_last_valid <= _2245;
        else
            queue_a_last_valid <= _36;
    end
    assign _2251 = _2196 & queue_a_last_valid;
    assign _2254 = _2251 & _2253;
    assign _2255 = _2250 | _2254;
    assign _2256 = _205 ? gnd : _2255;
    assign _37 = _2256;
    always @(posedge _151) begin
        if (_164)
            _2250 <= _2249;
        else
            _2250 <= _37;
    end
    assign _2265 = _2260 == _2264;
    assign _2262 = _2260[22:22];
    assign _2260 = _2242 - timebase;
    assign _2261 = _2260[23:23];
    assign _2263 = _2261 ^ _2262;
    assign _2266 = _2263 | _2265;
    assign _2267 = _2196 & _2266;
    assign _2268 = _2259 | _2267;
    assign _2269 = _205 ? gnd : _2268;
    assign _38 = _2269;
    always @(posedge _151) begin
        if (_164)
            _2259 <= _2258;
        else
            _2259 <= _38;
    end
    assign _2273 = _2148 ? vdd : seq_a_trapped;
    assign _2274 = _205 ? gnd : _2273;
    assign _39 = _2274;
    always @(posedge _151) begin
        if (_164)
            seq_a_trapped <= _2271;
        else
            seq_a_trapped <= _39;
    end
    assign _2283 = _2277 + _2282;
    assign _2279 = _2277 == _2278;
    assign _2280 = ~ _2279;
    assign _1940 = _257 == _1939;
    assign _1941 = _252 & _1940;
    assign _1937 = _268 == _1936;
    assign _1938 = _237 & _1937;
    assign _1942 = _1938 | _1941;
    assign _2281 = _1942 & _2280;
    assign _2284 = _2281 ? _2283 : _2277;
    assign _718 = spi_wdata[2:2];
    assign _719 = _200 & _718;
    assign _1935 = _719 | _205;
    assign _2286 = _1935 ? _2285 : _2284;
    assign _40 = _2286;
    always @(posedge _151) begin
        if (_164)
            _2277 <= _2276;
        else
            _2277 <= _40;
    end
    assign _2394 = _1186 & _1200;
    assign _2391 = _1194[15:0];
    assign _2392 = mon0_count_cycles < _2391;
    assign _2389 = _1089[1:1];
    assign _1180 = _1172[7:7];
    assign _1179 = _1172[6:6];
    assign _1178 = _1172[5:5];
    assign _1177 = _1172[4:4];
    assign _1176 = _1172[3:3];
    assign _1175 = _1172[2:2];
    assign _1174 = _1172[1:1];
    assign _1173 = _1172[0:0];
    always @* begin
        case (_1102)
        0: _1181 <= _1173;
        1: _1181 <= _1174;
        2: _1181 <= _1175;
        3: _1181 <= _1176;
        4: _1181 <= _1177;
        5: _1181 <= _1178;
        6: _1181 <= _1179;
        default: _1181 <= _1180;
        endcase
    end
    assign _1182 = ~ _1181;
    assign _1167 = _1159[7:7];
    assign _1166 = _1159[6:6];
    assign _1165 = _1159[5:5];
    assign _1164 = _1159[4:4];
    assign _1163 = _1159[3:3];
    assign _1162 = _1159[2:2];
    assign _1161 = _1159[1:1];
    assign _1160 = _1159[0:0];
    always @* begin
        case (_1102)
        0: _1168 <= _1160;
        1: _1168 <= _1161;
        2: _1168 <= _1162;
        3: _1168 <= _1163;
        4: _1168 <= _1164;
        5: _1168 <= _1165;
        6: _1168 <= _1166;
        default: _1168 <= _1167;
        endcase
    end
    assign _1169 = ~ _1168;
    assign _1183 = _1169 & _1182;
    assign _1152 = _1089[4:4];
    assign _1153 = ~ _1152;
    assign _1184 = _1153 | _1183;
    assign _1148 = _1100[20:20];
    assign _1146 = _1111[7:7];
    assign _1145 = _1111[6:6];
    assign _1144 = _1111[5:5];
    assign _1143 = _1111[4:4];
    assign _1142 = _1111[3:3];
    assign _1141 = _1111[2:2];
    assign _1140 = _1111[1:1];
    assign _1139 = _1111[0:0];
    assign _1138 = _1100[19:17];
    always @* begin
        case (_1138)
        0: _1147 <= _1139;
        1: _1147 <= _1140;
        2: _1147 <= _1141;
        3: _1147 <= _1142;
        4: _1147 <= _1143;
        5: _1147 <= _1144;
        6: _1147 <= _1145;
        default: _1147 <= _1146;
        endcase
    end
    assign _1149 = _1147 == _1148;
    assign _1136 = _1100[16:16];
    assign _1137 = ~ _1136;
    assign _1150 = _1137 | _1149;
    assign _1134 = _1120 ^ _1130;
    assign _1132 = ~ _1130;
    assign _1133 = _1120 & _1132;
    assign _1129 = _1108[7:7];
    assign _1128 = _1108[6:6];
    assign _1127 = _1108[5:5];
    assign _1126 = _1108[4:4];
    assign _1125 = _1108[3:3];
    assign _1124 = _1108[2:2];
    assign _1123 = _1108[1:1];
    assign _1122 = _1108[0:0];
    always @* begin
        case (_1102)
        0: _1130 <= _1122;
        1: _1130 <= _1123;
        2: _1130 <= _1124;
        3: _1130 <= _1125;
        4: _1130 <= _1126;
        5: _1130 <= _1127;
        6: _1130 <= _1128;
        default: _1130 <= _1129;
        endcase
    end
    assign _1119 = _1111[7:7];
    assign _1118 = _1111[6:6];
    assign _1117 = _1111[5:5];
    assign _1116 = _1111[4:4];
    assign _1115 = _1111[3:3];
    assign _1114 = _1111[2:2];
    assign _1113 = _1111[1:1];
    assign _1112 = _1111[0:0];
    assign _1102 = _1100[13:11];
    always @* begin
        case (_1102)
        0: _1120 <= _1112;
        1: _1120 <= _1113;
        2: _1120 <= _1114;
        3: _1120 <= _1115;
        4: _1120 <= _1116;
        5: _1120 <= _1117;
        6: _1120 <= _1118;
        default: _1120 <= _1119;
        endcase
    end
    assign _1121 = ~ _1120;
    assign _1131 = _1121 & _1130;
    assign _1101 = _1100[15:14];
    always @* begin
        case (_1101)
        0: _1135 <= _1131;
        1: _1135 <= _1133;
        2: _1135 <= _1134;
        default: _1135 <= gnd;
        endcase
    end
    assign _1151 = _1135 & _1150;
    assign _1185 = _1151 & _1184;
    assign _2359 = _1100[0:0];
    assign _1277 = ~ _1276;
    assign _1202 = ~ _1186;
    assign _2382 = mon0_count_cycles + _2381;
    assign _2378 = mon0_count_cycles == _2377;
    assign _2379 = ~ _2378;
    assign _2374 = _2366 == _2373;
    assign _2370 = _2366[7:0];
    assign _2372 = _2370 == _2371;
    assign _2367 = _2366[3:0];
    assign _2369 = _2367 == _2368;
    assign _2363 = _1089[7:6];
    always @* begin
        case (_2363)
        0: _2375 <= vdd;
        1: _2375 <= _2369;
        2: _2375 <= _2372;
        default: _2375 <= _2374;
        endcase
    end
    assign _2376 = _2358 & _2375;
    assign _2380 = _2376 & _2379;
    assign _2383 = _2380 ? _2382 : mon0_count_cycles;
    assign _2385 = _2362 ? _2384 : _2383;
    assign _2386 = _1080 ? mon0_count_cycles : _2385;
    assign _41 = _2386;
    always @(posedge _151) begin
        if (_164)
            mon0_count_cycles <= _1197;
        else
            mon0_count_cycles <= _41;
    end
    assign _1192 = _197 == _1191;
    assign _1193 = spi_wr & _1192;
    always @(posedge _151) begin
        if (_164)
            _1194 <= _1190;
        else
            if (_1193)
                _1194 <= spi_wdata;
    end
    assign _1195 = _1194[31:16];
    assign _1199 = _1195 < mon0_count_cycles;
    assign _1188 = _1089[2:2];
    assign _1200 = _1188 & _1199;
    assign _1187 = _1090 & mon0_armed;
    assign _1201 = _1187 & _1200;
    assign _1203 = _1201 & _1202;
    assign _1278 = _1203 & _1277;
    assign _1275 = ~ _1186;
    assign _1268 = _1172[7:7];
    assign _1267 = _1172[6:6];
    assign _1266 = _1172[5:5];
    assign _1265 = _1172[4:4];
    assign _1264 = _1172[3:3];
    assign _1263 = _1172[2:2];
    assign _1262 = _1172[1:1];
    assign _1261 = _1172[0:0];
    always @* begin
        case (_1208)
        0: _1269 <= _1261;
        1: _1269 <= _1262;
        2: _1269 <= _1263;
        3: _1269 <= _1264;
        4: _1269 <= _1265;
        5: _1269 <= _1266;
        6: _1269 <= _1267;
        default: _1269 <= _1268;
        endcase
    end
    assign _1270 = ~ _1269;
    assign _1258 = _1159[7:7];
    assign _1257 = _1159[6:6];
    assign _1256 = _1159[5:5];
    assign _1255 = _1159[4:4];
    assign _1254 = _1159[3:3];
    assign _1253 = _1159[2:2];
    assign _1252 = _1159[1:1];
    assign _1251 = _1159[0:0];
    always @* begin
        case (_1208)
        0: _1259 <= _1251;
        1: _1259 <= _1252;
        2: _1259 <= _1253;
        3: _1259 <= _1254;
        4: _1259 <= _1255;
        5: _1259 <= _1256;
        6: _1259 <= _1257;
        default: _1259 <= _1258;
        endcase
    end
    assign _1260 = ~ _1259;
    assign _1271 = _1260 & _1270;
    assign _1249 = _1089[5:5];
    assign _1250 = ~ _1249;
    assign _1272 = _1250 | _1271;
    assign _1245 = _1100[31:31];
    assign _1243 = _1111[7:7];
    assign _1242 = _1111[6:6];
    assign _1241 = _1111[5:5];
    assign _1240 = _1111[4:4];
    assign _1239 = _1111[3:3];
    assign _1238 = _1111[2:2];
    assign _1237 = _1111[1:1];
    assign _1236 = _1111[0:0];
    assign _1235 = _1100[30:28];
    always @* begin
        case (_1235)
        0: _1244 <= _1236;
        1: _1244 <= _1237;
        2: _1244 <= _1238;
        3: _1244 <= _1239;
        4: _1244 <= _1240;
        5: _1244 <= _1241;
        6: _1244 <= _1242;
        default: _1244 <= _1243;
        endcase
    end
    assign _1246 = _1244 == _1245;
    assign _1233 = _1100[27:27];
    assign _1234 = ~ _1233;
    assign _1247 = _1234 | _1246;
    assign _1231 = _1217 ^ _1227;
    assign _1229 = ~ _1227;
    assign _1230 = _1217 & _1229;
    assign _1226 = _1108[7:7];
    assign _1225 = _1108[6:6];
    assign _1224 = _1108[5:5];
    assign _1223 = _1108[4:4];
    assign _1222 = _1108[3:3];
    assign _1221 = _1108[2:2];
    assign _1220 = _1108[1:1];
    assign _1219 = _1108[0:0];
    always @* begin
        case (_1208)
        0: _1227 <= _1219;
        1: _1227 <= _1220;
        2: _1227 <= _1221;
        3: _1227 <= _1222;
        4: _1227 <= _1223;
        5: _1227 <= _1224;
        6: _1227 <= _1225;
        default: _1227 <= _1226;
        endcase
    end
    assign _1216 = _1111[7:7];
    assign _1215 = _1111[6:6];
    assign _1214 = _1111[5:5];
    assign _1213 = _1111[4:4];
    assign _1212 = _1111[3:3];
    assign _1211 = _1111[2:2];
    assign _1210 = _1111[1:1];
    assign _1209 = _1111[0:0];
    assign _1208 = _1100[24:22];
    always @* begin
        case (_1208)
        0: _1217 <= _1209;
        1: _1217 <= _1210;
        2: _1217 <= _1211;
        3: _1217 <= _1212;
        4: _1217 <= _1213;
        5: _1217 <= _1214;
        6: _1217 <= _1215;
        default: _1217 <= _1216;
        endcase
    end
    assign _1218 = ~ _1217;
    assign _1228 = _1218 & _1227;
    assign _1207 = _1100[26:25];
    always @* begin
        case (_1207)
        0: _1232 <= _1228;
        1: _1232 <= _1230;
        2: _1232 <= _1231;
        default: _1232 <= gnd;
        endcase
    end
    assign _1248 = _1232 & _1247;
    assign _1273 = _1248 & _1272;
    assign _1205 = _1100[21:21];
    assign _1204 = _1090 & mon0_armed;
    assign _1206 = _1204 & _1205;
    assign _1274 = _1206 & _1273;
    assign _1276 = _1274 & _1275;
    assign _2355 = _1186 | _1276;
    assign _2356 = _2355 | _1278;
    assign _2357 = ~ _2356;
    assign _2358 = mon0_armed & _2357;
    assign _2360 = _2358 & _2359;
    assign _2361 = ~ _2360;
    assign _2348 = _1172[7:7];
    assign _2347 = _1172[6:6];
    assign _2346 = _1172[5:5];
    assign _2345 = _1172[4:4];
    assign _2344 = _1172[3:3];
    assign _2343 = _1172[2:2];
    assign _2342 = _1172[1:1];
    assign _2341 = _1172[0:0];
    always @* begin
        case (_2288)
        0: _2349 <= _2341;
        1: _2349 <= _2342;
        2: _2349 <= _2343;
        3: _2349 <= _2344;
        4: _2349 <= _2345;
        5: _2349 <= _2346;
        6: _2349 <= _2347;
        default: _2349 <= _2348;
        endcase
    end
    assign _2350 = ~ _2349;
    assign _2338 = _1159[7:7];
    assign _2337 = _1159[6:6];
    assign _2336 = _1159[5:5];
    assign _2335 = _1159[4:4];
    assign _2334 = _1159[3:3];
    assign _2333 = _1159[2:2];
    assign _2332 = _1159[1:1];
    assign _2331 = _1159[0:0];
    always @* begin
        case (_2288)
        0: _2339 <= _2331;
        1: _2339 <= _2332;
        2: _2339 <= _2333;
        3: _2339 <= _2334;
        4: _2339 <= _2335;
        5: _2339 <= _2336;
        6: _2339 <= _2337;
        default: _2339 <= _2338;
        endcase
    end
    assign _2340 = ~ _2339;
    assign _2351 = _2340 & _2350;
    assign _2329 = _1089[3:3];
    assign _2330 = ~ _2329;
    assign _2352 = _2330 | _2351;
    assign _2325 = _1100[10:10];
    assign _2323 = _1111[7:7];
    assign _2322 = _1111[6:6];
    assign _2321 = _1111[5:5];
    assign _2320 = _1111[4:4];
    assign _2319 = _1111[3:3];
    assign _2318 = _1111[2:2];
    assign _2317 = _1111[1:1];
    assign _2316 = _1111[0:0];
    assign _2315 = _1100[9:7];
    always @* begin
        case (_2315)
        0: _2324 <= _2316;
        1: _2324 <= _2317;
        2: _2324 <= _2318;
        3: _2324 <= _2319;
        4: _2324 <= _2320;
        5: _2324 <= _2321;
        6: _2324 <= _2322;
        default: _2324 <= _2323;
        endcase
    end
    assign _2326 = _2324 == _2325;
    assign _2313 = _1100[6:6];
    assign _2314 = ~ _2313;
    assign _2327 = _2314 | _2326;
    assign _2311 = _2297 ^ _2307;
    assign _2309 = ~ _2307;
    assign _2310 = _2297 & _2309;
    assign _2306 = _1108[7:7];
    assign _2305 = _1108[6:6];
    assign _2304 = _1108[5:5];
    assign _2303 = _1108[4:4];
    assign _2302 = _1108[3:3];
    assign _2301 = _1108[2:2];
    assign _2300 = _1108[1:1];
    assign _2299 = _1108[0:0];
    always @* begin
        case (_2288)
        0: _2307 <= _2299;
        1: _2307 <= _2300;
        2: _2307 <= _2301;
        3: _2307 <= _2302;
        4: _2307 <= _2303;
        5: _2307 <= _2304;
        6: _2307 <= _2305;
        default: _2307 <= _2306;
        endcase
    end
    assign _2296 = _1111[7:7];
    assign _2295 = _1111[6:6];
    assign _2294 = _1111[5:5];
    assign _2293 = _1111[4:4];
    assign _2292 = _1111[3:3];
    assign _2291 = _1111[2:2];
    assign _2290 = _1111[1:1];
    assign _2289 = _1111[0:0];
    assign _2288 = _1100[3:1];
    always @* begin
        case (_2288)
        0: _2297 <= _2289;
        1: _2297 <= _2290;
        2: _2297 <= _2291;
        3: _2297 <= _2292;
        4: _2297 <= _2293;
        5: _2297 <= _2294;
        6: _2297 <= _2295;
        default: _2297 <= _2296;
        endcase
    end
    assign _2298 = ~ _2297;
    assign _2308 = _2298 & _2307;
    assign _1098 = _197 == _1097;
    assign _1099 = spi_wr & _1098;
    always @(posedge _151) begin
        if (_164)
            _1100 <= _1096;
        else
            if (_1099)
                _1100 <= spi_wdata;
    end
    assign _2287 = _1100[5:4];
    always @* begin
        case (_2287)
        0: _2312 <= _2308;
        1: _2312 <= _2310;
        2: _2312 <= _2311;
        default: _2312 <= gnd;
        endcase
    end
    assign _2328 = _2312 & _2327;
    assign _2353 = _2328 & _2352;
    assign _2354 = _1090 & _2353;
    assign _2362 = _2354 & _2361;
    assign _2387 = _2362 ? vdd : _2358;
    assign _2388 = _1080 ? gnd : _2387;
    assign _42 = _2388;
    always @(posedge _151) begin
        if (_164)
            mon0_armed <= _1092;
        else
            mon0_armed <= _42;
    end
    assign _1086 = _197 == _1085;
    assign _1087 = spi_wr & _1086;
    assign _1082 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1088 <= _1084;
        else
            if (_1087)
                _1088 <= _1082;
    end
    assign _1089 = { _1081, _1088 };
    assign _1090 = _1089[0:0];
    assign _1094 = _1090 & mon0_armed;
    assign _1186 = _1094 & _1185;
    assign _2390 = _1186 & _2389;
    assign _2393 = _2390 & _2392;
    assign _2395 = _2393 | _2394;
    assign _2396 = _2395 | _1278;
    assign _2400 = _2396 ? vdd : mon0_sticky;
    assign _2401 = _1080 ? gnd : _2400;
    assign _43 = _2401;
    always @(posedge _151) begin
        if (_164)
            mon0_sticky <= _2398;
        else
            mon0_sticky <= _43;
    end
    assign _2506 = _1379 & _1393;
    assign _2503 = _1387[15:0];
    assign _2504 = mon1_count_cycles < _2503;
    assign _2501 = _1300[1:1];
    assign _1373 = _1172[7:7];
    assign _1372 = _1172[6:6];
    assign _1371 = _1172[5:5];
    assign _1370 = _1172[4:4];
    assign _1369 = _1172[3:3];
    assign _1368 = _1172[2:2];
    assign _1367 = _1172[1:1];
    assign _1366 = _1172[0:0];
    always @* begin
        case (_1313)
        0: _1374 <= _1366;
        1: _1374 <= _1367;
        2: _1374 <= _1368;
        3: _1374 <= _1369;
        4: _1374 <= _1370;
        5: _1374 <= _1371;
        6: _1374 <= _1372;
        default: _1374 <= _1373;
        endcase
    end
    assign _1375 = ~ _1374;
    assign _1363 = _1159[7:7];
    assign _1362 = _1159[6:6];
    assign _1361 = _1159[5:5];
    assign _1360 = _1159[4:4];
    assign _1359 = _1159[3:3];
    assign _1358 = _1159[2:2];
    assign _1357 = _1159[1:1];
    assign _1356 = _1159[0:0];
    always @* begin
        case (_1313)
        0: _1364 <= _1356;
        1: _1364 <= _1357;
        2: _1364 <= _1358;
        3: _1364 <= _1359;
        4: _1364 <= _1360;
        5: _1364 <= _1361;
        6: _1364 <= _1362;
        default: _1364 <= _1363;
        endcase
    end
    assign _1365 = ~ _1364;
    assign _1376 = _1365 & _1375;
    assign _1354 = _1300[4:4];
    assign _1355 = ~ _1354;
    assign _1377 = _1355 | _1376;
    assign _1350 = _1311[20:20];
    assign _1348 = _1111[7:7];
    assign _1347 = _1111[6:6];
    assign _1346 = _1111[5:5];
    assign _1345 = _1111[4:4];
    assign _1344 = _1111[3:3];
    assign _1343 = _1111[2:2];
    assign _1342 = _1111[1:1];
    assign _1341 = _1111[0:0];
    assign _1340 = _1311[19:17];
    always @* begin
        case (_1340)
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
    assign _1351 = _1349 == _1350;
    assign _1338 = _1311[16:16];
    assign _1339 = ~ _1338;
    assign _1352 = _1339 | _1351;
    assign _1336 = _1322 ^ _1332;
    assign _1334 = ~ _1332;
    assign _1335 = _1322 & _1334;
    assign _1331 = _1108[7:7];
    assign _1330 = _1108[6:6];
    assign _1329 = _1108[5:5];
    assign _1328 = _1108[4:4];
    assign _1327 = _1108[3:3];
    assign _1326 = _1108[2:2];
    assign _1325 = _1108[1:1];
    assign _1324 = _1108[0:0];
    always @* begin
        case (_1313)
        0: _1332 <= _1324;
        1: _1332 <= _1325;
        2: _1332 <= _1326;
        3: _1332 <= _1327;
        4: _1332 <= _1328;
        5: _1332 <= _1329;
        6: _1332 <= _1330;
        default: _1332 <= _1331;
        endcase
    end
    assign _1321 = _1111[7:7];
    assign _1320 = _1111[6:6];
    assign _1319 = _1111[5:5];
    assign _1318 = _1111[4:4];
    assign _1317 = _1111[3:3];
    assign _1316 = _1111[2:2];
    assign _1315 = _1111[1:1];
    assign _1314 = _1111[0:0];
    assign _1313 = _1311[13:11];
    always @* begin
        case (_1313)
        0: _1322 <= _1314;
        1: _1322 <= _1315;
        2: _1322 <= _1316;
        3: _1322 <= _1317;
        4: _1322 <= _1318;
        5: _1322 <= _1319;
        6: _1322 <= _1320;
        default: _1322 <= _1321;
        endcase
    end
    assign _1323 = ~ _1322;
    assign _1333 = _1323 & _1332;
    assign _1312 = _1311[15:14];
    always @* begin
        case (_1312)
        0: _1337 <= _1333;
        1: _1337 <= _1335;
        2: _1337 <= _1336;
        default: _1337 <= gnd;
        endcase
    end
    assign _1353 = _1337 & _1352;
    assign _1378 = _1353 & _1377;
    assign _2474 = _1311[0:0];
    assign _1470 = ~ _1469;
    assign _1395 = ~ _1379;
    assign _2494 = mon1_count_cycles + _2493;
    assign _2490 = mon1_count_cycles == _2489;
    assign _2491 = ~ _2490;
    assign _2486 = _2366 == _2485;
    assign _2482 = _2366[7:0];
    assign _2484 = _2482 == _2483;
    assign _2479 = _2366[3:0];
    assign _2481 = _2479 == _2480;
    assign _2478 = _1300[7:6];
    always @* begin
        case (_2478)
        0: _2487 <= vdd;
        1: _2487 <= _2481;
        2: _2487 <= _2484;
        default: _2487 <= _2486;
        endcase
    end
    assign _2488 = _2473 & _2487;
    assign _2492 = _2488 & _2491;
    assign _2495 = _2492 ? _2494 : mon1_count_cycles;
    assign _2497 = _2477 ? _2496 : _2495;
    assign _2498 = _1080 ? mon1_count_cycles : _2497;
    assign _44 = _2498;
    always @(posedge _151) begin
        if (_164)
            mon1_count_cycles <= _1390;
        else
            mon1_count_cycles <= _44;
    end
    assign _1385 = _197 == _1384;
    assign _1386 = spi_wr & _1385;
    always @(posedge _151) begin
        if (_164)
            _1387 <= _1383;
        else
            if (_1386)
                _1387 <= spi_wdata;
    end
    assign _1388 = _1387[31:16];
    assign _1392 = _1388 < mon1_count_cycles;
    assign _1381 = _1300[2:2];
    assign _1393 = _1381 & _1392;
    assign _1380 = _1301 & mon1_armed;
    assign _1394 = _1380 & _1393;
    assign _1396 = _1394 & _1395;
    assign _1471 = _1396 & _1470;
    assign _1468 = ~ _1379;
    assign _1461 = _1172[7:7];
    assign _1460 = _1172[6:6];
    assign _1459 = _1172[5:5];
    assign _1458 = _1172[4:4];
    assign _1457 = _1172[3:3];
    assign _1456 = _1172[2:2];
    assign _1455 = _1172[1:1];
    assign _1454 = _1172[0:0];
    always @* begin
        case (_1401)
        0: _1462 <= _1454;
        1: _1462 <= _1455;
        2: _1462 <= _1456;
        3: _1462 <= _1457;
        4: _1462 <= _1458;
        5: _1462 <= _1459;
        6: _1462 <= _1460;
        default: _1462 <= _1461;
        endcase
    end
    assign _1463 = ~ _1462;
    assign _1451 = _1159[7:7];
    assign _1450 = _1159[6:6];
    assign _1449 = _1159[5:5];
    assign _1448 = _1159[4:4];
    assign _1447 = _1159[3:3];
    assign _1446 = _1159[2:2];
    assign _1445 = _1159[1:1];
    assign _1444 = _1159[0:0];
    always @* begin
        case (_1401)
        0: _1452 <= _1444;
        1: _1452 <= _1445;
        2: _1452 <= _1446;
        3: _1452 <= _1447;
        4: _1452 <= _1448;
        5: _1452 <= _1449;
        6: _1452 <= _1450;
        default: _1452 <= _1451;
        endcase
    end
    assign _1453 = ~ _1452;
    assign _1464 = _1453 & _1463;
    assign _1442 = _1300[5:5];
    assign _1443 = ~ _1442;
    assign _1465 = _1443 | _1464;
    assign _1438 = _1311[31:31];
    assign _1436 = _1111[7:7];
    assign _1435 = _1111[6:6];
    assign _1434 = _1111[5:5];
    assign _1433 = _1111[4:4];
    assign _1432 = _1111[3:3];
    assign _1431 = _1111[2:2];
    assign _1430 = _1111[1:1];
    assign _1429 = _1111[0:0];
    assign _1428 = _1311[30:28];
    always @* begin
        case (_1428)
        0: _1437 <= _1429;
        1: _1437 <= _1430;
        2: _1437 <= _1431;
        3: _1437 <= _1432;
        4: _1437 <= _1433;
        5: _1437 <= _1434;
        6: _1437 <= _1435;
        default: _1437 <= _1436;
        endcase
    end
    assign _1439 = _1437 == _1438;
    assign _1426 = _1311[27:27];
    assign _1427 = ~ _1426;
    assign _1440 = _1427 | _1439;
    assign _1424 = _1410 ^ _1420;
    assign _1422 = ~ _1420;
    assign _1423 = _1410 & _1422;
    assign _1419 = _1108[7:7];
    assign _1418 = _1108[6:6];
    assign _1417 = _1108[5:5];
    assign _1416 = _1108[4:4];
    assign _1415 = _1108[3:3];
    assign _1414 = _1108[2:2];
    assign _1413 = _1108[1:1];
    assign _1412 = _1108[0:0];
    always @* begin
        case (_1401)
        0: _1420 <= _1412;
        1: _1420 <= _1413;
        2: _1420 <= _1414;
        3: _1420 <= _1415;
        4: _1420 <= _1416;
        5: _1420 <= _1417;
        6: _1420 <= _1418;
        default: _1420 <= _1419;
        endcase
    end
    assign _1409 = _1111[7:7];
    assign _1408 = _1111[6:6];
    assign _1407 = _1111[5:5];
    assign _1406 = _1111[4:4];
    assign _1405 = _1111[3:3];
    assign _1404 = _1111[2:2];
    assign _1403 = _1111[1:1];
    assign _1402 = _1111[0:0];
    assign _1401 = _1311[24:22];
    always @* begin
        case (_1401)
        0: _1410 <= _1402;
        1: _1410 <= _1403;
        2: _1410 <= _1404;
        3: _1410 <= _1405;
        4: _1410 <= _1406;
        5: _1410 <= _1407;
        6: _1410 <= _1408;
        default: _1410 <= _1409;
        endcase
    end
    assign _1411 = ~ _1410;
    assign _1421 = _1411 & _1420;
    assign _1400 = _1311[26:25];
    always @* begin
        case (_1400)
        0: _1425 <= _1421;
        1: _1425 <= _1423;
        2: _1425 <= _1424;
        default: _1425 <= gnd;
        endcase
    end
    assign _1441 = _1425 & _1440;
    assign _1466 = _1441 & _1465;
    assign _1398 = _1311[21:21];
    assign _1397 = _1301 & mon1_armed;
    assign _1399 = _1397 & _1398;
    assign _1467 = _1399 & _1466;
    assign _1469 = _1467 & _1468;
    assign _2470 = _1379 | _1469;
    assign _2471 = _2470 | _1471;
    assign _2472 = ~ _2471;
    assign _2473 = mon1_armed & _2472;
    assign _2475 = _2473 & _2474;
    assign _2476 = ~ _2475;
    assign _2463 = _1172[7:7];
    assign _2462 = _1172[6:6];
    assign _2461 = _1172[5:5];
    assign _2460 = _1172[4:4];
    assign _2459 = _1172[3:3];
    assign _2458 = _1172[2:2];
    assign _2457 = _1172[1:1];
    assign _2456 = _1172[0:0];
    always @* begin
        case (_2403)
        0: _2464 <= _2456;
        1: _2464 <= _2457;
        2: _2464 <= _2458;
        3: _2464 <= _2459;
        4: _2464 <= _2460;
        5: _2464 <= _2461;
        6: _2464 <= _2462;
        default: _2464 <= _2463;
        endcase
    end
    assign _2465 = ~ _2464;
    assign _2453 = _1159[7:7];
    assign _2452 = _1159[6:6];
    assign _2451 = _1159[5:5];
    assign _2450 = _1159[4:4];
    assign _2449 = _1159[3:3];
    assign _2448 = _1159[2:2];
    assign _2447 = _1159[1:1];
    assign _2446 = _1159[0:0];
    always @* begin
        case (_2403)
        0: _2454 <= _2446;
        1: _2454 <= _2447;
        2: _2454 <= _2448;
        3: _2454 <= _2449;
        4: _2454 <= _2450;
        5: _2454 <= _2451;
        6: _2454 <= _2452;
        default: _2454 <= _2453;
        endcase
    end
    assign _2455 = ~ _2454;
    assign _2466 = _2455 & _2465;
    assign _2444 = _1300[3:3];
    assign _2445 = ~ _2444;
    assign _2467 = _2445 | _2466;
    assign _2440 = _1311[10:10];
    assign _2438 = _1111[7:7];
    assign _2437 = _1111[6:6];
    assign _2436 = _1111[5:5];
    assign _2435 = _1111[4:4];
    assign _2434 = _1111[3:3];
    assign _2433 = _1111[2:2];
    assign _2432 = _1111[1:1];
    assign _2431 = _1111[0:0];
    assign _2430 = _1311[9:7];
    always @* begin
        case (_2430)
        0: _2439 <= _2431;
        1: _2439 <= _2432;
        2: _2439 <= _2433;
        3: _2439 <= _2434;
        4: _2439 <= _2435;
        5: _2439 <= _2436;
        6: _2439 <= _2437;
        default: _2439 <= _2438;
        endcase
    end
    assign _2441 = _2439 == _2440;
    assign _2428 = _1311[6:6];
    assign _2429 = ~ _2428;
    assign _2442 = _2429 | _2441;
    assign _2426 = _2412 ^ _2422;
    assign _2424 = ~ _2422;
    assign _2425 = _2412 & _2424;
    assign _2421 = _1108[7:7];
    assign _2420 = _1108[6:6];
    assign _2419 = _1108[5:5];
    assign _2418 = _1108[4:4];
    assign _2417 = _1108[3:3];
    assign _2416 = _1108[2:2];
    assign _2415 = _1108[1:1];
    assign _2414 = _1108[0:0];
    always @* begin
        case (_2403)
        0: _2422 <= _2414;
        1: _2422 <= _2415;
        2: _2422 <= _2416;
        3: _2422 <= _2417;
        4: _2422 <= _2418;
        5: _2422 <= _2419;
        6: _2422 <= _2420;
        default: _2422 <= _2421;
        endcase
    end
    assign _2411 = _1111[7:7];
    assign _2410 = _1111[6:6];
    assign _2409 = _1111[5:5];
    assign _2408 = _1111[4:4];
    assign _2407 = _1111[3:3];
    assign _2406 = _1111[2:2];
    assign _2405 = _1111[1:1];
    assign _2404 = _1111[0:0];
    assign _2403 = _1311[3:1];
    always @* begin
        case (_2403)
        0: _2412 <= _2404;
        1: _2412 <= _2405;
        2: _2412 <= _2406;
        3: _2412 <= _2407;
        4: _2412 <= _2408;
        5: _2412 <= _2409;
        6: _2412 <= _2410;
        default: _2412 <= _2411;
        endcase
    end
    assign _2413 = ~ _2412;
    assign _2423 = _2413 & _2422;
    assign _1309 = _197 == _1308;
    assign _1310 = spi_wr & _1309;
    always @(posedge _151) begin
        if (_164)
            _1311 <= _1307;
        else
            if (_1310)
                _1311 <= spi_wdata;
    end
    assign _2402 = _1311[5:4];
    always @* begin
        case (_2402)
        0: _2427 <= _2423;
        1: _2427 <= _2425;
        2: _2427 <= _2426;
        default: _2427 <= gnd;
        endcase
    end
    assign _2443 = _2427 & _2442;
    assign _2468 = _2443 & _2467;
    assign _2469 = _1301 & _2468;
    assign _2477 = _2469 & _2476;
    assign _2499 = _2477 ? vdd : _2473;
    assign _2500 = _1080 ? gnd : _2499;
    assign _45 = _2500;
    always @(posedge _151) begin
        if (_164)
            mon1_armed <= _1303;
        else
            mon1_armed <= _45;
    end
    assign _1297 = _197 == _1296;
    assign _1298 = spi_wr & _1297;
    assign _1293 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1299 <= _1295;
        else
            if (_1298)
                _1299 <= _1293;
    end
    assign _1300 = { _1292, _1299 };
    assign _1301 = _1300[0:0];
    assign _1305 = _1301 & mon1_armed;
    assign _1379 = _1305 & _1378;
    assign _2502 = _1379 & _2501;
    assign _2505 = _2502 & _2504;
    assign _2507 = _2505 | _2506;
    assign _2508 = _2507 | _1471;
    assign _2512 = _2508 ? vdd : mon1_sticky;
    assign _2513 = _1080 ? gnd : _2512;
    assign _46 = _2513;
    always @(posedge _151) begin
        if (_164)
            mon1_sticky <= _2510;
        else
            mon1_sticky <= _46;
    end
    assign _2618 = _1572 & _1586;
    assign _2615 = _1580[15:0];
    assign _2616 = mon2_count_cycles < _2615;
    assign _2613 = _1493[1:1];
    assign _1566 = _1172[7:7];
    assign _1565 = _1172[6:6];
    assign _1564 = _1172[5:5];
    assign _1563 = _1172[4:4];
    assign _1562 = _1172[3:3];
    assign _1561 = _1172[2:2];
    assign _1560 = _1172[1:1];
    assign _1559 = _1172[0:0];
    always @* begin
        case (_1506)
        0: _1567 <= _1559;
        1: _1567 <= _1560;
        2: _1567 <= _1561;
        3: _1567 <= _1562;
        4: _1567 <= _1563;
        5: _1567 <= _1564;
        6: _1567 <= _1565;
        default: _1567 <= _1566;
        endcase
    end
    assign _1568 = ~ _1567;
    assign _1556 = _1159[7:7];
    assign _1555 = _1159[6:6];
    assign _1554 = _1159[5:5];
    assign _1553 = _1159[4:4];
    assign _1552 = _1159[3:3];
    assign _1551 = _1159[2:2];
    assign _1550 = _1159[1:1];
    assign _1549 = _1159[0:0];
    always @* begin
        case (_1506)
        0: _1557 <= _1549;
        1: _1557 <= _1550;
        2: _1557 <= _1551;
        3: _1557 <= _1552;
        4: _1557 <= _1553;
        5: _1557 <= _1554;
        6: _1557 <= _1555;
        default: _1557 <= _1556;
        endcase
    end
    assign _1558 = ~ _1557;
    assign _1569 = _1558 & _1568;
    assign _1547 = _1493[4:4];
    assign _1548 = ~ _1547;
    assign _1570 = _1548 | _1569;
    assign _1543 = _1504[20:20];
    assign _1541 = _1111[7:7];
    assign _1540 = _1111[6:6];
    assign _1539 = _1111[5:5];
    assign _1538 = _1111[4:4];
    assign _1537 = _1111[3:3];
    assign _1536 = _1111[2:2];
    assign _1535 = _1111[1:1];
    assign _1534 = _1111[0:0];
    assign _1533 = _1504[19:17];
    always @* begin
        case (_1533)
        0: _1542 <= _1534;
        1: _1542 <= _1535;
        2: _1542 <= _1536;
        3: _1542 <= _1537;
        4: _1542 <= _1538;
        5: _1542 <= _1539;
        6: _1542 <= _1540;
        default: _1542 <= _1541;
        endcase
    end
    assign _1544 = _1542 == _1543;
    assign _1531 = _1504[16:16];
    assign _1532 = ~ _1531;
    assign _1545 = _1532 | _1544;
    assign _1529 = _1515 ^ _1525;
    assign _1527 = ~ _1525;
    assign _1528 = _1515 & _1527;
    assign _1524 = _1108[7:7];
    assign _1523 = _1108[6:6];
    assign _1522 = _1108[5:5];
    assign _1521 = _1108[4:4];
    assign _1520 = _1108[3:3];
    assign _1519 = _1108[2:2];
    assign _1518 = _1108[1:1];
    assign _1517 = _1108[0:0];
    always @* begin
        case (_1506)
        0: _1525 <= _1517;
        1: _1525 <= _1518;
        2: _1525 <= _1519;
        3: _1525 <= _1520;
        4: _1525 <= _1521;
        5: _1525 <= _1522;
        6: _1525 <= _1523;
        default: _1525 <= _1524;
        endcase
    end
    assign _1514 = _1111[7:7];
    assign _1513 = _1111[6:6];
    assign _1512 = _1111[5:5];
    assign _1511 = _1111[4:4];
    assign _1510 = _1111[3:3];
    assign _1509 = _1111[2:2];
    assign _1508 = _1111[1:1];
    assign _1507 = _1111[0:0];
    assign _1506 = _1504[13:11];
    always @* begin
        case (_1506)
        0: _1515 <= _1507;
        1: _1515 <= _1508;
        2: _1515 <= _1509;
        3: _1515 <= _1510;
        4: _1515 <= _1511;
        5: _1515 <= _1512;
        6: _1515 <= _1513;
        default: _1515 <= _1514;
        endcase
    end
    assign _1516 = ~ _1515;
    assign _1526 = _1516 & _1525;
    assign _1505 = _1504[15:14];
    always @* begin
        case (_1505)
        0: _1530 <= _1526;
        1: _1530 <= _1528;
        2: _1530 <= _1529;
        default: _1530 <= gnd;
        endcase
    end
    assign _1546 = _1530 & _1545;
    assign _1571 = _1546 & _1570;
    assign _2586 = _1504[0:0];
    assign _1663 = ~ _1662;
    assign _1588 = ~ _1572;
    assign _2606 = mon2_count_cycles + _2605;
    assign _2602 = mon2_count_cycles == _2601;
    assign _2603 = ~ _2602;
    assign _2598 = _2366 == _2597;
    assign _2594 = _2366[7:0];
    assign _2596 = _2594 == _2595;
    assign _2591 = _2366[3:0];
    assign _2593 = _2591 == _2592;
    assign _2590 = _1493[7:6];
    always @* begin
        case (_2590)
        0: _2599 <= vdd;
        1: _2599 <= _2593;
        2: _2599 <= _2596;
        default: _2599 <= _2598;
        endcase
    end
    assign _2600 = _2585 & _2599;
    assign _2604 = _2600 & _2603;
    assign _2607 = _2604 ? _2606 : mon2_count_cycles;
    assign _2609 = _2589 ? _2608 : _2607;
    assign _2610 = _1080 ? mon2_count_cycles : _2609;
    assign _47 = _2610;
    always @(posedge _151) begin
        if (_164)
            mon2_count_cycles <= _1583;
        else
            mon2_count_cycles <= _47;
    end
    assign _1578 = _197 == _1577;
    assign _1579 = spi_wr & _1578;
    always @(posedge _151) begin
        if (_164)
            _1580 <= _1576;
        else
            if (_1579)
                _1580 <= spi_wdata;
    end
    assign _1581 = _1580[31:16];
    assign _1585 = _1581 < mon2_count_cycles;
    assign _1574 = _1493[2:2];
    assign _1586 = _1574 & _1585;
    assign _1573 = _1494 & mon2_armed;
    assign _1587 = _1573 & _1586;
    assign _1589 = _1587 & _1588;
    assign _1664 = _1589 & _1663;
    assign _1661 = ~ _1572;
    assign _1654 = _1172[7:7];
    assign _1653 = _1172[6:6];
    assign _1652 = _1172[5:5];
    assign _1651 = _1172[4:4];
    assign _1650 = _1172[3:3];
    assign _1649 = _1172[2:2];
    assign _1648 = _1172[1:1];
    assign _1647 = _1172[0:0];
    always @* begin
        case (_1594)
        0: _1655 <= _1647;
        1: _1655 <= _1648;
        2: _1655 <= _1649;
        3: _1655 <= _1650;
        4: _1655 <= _1651;
        5: _1655 <= _1652;
        6: _1655 <= _1653;
        default: _1655 <= _1654;
        endcase
    end
    assign _1656 = ~ _1655;
    assign _1644 = _1159[7:7];
    assign _1643 = _1159[6:6];
    assign _1642 = _1159[5:5];
    assign _1641 = _1159[4:4];
    assign _1640 = _1159[3:3];
    assign _1639 = _1159[2:2];
    assign _1638 = _1159[1:1];
    assign _1637 = _1159[0:0];
    always @* begin
        case (_1594)
        0: _1645 <= _1637;
        1: _1645 <= _1638;
        2: _1645 <= _1639;
        3: _1645 <= _1640;
        4: _1645 <= _1641;
        5: _1645 <= _1642;
        6: _1645 <= _1643;
        default: _1645 <= _1644;
        endcase
    end
    assign _1646 = ~ _1645;
    assign _1657 = _1646 & _1656;
    assign _1635 = _1493[5:5];
    assign _1636 = ~ _1635;
    assign _1658 = _1636 | _1657;
    assign _1631 = _1504[31:31];
    assign _1629 = _1111[7:7];
    assign _1628 = _1111[6:6];
    assign _1627 = _1111[5:5];
    assign _1626 = _1111[4:4];
    assign _1625 = _1111[3:3];
    assign _1624 = _1111[2:2];
    assign _1623 = _1111[1:1];
    assign _1622 = _1111[0:0];
    assign _1621 = _1504[30:28];
    always @* begin
        case (_1621)
        0: _1630 <= _1622;
        1: _1630 <= _1623;
        2: _1630 <= _1624;
        3: _1630 <= _1625;
        4: _1630 <= _1626;
        5: _1630 <= _1627;
        6: _1630 <= _1628;
        default: _1630 <= _1629;
        endcase
    end
    assign _1632 = _1630 == _1631;
    assign _1619 = _1504[27:27];
    assign _1620 = ~ _1619;
    assign _1633 = _1620 | _1632;
    assign _1617 = _1603 ^ _1613;
    assign _1615 = ~ _1613;
    assign _1616 = _1603 & _1615;
    assign _1612 = _1108[7:7];
    assign _1611 = _1108[6:6];
    assign _1610 = _1108[5:5];
    assign _1609 = _1108[4:4];
    assign _1608 = _1108[3:3];
    assign _1607 = _1108[2:2];
    assign _1606 = _1108[1:1];
    assign _1605 = _1108[0:0];
    always @* begin
        case (_1594)
        0: _1613 <= _1605;
        1: _1613 <= _1606;
        2: _1613 <= _1607;
        3: _1613 <= _1608;
        4: _1613 <= _1609;
        5: _1613 <= _1610;
        6: _1613 <= _1611;
        default: _1613 <= _1612;
        endcase
    end
    assign _1602 = _1111[7:7];
    assign _1601 = _1111[6:6];
    assign _1600 = _1111[5:5];
    assign _1599 = _1111[4:4];
    assign _1598 = _1111[3:3];
    assign _1597 = _1111[2:2];
    assign _1596 = _1111[1:1];
    assign _1595 = _1111[0:0];
    assign _1594 = _1504[24:22];
    always @* begin
        case (_1594)
        0: _1603 <= _1595;
        1: _1603 <= _1596;
        2: _1603 <= _1597;
        3: _1603 <= _1598;
        4: _1603 <= _1599;
        5: _1603 <= _1600;
        6: _1603 <= _1601;
        default: _1603 <= _1602;
        endcase
    end
    assign _1604 = ~ _1603;
    assign _1614 = _1604 & _1613;
    assign _1593 = _1504[26:25];
    always @* begin
        case (_1593)
        0: _1618 <= _1614;
        1: _1618 <= _1616;
        2: _1618 <= _1617;
        default: _1618 <= gnd;
        endcase
    end
    assign _1634 = _1618 & _1633;
    assign _1659 = _1634 & _1658;
    assign _1591 = _1504[21:21];
    assign _1590 = _1494 & mon2_armed;
    assign _1592 = _1590 & _1591;
    assign _1660 = _1592 & _1659;
    assign _1662 = _1660 & _1661;
    assign _2582 = _1572 | _1662;
    assign _2583 = _2582 | _1664;
    assign _2584 = ~ _2583;
    assign _2585 = mon2_armed & _2584;
    assign _2587 = _2585 & _2586;
    assign _2588 = ~ _2587;
    assign _2575 = _1172[7:7];
    assign _2574 = _1172[6:6];
    assign _2573 = _1172[5:5];
    assign _2572 = _1172[4:4];
    assign _2571 = _1172[3:3];
    assign _2570 = _1172[2:2];
    assign _2569 = _1172[1:1];
    assign _2568 = _1172[0:0];
    always @* begin
        case (_2515)
        0: _2576 <= _2568;
        1: _2576 <= _2569;
        2: _2576 <= _2570;
        3: _2576 <= _2571;
        4: _2576 <= _2572;
        5: _2576 <= _2573;
        6: _2576 <= _2574;
        default: _2576 <= _2575;
        endcase
    end
    assign _2577 = ~ _2576;
    assign _2565 = _1159[7:7];
    assign _2564 = _1159[6:6];
    assign _2563 = _1159[5:5];
    assign _2562 = _1159[4:4];
    assign _2561 = _1159[3:3];
    assign _2560 = _1159[2:2];
    assign _2559 = _1159[1:1];
    assign _2558 = _1159[0:0];
    always @* begin
        case (_2515)
        0: _2566 <= _2558;
        1: _2566 <= _2559;
        2: _2566 <= _2560;
        3: _2566 <= _2561;
        4: _2566 <= _2562;
        5: _2566 <= _2563;
        6: _2566 <= _2564;
        default: _2566 <= _2565;
        endcase
    end
    assign _2567 = ~ _2566;
    assign _2578 = _2567 & _2577;
    assign _2556 = _1493[3:3];
    assign _2557 = ~ _2556;
    assign _2579 = _2557 | _2578;
    assign _2552 = _1504[10:10];
    assign _2550 = _1111[7:7];
    assign _2549 = _1111[6:6];
    assign _2548 = _1111[5:5];
    assign _2547 = _1111[4:4];
    assign _2546 = _1111[3:3];
    assign _2545 = _1111[2:2];
    assign _2544 = _1111[1:1];
    assign _2543 = _1111[0:0];
    assign _2542 = _1504[9:7];
    always @* begin
        case (_2542)
        0: _2551 <= _2543;
        1: _2551 <= _2544;
        2: _2551 <= _2545;
        3: _2551 <= _2546;
        4: _2551 <= _2547;
        5: _2551 <= _2548;
        6: _2551 <= _2549;
        default: _2551 <= _2550;
        endcase
    end
    assign _2553 = _2551 == _2552;
    assign _2540 = _1504[6:6];
    assign _2541 = ~ _2540;
    assign _2554 = _2541 | _2553;
    assign _2538 = _2524 ^ _2534;
    assign _2536 = ~ _2534;
    assign _2537 = _2524 & _2536;
    assign _2533 = _1108[7:7];
    assign _2532 = _1108[6:6];
    assign _2531 = _1108[5:5];
    assign _2530 = _1108[4:4];
    assign _2529 = _1108[3:3];
    assign _2528 = _1108[2:2];
    assign _2527 = _1108[1:1];
    assign _2526 = _1108[0:0];
    always @* begin
        case (_2515)
        0: _2534 <= _2526;
        1: _2534 <= _2527;
        2: _2534 <= _2528;
        3: _2534 <= _2529;
        4: _2534 <= _2530;
        5: _2534 <= _2531;
        6: _2534 <= _2532;
        default: _2534 <= _2533;
        endcase
    end
    assign _2523 = _1111[7:7];
    assign _2522 = _1111[6:6];
    assign _2521 = _1111[5:5];
    assign _2520 = _1111[4:4];
    assign _2519 = _1111[3:3];
    assign _2518 = _1111[2:2];
    assign _2517 = _1111[1:1];
    assign _2516 = _1111[0:0];
    assign _2515 = _1504[3:1];
    always @* begin
        case (_2515)
        0: _2524 <= _2516;
        1: _2524 <= _2517;
        2: _2524 <= _2518;
        3: _2524 <= _2519;
        4: _2524 <= _2520;
        5: _2524 <= _2521;
        6: _2524 <= _2522;
        default: _2524 <= _2523;
        endcase
    end
    assign _2525 = ~ _2524;
    assign _2535 = _2525 & _2534;
    assign _1502 = _197 == _1501;
    assign _1503 = spi_wr & _1502;
    always @(posedge _151) begin
        if (_164)
            _1504 <= _1500;
        else
            if (_1503)
                _1504 <= spi_wdata;
    end
    assign _2514 = _1504[5:4];
    always @* begin
        case (_2514)
        0: _2539 <= _2535;
        1: _2539 <= _2537;
        2: _2539 <= _2538;
        default: _2539 <= gnd;
        endcase
    end
    assign _2555 = _2539 & _2554;
    assign _2580 = _2555 & _2579;
    assign _2581 = _1494 & _2580;
    assign _2589 = _2581 & _2588;
    assign _2611 = _2589 ? vdd : _2585;
    assign _2612 = _1080 ? gnd : _2611;
    assign _48 = _2612;
    always @(posedge _151) begin
        if (_164)
            mon2_armed <= _1496;
        else
            mon2_armed <= _48;
    end
    assign _1490 = _197 == _1489;
    assign _1491 = spi_wr & _1490;
    assign _1486 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1492 <= _1488;
        else
            if (_1491)
                _1492 <= _1486;
    end
    assign _1493 = { _1485, _1492 };
    assign _1494 = _1493[0:0];
    assign _1498 = _1494 & mon2_armed;
    assign _1572 = _1498 & _1571;
    assign _2614 = _1572 & _2613;
    assign _2617 = _2614 & _2616;
    assign _2619 = _2617 | _2618;
    assign _2620 = _2619 | _1664;
    assign _2624 = _2620 ? vdd : mon2_sticky;
    assign _2625 = _1080 ? gnd : _2624;
    assign _49 = _2625;
    always @(posedge _151) begin
        if (_164)
            mon2_sticky <= _2622;
        else
            mon2_sticky <= _49;
    end
    assign _2892 = _1765 & _1779;
    assign _2889 = _1773[15:0];
    assign _2890 = mon3_count_cycles < _2889;
    assign _2887 = _1686[1:1];
    assign _1759 = _1172[7:7];
    assign _1758 = _1172[6:6];
    assign _1757 = _1172[5:5];
    assign _1756 = _1172[4:4];
    assign _1755 = _1172[3:3];
    assign _1754 = _1172[2:2];
    assign _1753 = _1172[1:1];
    assign _1752 = _1172[0:0];
    always @* begin
        case (_1699)
        0: _1760 <= _1752;
        1: _1760 <= _1753;
        2: _1760 <= _1754;
        3: _1760 <= _1755;
        4: _1760 <= _1756;
        5: _1760 <= _1757;
        6: _1760 <= _1758;
        default: _1760 <= _1759;
        endcase
    end
    assign _1761 = ~ _1760;
    assign _1749 = _1159[7:7];
    assign _1748 = _1159[6:6];
    assign _1747 = _1159[5:5];
    assign _1746 = _1159[4:4];
    assign _1745 = _1159[3:3];
    assign _1744 = _1159[2:2];
    assign _1743 = _1159[1:1];
    assign _1742 = _1159[0:0];
    always @* begin
        case (_1699)
        0: _1750 <= _1742;
        1: _1750 <= _1743;
        2: _1750 <= _1744;
        3: _1750 <= _1745;
        4: _1750 <= _1746;
        5: _1750 <= _1747;
        6: _1750 <= _1748;
        default: _1750 <= _1749;
        endcase
    end
    assign _1751 = ~ _1750;
    assign _1762 = _1751 & _1761;
    assign _1740 = _1686[4:4];
    assign _1741 = ~ _1740;
    assign _1763 = _1741 | _1762;
    assign _1736 = _1697[20:20];
    assign _1734 = _1111[7:7];
    assign _1733 = _1111[6:6];
    assign _1732 = _1111[5:5];
    assign _1731 = _1111[4:4];
    assign _1730 = _1111[3:3];
    assign _1729 = _1111[2:2];
    assign _1728 = _1111[1:1];
    assign _1727 = _1111[0:0];
    assign _1726 = _1697[19:17];
    always @* begin
        case (_1726)
        0: _1735 <= _1727;
        1: _1735 <= _1728;
        2: _1735 <= _1729;
        3: _1735 <= _1730;
        4: _1735 <= _1731;
        5: _1735 <= _1732;
        6: _1735 <= _1733;
        default: _1735 <= _1734;
        endcase
    end
    assign _1737 = _1735 == _1736;
    assign _1724 = _1697[16:16];
    assign _1725 = ~ _1724;
    assign _1738 = _1725 | _1737;
    assign _1722 = _1708 ^ _1718;
    assign _1720 = ~ _1718;
    assign _1721 = _1708 & _1720;
    assign _1717 = _1108[7:7];
    assign _1716 = _1108[6:6];
    assign _1715 = _1108[5:5];
    assign _1714 = _1108[4:4];
    assign _1713 = _1108[3:3];
    assign _1712 = _1108[2:2];
    assign _1711 = _1108[1:1];
    assign _1710 = _1108[0:0];
    always @* begin
        case (_1699)
        0: _1718 <= _1710;
        1: _1718 <= _1711;
        2: _1718 <= _1712;
        3: _1718 <= _1713;
        4: _1718 <= _1714;
        5: _1718 <= _1715;
        6: _1718 <= _1716;
        default: _1718 <= _1717;
        endcase
    end
    assign _1707 = _1111[7:7];
    assign _1706 = _1111[6:6];
    assign _1705 = _1111[5:5];
    assign _1704 = _1111[4:4];
    assign _1703 = _1111[3:3];
    assign _1702 = _1111[2:2];
    assign _1701 = _1111[1:1];
    assign _1700 = _1111[0:0];
    assign _1699 = _1697[13:11];
    always @* begin
        case (_1699)
        0: _1708 <= _1700;
        1: _1708 <= _1701;
        2: _1708 <= _1702;
        3: _1708 <= _1703;
        4: _1708 <= _1704;
        5: _1708 <= _1705;
        6: _1708 <= _1706;
        default: _1708 <= _1707;
        endcase
    end
    assign _1709 = ~ _1708;
    assign _1719 = _1709 & _1718;
    assign _1698 = _1697[15:14];
    always @* begin
        case (_1698)
        0: _1723 <= _1719;
        1: _1723 <= _1721;
        2: _1723 <= _1722;
        default: _1723 <= gnd;
        endcase
    end
    assign _1739 = _1723 & _1738;
    assign _1764 = _1739 & _1763;
    assign _2700 = _1697[0:0];
    assign _1856 = ~ _1855;
    assign _1781 = ~ _1765;
    assign _2720 = mon3_count_cycles + _2719;
    assign _2716 = mon3_count_cycles == _2715;
    assign _2717 = ~ _2716;
    assign _2712 = _2366 == _2711;
    assign _2708 = _2366[7:0];
    assign _2710 = _2708 == _2709;
    assign _2627 = _2366 + _2626;
    assign _50 = _2627;
    always @(posedge _151) begin
        if (_164)
            _2366 <= _2365;
        else
            _2366 <= _50;
    end
    assign _2705 = _2366[3:0];
    assign _2707 = _2705 == _2706;
    assign _2704 = _1686[7:6];
    always @* begin
        case (_2704)
        0: _2713 <= vdd;
        1: _2713 <= _2707;
        2: _2713 <= _2710;
        default: _2713 <= _2712;
        endcase
    end
    assign _2714 = _2699 & _2713;
    assign _2718 = _2714 & _2717;
    assign _2721 = _2718 ? _2720 : mon3_count_cycles;
    assign _2723 = _2703 ? _2722 : _2721;
    assign _2724 = _1080 ? mon3_count_cycles : _2723;
    assign _51 = _2724;
    always @(posedge _151) begin
        if (_164)
            mon3_count_cycles <= _1776;
        else
            mon3_count_cycles <= _51;
    end
    assign _1771 = _197 == _1770;
    assign _1772 = spi_wr & _1771;
    always @(posedge _151) begin
        if (_164)
            _1773 <= _1769;
        else
            if (_1772)
                _1773 <= spi_wdata;
    end
    assign _1774 = _1773[31:16];
    assign _1778 = _1774 < mon3_count_cycles;
    assign _1767 = _1686[2:2];
    assign _1779 = _1767 & _1778;
    assign _1766 = _1687 & mon3_armed;
    assign _1780 = _1766 & _1779;
    assign _1782 = _1780 & _1781;
    assign _1857 = _1782 & _1856;
    assign _1854 = ~ _1765;
    assign _1847 = _1172[7:7];
    assign _1846 = _1172[6:6];
    assign _1845 = _1172[5:5];
    assign _1844 = _1172[4:4];
    assign _1843 = _1172[3:3];
    assign _1842 = _1172[2:2];
    assign _1841 = _1172[1:1];
    assign _1840 = _1172[0:0];
    always @* begin
        case (_1787)
        0: _1848 <= _1840;
        1: _1848 <= _1841;
        2: _1848 <= _1842;
        3: _1848 <= _1843;
        4: _1848 <= _1844;
        5: _1848 <= _1845;
        6: _1848 <= _1846;
        default: _1848 <= _1847;
        endcase
    end
    assign _1849 = ~ _1848;
    assign _1837 = _1159[7:7];
    assign _1836 = _1159[6:6];
    assign _1835 = _1159[5:5];
    assign _1834 = _1159[4:4];
    assign _1833 = _1159[3:3];
    assign _1832 = _1159[2:2];
    assign _1831 = _1159[1:1];
    assign _1830 = _1159[0:0];
    always @* begin
        case (_1787)
        0: _1838 <= _1830;
        1: _1838 <= _1831;
        2: _1838 <= _1832;
        3: _1838 <= _1833;
        4: _1838 <= _1834;
        5: _1838 <= _1835;
        6: _1838 <= _1836;
        default: _1838 <= _1837;
        endcase
    end
    assign _1839 = ~ _1838;
    assign _1850 = _1839 & _1849;
    assign _1828 = _1686[5:5];
    assign _1829 = ~ _1828;
    assign _1851 = _1829 | _1850;
    assign _1824 = _1697[31:31];
    assign _1822 = _1111[7:7];
    assign _1821 = _1111[6:6];
    assign _1820 = _1111[5:5];
    assign _1819 = _1111[4:4];
    assign _1818 = _1111[3:3];
    assign _1817 = _1111[2:2];
    assign _1816 = _1111[1:1];
    assign _1815 = _1111[0:0];
    assign _1814 = _1697[30:28];
    always @* begin
        case (_1814)
        0: _1823 <= _1815;
        1: _1823 <= _1816;
        2: _1823 <= _1817;
        3: _1823 <= _1818;
        4: _1823 <= _1819;
        5: _1823 <= _1820;
        6: _1823 <= _1821;
        default: _1823 <= _1822;
        endcase
    end
    assign _1825 = _1823 == _1824;
    assign _1812 = _1697[27:27];
    assign _1813 = ~ _1812;
    assign _1826 = _1813 | _1825;
    assign _1810 = _1796 ^ _1806;
    assign _1808 = ~ _1806;
    assign _1809 = _1796 & _1808;
    assign _1805 = _1108[7:7];
    assign _1804 = _1108[6:6];
    assign _1803 = _1108[5:5];
    assign _1802 = _1108[4:4];
    assign _1801 = _1108[3:3];
    assign _1800 = _1108[2:2];
    assign _1799 = _1108[1:1];
    assign _1798 = _1108[0:0];
    always @* begin
        case (_1787)
        0: _1806 <= _1798;
        1: _1806 <= _1799;
        2: _1806 <= _1800;
        3: _1806 <= _1801;
        4: _1806 <= _1802;
        5: _1806 <= _1803;
        6: _1806 <= _1804;
        default: _1806 <= _1805;
        endcase
    end
    assign _1795 = _1111[7:7];
    assign _1794 = _1111[6:6];
    assign _1793 = _1111[5:5];
    assign _1792 = _1111[4:4];
    assign _1791 = _1111[3:3];
    assign _1790 = _1111[2:2];
    assign _1789 = _1111[1:1];
    assign _1788 = _1111[0:0];
    assign _1787 = _1697[24:22];
    always @* begin
        case (_1787)
        0: _1796 <= _1788;
        1: _1796 <= _1789;
        2: _1796 <= _1790;
        3: _1796 <= _1791;
        4: _1796 <= _1792;
        5: _1796 <= _1793;
        6: _1796 <= _1794;
        default: _1796 <= _1795;
        endcase
    end
    assign _1797 = ~ _1796;
    assign _1807 = _1797 & _1806;
    assign _1786 = _1697[26:25];
    always @* begin
        case (_1786)
        0: _1811 <= _1807;
        1: _1811 <= _1809;
        2: _1811 <= _1810;
        default: _1811 <= gnd;
        endcase
    end
    assign _1827 = _1811 & _1826;
    assign _1852 = _1827 & _1851;
    assign _1784 = _1697[21:21];
    assign _1783 = _1687 & mon3_armed;
    assign _1785 = _1783 & _1784;
    assign _1853 = _1785 & _1852;
    assign _1855 = _1853 & _1854;
    assign _2696 = _1765 | _1855;
    assign _2697 = _2696 | _1857;
    assign _2698 = ~ _2697;
    assign _2699 = mon3_armed & _2698;
    assign _2701 = _2699 & _2700;
    assign _2702 = ~ _2701;
    assign _2689 = _1172[7:7];
    assign _2688 = _1172[6:6];
    assign _2687 = _1172[5:5];
    assign _2686 = _1172[4:4];
    assign _2685 = _1172[3:3];
    assign _2684 = _1172[2:2];
    assign _2683 = _1172[1:1];
    always @(posedge _151) begin
        if (_164)
            _1172 <= _1171;
        else
            _1172 <= _1159;
    end
    assign _2682 = _1172[0:0];
    always @* begin
        case (_2629)
        0: _2690 <= _2682;
        1: _2690 <= _2683;
        2: _2690 <= _2684;
        3: _2690 <= _2685;
        4: _2690 <= _2686;
        5: _2690 <= _2687;
        6: _2690 <= _2688;
        default: _2690 <= _2689;
        endcase
    end
    assign _2691 = ~ _2690;
    assign _2679 = _1159[7:7];
    assign _2678 = _1159[6:6];
    assign _2677 = _1159[5:5];
    assign _2676 = _1159[4:4];
    assign _2675 = _1159[3:3];
    assign _2674 = _1159[2:2];
    assign _2673 = _1159[1:1];
    assign _2738 = _338 == _2737;
    assign _342 = _338 == _341;
    assign _340 = _338 == _339;
    assign _343 = _340 | _342;
    assign _2739 = _343 | _2738;
    assign _336 = _334 == _335;
    assign _337 = _307 & _336;
    assign _2740 = _337 & _2739;
    assign _2741 = _2740 ? _343 : pin0_oe;
    assign _2734 = _327 == _2733;
    assign _331 = _327 == _330;
    assign _329 = _327 == _328;
    assign _332 = _329 | _331;
    assign _2735 = _332 | _2734;
    assign _325 = _323 == _324;
    assign _326 = _322 & _325;
    assign _2736 = _326 & _2735;
    assign _2742 = _2736 ? _332 : _2741;
    assign _2730 = _268 == _2729;
    assign _272 = _268 == _271;
    assign _270 = _268 == _269;
    assign _273 = _270 | _272;
    assign _2731 = _273 | _2730;
    assign _266 = _264 == _265;
    assign _267 = _237 & _266;
    assign _2732 = _267 & _2731;
    assign _2743 = _2732 ? _273 : _2742;
    assign _2726 = _257 == _2725;
    assign _261 = _257 == _260;
    assign _259 = _257 == _258;
    assign _262 = _259 | _261;
    assign _2727 = _262 | _2726;
    assign _255 = _253 == _254;
    assign _256 = _252 & _255;
    assign _2728 = _256 & _2727;
    assign _2744 = _2728 ? _262 : _2743;
    assign _52 = _2744;
    always @(posedge _151) begin
        if (_164)
            pin0_oe <= _186;
        else
            pin0_oe <= _52;
    end
    assign _2758 = _338 == _2757;
    assign _393 = _338 == _392;
    assign _391 = _338 == _390;
    assign _394 = _391 | _393;
    assign _2759 = _394 | _2758;
    assign _388 = _334 == _387;
    assign _389 = _307 & _388;
    assign _2760 = _389 & _2759;
    assign _2761 = _2760 ? _394 : pin1_oe;
    assign _2754 = _327 == _2753;
    assign _384 = _327 == _383;
    assign _382 = _327 == _381;
    assign _385 = _382 | _384;
    assign _2755 = _385 | _2754;
    assign _379 = _323 == _378;
    assign _380 = _322 & _379;
    assign _2756 = _380 & _2755;
    assign _2762 = _2756 ? _385 : _2761;
    assign _2750 = _268 == _2749;
    assign _375 = _268 == _374;
    assign _373 = _268 == _372;
    assign _376 = _373 | _375;
    assign _2751 = _376 | _2750;
    assign _370 = _264 == _369;
    assign _371 = _237 & _370;
    assign _2752 = _371 & _2751;
    assign _2763 = _2752 ? _376 : _2762;
    assign _2746 = _257 == _2745;
    assign _366 = _257 == _365;
    assign _364 = _257 == _363;
    assign _367 = _364 | _366;
    assign _2747 = _367 | _2746;
    assign _361 = _253 == _360;
    assign _362 = _252 & _361;
    assign _2748 = _362 & _2747;
    assign _2764 = _2748 ? _367 : _2763;
    assign _53 = _2764;
    always @(posedge _151) begin
        if (_164)
            pin1_oe <= _183;
        else
            pin1_oe <= _53;
    end
    assign _2778 = _338 == _2777;
    assign _444 = _338 == _443;
    assign _442 = _338 == _441;
    assign _445 = _442 | _444;
    assign _2779 = _445 | _2778;
    assign _439 = _334 == _438;
    assign _440 = _307 & _439;
    assign _2780 = _440 & _2779;
    assign _2781 = _2780 ? _445 : pin2_oe;
    assign _2774 = _327 == _2773;
    assign _435 = _327 == _434;
    assign _433 = _327 == _432;
    assign _436 = _433 | _435;
    assign _2775 = _436 | _2774;
    assign _430 = _323 == _429;
    assign _431 = _322 & _430;
    assign _2776 = _431 & _2775;
    assign _2782 = _2776 ? _436 : _2781;
    assign _2770 = _268 == _2769;
    assign _426 = _268 == _425;
    assign _424 = _268 == _423;
    assign _427 = _424 | _426;
    assign _2771 = _427 | _2770;
    assign _421 = _264 == _420;
    assign _422 = _237 & _421;
    assign _2772 = _422 & _2771;
    assign _2783 = _2772 ? _427 : _2782;
    assign _2766 = _257 == _2765;
    assign _417 = _257 == _416;
    assign _415 = _257 == _414;
    assign _418 = _415 | _417;
    assign _2767 = _418 | _2766;
    assign _412 = _253 == _411;
    assign _413 = _252 & _412;
    assign _2768 = _413 & _2767;
    assign _2784 = _2768 ? _418 : _2783;
    assign _54 = _2784;
    always @(posedge _151) begin
        if (_164)
            pin2_oe <= _180;
        else
            pin2_oe <= _54;
    end
    assign _2798 = _338 == _2797;
    assign _495 = _338 == _494;
    assign _493 = _338 == _492;
    assign _496 = _493 | _495;
    assign _2799 = _496 | _2798;
    assign _490 = _334 == _489;
    assign _491 = _307 & _490;
    assign _2800 = _491 & _2799;
    assign _2801 = _2800 ? _496 : pin3_oe;
    assign _2794 = _327 == _2793;
    assign _486 = _327 == _485;
    assign _484 = _327 == _483;
    assign _487 = _484 | _486;
    assign _2795 = _487 | _2794;
    assign _481 = _323 == _480;
    assign _482 = _322 & _481;
    assign _2796 = _482 & _2795;
    assign _2802 = _2796 ? _487 : _2801;
    assign _2790 = _268 == _2789;
    assign _477 = _268 == _476;
    assign _475 = _268 == _474;
    assign _478 = _475 | _477;
    assign _2791 = _478 | _2790;
    assign _472 = _264 == _471;
    assign _473 = _237 & _472;
    assign _2792 = _473 & _2791;
    assign _2803 = _2792 ? _478 : _2802;
    assign _2786 = _257 == _2785;
    assign _468 = _257 == _467;
    assign _466 = _257 == _465;
    assign _469 = _466 | _468;
    assign _2787 = _469 | _2786;
    assign _463 = _253 == _462;
    assign _464 = _252 & _463;
    assign _2788 = _464 & _2787;
    assign _2804 = _2788 ? _469 : _2803;
    assign _55 = _2804;
    always @(posedge _151) begin
        if (_164)
            pin3_oe <= _177;
        else
            pin3_oe <= _55;
    end
    assign _2818 = _338 == _2817;
    assign _546 = _338 == _545;
    assign _544 = _338 == _543;
    assign _547 = _544 | _546;
    assign _2819 = _547 | _2818;
    assign _541 = _334 == _540;
    assign _542 = _307 & _541;
    assign _2820 = _542 & _2819;
    assign _2821 = _2820 ? _547 : pin4_oe;
    assign _2814 = _327 == _2813;
    assign _537 = _327 == _536;
    assign _535 = _327 == _534;
    assign _538 = _535 | _537;
    assign _2815 = _538 | _2814;
    assign _532 = _323 == _531;
    assign _533 = _322 & _532;
    assign _2816 = _533 & _2815;
    assign _2822 = _2816 ? _538 : _2821;
    assign _2810 = _268 == _2809;
    assign _528 = _268 == _527;
    assign _526 = _268 == _525;
    assign _529 = _526 | _528;
    assign _2811 = _529 | _2810;
    assign _523 = _264 == _522;
    assign _524 = _237 & _523;
    assign _2812 = _524 & _2811;
    assign _2823 = _2812 ? _529 : _2822;
    assign _2806 = _257 == _2805;
    assign _519 = _257 == _518;
    assign _517 = _257 == _516;
    assign _520 = _517 | _519;
    assign _2807 = _520 | _2806;
    assign _514 = _253 == _513;
    assign _515 = _252 & _514;
    assign _2808 = _515 & _2807;
    assign _2824 = _2808 ? _520 : _2823;
    assign _56 = _2824;
    always @(posedge _151) begin
        if (_164)
            pin4_oe <= _174;
        else
            pin4_oe <= _56;
    end
    assign _2838 = _338 == _2837;
    assign _597 = _338 == _596;
    assign _595 = _338 == _594;
    assign _598 = _595 | _597;
    assign _2839 = _598 | _2838;
    assign _592 = _334 == _591;
    assign _593 = _307 & _592;
    assign _2840 = _593 & _2839;
    assign _2841 = _2840 ? _598 : pin5_oe;
    assign _2834 = _327 == _2833;
    assign _588 = _327 == _587;
    assign _586 = _327 == _585;
    assign _589 = _586 | _588;
    assign _2835 = _589 | _2834;
    assign _583 = _323 == _582;
    assign _584 = _322 & _583;
    assign _2836 = _584 & _2835;
    assign _2842 = _2836 ? _589 : _2841;
    assign _2830 = _268 == _2829;
    assign _579 = _268 == _578;
    assign _577 = _268 == _576;
    assign _580 = _577 | _579;
    assign _2831 = _580 | _2830;
    assign _574 = _264 == _573;
    assign _575 = _237 & _574;
    assign _2832 = _575 & _2831;
    assign _2843 = _2832 ? _580 : _2842;
    assign _2826 = _257 == _2825;
    assign _570 = _257 == _569;
    assign _568 = _257 == _567;
    assign _571 = _568 | _570;
    assign _2827 = _571 | _2826;
    assign _565 = _253 == _564;
    assign _566 = _252 & _565;
    assign _2828 = _566 & _2827;
    assign _2844 = _2828 ? _571 : _2843;
    assign _57 = _2844;
    always @(posedge _151) begin
        if (_164)
            pin5_oe <= _171;
        else
            pin5_oe <= _57;
    end
    assign _2858 = _338 == _2857;
    assign _648 = _338 == _647;
    assign _646 = _338 == _645;
    assign _649 = _646 | _648;
    assign _2859 = _649 | _2858;
    assign _643 = _334 == _642;
    assign _644 = _307 & _643;
    assign _2860 = _644 & _2859;
    assign _2861 = _2860 ? _649 : pin6_oe;
    assign _2854 = _327 == _2853;
    assign _639 = _327 == _638;
    assign _637 = _327 == _636;
    assign _640 = _637 | _639;
    assign _2855 = _640 | _2854;
    assign _634 = _323 == _633;
    assign _635 = _322 & _634;
    assign _2856 = _635 & _2855;
    assign _2862 = _2856 ? _640 : _2861;
    assign _2850 = _268 == _2849;
    assign _630 = _268 == _629;
    assign _628 = _268 == _627;
    assign _631 = _628 | _630;
    assign _2851 = _631 | _2850;
    assign _625 = _264 == _624;
    assign _626 = _237 & _625;
    assign _2852 = _626 & _2851;
    assign _2863 = _2852 ? _631 : _2862;
    assign _2846 = _257 == _2845;
    assign _621 = _257 == _620;
    assign _619 = _257 == _618;
    assign _622 = _619 | _621;
    assign _2847 = _622 | _2846;
    assign _616 = _253 == _615;
    assign _617 = _252 & _616;
    assign _2848 = _617 & _2847;
    assign _2864 = _2848 ? _622 : _2863;
    assign _58 = _2864;
    always @(posedge _151) begin
        if (_164)
            pin6_oe <= _168;
        else
            pin6_oe <= _58;
    end
    assign _2878 = _338 == _2877;
    assign _699 = _338 == _698;
    assign _697 = _338 == _696;
    assign _700 = _697 | _699;
    assign _2879 = _700 | _2878;
    assign _694 = _334 == _693;
    assign _695 = _307 & _694;
    assign _2880 = _695 & _2879;
    assign _2881 = _2880 ? _700 : pin7_oe;
    assign _2874 = _327 == _2873;
    assign _690 = _327 == _689;
    assign _688 = _327 == _687;
    assign _691 = _688 | _690;
    assign _2875 = _691 | _2874;
    assign _685 = _323 == _684;
    assign _686 = _322 & _685;
    assign _2876 = _686 & _2875;
    assign _2882 = _2876 ? _691 : _2881;
    assign _2870 = _268 == _2869;
    assign _681 = _268 == _680;
    assign _679 = _268 == _678;
    assign _682 = _679 | _681;
    assign _2871 = _682 | _2870;
    assign _676 = _264 == _675;
    assign _677 = _237 & _676;
    assign _2872 = _677 & _2871;
    assign _2883 = _2872 ? _682 : _2882;
    assign _2866 = _257 == _2865;
    assign _672 = _257 == _671;
    assign _670 = _257 == _669;
    assign _673 = _670 | _672;
    assign _2867 = _673 | _2866;
    assign _667 = _253 == _666;
    assign _668 = _252 & _667;
    assign _2868 = _668 & _2867;
    assign _2884 = _2868 ? _673 : _2883;
    assign _59 = _2884;
    always @(posedge _151) begin
        if (_164)
            pin7_oe <= _165;
        else
            pin7_oe <= _59;
    end
    assign _188 = { pin7_oe, pin6_oe, pin5_oe, pin4_oe, pin3_oe, pin2_oe, pin1_oe, pin0_oe };
    always @(posedge _151) begin
        if (_164)
            _1156 <= _1155;
        else
            _1156 <= _188;
    end
    always @(posedge _151) begin
        if (_164)
            _1159 <= _1158;
        else
            _1159 <= _1156;
    end
    assign _2672 = _1159[0:0];
    always @* begin
        case (_2629)
        0: _2680 <= _2672;
        1: _2680 <= _2673;
        2: _2680 <= _2674;
        3: _2680 <= _2675;
        4: _2680 <= _2676;
        5: _2680 <= _2677;
        6: _2680 <= _2678;
        default: _2680 <= _2679;
        endcase
    end
    assign _2681 = ~ _2680;
    assign _2692 = _2681 & _2691;
    assign _2670 = _1686[3:3];
    assign _2671 = ~ _2670;
    assign _2693 = _2671 | _2692;
    assign _2666 = _1697[10:10];
    assign _2664 = _1111[7:7];
    assign _2663 = _1111[6:6];
    assign _2662 = _1111[5:5];
    assign _2661 = _1111[4:4];
    assign _2660 = _1111[3:3];
    assign _2659 = _1111[2:2];
    assign _2658 = _1111[1:1];
    assign _2657 = _1111[0:0];
    assign _2656 = _1697[9:7];
    always @* begin
        case (_2656)
        0: _2665 <= _2657;
        1: _2665 <= _2658;
        2: _2665 <= _2659;
        3: _2665 <= _2660;
        4: _2665 <= _2661;
        5: _2665 <= _2662;
        6: _2665 <= _2663;
        default: _2665 <= _2664;
        endcase
    end
    assign _2667 = _2665 == _2666;
    assign _2654 = _1697[6:6];
    assign _2655 = ~ _2654;
    assign _2668 = _2655 | _2667;
    assign _2652 = _2638 ^ _2648;
    assign _2650 = ~ _2648;
    assign _2651 = _2638 & _2650;
    assign _2647 = _1108[7:7];
    assign _2646 = _1108[6:6];
    assign _2645 = _1108[5:5];
    assign _2644 = _1108[4:4];
    assign _2643 = _1108[3:3];
    assign _2642 = _1108[2:2];
    assign _2641 = _1108[1:1];
    assign _2640 = _1108[0:0];
    always @* begin
        case (_2629)
        0: _2648 <= _2640;
        1: _2648 <= _2641;
        2: _2648 <= _2642;
        3: _2648 <= _2643;
        4: _2648 <= _2644;
        5: _2648 <= _2645;
        6: _2648 <= _2646;
        default: _2648 <= _2647;
        endcase
    end
    assign _2637 = _1111[7:7];
    assign _2636 = _1111[6:6];
    assign _2635 = _1111[5:5];
    assign _2634 = _1111[4:4];
    assign _2633 = _1111[3:3];
    assign _2632 = _1111[2:2];
    assign _2631 = _1111[1:1];
    always @(posedge _151) begin
        _1105 <= _126;
    end
    always @(posedge _151) begin
        _1108 <= _1105;
    end
    always @(posedge _151) begin
        if (_164)
            _1111 <= _1110;
        else
            _1111 <= _1108;
    end
    assign _2630 = _1111[0:0];
    assign _2629 = _1697[3:1];
    always @* begin
        case (_2629)
        0: _2638 <= _2630;
        1: _2638 <= _2631;
        2: _2638 <= _2632;
        3: _2638 <= _2633;
        4: _2638 <= _2634;
        5: _2638 <= _2635;
        6: _2638 <= _2636;
        default: _2638 <= _2637;
        endcase
    end
    assign _2639 = ~ _2638;
    assign _2649 = _2639 & _2648;
    assign _1695 = _197 == _1694;
    assign _1696 = spi_wr & _1695;
    always @(posedge _151) begin
        if (_164)
            _1697 <= _1693;
        else
            if (_1696)
                _1697 <= spi_wdata;
    end
    assign _2628 = _1697[5:4];
    always @* begin
        case (_2628)
        0: _2653 <= _2649;
        1: _2653 <= _2651;
        2: _2653 <= _2652;
        default: _2653 <= gnd;
        endcase
    end
    assign _2669 = _2653 & _2668;
    assign _2694 = _2669 & _2693;
    assign _2695 = _1687 & _2694;
    assign _2703 = _2695 & _2702;
    assign _2885 = _2703 ? vdd : _2699;
    assign _2886 = _1080 ? gnd : _2885;
    assign _60 = _2886;
    always @(posedge _151) begin
        if (_164)
            mon3_armed <= _1689;
        else
            mon3_armed <= _60;
    end
    assign _1683 = _197 == _1682;
    assign _1684 = spi_wr & _1683;
    assign _1679 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1685 <= _1681;
        else
            if (_1684)
                _1685 <= _1679;
    end
    assign _1686 = { _1678, _1685 };
    assign _1687 = _1686[0:0];
    assign _1691 = _1687 & mon3_armed;
    assign _1765 = _1691 & _1764;
    assign _2888 = _1765 & _2887;
    assign _2891 = _2888 & _2890;
    assign _2893 = _2891 | _2892;
    assign _2894 = _2893 | _1857;
    assign _2898 = _2894 ? vdd : mon3_sticky;
    assign _1079 = spi_wdata[1:1];
    assign _1080 = _200 & _1079;
    assign _2899 = _1080 ? gnd : _2898;
    assign _61 = _2899;
    always @(posedge _151) begin
        if (_164)
            mon3_sticky <= _2896;
        else
            mon3_sticky <= _61;
    end
    assign _4591 = { mon3_sticky, mon2_sticky, mon1_sticky, mon0_sticky };
    assign _63 = ena;
    always @(posedge _151) begin
        _4587 <= _63;
    end
    always @(posedge _151) begin
        _4590 <= _4587;
    end
    assign _4439 = _253 == _323;
    assign _4435 = _327 == _4434;
    assign _4436 = ~ _4435;
    assign _4437 = _322 & _4436;
    assign _4431 = _257 == _4430;
    assign _4432 = ~ _4431;
    assign _4433 = _252 & _4432;
    assign _4438 = _4433 & _4437;
    assign _4440 = _4438 & _4439;
    assign _253 = _243[4:2];
    assign _4427 = _253 == _334;
    assign _4423 = _338 == _4422;
    assign _4424 = ~ _4423;
    assign _4425 = _307 & _4424;
    assign _257 = _243[1:0];
    assign _4419 = _257 == _4418;
    assign _4420 = ~ _4419;
    assign _4421 = _252 & _4420;
    assign _4426 = _4421 & _4425;
    assign _4428 = _4426 & _4427;
    assign _323 = _313[4:2];
    assign _4415 = _264 == _323;
    assign _327 = _313[1:0];
    assign _4411 = _327 == _4410;
    assign _4412 = ~ _4411;
    assign _4413 = _322 & _4412;
    assign _4407 = _268 == _4406;
    assign _4408 = ~ _4407;
    assign _4409 = _237 & _4408;
    assign _4414 = _4409 & _4413;
    assign _4416 = _4414 & _4415;
    assign _334 = _298[4:2];
    assign _264 = _225[4:2];
    assign _4404 = _264 == _334;
    assign _338 = _298[1:0];
    assign _4400 = _338 == _4399;
    assign _4401 = ~ _4400;
    assign _302 = _298[28:5];
    assign _303 = _302 - timebase;
    assign _305 = _303 == _304;
    always @* begin
        case (queue_b_read_ptr)
        0: _298 <= queue_b_entry0;
        1: _298 <= queue_b_entry1;
        2: _298 <= queue_b_entry2;
        default: _298 <= queue_b_entry3;
        endcase
    end
    assign _299 = _298[28:5];
    assign _300 = _299 - timebase;
    assign _301 = _300[23:23];
    assign _306 = _301 | _305;
    assign _317 = _313[28:5];
    assign _318 = _317 - timebase;
    assign _320 = _318 == _319;
    assign _2904 = queue_b_write_ptr == _2903;
    assign _2982 = _2904 ? _2981 : queue_b_entry3;
    assign _2983 = _988 ? _2982 : queue_b_entry3;
    assign _64 = _2983;
    always @(posedge _151) begin
        if (_279)
            queue_b_entry3 <= _296;
        else
            queue_b_entry3 <= _64;
    end
    assign _2985 = queue_b_write_ptr == _2984;
    assign _2986 = _2985 ? _2981 : queue_b_entry2;
    assign _2987 = _988 ? _2986 : queue_b_entry2;
    assign _65 = _2987;
    always @(posedge _151) begin
        if (_279)
            queue_b_entry2 <= _293;
        else
            queue_b_entry2 <= _65;
    end
    assign _2989 = queue_b_write_ptr == _2988;
    assign _2990 = _2989 ? _2981 : queue_b_entry1;
    assign _2991 = _988 ? _2990 : queue_b_entry1;
    assign _66 = _2991;
    always @(posedge _151) begin
        if (_279)
            queue_b_entry1 <= _290;
        else
            queue_b_entry1 <= _66;
    end
    assign _2977 = _2930 ? _2976 : _2975;
    assign _3090 = _2914 ? _2980 : seq_b_shadow_clk;
    assign _3091 = _3089 ? _3090 : seq_b_shadow_clk;
    assign _3092 = _985 ? _3091 : seq_b_shadow_clk;
    assign _3093 = _3080 ? _3092 : seq_b_shadow_clk;
    assign _3095 = _278 ? _3094 : _3093;
    assign _67 = _3095;
    always @(posedge _151) begin
        if (_164)
            seq_b_shadow_clk <= _2968;
        else
            seq_b_shadow_clk <= _67;
    end
    assign _3096 = _2914 ? seq_b_shadow_data : _2980;
    assign _3087 = _2905 == _3086;
    assign _3084 = _2905 == _3083;
    assign _3082 = _2905 == _3081;
    assign _3085 = _3082 | _3084;
    assign _3088 = _3085 | _3087;
    assign _3089 = ~ _3088;
    assign _3097 = _3089 ? _3096 : seq_b_shadow_data;
    assign _3098 = _985 ? _3097 : seq_b_shadow_data;
    assign _3099 = _3080 ? _3098 : seq_b_shadow_data;
    assign _3101 = _278 ? _3100 : _3099;
    assign _68 = _3101;
    always @(posedge _151) begin
        if (_164)
            seq_b_shadow_data <= _2965;
        else
            seq_b_shadow_data <= _68;
    end
    assign _2970 = _2914 ? seq_b_shadow_clk : seq_b_shadow_data;
    assign _2972 = _2970 == _2971;
    assign _2973 = _2972 ? _2962 : _2946;
    assign _2959 = seq_b_coder[3:3];
    assign _2962 = _2959 ? _2961 : _2960;
    assign _3110 = _3109[3:0];
    assign _3107 = _3105 == _3106;
    assign _3103 = _940 == _3102;
    assign _3104 = _937 & _3103;
    assign _3108 = _3104 & _3107;
    assign _3111 = _3108 ? _3110 : seq_b_coder;
    assign _3112 = _3080 ? _3111 : seq_b_coder;
    assign _3114 = _278 ? _3113 : _3112;
    assign _69 = _3114;
    always @(posedge _151) begin
        if (_164)
            seq_b_coder <= _2955;
        else
            seq_b_coder <= _69;
    end
    assign _2957 = seq_b_coder[2:2];
    assign _3125 = _3123 == _3124;
    assign _3126 = _3120 & _3125;
    assign _3130 = _3126 ? spi_wdata : _3129;
    assign _70 = _3130;
    always @(posedge _151) begin
        if (_164)
            _3129 <= _3128;
        else
            _3129 <= _70;
    end
    assign _3132 = _3123 == _3131;
    assign _3133 = _3120 & _3132;
    assign _3137 = _3133 ? spi_wdata : _3136;
    assign _71 = _3137;
    always @(posedge _151) begin
        if (_164)
            _3136 <= _3135;
        else
            _3136 <= _71;
    end
    assign _3139 = _3123 == _3138;
    assign _3140 = _3120 & _3139;
    assign _3144 = _3140 ? spi_wdata : _3143;
    assign _72 = _3144;
    always @(posedge _151) begin
        if (_164)
            _3143 <= _3142;
        else
            _3143 <= _72;
    end
    assign _3146 = _3123 + _3145;
    assign _3147 = _3120 ? _3146 : _3123;
    assign _73 = _3147;
    always @(posedge _151) begin
        if (_164)
            _3123 <= _3122;
        else
            _3123 <= _73;
    end
    assign _3149 = _3123 == _3148;
    assign _3150 = _3120 & _3149;
    assign _3154 = _3150 ? spi_wdata : _3153;
    assign _74 = _3154;
    always @(posedge _151) begin
        if (_164)
            _3153 <= _3152;
        else
            _3153 <= _74;
    end
    assign _3162 = _3160 + _3161;
    assign _3163 = _3157 ? _3162 : _3160;
    assign _75 = _3163;
    always @(posedge _151) begin
        if (_164)
            _3160 <= _3159;
        else
            _3160 <= _75;
    end
    always @* begin
        case (_3160)
        0: _3171 <= _3153;
        1: _3171 <= _3143;
        2: _3171 <= _3136;
        default: _3171 <= _3129;
        endcase
    end
    assign _3166 = seq_b_osr[30:0];
    assign _3168 = { _3166, _3167 };
    assign _3165 = _2905 == _3164;
    assign _3169 = _3165 ? _3168 : seq_b_osr;
    assign _3170 = _985 ? _3169 : seq_b_osr;
    assign _3172 = _3022 ? _3171 : _3170;
    assign _3173 = _3080 ? _3172 : seq_b_osr;
    assign _3175 = _278 ? _3174 : _3173;
    assign _76 = _3175;
    always @(posedge _151) begin
        if (_164)
            seq_b_osr <= _2951;
        else
            seq_b_osr <= _76;
    end
    assign _2953 = seq_b_osr[31:31];
    assign _2958 = _2953 ^ _2957;
    assign _2963 = _2958 ? _2962 : _2946;
    assign _2974 = _2935 ? _2973 : _2963;
    assign _2978 = _2933 ? _2977 : _2974;
    assign _2949 = _2941 ? _2948 : _2947;
    assign _2979 = _2939 ? _2978 : _2949;
    assign _2943 = _2905 == _2942;
    assign _2941 = _2905 == _2940;
    assign _2944 = _2941 | _2943;
    assign _2937 = _2905 == _2936;
    assign _2935 = _2905 == _2934;
    assign _2938 = _2935 | _2937;
    assign _2932 = _2905 == _2931;
    assign _2930 = _2905 == _2929;
    assign _2933 = _2930 | _2932;
    assign _2939 = _2933 | _2938;
    assign _2945 = _2939 | _2944;
    assign _2980 = _2945 ? _2979 : _2946;
    assign _2927 = _2907 ? _2926 : _2925;
    assign _2914 = seq_b_ir[5:5];
    assign _2924 = _2914 ? _2923 : _2922;
    assign _2911 = _2905 == _2910;
    assign _2909 = _2905 == _2908;
    assign _2912 = _2909 | _2911;
    assign _2905 = seq_b_ir[2:0];
    assign _2907 = _2905 == _2906;
    assign _2913 = _2907 | _2912;
    assign _2928 = _2913 ? _2927 : _2924;
    assign _1030 = _1023[17:0];
    assign _1032 = { _1030, _1031 };
    assign _1027 = _1023[19:0];
    assign _1029 = { _1027, _1028 };
    assign _1024 = _1023[21:0];
    assign _1026 = { _1024, _1025 };
    assign _1021 = { _1019, _1018 };
    assign _3180 = _3105 == _3179;
    assign _3177 = _940 == _3176;
    assign _3178 = _937 & _3177;
    assign _3181 = _3178 & _3180;
    assign _3182 = _3181 ? _3109 : seq_b_k3;
    assign _3183 = _3080 ? _3182 : seq_b_k3;
    assign _3192 = _278 ? _3191 : _3183;
    assign _77 = _3192;
    always @(posedge _151) begin
        if (_164)
            seq_b_k3 <= _1010;
        else
            seq_b_k3 <= _77;
    end
    assign _3197 = _3105 == _3196;
    assign _3194 = _940 == _3193;
    assign _3195 = _937 & _3194;
    assign _3198 = _3195 & _3197;
    assign _3199 = _3198 ? _3109 : seq_b_k2;
    assign _3200 = _3080 ? _3199 : seq_b_k2;
    assign _3202 = _278 ? _3201 : _3200;
    assign _78 = _3202;
    always @(posedge _151) begin
        if (_164)
            seq_b_k2 <= _1007;
        else
            seq_b_k2 <= _78;
    end
    assign _3207 = _3105 == _3206;
    assign _3204 = _940 == _3203;
    assign _3205 = _937 & _3204;
    assign _3208 = _3205 & _3207;
    assign _3209 = _3208 ? _3109 : seq_b_k1;
    assign _3210 = _3080 ? _3209 : seq_b_k1;
    assign _3212 = _278 ? _3211 : _3210;
    assign _79 = _3212;
    always @(posedge _151) begin
        if (_164)
            seq_b_k1 <= _1004;
        else
            seq_b_k1 <= _79;
    end
    assign _1001 = seq_b_ir[4:3];
    always @* begin
        case (_1001)
        0: _1012 <= _1002;
        1: _1012 <= seq_b_k1;
        2: _1012 <= seq_b_k2;
        default: _1012 <= seq_b_k3;
        endcase
    end
    assign _1013 = _1012[7:7];
    assign _1014 = { _1013, _1013 };
    assign _1015 = { _1014, _1012 };
    assign _999 = seq_b_ir[11:6];
    assign _1000 = { _998, _999 };
    assign _1016 = _1000 + _1015;
    assign _1017 = _1016[9:9];
    assign _1018 = { _1017, _1017 };
    assign _1019 = { _1018, _1018 };
    assign _1020 = { _1019, _1019 };
    assign _1022 = { _1020, _1021 };
    assign _1023 = { _1022, _1016 };
    always @* begin
        case (seq_b_prescale)
        0: _1033 <= _1023;
        1: _1033 <= _1026;
        2: _1033 <= _1029;
        default: _1033 <= _1032;
        endcase
    end
    assign _1034 = seq_b_sched_s + _1033;
    assign _2981 = { _1034, _2928, _2980 };
    assign _3214 = queue_b_write_ptr + _3213;
    assign _3215 = _988 ? _3214 : queue_b_write_ptr;
    assign _80 = _3215;
    always @(posedge _151) begin
        if (_279)
            queue_b_write_ptr <= _2901;
        else
            queue_b_write_ptr <= _80;
    end
    assign _3217 = queue_b_write_ptr == _3216;
    assign _3218 = _3217 ? _2981 : queue_b_entry0;
    assign _3219 = _988 ? _3218 : queue_b_entry0;
    assign _81 = _3219;
    always @(posedge _151) begin
        if (_279)
            queue_b_entry0 <= _287;
        else
            queue_b_entry0 <= _81;
    end
    assign _279 = _164 | _278;
    assign _3225 = _3224[1:0];
    assign _3226 = queue_b_read_ptr + _3225;
    assign _82 = _3226;
    always @(posedge _151) begin
        if (_279)
            queue_b_read_ptr <= _284;
        else
            queue_b_read_ptr <= _82;
    end
    assign _312 = queue_b_read_ptr + _311;
    always @* begin
        case (_312)
        0: _313 <= queue_b_entry0;
        1: _313 <= queue_b_entry1;
        2: _313 <= queue_b_entry2;
        default: _313 <= queue_b_entry3;
        endcase
    end
    assign _314 = _313[28:5];
    assign _315 = _314 - timebase;
    assign _316 = _315[23:23];
    assign _321 = _316 | _320;
    assign _309 = _308 < queue_b_count;
    assign _310 = _307 & _309;
    assign _322 = _310 & _321;
    assign _3223 = { _3222, _322 };
    assign _3221 = { _3220, _307 };
    assign _3224 = _3221 + _3223;
    assign _984 = ~ seq_b_far;
    assign _987 = queue_b_count < _986;
    assign _83 = _987;
    assign _977 = _940 == _976;
    assign _978 = _937 & _977;
    assign _954 = seq_b_running & _953;
    assign _3650 = _954 ? gnd : seq_b_running;
    assign _933 = seq_b_ir & _932;
    assign _935 = _933 == _934;
    assign _928 = seq_b_ir[10:10];
    assign _930 = _928 == _929;
    assign _924 = seq_b_ir[11:11];
    assign _926 = _924 == _925;
    assign _921 = seq_b_ir[15:12];
    assign _923 = _921 == _922;
    assign _927 = _923 & _926;
    assign _931 = _927 & _930;
    assign _936 = _931 & _935;
    assign _915 = seq_b_ir[11:8];
    assign _917 = _915 == _916;
    assign _911 = seq_b_ir[11:8];
    assign _913 = _911 == _912;
    assign _907 = seq_b_ir[11:8];
    assign _909 = _907 == _908;
    assign _903 = seq_b_ir[11:8];
    assign _905 = _903 == _904;
    assign _899 = seq_b_ir[11:8];
    assign _901 = _899 == _900;
    assign _895 = seq_b_ir[11:8];
    assign _897 = _895 == _896;
    assign _891 = seq_b_ir[11:8];
    assign _893 = _891 == _892;
    assign _887 = seq_b_ir[11:8];
    assign _889 = _887 == _888;
    assign _884 = seq_b_ir[11:8];
    assign _886 = _884 == _885;
    assign _890 = _886 | _889;
    assign _894 = _890 | _893;
    assign _898 = _894 | _897;
    assign _902 = _898 | _901;
    assign _906 = _902 | _905;
    assign _910 = _906 | _909;
    assign _914 = _910 | _913;
    assign _918 = _914 | _917;
    assign _881 = seq_b_ir[15:12];
    assign _883 = _881 == _882;
    assign _919 = _883 & _918;
    assign _876 = seq_b_ir & _875;
    assign _878 = _876 == _877;
    assign _870 = seq_b_ir[11:8];
    assign _872 = _870 == _871;
    assign _866 = seq_b_ir[11:8];
    assign _868 = _866 == _867;
    assign _862 = seq_b_ir[11:8];
    assign _864 = _862 == _863;
    assign _858 = seq_b_ir[11:8];
    assign _860 = _858 == _859;
    assign _855 = seq_b_ir[11:8];
    assign _857 = _855 == _856;
    assign _861 = _857 | _860;
    assign _865 = _861 | _864;
    assign _869 = _865 | _868;
    assign _873 = _869 | _872;
    assign _852 = seq_b_ir[15:12];
    assign _854 = _852 == _853;
    assign _874 = _854 & _873;
    assign _879 = _874 & _878;
    assign _847 = seq_b_ir & _846;
    assign _849 = _847 == _848;
    assign _841 = seq_b_ir[7:6];
    assign _843 = _841 == _842;
    assign _837 = seq_b_ir[7:6];
    assign _839 = _837 == _838;
    assign _834 = seq_b_ir[7:6];
    assign _836 = _834 == _835;
    assign _840 = _836 | _839;
    assign _844 = _840 | _843;
    assign _829 = seq_b_ir[11:9];
    assign _831 = _829 == _830;
    assign _825 = seq_b_ir[11:9];
    assign _827 = _825 == _826;
    assign _821 = seq_b_ir[11:9];
    assign _823 = _821 == _822;
    assign _818 = seq_b_ir[11:9];
    assign _820 = _818 == _819;
    assign _824 = _820 | _823;
    assign _828 = _824 | _827;
    assign _832 = _828 | _831;
    assign _815 = seq_b_ir[15:12];
    assign _817 = _815 == _816;
    assign _833 = _817 & _832;
    assign _845 = _833 & _844;
    assign _850 = _845 & _849;
    assign _811 = seq_b_ir[15:12];
    assign _813 = _811 == _812;
    assign _805 = seq_b_ir[2:0];
    assign _807 = _805 == _806;
    assign _801 = seq_b_ir[2:0];
    assign _803 = _801 == _802;
    assign _797 = seq_b_ir[2:0];
    assign _799 = _797 == _798;
    assign _793 = seq_b_ir[2:0];
    assign _795 = _793 == _794;
    assign _789 = seq_b_ir[2:0];
    assign _791 = _789 == _790;
    assign _785 = seq_b_ir[2:0];
    assign _787 = _785 == _786;
    assign _781 = seq_b_ir[2:0];
    assign _783 = _781 == _782;
    assign _778 = seq_b_ir[2:0];
    assign _780 = _778 == _779;
    assign _784 = _780 | _783;
    assign _788 = _784 | _787;
    assign _792 = _788 | _791;
    assign _796 = _792 | _795;
    assign _800 = _796 | _799;
    assign _804 = _800 | _803;
    assign _808 = _804 | _807;
    assign _775 = seq_b_ir[15:12];
    assign _777 = _775 == _776;
    assign _809 = _777 & _808;
    assign _771 = seq_b_ir & _770;
    assign _773 = _771 == _772;
    assign _3280 = _278 ? _3279 : _3269;
    assign _3281 = _3280[4:0];
    always @* begin
        case (_3281)
        0: _3479 <= imem_32;
        1: _3479 <= imem_33;
        2: _3479 <= imem_34;
        3: _3479 <= imem_35;
        4: _3479 <= imem_36;
        5: _3479 <= imem_37;
        6: _3479 <= imem_38;
        7: _3479 <= imem_39;
        8: _3479 <= imem_40;
        9: _3479 <= imem_41;
        10: _3479 <= imem_42;
        11: _3479 <= imem_43;
        12: _3479 <= imem_44;
        13: _3479 <= imem_45;
        14: _3479 <= imem_46;
        15: _3479 <= imem_47;
        16: _3479 <= imem_48;
        17: _3479 <= imem_49;
        18: _3479 <= imem_50;
        19: _3479 <= imem_51;
        20: _3479 <= imem_52;
        21: _3479 <= imem_53;
        22: _3479 <= imem_54;
        23: _3479 <= imem_55;
        24: _3479 <= imem_56;
        25: _3479 <= imem_57;
        26: _3479 <= imem_58;
        27: _3479 <= imem_59;
        28: _3479 <= imem_60;
        29: _3479 <= imem_61;
        30: _3479 <= imem_62;
        default: _3479 <= imem_63;
        endcase
    end
    assign _84 = _3479;
    assign _3079 = ~ _939;
    assign _3277 = _3276[13:8];
    assign _3279 = _3277 | _3278;
    assign _3268 = seq_b_ir_pc + _3267;
    assign _3263 = pins_sync[7:7];
    assign _3262 = pins_sync[6:6];
    assign _3261 = pins_sync[5:5];
    assign _3260 = pins_sync[4:4];
    assign _3259 = pins_sync[3:3];
    assign _3258 = pins_sync[2:2];
    assign _3257 = pins_sync[1:1];
    assign _3256 = pins_sync[0:0];
    always @* begin
        case (_2926)
        0: _3264 <= _3256;
        1: _3264 <= _3257;
        2: _3264 <= _3258;
        3: _3264 <= _3259;
        4: _3264 <= _3260;
        5: _3264 <= _3261;
        6: _3264 <= _3262;
        default: _3264 <= _3263;
        endcase
    end
    assign _3253 = _944 == _3252;
    assign _3254 = _943 & _3253;
    assign _3255 = _3254 & seq_b_caught_up;
    assign _3265 = _3255 & _3264;
    assign _3480 = ~ _3045;
    assign _3481 = _3028 ? _3480 : seq_b_flag;
    assign _3482 = _3080 ? _3481 : seq_b_flag;
    assign _3483 = _278 ? gnd : _3482;
    assign _85 = _3483;
    always @(posedge _151) begin
        if (_164)
            seq_b_flag <= _3248;
        else
            seq_b_flag <= _85;
    end
    assign _3245 = _944 == _3244;
    assign _3246 = _943 & _3245;
    assign _3250 = _3246 & seq_b_flag;
    assign _3239 = seq_b_y == _3238;
    assign _3240 = ~ _3239;
    assign _3237 = _944 == _3236;
    assign _3241 = _3237 & _3240;
    assign _3232 = seq_b_x == _3231;
    assign _3233 = ~ _3232;
    assign _3230 = _944 == _3229;
    assign _3234 = _3230 & _3233;
    assign _3228 = _944 == _3227;
    assign _3235 = _3228 | _3234;
    assign _3242 = _3235 | _3241;
    assign _3243 = _943 & _3242;
    assign _3251 = _3243 | _3250;
    assign _3266 = _3251 | _3265;
    assign _3269 = _3266 ? _948 : _3268;
    assign _3484 = _3080 ? _3269 : seq_b_ir_pc;
    assign _3485 = _278 ? _3279 : _3484;
    assign _86 = _3485;
    always @(posedge _151) begin
        if (_164)
            seq_b_ir_pc <= _950;
        else
            seq_b_ir_pc <= _86;
    end
    assign _948 = seq_b_ir[5:0];
    assign _952 = _948 == seq_b_ir_pc;
    assign _946 = _944 == _945;
    assign _947 = _943 & _946;
    assign _953 = _947 & _952;
    assign _3077 = ~ _953;
    assign _3072 = ~ seq_b_caught_up;
    assign _3070 = _944 == _3069;
    assign _3071 = _943 & _3070;
    assign _3073 = _3071 & _3072;
    assign _3511 = seq_b_y[7:0];
    assign _3512 = { _3109, _3511 };
    assign _3509 = { _3508, _3109 };
    assign _3506 = seq_b_y - _3505;
    assign _3502 = seq_b_y == _3501;
    assign _3503 = ~ _3502;
    assign _3499 = _944 == _3498;
    assign _3500 = _943 & _3499;
    assign _3504 = _3500 & _3503;
    assign _3507 = _3504 ? _3506 : seq_b_y;
    assign _3496 = _3105 == _3495;
    assign _3493 = _940 == _3492;
    assign _3494 = _937 & _3493;
    assign _3497 = _3494 & _3496;
    assign _3510 = _3497 ? _3509 : _3507;
    assign _3490 = _3105 == _3489;
    assign _3487 = _940 == _3486;
    assign _3488 = _937 & _3487;
    assign _3491 = _3488 & _3490;
    assign _3513 = _3491 ? _3512 : _3510;
    assign _3514 = _3080 ? _3513 : seq_b_y;
    assign _3516 = _278 ? _3515 : _3514;
    assign _87 = _3516;
    always @(posedge _151) begin
        if (_164)
            seq_b_y <= _3058;
        else
            seq_b_y <= _87;
    end
    assign _3542 = seq_b_x[7:0];
    assign _3543 = { _3109, _3542 };
    assign _3540 = { _3539, _3109 };
    assign _3537 = seq_b_x - _3536;
    assign _3533 = seq_b_x == _3532;
    assign _3534 = ~ _3533;
    assign _944 = seq_b_ir[11:8];
    assign _3530 = _944 == _3529;
    assign _942 = _940 == _941;
    assign _943 = _937 & _942;
    assign _3531 = _943 & _3530;
    assign _3535 = _3531 & _3534;
    assign _3538 = _3535 ? _3537 : seq_b_x;
    assign _3527 = _3105 == _3526;
    assign _3524 = _940 == _3523;
    assign _3525 = _937 & _3524;
    assign _3528 = _3525 & _3527;
    assign _3541 = _3528 ? _3540 : _3538;
    assign _3521 = _3105 == _3520;
    assign _3518 = _940 == _3517;
    assign _3519 = _937 & _3518;
    assign _3522 = _3519 & _3521;
    assign _3544 = _3522 ? _3543 : _3541;
    assign _3545 = _3080 ? _3544 : seq_b_x;
    assign _3547 = _278 ? _3546 : _3545;
    assign _88 = _3547;
    always @(posedge _151) begin
        if (_164)
            seq_b_x <= _3055;
        else
            seq_b_x <= _88;
    end
    always @* begin
        case (_3046)
        0: _3061 <= _3053;
        1: _3061 <= seq_b_x;
        2: _3061 <= seq_b_y;
        default: _3061 <= _3060;
        endcase
    end
    assign _3554 = seq_b_wait_count + _3553;
    assign _3550 = ~ _3065;
    assign _3548 = seq_b_running & _3028;
    assign _3549 = _3548 & seq_b_caught_up;
    assign _3551 = _3549 & _3550;
    assign _3555 = _3551 ? _3554 : _3552;
    assign _3557 = _278 ? _3556 : _3555;
    assign _89 = _3557;
    always @(posedge _151) begin
        if (_164)
            seq_b_wait_count <= _3051;
        else
            seq_b_wait_count <= _89;
    end
    assign _3062 = seq_b_wait_count == _3061;
    assign _3046 = seq_b_ir[7:6];
    assign _3048 = _3046 == _3047;
    assign _3049 = ~ _3048;
    assign _3063 = _3049 & _3062;
    assign _3044 = seq_b_ir[8:8];
    assign _3042 = pins_sync[7:7];
    assign _3041 = pins_sync[6:6];
    assign _3040 = pins_sync[5:5];
    assign _3039 = pins_sync[4:4];
    assign _3038 = pins_sync[3:3];
    assign _3037 = pins_sync[2:2];
    assign _3036 = pins_sync[1:1];
    assign _3035 = pins_sync[0:0];
    assign _2925 = _2921[11:9];
    assign _2923 = _2921[5:3];
    assign _2922 = _2921[2:0];
    assign _2919 = _197 == _2918;
    assign _2920 = spi_wr & _2919;
    assign _2915 = spi_wdata[11:0];
    always @(posedge _151) begin
        if (_164)
            _2921 <= _2917;
        else
            if (_2920)
                _2921 <= _2915;
    end
    assign _2926 = _2921[8:6];
    assign _3032 = seq_b_ir[11:9];
    assign _3033 = _3032[1:0];
    always @* begin
        case (_3033)
        0: _3034 <= _2926;
        1: _3034 <= _2922;
        2: _3034 <= _2923;
        default: _3034 <= _2925;
        endcase
    end
    always @* begin
        case (_3034)
        0: _3043 <= _3035;
        1: _3043 <= _3036;
        2: _3043 <= _3037;
        3: _3043 <= _3038;
        4: _3043 <= _3039;
        5: _3043 <= _3040;
        6: _3043 <= _3041;
        default: _3043 <= _3042;
        endcase
    end
    assign _3045 = _3043 == _3044;
    assign _3064 = _3045 | _3063;
    assign _3610 = _3607 == _3609;
    assign _3606 = timebase + _3605;
    assign _3607 = _3604 - _3606;
    assign _3608 = _3607[23:23];
    assign _3611 = _3608 | _3610;
    assign _3589 = _3586 == _3588;
    assign _3585 = timebase + _3584;
    assign _3586 = _3583 - _3585;
    assign _3587 = _3586[23:23];
    assign _3590 = _3587 | _3589;
    assign _3612 = _3558 ? _3611 : _3590;
    assign _3613 = _3560 ? _3612 : vdd;
    assign _3568 = _3565 == _3567;
    assign _3564 = timebase + _3563;
    assign _3565 = seq_b_sched_s - _3564;
    assign _3566 = _3565[23:23];
    assign _3569 = _3566 | _3568;
    assign _3561 = _3080 & _3028;
    assign _3559 = _3080 & _3005;
    assign _3558 = _3080 & _985;
    assign _3560 = _3558 | _3559;
    assign _3562 = _3560 | _3561;
    assign _3614 = _3562 ? _3613 : _3569;
    assign _3615 = _278 ? gnd : _3614;
    assign _90 = _3615;
    always @(posedge _151) begin
        if (_164)
            seq_b_caught_up <= _3030;
        else
            seq_b_caught_up <= _90;
    end
    assign _3065 = seq_b_caught_up & _3064;
    assign _3066 = ~ _3065;
    assign _3067 = _3028 & _3066;
    assign _3156 = _3155 < _3020;
    assign _91 = _3022;
    assign _3157 = _91 & _3156;
    assign _3620 = { _3619, _3157 };
    assign _3119 = _3020 < _3118;
    assign _3116 = _197 == _3115;
    assign _3117 = spi_wr & _3116;
    assign _3120 = _3117 & _3119;
    assign _3617 = { _3616, _3120 };
    assign _3618 = _3020 + _3617;
    assign _3621 = _3618 - _3620;
    assign _92 = _3621;
    always @(posedge _151) begin
        if (_164)
            _3020 <= _3019;
        else
            _3020 <= _92;
    end
    assign _3021 = _3017 < _3020;
    assign _3016 = seq_b_running & _3015;
    assign _3022 = _3016 & _3021;
    assign _3023 = ~ _3022;
    assign _3012 = seq_b_ir[11:11];
    assign _3014 = _3012 == _3013;
    assign _3010 = _940 == _3009;
    assign _3011 = _937 & _3010;
    assign _3015 = _3011 & _3014;
    assign _3024 = _3015 & _3023;
    assign _3644 = _3640[21:21];
    assign _3643 = _3640[22:22];
    assign _3645 = _3643 | _3644;
    assign _3638 = timebase + _3637;
    assign _3579 = _3572[17:0];
    assign _3581 = { _3579, _3580 };
    assign _3576 = _3572[19:0];
    assign _3578 = { _3576, _3577 };
    assign _3573 = _3572[21:0];
    assign _3575 = { _3573, _3574 };
    assign _3571 = seq_b_ir[11:0];
    assign _3572 = { _3570, _3571 };
    always @* begin
        case (seq_b_prescale)
        0: _3582 <= _3572;
        1: _3582 <= _3575;
        2: _3582 <= _3578;
        default: _3582 <= _3581;
        endcase
    end
    assign _3583 = seq_b_sched_s + _3582;
    assign _3600 = _3593[17:0];
    assign _3602 = { _3600, _3601 };
    assign _3597 = _3593[19:0];
    assign _3599 = { _3597, _3598 };
    assign _3594 = _3593[21:0];
    assign _3596 = { _3594, _3595 };
    assign _3592 = seq_b_ir[11:6];
    assign _3593 = { _3591, _3592 };
    assign _3109 = seq_b_ir[7:0];
    assign _3628 = _3109[1:0];
    assign _3105 = seq_b_ir[11:8];
    assign _3626 = _3105 == _3625;
    assign _3623 = _940 == _3622;
    assign _3624 = _937 & _3623;
    assign _3627 = _3624 & _3626;
    assign _3629 = _3627 ? _3628 : seq_b_prescale;
    assign _3630 = _3080 ? _3629 : seq_b_prescale;
    assign _3632 = _278 ? _3631 : _3630;
    assign _93 = _3632;
    always @(posedge _151) begin
        if (_164)
            seq_b_prescale <= _996;
        else
            seq_b_prescale <= _93;
    end
    always @* begin
        case (seq_b_prescale)
        0: _3603 <= _3593;
        1: _3603 <= _3596;
        2: _3603 <= _3599;
        default: _3603 <= _3602;
        endcase
    end
    assign _3604 = seq_b_sched_s + _3603;
    assign _3633 = _985 ? _3604 : seq_b_sched_s;
    assign _3634 = _3005 ? _3583 : _3633;
    assign _3027 = _940 == _3026;
    assign _3028 = _937 & _3027;
    assign _3635 = _3028 ? timebase : _3634;
    assign _3636 = _3080 ? _3635 : seq_b_sched_s;
    assign _3639 = _278 ? _3638 : _3636;
    assign _94 = _3639;
    always @(posedge _151) begin
        if (_164)
            seq_b_sched_s <= _993;
        else
            seq_b_sched_s <= _94;
    end
    assign _3640 = seq_b_sched_s - timebase;
    assign _3641 = _3640[23:23];
    assign _3642 = ~ _3641;
    assign _3646 = _3642 & _3645;
    assign _3647 = _278 ? gnd : _3646;
    assign _95 = _3647;
    always @(posedge _151) begin
        if (_164)
            seq_b_far <= _982;
        else
            seq_b_far <= _95;
    end
    assign _3004 = ~ seq_b_far;
    assign _3001 = _940 == _3000;
    assign _3002 = _937 & _3001;
    assign _3003 = seq_b_running & _3002;
    assign _3005 = _3003 & _3004;
    assign _3006 = ~ _3005;
    assign _2998 = _940 == _2997;
    assign _2999 = _937 & _2998;
    assign _3007 = _2999 & _3006;
    assign _2995 = ~ _985;
    assign _940 = seq_b_ir[15:12];
    assign _2993 = _940 == _2992;
    assign _2994 = _937 & _2993;
    assign _2996 = _2994 & _2995;
    assign _3008 = _2996 | _3007;
    assign _3025 = _3008 | _3024;
    assign _3068 = _3025 | _3067;
    assign _3074 = _3068 | _3073;
    assign _3075 = ~ _3074;
    assign _3076 = seq_b_running & _3075;
    assign _3078 = _3076 & _3077;
    assign _3080 = _3078 & _3079;
    assign _3648 = _3080 ? _84 : seq_b_ir;
    assign _3649 = _278 ? _84 : _3648;
    assign _96 = _3649;
    always @(posedge _151) begin
        if (_164)
            seq_b_ir <= _765;
        else
            seq_b_ir <= _96;
    end
    assign _767 = seq_b_ir[15:12];
    assign _769 = _767 == _768;
    assign _774 = _769 & _773;
    assign _810 = _774 | _809;
    assign _814 = _810 | _813;
    assign _851 = _814 | _850;
    assign _880 = _851 | _879;
    assign _920 = _880 | _919;
    assign _937 = _920 | _936;
    assign _938 = ~ _937;
    assign _939 = seq_b_running & _938;
    assign _3651 = _939 ? gnd : _3650;
    assign _3652 = _278 ? vdd : _3651;
    assign _97 = _3652;
    always @(posedge _151) begin
        if (_164)
            seq_b_running <= _762;
        else
            seq_b_running <= _97;
    end
    assign _979 = seq_b_running & _978;
    assign _980 = _979 & _83;
    assign _985 = _980 & _984;
    assign _988 = _985 & _987;
    assign _3654 = { _3653, _988 };
    assign _3655 = queue_b_count + _3654;
    assign _3656 = _3655 - _3224;
    assign _98 = _3656;
    always @(posedge _151) begin
        if (_279)
            queue_b_count <= _280;
        else
            queue_b_count <= _98;
    end
    assign _282 = _275 < queue_b_count;
    assign _307 = _282 & _306;
    assign _4402 = _307 & _4401;
    assign _268 = _225[1:0];
    assign _4396 = _268 == _4395;
    assign _4397 = ~ _4396;
    assign _232 = _225[28:5];
    assign _233 = _232 - timebase;
    assign _235 = _233 == _234;
    always @* begin
        case (queue_a_read_ptr)
        0: _225 <= queue_a_entry0;
        1: _225 <= queue_a_entry1;
        2: _225 <= queue_a_entry2;
        default: _225 <= queue_a_entry3;
        endcase
    end
    assign _226 = _225[28:5];
    assign _230 = _226 - timebase;
    assign _231 = _230[23:23];
    assign _236 = _231 | _235;
    assign _247 = _243[28:5];
    assign _248 = _247 - timebase;
    assign _250 = _248 == _249;
    assign _3661 = queue_a_write_ptr == _3660;
    assign _3739 = _3661 ? _3738 : queue_a_entry3;
    assign _3740 = _2196 ? _3739 : queue_a_entry3;
    assign _99 = _3740;
    always @(posedge _151) begin
        if (_206)
            queue_a_entry3 <= _223;
        else
            queue_a_entry3 <= _99;
    end
    assign _3742 = queue_a_write_ptr == _3741;
    assign _3743 = _3742 ? _3738 : queue_a_entry2;
    assign _3744 = _2196 ? _3743 : queue_a_entry2;
    assign _100 = _3744;
    always @(posedge _151) begin
        if (_206)
            queue_a_entry2 <= _220;
        else
            queue_a_entry2 <= _100;
    end
    assign _3746 = queue_a_write_ptr == _3745;
    assign _3747 = _3746 ? _3738 : queue_a_entry1;
    assign _3748 = _2196 ? _3747 : queue_a_entry1;
    assign _101 = _3748;
    always @(posedge _151) begin
        if (_206)
            queue_a_entry1 <= _217;
        else
            queue_a_entry1 <= _101;
    end
    assign _3734 = _3687 ? _3733 : _3732;
    assign _3847 = _3671 ? _3737 : seq_a_shadow_clk;
    assign _3848 = _3846 ? _3847 : seq_a_shadow_clk;
    assign _3849 = _2193 ? _3848 : seq_a_shadow_clk;
    assign _3850 = _3837 ? _3849 : seq_a_shadow_clk;
    assign _3852 = _205 ? _3851 : _3850;
    assign _102 = _3852;
    always @(posedge _151) begin
        if (_164)
            seq_a_shadow_clk <= _3725;
        else
            seq_a_shadow_clk <= _102;
    end
    assign _3853 = _3671 ? seq_a_shadow_data : _3737;
    assign _3844 = _3662 == _3843;
    assign _3841 = _3662 == _3840;
    assign _3839 = _3662 == _3838;
    assign _3842 = _3839 | _3841;
    assign _3845 = _3842 | _3844;
    assign _3846 = ~ _3845;
    assign _3854 = _3846 ? _3853 : seq_a_shadow_data;
    assign _3855 = _2193 ? _3854 : seq_a_shadow_data;
    assign _3856 = _3837 ? _3855 : seq_a_shadow_data;
    assign _3858 = _205 ? _3857 : _3856;
    assign _103 = _3858;
    always @(posedge _151) begin
        if (_164)
            seq_a_shadow_data <= _3722;
        else
            seq_a_shadow_data <= _103;
    end
    assign _3727 = _3671 ? seq_a_shadow_clk : seq_a_shadow_data;
    assign _3729 = _3727 == _3728;
    assign _3730 = _3729 ? _3719 : _3703;
    assign _3716 = seq_a_coder[3:3];
    assign _3719 = _3716 ? _3718 : _3717;
    assign _3867 = _3866[3:0];
    assign _3864 = _3862 == _3863;
    assign _3860 = _2149 == _3859;
    assign _3861 = _2146 & _3860;
    assign _3865 = _3861 & _3864;
    assign _3868 = _3865 ? _3867 : seq_a_coder;
    assign _3869 = _3837 ? _3868 : seq_a_coder;
    assign _3871 = _205 ? _3870 : _3869;
    assign _104 = _3871;
    always @(posedge _151) begin
        if (_164)
            seq_a_coder <= _3712;
        else
            seq_a_coder <= _104;
    end
    assign _3714 = seq_a_coder[2:2];
    assign _3882 = _3880 == _3881;
    assign _3883 = _3877 & _3882;
    assign _3887 = _3883 ? spi_wdata : _3886;
    assign _105 = _3887;
    always @(posedge _151) begin
        if (_164)
            _3886 <= _3885;
        else
            _3886 <= _105;
    end
    assign _3889 = _3880 == _3888;
    assign _3890 = _3877 & _3889;
    assign _3894 = _3890 ? spi_wdata : _3893;
    assign _106 = _3894;
    always @(posedge _151) begin
        if (_164)
            _3893 <= _3892;
        else
            _3893 <= _106;
    end
    assign _3896 = _3880 == _3895;
    assign _3897 = _3877 & _3896;
    assign _3901 = _3897 ? spi_wdata : _3900;
    assign _107 = _3901;
    always @(posedge _151) begin
        if (_164)
            _3900 <= _3899;
        else
            _3900 <= _107;
    end
    assign _3903 = _3880 + _3902;
    assign _3904 = _3877 ? _3903 : _3880;
    assign _108 = _3904;
    always @(posedge _151) begin
        if (_164)
            _3880 <= _3879;
        else
            _3880 <= _108;
    end
    assign _3906 = _3880 == _3905;
    assign _3907 = _3877 & _3906;
    assign _3911 = _3907 ? spi_wdata : _3910;
    assign _109 = _3911;
    always @(posedge _151) begin
        if (_164)
            _3910 <= _3909;
        else
            _3910 <= _109;
    end
    assign _3919 = _3917 + _3918;
    assign _3920 = _3914 ? _3919 : _3917;
    assign _110 = _3920;
    always @(posedge _151) begin
        if (_164)
            _3917 <= _3916;
        else
            _3917 <= _110;
    end
    always @* begin
        case (_3917)
        0: _3928 <= _3910;
        1: _3928 <= _3900;
        2: _3928 <= _3893;
        default: _3928 <= _3886;
        endcase
    end
    assign _3923 = seq_a_osr[30:0];
    assign _3925 = { _3923, _3924 };
    assign _3922 = _3662 == _3921;
    assign _3926 = _3922 ? _3925 : seq_a_osr;
    assign _3927 = _2193 ? _3926 : seq_a_osr;
    assign _3929 = _3779 ? _3928 : _3927;
    assign _3930 = _3837 ? _3929 : seq_a_osr;
    assign _3932 = _205 ? _3931 : _3930;
    assign _111 = _3932;
    always @(posedge _151) begin
        if (_164)
            seq_a_osr <= _3708;
        else
            seq_a_osr <= _111;
    end
    assign _3710 = seq_a_osr[31:31];
    assign _3715 = _3710 ^ _3714;
    assign _3720 = _3715 ? _3719 : _3703;
    assign _3731 = _3692 ? _3730 : _3720;
    assign _3735 = _3690 ? _3734 : _3731;
    assign _3706 = _3698 ? _3705 : _3704;
    assign _3736 = _3696 ? _3735 : _3706;
    assign _3700 = _3662 == _3699;
    assign _3698 = _3662 == _3697;
    assign _3701 = _3698 | _3700;
    assign _3694 = _3662 == _3693;
    assign _3692 = _3662 == _3691;
    assign _3695 = _3692 | _3694;
    assign _3689 = _3662 == _3688;
    assign _3687 = _3662 == _3686;
    assign _3690 = _3687 | _3689;
    assign _3696 = _3690 | _3695;
    assign _3702 = _3696 | _3701;
    assign _3737 = _3702 ? _3736 : _3703;
    assign _3684 = _3664 ? _3683 : _3682;
    assign _3671 = seq_a_ir[5:5];
    assign _3681 = _3671 ? _3680 : _3679;
    assign _3668 = _3662 == _3667;
    assign _3666 = _3662 == _3665;
    assign _3669 = _3666 | _3668;
    assign _3662 = seq_a_ir[2:0];
    assign _3664 = _3662 == _3663;
    assign _3670 = _3664 | _3669;
    assign _3685 = _3670 ? _3684 : _3681;
    assign _2238 = _2231[17:0];
    assign _2240 = { _2238, _2239 };
    assign _2235 = _2231[19:0];
    assign _2237 = { _2235, _2236 };
    assign _2232 = _2231[21:0];
    assign _2234 = { _2232, _2233 };
    assign _2229 = { _2227, _2226 };
    assign _3191 = _3190[23:16];
    assign _3937 = _3862 == _3936;
    assign _3934 = _2149 == _3933;
    assign _3935 = _2146 & _3934;
    assign _3938 = _3935 & _3937;
    assign _3939 = _3938 ? _3866 : seq_a_k3;
    assign _3940 = _3837 ? _3939 : seq_a_k3;
    assign _3941 = _205 ? _3191 : _3940;
    assign _112 = _3941;
    always @(posedge _151) begin
        if (_164)
            seq_a_k3 <= _2218;
        else
            seq_a_k3 <= _112;
    end
    assign _3201 = _3190[15:8];
    assign _3946 = _3862 == _3945;
    assign _3943 = _2149 == _3942;
    assign _3944 = _2146 & _3943;
    assign _3947 = _3944 & _3946;
    assign _3948 = _3947 ? _3866 : seq_a_k2;
    assign _3949 = _3837 ? _3948 : seq_a_k2;
    assign _3950 = _205 ? _3201 : _3949;
    assign _113 = _3950;
    always @(posedge _151) begin
        if (_164)
            seq_a_k2 <= _2215;
        else
            seq_a_k2 <= _113;
    end
    assign _3211 = _3190[7:0];
    assign _3955 = _3862 == _3954;
    assign _3952 = _2149 == _3951;
    assign _3953 = _2146 & _3952;
    assign _3956 = _3953 & _3955;
    assign _3957 = _3956 ? _3866 : seq_a_k1;
    assign _3958 = _3837 ? _3957 : seq_a_k1;
    assign _3959 = _205 ? _3211 : _3958;
    assign _114 = _3959;
    always @(posedge _151) begin
        if (_164)
            seq_a_k1 <= _2212;
        else
            seq_a_k1 <= _114;
    end
    assign _2209 = seq_a_ir[4:3];
    always @* begin
        case (_2209)
        0: _2220 <= _2210;
        1: _2220 <= seq_a_k1;
        2: _2220 <= seq_a_k2;
        default: _2220 <= seq_a_k3;
        endcase
    end
    assign _2221 = _2220[7:7];
    assign _2222 = { _2221, _2221 };
    assign _2223 = { _2222, _2220 };
    assign _2207 = seq_a_ir[11:6];
    assign _2208 = { _2206, _2207 };
    assign _2224 = _2208 + _2223;
    assign _2225 = _2224[9:9];
    assign _2226 = { _2225, _2225 };
    assign _2227 = { _2226, _2226 };
    assign _2228 = { _2227, _2227 };
    assign _2230 = { _2228, _2229 };
    assign _2231 = { _2230, _2224 };
    always @* begin
        case (seq_a_prescale)
        0: _2241 <= _2231;
        1: _2241 <= _2234;
        2: _2241 <= _2237;
        default: _2241 <= _2240;
        endcase
    end
    assign _2242 = seq_a_sched_s + _2241;
    assign _3738 = { _2242, _3685, _3737 };
    assign _3961 = queue_a_write_ptr + _3960;
    assign _3962 = _2196 ? _3961 : queue_a_write_ptr;
    assign _115 = _3962;
    always @(posedge _151) begin
        if (_206)
            queue_a_write_ptr <= _3658;
        else
            queue_a_write_ptr <= _115;
    end
    assign _3964 = queue_a_write_ptr == _3963;
    assign _3965 = _3964 ? _3738 : queue_a_entry0;
    assign _3966 = _2196 ? _3965 : queue_a_entry0;
    assign _116 = _3966;
    always @(posedge _151) begin
        if (_206)
            queue_a_entry0 <= _214;
        else
            queue_a_entry0 <= _116;
    end
    assign _206 = _164 | _205;
    assign _3972 = _3971[1:0];
    assign _3973 = queue_a_read_ptr + _3972;
    assign _117 = _3973;
    always @(posedge _151) begin
        if (_206)
            queue_a_read_ptr <= _211;
        else
            queue_a_read_ptr <= _117;
    end
    assign _242 = queue_a_read_ptr + _241;
    always @* begin
        case (_242)
        0: _243 <= queue_a_entry0;
        1: _243 <= queue_a_entry1;
        2: _243 <= queue_a_entry2;
        default: _243 <= queue_a_entry3;
        endcase
    end
    assign _244 = _243[28:5];
    assign _245 = _244 - timebase;
    assign _246 = _245[23:23];
    assign _251 = _246 | _250;
    assign _239 = _238 < queue_a_count;
    assign _240 = _237 & _239;
    assign _252 = _240 & _251;
    assign _3970 = { _3969, _252 };
    assign _3968 = { _3967, _237 };
    assign _3971 = _3968 + _3970;
    assign _2192 = ~ seq_a_far;
    assign _2195 = queue_a_count < _2194;
    assign _118 = _2195;
    assign _2185 = _2149 == _2184;
    assign _2186 = _2146 & _2185;
    assign _2163 = seq_a_running & _2162;
    assign _4384 = _2163 ? gnd : seq_a_running;
    assign _2142 = seq_a_ir & _2141;
    assign _2144 = _2142 == _2143;
    assign _2137 = seq_a_ir[10:10];
    assign _2139 = _2137 == _2138;
    assign _2133 = seq_a_ir[11:11];
    assign _2135 = _2133 == _2134;
    assign _2130 = seq_a_ir[15:12];
    assign _2132 = _2130 == _2131;
    assign _2136 = _2132 & _2135;
    assign _2140 = _2136 & _2139;
    assign _2145 = _2140 & _2144;
    assign _2124 = seq_a_ir[11:8];
    assign _2126 = _2124 == _2125;
    assign _2120 = seq_a_ir[11:8];
    assign _2122 = _2120 == _2121;
    assign _2116 = seq_a_ir[11:8];
    assign _2118 = _2116 == _2117;
    assign _2112 = seq_a_ir[11:8];
    assign _2114 = _2112 == _2113;
    assign _2108 = seq_a_ir[11:8];
    assign _2110 = _2108 == _2109;
    assign _2104 = seq_a_ir[11:8];
    assign _2106 = _2104 == _2105;
    assign _2100 = seq_a_ir[11:8];
    assign _2102 = _2100 == _2101;
    assign _2096 = seq_a_ir[11:8];
    assign _2098 = _2096 == _2097;
    assign _2093 = seq_a_ir[11:8];
    assign _2095 = _2093 == _2094;
    assign _2099 = _2095 | _2098;
    assign _2103 = _2099 | _2102;
    assign _2107 = _2103 | _2106;
    assign _2111 = _2107 | _2110;
    assign _2115 = _2111 | _2114;
    assign _2119 = _2115 | _2118;
    assign _2123 = _2119 | _2122;
    assign _2127 = _2123 | _2126;
    assign _2090 = seq_a_ir[15:12];
    assign _2092 = _2090 == _2091;
    assign _2128 = _2092 & _2127;
    assign _2085 = seq_a_ir & _2084;
    assign _2087 = _2085 == _2086;
    assign _2079 = seq_a_ir[11:8];
    assign _2081 = _2079 == _2080;
    assign _2075 = seq_a_ir[11:8];
    assign _2077 = _2075 == _2076;
    assign _2071 = seq_a_ir[11:8];
    assign _2073 = _2071 == _2072;
    assign _2067 = seq_a_ir[11:8];
    assign _2069 = _2067 == _2068;
    assign _2064 = seq_a_ir[11:8];
    assign _2066 = _2064 == _2065;
    assign _2070 = _2066 | _2069;
    assign _2074 = _2070 | _2073;
    assign _2078 = _2074 | _2077;
    assign _2082 = _2078 | _2081;
    assign _2061 = seq_a_ir[15:12];
    assign _2063 = _2061 == _2062;
    assign _2083 = _2063 & _2082;
    assign _2088 = _2083 & _2087;
    assign _2056 = seq_a_ir & _2055;
    assign _2058 = _2056 == _2057;
    assign _2050 = seq_a_ir[7:6];
    assign _2052 = _2050 == _2051;
    assign _2046 = seq_a_ir[7:6];
    assign _2048 = _2046 == _2047;
    assign _2043 = seq_a_ir[7:6];
    assign _2045 = _2043 == _2044;
    assign _2049 = _2045 | _2048;
    assign _2053 = _2049 | _2052;
    assign _2038 = seq_a_ir[11:9];
    assign _2040 = _2038 == _2039;
    assign _2034 = seq_a_ir[11:9];
    assign _2036 = _2034 == _2035;
    assign _2030 = seq_a_ir[11:9];
    assign _2032 = _2030 == _2031;
    assign _2027 = seq_a_ir[11:9];
    assign _2029 = _2027 == _2028;
    assign _2033 = _2029 | _2032;
    assign _2037 = _2033 | _2036;
    assign _2041 = _2037 | _2040;
    assign _2024 = seq_a_ir[15:12];
    assign _2026 = _2024 == _2025;
    assign _2042 = _2026 & _2041;
    assign _2054 = _2042 & _2053;
    assign _2059 = _2054 & _2058;
    assign _2020 = seq_a_ir[15:12];
    assign _2022 = _2020 == _2021;
    assign _2014 = seq_a_ir[2:0];
    assign _2016 = _2014 == _2015;
    assign _2010 = seq_a_ir[2:0];
    assign _2012 = _2010 == _2011;
    assign _2006 = seq_a_ir[2:0];
    assign _2008 = _2006 == _2007;
    assign _2002 = seq_a_ir[2:0];
    assign _2004 = _2002 == _2003;
    assign _1998 = seq_a_ir[2:0];
    assign _2000 = _1998 == _1999;
    assign _1994 = seq_a_ir[2:0];
    assign _1996 = _1994 == _1995;
    assign _1990 = seq_a_ir[2:0];
    assign _1992 = _1990 == _1991;
    assign _1987 = seq_a_ir[2:0];
    assign _1989 = _1987 == _1988;
    assign _1993 = _1989 | _1992;
    assign _1997 = _1993 | _1996;
    assign _2001 = _1997 | _2000;
    assign _2005 = _2001 | _2004;
    assign _2009 = _2005 | _2008;
    assign _2013 = _2009 | _2012;
    assign _2017 = _2013 | _2016;
    assign _1984 = seq_a_ir[15:12];
    assign _1986 = _1984 == _1985;
    assign _2018 = _1986 & _2017;
    assign _1980 = seq_a_ir & _1979;
    assign _1982 = _1980 == _1981;
    assign _3476 = _3288 == _3475;
    assign _3477 = _3287 & _3476;
    always @(posedge _151) begin
        if (_3477)
            imem_63 <= _3282;
    end
    assign _3470 = _3288 == _3469;
    assign _3471 = _3287 & _3470;
    always @(posedge _151) begin
        if (_3471)
            imem_62 <= _3282;
    end
    assign _3464 = _3288 == _3463;
    assign _3465 = _3287 & _3464;
    always @(posedge _151) begin
        if (_3465)
            imem_61 <= _3282;
    end
    assign _3458 = _3288 == _3457;
    assign _3459 = _3287 & _3458;
    always @(posedge _151) begin
        if (_3459)
            imem_60 <= _3282;
    end
    assign _3452 = _3288 == _3451;
    assign _3453 = _3287 & _3452;
    always @(posedge _151) begin
        if (_3453)
            imem_59 <= _3282;
    end
    assign _3446 = _3288 == _3445;
    assign _3447 = _3287 & _3446;
    always @(posedge _151) begin
        if (_3447)
            imem_58 <= _3282;
    end
    assign _3440 = _3288 == _3439;
    assign _3441 = _3287 & _3440;
    always @(posedge _151) begin
        if (_3441)
            imem_57 <= _3282;
    end
    assign _3434 = _3288 == _3433;
    assign _3435 = _3287 & _3434;
    always @(posedge _151) begin
        if (_3435)
            imem_56 <= _3282;
    end
    assign _3428 = _3288 == _3427;
    assign _3429 = _3287 & _3428;
    always @(posedge _151) begin
        if (_3429)
            imem_55 <= _3282;
    end
    assign _3422 = _3288 == _3421;
    assign _3423 = _3287 & _3422;
    always @(posedge _151) begin
        if (_3423)
            imem_54 <= _3282;
    end
    assign _3416 = _3288 == _3415;
    assign _3417 = _3287 & _3416;
    always @(posedge _151) begin
        if (_3417)
            imem_53 <= _3282;
    end
    assign _3410 = _3288 == _3409;
    assign _3411 = _3287 & _3410;
    always @(posedge _151) begin
        if (_3411)
            imem_52 <= _3282;
    end
    assign _3404 = _3288 == _3403;
    assign _3405 = _3287 & _3404;
    always @(posedge _151) begin
        if (_3405)
            imem_51 <= _3282;
    end
    assign _3398 = _3288 == _3397;
    assign _3399 = _3287 & _3398;
    always @(posedge _151) begin
        if (_3399)
            imem_50 <= _3282;
    end
    assign _3392 = _3288 == _3391;
    assign _3393 = _3287 & _3392;
    always @(posedge _151) begin
        if (_3393)
            imem_49 <= _3282;
    end
    assign _3386 = _3288 == _3385;
    assign _3387 = _3287 & _3386;
    always @(posedge _151) begin
        if (_3387)
            imem_48 <= _3282;
    end
    assign _3380 = _3288 == _3379;
    assign _3381 = _3287 & _3380;
    always @(posedge _151) begin
        if (_3381)
            imem_47 <= _3282;
    end
    assign _3374 = _3288 == _3373;
    assign _3375 = _3287 & _3374;
    always @(posedge _151) begin
        if (_3375)
            imem_46 <= _3282;
    end
    assign _3368 = _3288 == _3367;
    assign _3369 = _3287 & _3368;
    always @(posedge _151) begin
        if (_3369)
            imem_45 <= _3282;
    end
    assign _3362 = _3288 == _3361;
    assign _3363 = _3287 & _3362;
    always @(posedge _151) begin
        if (_3363)
            imem_44 <= _3282;
    end
    assign _3356 = _3288 == _3355;
    assign _3357 = _3287 & _3356;
    always @(posedge _151) begin
        if (_3357)
            imem_43 <= _3282;
    end
    assign _3350 = _3288 == _3349;
    assign _3351 = _3287 & _3350;
    always @(posedge _151) begin
        if (_3351)
            imem_42 <= _3282;
    end
    assign _3344 = _3288 == _3343;
    assign _3345 = _3287 & _3344;
    always @(posedge _151) begin
        if (_3345)
            imem_41 <= _3282;
    end
    assign _3338 = _3288 == _3337;
    assign _3339 = _3287 & _3338;
    always @(posedge _151) begin
        if (_3339)
            imem_40 <= _3282;
    end
    assign _3332 = _3288 == _3331;
    assign _3333 = _3287 & _3332;
    always @(posedge _151) begin
        if (_3333)
            imem_39 <= _3282;
    end
    assign _3326 = _3288 == _3325;
    assign _3327 = _3287 & _3326;
    always @(posedge _151) begin
        if (_3327)
            imem_38 <= _3282;
    end
    assign _3320 = _3288 == _3319;
    assign _3321 = _3287 & _3320;
    always @(posedge _151) begin
        if (_3321)
            imem_37 <= _3282;
    end
    assign _3314 = _3288 == _3313;
    assign _3315 = _3287 & _3314;
    always @(posedge _151) begin
        if (_3315)
            imem_36 <= _3282;
    end
    assign _3308 = _3288 == _3307;
    assign _3309 = _3287 & _3308;
    always @(posedge _151) begin
        if (_3309)
            imem_35 <= _3282;
    end
    assign _3302 = _3288 == _3301;
    assign _3303 = _3287 & _3302;
    always @(posedge _151) begin
        if (_3303)
            imem_34 <= _3282;
    end
    assign _3296 = _3288 == _3295;
    assign _3297 = _3287 & _3296;
    always @(posedge _151) begin
        if (_3297)
            imem_33 <= _3282;
    end
    assign _3290 = _3288 == _3289;
    assign _3291 = _3287 & _3290;
    always @(posedge _151) begin
        if (_3291)
            imem_32 <= _3282;
    end
    assign _4208 = _3288 == _4207;
    assign _4209 = _3287 & _4208;
    always @(posedge _151) begin
        if (_4209)
            imem_31 <= _3282;
    end
    assign _4202 = _3288 == _4201;
    assign _4203 = _3287 & _4202;
    always @(posedge _151) begin
        if (_4203)
            imem_30 <= _3282;
    end
    assign _4196 = _3288 == _4195;
    assign _4197 = _3287 & _4196;
    always @(posedge _151) begin
        if (_4197)
            imem_29 <= _3282;
    end
    assign _4190 = _3288 == _4189;
    assign _4191 = _3287 & _4190;
    always @(posedge _151) begin
        if (_4191)
            imem_28 <= _3282;
    end
    assign _4184 = _3288 == _4183;
    assign _4185 = _3287 & _4184;
    always @(posedge _151) begin
        if (_4185)
            imem_27 <= _3282;
    end
    assign _4178 = _3288 == _4177;
    assign _4179 = _3287 & _4178;
    always @(posedge _151) begin
        if (_4179)
            imem_26 <= _3282;
    end
    assign _4172 = _3288 == _4171;
    assign _4173 = _3287 & _4172;
    always @(posedge _151) begin
        if (_4173)
            imem_25 <= _3282;
    end
    assign _4166 = _3288 == _4165;
    assign _4167 = _3287 & _4166;
    always @(posedge _151) begin
        if (_4167)
            imem_24 <= _3282;
    end
    assign _4160 = _3288 == _4159;
    assign _4161 = _3287 & _4160;
    always @(posedge _151) begin
        if (_4161)
            imem_23 <= _3282;
    end
    assign _4154 = _3288 == _4153;
    assign _4155 = _3287 & _4154;
    always @(posedge _151) begin
        if (_4155)
            imem_22 <= _3282;
    end
    assign _4148 = _3288 == _4147;
    assign _4149 = _3287 & _4148;
    always @(posedge _151) begin
        if (_4149)
            imem_21 <= _3282;
    end
    assign _4142 = _3288 == _4141;
    assign _4143 = _3287 & _4142;
    always @(posedge _151) begin
        if (_4143)
            imem_20 <= _3282;
    end
    assign _4136 = _3288 == _4135;
    assign _4137 = _3287 & _4136;
    always @(posedge _151) begin
        if (_4137)
            imem_19 <= _3282;
    end
    assign _4130 = _3288 == _4129;
    assign _4131 = _3287 & _4130;
    always @(posedge _151) begin
        if (_4131)
            imem_18 <= _3282;
    end
    assign _4124 = _3288 == _4123;
    assign _4125 = _3287 & _4124;
    always @(posedge _151) begin
        if (_4125)
            imem_17 <= _3282;
    end
    assign _4118 = _3288 == _4117;
    assign _4119 = _3287 & _4118;
    always @(posedge _151) begin
        if (_4119)
            imem_16 <= _3282;
    end
    assign _4112 = _3288 == _4111;
    assign _4113 = _3287 & _4112;
    always @(posedge _151) begin
        if (_4113)
            imem_15 <= _3282;
    end
    assign _4106 = _3288 == _4105;
    assign _4107 = _3287 & _4106;
    always @(posedge _151) begin
        if (_4107)
            imem_14 <= _3282;
    end
    assign _4100 = _3288 == _4099;
    assign _4101 = _3287 & _4100;
    always @(posedge _151) begin
        if (_4101)
            imem_13 <= _3282;
    end
    assign _4094 = _3288 == _4093;
    assign _4095 = _3287 & _4094;
    always @(posedge _151) begin
        if (_4095)
            imem_12 <= _3282;
    end
    assign _4088 = _3288 == _4087;
    assign _4089 = _3287 & _4088;
    always @(posedge _151) begin
        if (_4089)
            imem_11 <= _3282;
    end
    assign _4082 = _3288 == _4081;
    assign _4083 = _3287 & _4082;
    always @(posedge _151) begin
        if (_4083)
            imem_10 <= _3282;
    end
    assign _4076 = _3288 == _4075;
    assign _4077 = _3287 & _4076;
    always @(posedge _151) begin
        if (_4077)
            imem_09 <= _3282;
    end
    assign _4070 = _3288 == _4069;
    assign _4071 = _3287 & _4070;
    always @(posedge _151) begin
        if (_4071)
            imem_08 <= _3282;
    end
    assign _4064 = _3288 == _4063;
    assign _4065 = _3287 & _4064;
    always @(posedge _151) begin
        if (_4065)
            imem_07 <= _3282;
    end
    assign _4058 = _3288 == _4057;
    assign _4059 = _3287 & _4058;
    always @(posedge _151) begin
        if (_4059)
            imem_06 <= _3282;
    end
    assign _4052 = _3288 == _4051;
    assign _4053 = _3287 & _4052;
    always @(posedge _151) begin
        if (_4053)
            imem_05 <= _3282;
    end
    assign _4046 = _3288 == _4045;
    assign _4047 = _3287 & _4046;
    always @(posedge _151) begin
        if (_4047)
            imem_04 <= _3282;
    end
    assign _4040 = _3288 == _4039;
    assign _4041 = _3287 & _4040;
    always @(posedge _151) begin
        if (_4041)
            imem_03 <= _3282;
    end
    assign _4034 = _3288 == _4033;
    assign _4035 = _3287 & _4034;
    always @(posedge _151) begin
        if (_4035)
            imem_02 <= _3282;
    end
    assign _4028 = _3288 == _4027;
    assign _4029 = _3287 & _4028;
    always @(posedge _151) begin
        if (_4029)
            imem_01 <= _3282;
    end
    assign _3288 = _197[5:0];
    assign _4022 = _3288 == _4021;
    assign _3286 = _197 < _3285;
    assign _3287 = spi_wr & _3286;
    assign _4023 = _3287 & _4022;
    assign _3282 = spi_wdata[15:0];
    always @(posedge _151) begin
        if (_4023)
            imem_00 <= _3282;
    end
    assign _4018 = _205 ? _4017 : _4016;
    always @* begin
        case (_4018)
        0: _4211 <= imem_00;
        1: _4211 <= imem_01;
        2: _4211 <= imem_02;
        3: _4211 <= imem_03;
        4: _4211 <= imem_04;
        5: _4211 <= imem_05;
        6: _4211 <= imem_06;
        7: _4211 <= imem_07;
        8: _4211 <= imem_08;
        9: _4211 <= imem_09;
        10: _4211 <= imem_10;
        11: _4211 <= imem_11;
        12: _4211 <= imem_12;
        13: _4211 <= imem_13;
        14: _4211 <= imem_14;
        15: _4211 <= imem_15;
        16: _4211 <= imem_16;
        17: _4211 <= imem_17;
        18: _4211 <= imem_18;
        19: _4211 <= imem_19;
        20: _4211 <= imem_20;
        21: _4211 <= imem_21;
        22: _4211 <= imem_22;
        23: _4211 <= imem_23;
        24: _4211 <= imem_24;
        25: _4211 <= imem_25;
        26: _4211 <= imem_26;
        27: _4211 <= imem_27;
        28: _4211 <= imem_28;
        29: _4211 <= imem_29;
        30: _4211 <= imem_30;
        31: _4211 <= imem_31;
        32: _4211 <= imem_32;
        33: _4211 <= imem_33;
        34: _4211 <= imem_34;
        35: _4211 <= imem_35;
        36: _4211 <= imem_36;
        37: _4211 <= imem_37;
        38: _4211 <= imem_38;
        39: _4211 <= imem_39;
        40: _4211 <= imem_40;
        41: _4211 <= imem_41;
        42: _4211 <= imem_42;
        43: _4211 <= imem_43;
        44: _4211 <= imem_44;
        45: _4211 <= imem_45;
        46: _4211 <= imem_46;
        47: _4211 <= imem_47;
        48: _4211 <= imem_48;
        49: _4211 <= imem_49;
        50: _4211 <= imem_50;
        51: _4211 <= imem_51;
        52: _4211 <= imem_52;
        53: _4211 <= imem_53;
        54: _4211 <= imem_54;
        55: _4211 <= imem_55;
        56: _4211 <= imem_56;
        57: _4211 <= imem_57;
        58: _4211 <= imem_58;
        59: _4211 <= imem_59;
        60: _4211 <= imem_60;
        61: _4211 <= imem_61;
        62: _4211 <= imem_62;
        default: _4211 <= imem_63;
        endcase
    end
    assign _119 = _4211;
    assign _3836 = ~ _2148;
    assign _3274 = _197 == _3273;
    assign _3275 = spi_wr & _3274;
    assign _3270 = spi_wdata[13:0];
    always @(posedge _151) begin
        if (_164)
            _3276 <= _3272;
        else
            if (_3275)
                _3276 <= _3270;
    end
    assign _4017 = _3276[5:0];
    assign _4015 = seq_a_ir_pc + _4014;
    assign _4010 = pins_sync[7:7];
    assign _4009 = pins_sync[6:6];
    assign _4008 = pins_sync[5:5];
    assign _4007 = pins_sync[4:4];
    assign _4006 = pins_sync[3:3];
    assign _4005 = pins_sync[2:2];
    assign _4004 = pins_sync[1:1];
    assign _4003 = pins_sync[0:0];
    always @* begin
        case (_3683)
        0: _4011 <= _4003;
        1: _4011 <= _4004;
        2: _4011 <= _4005;
        3: _4011 <= _4006;
        4: _4011 <= _4007;
        5: _4011 <= _4008;
        6: _4011 <= _4009;
        default: _4011 <= _4010;
        endcase
    end
    assign _4000 = _2153 == _3999;
    assign _4001 = _2152 & _4000;
    assign _4002 = _4001 & seq_a_caught_up;
    assign _4012 = _4002 & _4011;
    assign _4212 = ~ _3802;
    assign _4213 = _3785 ? _4212 : seq_a_flag;
    assign _4214 = _3837 ? _4213 : seq_a_flag;
    assign _4215 = _205 ? gnd : _4214;
    assign _120 = _4215;
    always @(posedge _151) begin
        if (_164)
            seq_a_flag <= _3995;
        else
            seq_a_flag <= _120;
    end
    assign _3992 = _2153 == _3991;
    assign _3993 = _2152 & _3992;
    assign _3997 = _3993 & seq_a_flag;
    assign _3986 = seq_a_y == _3985;
    assign _3987 = ~ _3986;
    assign _3984 = _2153 == _3983;
    assign _3988 = _3984 & _3987;
    assign _3979 = seq_a_x == _3978;
    assign _3980 = ~ _3979;
    assign _3977 = _2153 == _3976;
    assign _3981 = _3977 & _3980;
    assign _3975 = _2153 == _3974;
    assign _3982 = _3975 | _3981;
    assign _3989 = _3982 | _3988;
    assign _3990 = _2152 & _3989;
    assign _3998 = _3990 | _3997;
    assign _4013 = _3998 | _4012;
    assign _4016 = _4013 ? _2157 : _4015;
    assign _4216 = _3837 ? _4016 : seq_a_ir_pc;
    assign _4217 = _205 ? _4017 : _4216;
    assign _121 = _4217;
    always @(posedge _151) begin
        if (_164)
            seq_a_ir_pc <= _2159;
        else
            seq_a_ir_pc <= _121;
    end
    assign _2157 = seq_a_ir[5:0];
    assign _2161 = _2157 == seq_a_ir_pc;
    assign _2155 = _2153 == _2154;
    assign _2156 = _2152 & _2155;
    assign _2162 = _2156 & _2161;
    assign _3834 = ~ _2162;
    assign _3829 = ~ seq_a_caught_up;
    assign _3827 = _2153 == _3826;
    assign _3828 = _2152 & _3827;
    assign _3830 = _3828 & _3829;
    assign _4243 = seq_a_y[7:0];
    assign _4244 = { _3866, _4243 };
    assign _4241 = { _4240, _3866 };
    assign _4238 = seq_a_y - _4237;
    assign _4234 = seq_a_y == _4233;
    assign _4235 = ~ _4234;
    assign _4231 = _2153 == _4230;
    assign _4232 = _2152 & _4231;
    assign _4236 = _4232 & _4235;
    assign _4239 = _4236 ? _4238 : seq_a_y;
    assign _4228 = _3862 == _4227;
    assign _4225 = _2149 == _4224;
    assign _4226 = _2146 & _4225;
    assign _4229 = _4226 & _4228;
    assign _4242 = _4229 ? _4241 : _4239;
    assign _4222 = _3862 == _4221;
    assign _4219 = _2149 == _4218;
    assign _4220 = _2146 & _4219;
    assign _4223 = _4220 & _4222;
    assign _4245 = _4223 ? _4244 : _4242;
    assign _4246 = _3837 ? _4245 : seq_a_y;
    assign _4248 = _205 ? _4247 : _4246;
    assign _122 = _4248;
    always @(posedge _151) begin
        if (_164)
            seq_a_y <= _3815;
        else
            seq_a_y <= _122;
    end
    assign _4274 = seq_a_x[7:0];
    assign _4275 = { _3866, _4274 };
    assign _4272 = { _4271, _3866 };
    assign _4269 = seq_a_x - _4268;
    assign _4265 = seq_a_x == _4264;
    assign _4266 = ~ _4265;
    assign _2153 = seq_a_ir[11:8];
    assign _4262 = _2153 == _4261;
    assign _2151 = _2149 == _2150;
    assign _2152 = _2146 & _2151;
    assign _4263 = _2152 & _4262;
    assign _4267 = _4263 & _4266;
    assign _4270 = _4267 ? _4269 : seq_a_x;
    assign _4259 = _3862 == _4258;
    assign _4256 = _2149 == _4255;
    assign _4257 = _2146 & _4256;
    assign _4260 = _4257 & _4259;
    assign _4273 = _4260 ? _4272 : _4270;
    assign _4253 = _3862 == _4252;
    assign _4250 = _2149 == _4249;
    assign _4251 = _2146 & _4250;
    assign _4254 = _4251 & _4253;
    assign _4276 = _4254 ? _4275 : _4273;
    assign _4277 = _3837 ? _4276 : seq_a_x;
    assign _4279 = _205 ? _4278 : _4277;
    assign _123 = _4279;
    always @(posedge _151) begin
        if (_164)
            seq_a_x <= _3812;
        else
            seq_a_x <= _123;
    end
    always @* begin
        case (_3803)
        0: _3818 <= _3810;
        1: _3818 <= seq_a_x;
        2: _3818 <= seq_a_y;
        default: _3818 <= _3817;
        endcase
    end
    assign _4286 = seq_a_wait_count + _4285;
    assign _4282 = ~ _3822;
    assign _4280 = seq_a_running & _3785;
    assign _4281 = _4280 & seq_a_caught_up;
    assign _4283 = _4281 & _4282;
    assign _4287 = _4283 ? _4286 : _4284;
    assign _4289 = _205 ? _4288 : _4287;
    assign _124 = _4289;
    always @(posedge _151) begin
        if (_164)
            seq_a_wait_count <= _3808;
        else
            seq_a_wait_count <= _124;
    end
    assign _3819 = seq_a_wait_count == _3818;
    assign _3803 = seq_a_ir[7:6];
    assign _3805 = _3803 == _3804;
    assign _3806 = ~ _3805;
    assign _3820 = _3806 & _3819;
    assign _3801 = seq_a_ir[8:8];
    assign _3799 = pins_sync[7:7];
    assign _3798 = pins_sync[6:6];
    assign _3797 = pins_sync[5:5];
    assign _3796 = pins_sync[4:4];
    assign _3795 = pins_sync[3:3];
    assign _3794 = pins_sync[2:2];
    assign _3793 = pins_sync[1:1];
    assign _126 = uio_in;
    always @(posedge _151) begin
        pins_sync1 <= _126;
    end
    always @(posedge _151) begin
        pins_sync <= pins_sync1;
    end
    assign _3792 = pins_sync[0:0];
    assign _3682 = _3678[11:9];
    assign _3680 = _3678[5:3];
    assign _3679 = _3678[2:0];
    assign _3683 = _3678[8:6];
    assign _3789 = seq_a_ir[11:9];
    assign _3790 = _3789[1:0];
    always @* begin
        case (_3790)
        0: _3791 <= _3683;
        1: _3791 <= _3679;
        2: _3791 <= _3680;
        default: _3791 <= _3682;
        endcase
    end
    always @* begin
        case (_3791)
        0: _3800 <= _3792;
        1: _3800 <= _3793;
        2: _3800 <= _3794;
        3: _3800 <= _3795;
        4: _3800 <= _3796;
        5: _3800 <= _3797;
        6: _3800 <= _3798;
        default: _3800 <= _3799;
        endcase
    end
    assign _3802 = _3800 == _3801;
    assign _3821 = _3802 | _3820;
    assign _4342 = _4339 == _4341;
    assign _4338 = timebase + _4337;
    assign _4339 = _4336 - _4338;
    assign _4340 = _4339[23:23];
    assign _4343 = _4340 | _4342;
    assign _4321 = _4318 == _4320;
    assign _4317 = timebase + _4316;
    assign _4318 = _4315 - _4317;
    assign _4319 = _4318[23:23];
    assign _4322 = _4319 | _4321;
    assign _4344 = _4290 ? _4343 : _4322;
    assign _4345 = _4292 ? _4344 : vdd;
    assign _4300 = _4297 == _4299;
    assign _4296 = timebase + _4295;
    assign _4297 = seq_a_sched_s - _4296;
    assign _4298 = _4297[23:23];
    assign _4301 = _4298 | _4300;
    assign _4293 = _3837 & _3785;
    assign _4291 = _3837 & _3762;
    assign _4290 = _3837 & _2193;
    assign _4292 = _4290 | _4291;
    assign _4294 = _4292 | _4293;
    assign _4346 = _4294 ? _4345 : _4301;
    assign _4347 = _205 ? gnd : _4346;
    assign _127 = _4347;
    always @(posedge _151) begin
        if (_164)
            seq_a_caught_up <= _3787;
        else
            seq_a_caught_up <= _127;
    end
    assign _3822 = seq_a_caught_up & _3821;
    assign _3823 = ~ _3822;
    assign _3824 = _3785 & _3823;
    assign _3913 = _3912 < _3777;
    assign _128 = _3779;
    assign _3914 = _128 & _3913;
    assign _4352 = { _4351, _3914 };
    assign _3876 = _3777 < _3875;
    assign _3873 = _197 == _3872;
    assign _3874 = spi_wr & _3873;
    assign _3877 = _3874 & _3876;
    assign _4349 = { _4348, _3877 };
    assign _4350 = _3777 + _4349;
    assign _4353 = _4350 - _4352;
    assign _129 = _4353;
    always @(posedge _151) begin
        if (_164)
            _3777 <= _3776;
        else
            _3777 <= _129;
    end
    assign _3778 = _3774 < _3777;
    assign _3773 = seq_a_running & _3772;
    assign _3779 = _3773 & _3778;
    assign _3780 = ~ _3779;
    assign _3769 = seq_a_ir[11:11];
    assign _3771 = _3769 == _3770;
    assign _3767 = _2149 == _3766;
    assign _3768 = _2146 & _3767;
    assign _3772 = _3768 & _3771;
    assign _3781 = _3772 & _3780;
    assign _4378 = _4374[21:21];
    assign _4377 = _4374[22:22];
    assign _4379 = _4377 | _4378;
    assign _4372 = timebase + _4371;
    assign _4355 = timebase + _4354;
    assign _130 = _4355;
    always @(posedge _151) begin
        if (_164)
            timebase <= _228;
        else
            timebase <= _130;
    end
    assign _4311 = _4304[17:0];
    assign _4313 = { _4311, _4312 };
    assign _4308 = _4304[19:0];
    assign _4310 = { _4308, _4309 };
    assign _4305 = _4304[21:0];
    assign _4307 = { _4305, _4306 };
    assign _4303 = seq_a_ir[11:0];
    assign _4304 = { _4302, _4303 };
    always @* begin
        case (seq_a_prescale)
        0: _4314 <= _4304;
        1: _4314 <= _4307;
        2: _4314 <= _4310;
        default: _4314 <= _4313;
        endcase
    end
    assign _4315 = seq_a_sched_s + _4314;
    assign _4332 = _4325[17:0];
    assign _4334 = { _4332, _4333 };
    assign _4329 = _4325[19:0];
    assign _4331 = { _4329, _4330 };
    assign _4326 = _4325[21:0];
    assign _4328 = { _4326, _4327 };
    assign _4324 = seq_a_ir[11:6];
    assign _4325 = { _4323, _4324 };
    assign _3866 = seq_a_ir[7:0];
    assign _4362 = _3866[1:0];
    assign _3862 = seq_a_ir[11:8];
    assign _4360 = _3862 == _4359;
    assign _4357 = _2149 == _4356;
    assign _4358 = _2146 & _4357;
    assign _4361 = _4358 & _4360;
    assign _4363 = _4361 ? _4362 : seq_a_prescale;
    assign _4364 = _3837 ? _4363 : seq_a_prescale;
    assign _4366 = _205 ? _4365 : _4364;
    assign _131 = _4366;
    always @(posedge _151) begin
        if (_164)
            seq_a_prescale <= _2204;
        else
            seq_a_prescale <= _131;
    end
    always @* begin
        case (seq_a_prescale)
        0: _4335 <= _4325;
        1: _4335 <= _4328;
        2: _4335 <= _4331;
        default: _4335 <= _4334;
        endcase
    end
    assign _4336 = seq_a_sched_s + _4335;
    assign _4367 = _2193 ? _4336 : seq_a_sched_s;
    assign _4368 = _3762 ? _4315 : _4367;
    assign _3784 = _2149 == _3783;
    assign _3785 = _2146 & _3784;
    assign _4369 = _3785 ? timebase : _4368;
    assign _4370 = _3837 ? _4369 : seq_a_sched_s;
    assign _4373 = _205 ? _4372 : _4370;
    assign _132 = _4373;
    always @(posedge _151) begin
        if (_164)
            seq_a_sched_s <= _2201;
        else
            seq_a_sched_s <= _132;
    end
    assign _4374 = seq_a_sched_s - timebase;
    assign _4375 = _4374[23:23];
    assign _4376 = ~ _4375;
    assign _4380 = _4376 & _4379;
    assign _4381 = _205 ? gnd : _4380;
    assign _133 = _4381;
    always @(posedge _151) begin
        if (_164)
            seq_a_far <= _2190;
        else
            seq_a_far <= _133;
    end
    assign _3761 = ~ seq_a_far;
    assign _3758 = _2149 == _3757;
    assign _3759 = _2146 & _3758;
    assign _3760 = seq_a_running & _3759;
    assign _3762 = _3760 & _3761;
    assign _3763 = ~ _3762;
    assign _3755 = _2149 == _3754;
    assign _3756 = _2146 & _3755;
    assign _3764 = _3756 & _3763;
    assign _3752 = ~ _2193;
    assign _2149 = seq_a_ir[15:12];
    assign _3750 = _2149 == _3749;
    assign _3751 = _2146 & _3750;
    assign _3753 = _3751 & _3752;
    assign _3765 = _3753 | _3764;
    assign _3782 = _3765 | _3781;
    assign _3825 = _3782 | _3824;
    assign _3831 = _3825 | _3830;
    assign _3832 = ~ _3831;
    assign _3833 = seq_a_running & _3832;
    assign _3835 = _3833 & _3834;
    assign _3837 = _3835 & _3836;
    assign _4382 = _3837 ? _119 : seq_a_ir;
    assign _4383 = _205 ? _119 : _4382;
    assign _134 = _4383;
    always @(posedge _151) begin
        if (_164)
            seq_a_ir <= _1974;
        else
            seq_a_ir <= _134;
    end
    assign _1976 = seq_a_ir[15:12];
    assign _1978 = _1976 == _1977;
    assign _1983 = _1978 & _1982;
    assign _2019 = _1983 | _2018;
    assign _2023 = _2019 | _2022;
    assign _2060 = _2023 | _2059;
    assign _2089 = _2060 | _2088;
    assign _2129 = _2089 | _2128;
    assign _2146 = _2129 | _2145;
    assign _2147 = ~ _2146;
    assign _2148 = seq_a_running & _2147;
    assign _4385 = _2148 ? gnd : _4384;
    assign _4386 = _205 ? vdd : _4385;
    assign _135 = _4386;
    always @(posedge _151) begin
        if (_164)
            seq_a_running <= _1971;
        else
            seq_a_running <= _135;
    end
    assign _2187 = seq_a_running & _2186;
    assign _2188 = _2187 & _118;
    assign _2193 = _2188 & _2192;
    assign _2196 = _2193 & _2195;
    assign _4388 = { _4387, _2196 };
    assign _4389 = queue_a_count + _4388;
    assign _4390 = _4389 - _3971;
    assign _136 = _4390;
    always @(posedge _151) begin
        if (_206)
            queue_a_count <= _207;
        else
            queue_a_count <= _136;
    end
    assign _209 = _189 < queue_a_count;
    assign _237 = _209 & _236;
    assign _4398 = _237 & _4397;
    assign _4403 = _4398 & _4402;
    assign _4405 = _4403 & _4404;
    assign _4417 = _4405 | _4416;
    assign _4429 = _4417 | _4428;
    assign _4441 = _4429 | _4440;
    assign _4442 = _4394 | _4441;
    assign _277 = spi_wdata[3:3];
    assign _278 = _200 & _277;
    assign _204 = spi_wdata[0:0];
    assign _205 = _200 & _204;
    assign _4391 = _205 | _278;
    assign _4443 = _4391 ? gnd : _4442;
    assign _137 = _4443;
    always @(posedge _151) begin
        if (_164)
            _4394 <= _4393;
        else
            _4394 <= _137;
    end
    assign _4488 = spi_bitcnt == _4487;
    assign _4489 = ~ _4488;
    assign _4484 = spi_bitcnt == _4483;
    assign _4485 = ~ _4484;
    always @(posedge _151) begin
        if (_164)
            _4480 <= _4479;
        else
            _4480 <= _4467;
    end
    assign _4481 = ~ _4480;
    assign _4482 = _4467 & _4481;
    assign _4486 = _4482 & _4485;
    assign _4490 = _4486 & _4489;
    assign _4474 = spi_bitcnt < _4473;
    assign _4475 = ~ _4474;
    assign _4476 = _4469 & _4475;
    assign _4477 = _4448 | _4476;
    assign _4491 = _4477 | _4490;
    assign _4444 = spi_wdata[4:4];
    assign _199 = _197 == _198;
    assign _200 = spi_wr & _199;
    assign _4445 = _200 & _4444;
    assign _138 = _4445;
    assign _4492 = _138 ? gnd : _4491;
    assign _139 = _4492;
    always @(posedge _151) begin
        if (_164)
            _4448 <= _4447;
        else
            _4448 <= _139;
    end
    assign _4594 = { gnd, _4448, _4394, _4590, _4591, _4592, _2277, _4593, _3777, seq_a_trapped, queue_a_count, _2259, _2250, _2172, seq_a_halted };
    assign _3188 = _197 == _3187;
    assign _3189 = spi_wr & _3188;
    assign _3184 = spi_wdata[23:0];
    always @(posedge _151) begin
        if (_164)
            _3190 <= _3186;
        else
            if (_3189)
                _3190 <= _3184;
    end
    assign _4583 = { _4582, _3190 };
    assign _3676 = _197 == _3675;
    assign _4497 = _4496 ? vdd : gnd;
    assign _4498 = _4469 ? _4497 : gnd;
    assign _4499 = _4467 ? gnd : _4498;
    assign _140 = _4499;
    always @(posedge _151) begin
        if (_164)
            spi_wr <= _192;
        else
            spi_wr <= _140;
    end
    assign _3677 = spi_wr & _3676;
    assign _4494 = spi_bitcnt == _4493;
    assign _4496 = _4494 & _4495;
    assign _4512 = _4496 ? _4511 : spi_wdata;
    assign _4513 = _4469 ? _4512 : spi_wdata;
    assign _4514 = _4467 ? spi_wdata : _4513;
    assign _141 = _4514;
    always @(posedge _151) begin
        if (_164)
            spi_wdata <= _202;
        else
            spi_wdata <= _141;
    end
    assign _3672 = spi_wdata[11:0];
    always @(posedge _151) begin
        if (_164)
            _3678 <= _3674;
        else
            if (_3677)
                _3678 <= _3672;
    end
    assign _4581 = { _4580, _3678 };
    assign _197 = spi_cmd[6:0];
    always @* begin
        case (_197)
        0: _4662 <= _4515;
        1: _4662 <= _4516;
        2: _4662 <= _4517;
        3: _4662 <= _4518;
        4: _4662 <= _4519;
        5: _4662 <= _4520;
        6: _4662 <= _4521;
        7: _4662 <= _4522;
        8: _4662 <= _4523;
        9: _4662 <= _4524;
        10: _4662 <= _4525;
        11: _4662 <= _4526;
        12: _4662 <= _4527;
        13: _4662 <= _4528;
        14: _4662 <= _4529;
        15: _4662 <= _4530;
        16: _4662 <= _4531;
        17: _4662 <= _4532;
        18: _4662 <= _4533;
        19: _4662 <= _4534;
        20: _4662 <= _4535;
        21: _4662 <= _4536;
        22: _4662 <= _4537;
        23: _4662 <= _4538;
        24: _4662 <= _4539;
        25: _4662 <= _4540;
        26: _4662 <= _4541;
        27: _4662 <= _4542;
        28: _4662 <= _4543;
        29: _4662 <= _4544;
        30: _4662 <= _4545;
        31: _4662 <= _4546;
        32: _4662 <= _4547;
        33: _4662 <= _4548;
        34: _4662 <= _4549;
        35: _4662 <= _4550;
        36: _4662 <= _4551;
        37: _4662 <= _4552;
        38: _4662 <= _4553;
        39: _4662 <= _4554;
        40: _4662 <= _4555;
        41: _4662 <= _4556;
        42: _4662 <= _4557;
        43: _4662 <= _4558;
        44: _4662 <= _4559;
        45: _4662 <= _4560;
        46: _4662 <= _4561;
        47: _4662 <= _4562;
        48: _4662 <= _4563;
        49: _4662 <= _4564;
        50: _4662 <= _4565;
        51: _4662 <= _4566;
        52: _4662 <= _4567;
        53: _4662 <= _4568;
        54: _4662 <= _4569;
        55: _4662 <= _4570;
        56: _4662 <= _4571;
        57: _4662 <= _4572;
        58: _4662 <= _4573;
        59: _4662 <= _4574;
        60: _4662 <= _4575;
        61: _4662 <= _4576;
        62: _4662 <= _4577;
        63: _4662 <= _4578;
        64: _4662 <= _4579;
        65: _4662 <= _4581;
        66: _4662 <= _4583;
        67: _4662 <= _4584;
        68: _4662 <= _4594;
        69: _4662 <= _1945;
        70: _4662 <= _4603;
        71: _4662 <= _4605;
        72: _4662 <= _1100;
        73: _4662 <= _1194;
        74: _4662 <= _1089;
        75: _4662 <= _1311;
        76: _4662 <= _1387;
        77: _4662 <= _1300;
        78: _4662 <= _1504;
        79: _4662 <= _1580;
        80: _4662 <= _1493;
        81: _4662 <= _1697;
        82: _4662 <= _1773;
        83: _4662 <= _1686;
        84: _4662 <= _4606;
        85: _4662 <= _4607;
        86: _4662 <= _4608;
        87: _4662 <= _4609;
        88: _4662 <= _4610;
        89: _4662 <= _4611;
        90: _4662 <= _4612;
        91: _4662 <= _4613;
        92: _4662 <= _4614;
        93: _4662 <= _4615;
        94: _4662 <= _4616;
        95: _4662 <= _4617;
        96: _4662 <= _4621;
        97: _4662 <= _4623;
        98: _4662 <= _4625;
        99: _4662 <= _4626;
        100: _4662 <= _4628;
        101: _4662 <= _4632;
        102: _4662 <= _4633;
        103: _4662 <= _730;
        104: _4662 <= _4637;
        105: _4662 <= _4639;
        106: _4662 <= _4640;
        107: _4662 <= _4641;
        108: _4662 <= _4642;
        109: _4662 <= _4643;
        110: _4662 <= _4644;
        111: _4662 <= _4645;
        112: _4662 <= _4646;
        113: _4662 <= _4647;
        114: _4662 <= _4648;
        115: _4662 <= _4649;
        116: _4662 <= _4650;
        117: _4662 <= _4651;
        118: _4662 <= _4652;
        119: _4662 <= _4653;
        120: _4662 <= _4654;
        121: _4662 <= _4655;
        122: _4662 <= _4656;
        123: _4662 <= _4657;
        124: _4662 <= _4658;
        125: _4662 <= _4659;
        126: _4662 <= _4660;
        default: _4662 <= _4661;
        endcase
    end
    assign _142 = _4662;
    assign _4681 = ~ _4495;
    assign _4665 = _4664 ? vdd : gnd;
    assign _4666 = _4469 ? _4665 : gnd;
    assign _4667 = _4467 ? gnd : _4666;
    assign _143 = _4667;
    always @(posedge _151) begin
        if (_164)
            spi_load <= _4679;
        else
            spi_load <= _143;
    end
    assign _4682 = spi_load & _4681;
    assign _4686 = _4682 ? _142 : spi_out;
    assign _4690 = _4677 ? _4689 : _4686;
    assign _4691 = _4467 ? spi_out : _4690;
    assign _144 = _4691;
    always @(posedge _151) begin
        if (_164)
            spi_out <= _4684;
        else
            spi_out <= _144;
    end
    assign _4710 = spi_out[31:31];
    assign _4504 = _153[2:2];
    always @(posedge _151) begin
        _4507 <= _4504;
    end
    always @(posedge _151) begin
        _4510 <= _4507;
    end
    assign _4692 = _4469 ? _4511 : spi_shift_in;
    assign _4693 = _4467 ? spi_shift_in : _4692;
    assign _145 = _4693;
    always @(posedge _151) begin
        if (_164)
            spi_shift_in <= _4501;
        else
            spi_shift_in <= _145;
    end
    assign _4503 = spi_shift_in[30:0];
    assign _4511 = { _4503, _4510 };
    assign _4694 = _4511[7:0];
    assign _4664 = spi_bitcnt == _4663;
    assign _4695 = _4664 ? _4694 : spi_cmd;
    assign _4696 = _4469 ? _4695 : spi_cmd;
    assign _4697 = _4467 ? spi_cmd : _4696;
    assign _146 = _4697;
    always @(posedge _151) begin
        if (_164)
            spi_cmd <= _195;
        else
            spi_cmd <= _146;
    end
    assign _4495 = spi_cmd[7:7];
    assign _4676 = ~ _4495;
    assign _4702 = spi_bitcnt + _4701;
    assign _4699 = spi_bitcnt == _4698;
    assign _4700 = ~ _4699;
    assign _4703 = _4700 ? _4702 : spi_bitcnt;
    assign _4468 = ~ _4467;
    assign _4459 = ~ _4458;
    assign _4460 = _4455 & _4459;
    assign _4469 = _4460 & _4468;
    assign _4704 = _4469 ? _4703 : spi_bitcnt;
    assign _4706 = _4467 ? _4705 : _4704;
    assign _147 = _4706;
    always @(posedge _151) begin
        if (_164)
            spi_bitcnt <= _4471;
        else
            spi_bitcnt <= _147;
    end
    assign _4673 = spi_bitcnt < _4672;
    assign _4674 = ~ _4673;
    assign _4670 = ~ _4467;
    assign _149 = rst_n;
    always @(posedge _151) begin
        _160 <= _149;
    end
    always @(posedge _151) begin
        _163 <= _160;
    end
    assign _164 = ~ _163;
    always @(posedge _151) begin
        if (_164)
            _4458 <= _4457;
        else
            _4458 <= _4455;
    end
    assign _4449 = _153[0:0];
    always @(posedge _151) begin
        _4452 <= _4449;
    end
    always @(posedge _151) begin
        _4455 <= _4452;
    end
    assign _4668 = ~ _4455;
    assign _4669 = _4668 & _4458;
    assign _4671 = _4669 & _4670;
    assign _4675 = _4671 & _4674;
    assign _4677 = _4675 & _4676;
    assign _4711 = _4677 ? _4710 : spi_miso;
    assign _151 = clk;
    assign _153 = ui_in;
    assign _4461 = _153[1:1];
    always @(posedge _151) begin
        _4464 <= _4461;
    end
    always @(posedge _151) begin
        _4467 <= _4464;
    end
    assign _4712 = _4467 ? spi_miso : _4711;
    assign _154 = _4712;
    always @(posedge _151) begin
        if (_164)
            spi_miso <= _4708;
        else
            spi_miso <= _154;
    end
    assign _4723 = { spi_miso, _4722 };

    /* aliases */

    /* output assignments */
    assign uo_out = _4723;
    assign uio_out = _717;
    assign uio_oe = _188;

endmodule
