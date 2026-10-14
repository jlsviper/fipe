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
    wire _352 = 1'b0;
    wire _351 = 1'b0;
    wire [1:0] _363 = 2'b01;
    wire _364;
    wire [1:0] _360 = 2'b01;
    wire _361;
    wire [1:0] _357 = 2'b01;
    wire _358;
    wire [1:0] _354 = 2'b01;
    wire _355;
    wire _350;
    wire _356;
    wire _339;
    wire _359;
    wire _277;
    wire _362;
    wire _266;
    wire _365;
    wire _2;
    reg pin0_out;
    wire _403 = 1'b0;
    wire _402 = 1'b0;
    wire [1:0] _414 = 2'b01;
    wire _415;
    wire [1:0] _411 = 2'b01;
    wire _412;
    wire [1:0] _408 = 2'b01;
    wire _409;
    wire [1:0] _405 = 2'b01;
    wire _406;
    wire _401;
    wire _407;
    wire _392;
    wire _410;
    wire _383;
    wire _413;
    wire _374;
    wire _416;
    wire _3;
    reg pin1_out;
    wire _454 = 1'b0;
    wire _453 = 1'b0;
    wire [1:0] _465 = 2'b01;
    wire _466;
    wire [1:0] _462 = 2'b01;
    wire _463;
    wire [1:0] _459 = 2'b01;
    wire _460;
    wire [1:0] _456 = 2'b01;
    wire _457;
    wire _452;
    wire _458;
    wire _443;
    wire _461;
    wire _434;
    wire _464;
    wire _425;
    wire _467;
    wire _4;
    reg pin2_out;
    wire _505 = 1'b0;
    wire _504 = 1'b0;
    wire [1:0] _516 = 2'b01;
    wire _517;
    wire [1:0] _513 = 2'b01;
    wire _514;
    wire [1:0] _510 = 2'b01;
    wire _511;
    wire [1:0] _507 = 2'b01;
    wire _508;
    wire _503;
    wire _509;
    wire _494;
    wire _512;
    wire _485;
    wire _515;
    wire _476;
    wire _518;
    wire _5;
    reg pin3_out;
    wire _556 = 1'b0;
    wire _555 = 1'b0;
    wire [1:0] _567 = 2'b01;
    wire _568;
    wire [1:0] _564 = 2'b01;
    wire _565;
    wire [1:0] _561 = 2'b01;
    wire _562;
    wire [1:0] _558 = 2'b01;
    wire _559;
    wire _554;
    wire _560;
    wire _545;
    wire _563;
    wire _536;
    wire _566;
    wire _527;
    wire _569;
    wire _6;
    reg pin4_out;
    wire _607 = 1'b0;
    wire _606 = 1'b0;
    wire [1:0] _618 = 2'b01;
    wire _619;
    wire [1:0] _615 = 2'b01;
    wire _616;
    wire [1:0] _612 = 2'b01;
    wire _613;
    wire [1:0] _609 = 2'b01;
    wire _610;
    wire _605;
    wire _611;
    wire _596;
    wire _614;
    wire _587;
    wire _617;
    wire _578;
    wire _620;
    wire _7;
    reg pin5_out;
    wire _658 = 1'b0;
    wire _657 = 1'b0;
    wire [1:0] _669 = 2'b01;
    wire _670;
    wire [1:0] _666 = 2'b01;
    wire _667;
    wire [1:0] _663 = 2'b01;
    wire _664;
    wire [1:0] _660 = 2'b01;
    wire _661;
    wire _656;
    wire _662;
    wire _647;
    wire _665;
    wire _638;
    wire _668;
    wire _629;
    wire _671;
    wire _8;
    reg pin6_out;
    wire _709 = 1'b0;
    wire _708 = 1'b0;
    wire [1:0] _720 = 2'b01;
    wire _721;
    wire [1:0] _717 = 2'b01;
    wire _718;
    wire [1:0] _714 = 2'b01;
    wire _715;
    wire [1:0] _711 = 2'b01;
    wire _712;
    wire _707;
    wire _713;
    wire _698;
    wire _716;
    wire _689;
    wire _719;
    wire _680;
    wire _722;
    wire _9;
    reg pin7_out;
    wire [7:0] _723;
    wire [6:0] _4736 = 7'b0000000;
    wire [6:0] _4735 = 7'b0000000;
    wire [3:0] _4731 = 4'b0000;
    wire _4732;
    wire _4733;
    wire _4728;
    wire _4729;
    wire _4730;
    wire [6:0] _4734;
    reg [6:0] _4737;
    wire _4723 = 1'b0;
    wire _4722 = 1'b0;
    wire [31:0] _4699 = 32'b00000000000000000000000000000000;
    wire [31:0] _4698 = 32'b00000000000000000000000000000000;
    wire _4703 = 1'b0;
    wire [30:0] _4702;
    wire [31:0] _4704;
    wire [31:0] _4676 = 32'b01000110010010010101000001000101;
    wire [31:0] _4675 = 32'b00000000000000000000000000000000;
    wire [31:0] _4674 = 32'b00000000000000000000000000000000;
    wire [31:0] _4673 = 32'b00000000000000000000000000000000;
    wire [31:0] _4672 = 32'b00000000000000000000000000000000;
    wire [31:0] _4671 = 32'b00000000000000000000000000000000;
    wire [31:0] _4670 = 32'b00000000000000000000000000000000;
    wire [31:0] _4669 = 32'b00000000000000000000000000000000;
    wire [31:0] _4668 = 32'b00000000000000000000000000000000;
    wire [31:0] _4667 = 32'b00000000000000000000000000000000;
    wire [31:0] _4666 = 32'b00000000000000000000000000000000;
    wire [31:0] _4665 = 32'b00000000000000000000000000000000;
    wire [31:0] _4664 = 32'b00000000000000000000000000000000;
    wire [31:0] _4663 = 32'b00000000000000000000000000000000;
    wire [31:0] _4662 = 32'b00000000000000000000000000000000;
    wire [31:0] _4661 = 32'b00000000000000000000000000000000;
    wire [31:0] _4660 = 32'b00000000000000000000000000000000;
    wire [31:0] _4659 = 32'b00000000000000000000000000000000;
    wire [31:0] _4658 = 32'b00000000000000000000000000000000;
    wire [31:0] _4657 = 32'b00000000000000000000000000000000;
    wire [31:0] _4656 = 32'b00000000000000000000000000000000;
    wire [31:0] _4655;
    wire [7:0] _4653 = 8'b00000000;
    wire [31:0] _4654;
    wire [2:0] _4650 = 3'b000;
    wire [14:0] _4651;
    wire [16:0] _4649 = 17'b00000000000000000;
    wire [31:0] _4652;
    wire [31:0] _738 = 32'b00000000000000000000000000000000;
    wire [31:0] _737 = 32'b00000000000000000000000000000000;
    wire [31:0] _768 = 32'b00000000000000000000000000000000;
    wire _763;
    wire _762;
    wire _761;
    wire _760;
    wire _759;
    wire _758;
    wire _757;
    wire _756;
    reg _764;
    wire _754;
    wire _753;
    wire _752;
    wire _751;
    wire _750;
    wire _749;
    wire _748;
    wire _747;
    reg _755;
    wire _765;
    wire [30:0] _740;
    wire [31:0] _766;
    wire [31:0] _767;
    wire [31:0] _769;
    wire [31:0] _11;
    reg [31:0] _739;
    wire [31:0] _4648 = 32'b00000000000000000000000000000000;
    wire _965 = 1'b0;
    wire _964 = 1'b0;
    wire _967;
    wire _968;
    wire _970;
    wire _12;
    reg seq_b_halted;
    wire _972 = 1'b0;
    wire _971 = 1'b0;
    wire [23:0] _978;
    wire [23:0] _979;
    wire _980;
    wire _981;
    wire [23:0] _974;
    wire [23:0] _975;
    wire _976;
    wire _977;
    wire _982;
    wire _983;
    wire _984;
    wire _13;
    reg _973;
    wire _1050 = 1'b0;
    wire _1049 = 1'b0;
    wire [23:0] _999 = 24'b000000000000000000000000;
    wire [23:0] _998 = 24'b000000000000000000000000;
    wire [23:0] _1044;
    wire [23:0] _14;
    reg [23:0] queue_b_last_due;
    wire [23:0] _1053;
    wire _1054;
    wire _1046 = 1'b0;
    wire _1045 = 1'b0;
    wire _1048;
    wire _15;
    reg queue_b_last_valid;
    wire _1052;
    wire _1055;
    wire _1056;
    wire _1057;
    wire _16;
    reg _1051;
    wire _1059 = 1'b0;
    wire _1058 = 1'b0;
    wire [23:0] _1065 = 24'b110000000000000000000000;
    wire _1066;
    wire _1063;
    wire [23:0] _1061;
    wire _1062;
    wire _1064;
    wire _1067;
    wire _1068;
    wire _1069;
    wire _1070;
    wire _17;
    reg _1060;
    wire _1072 = 1'b0;
    wire _1071 = 1'b0;
    wire _1074;
    wire _1075;
    wire _18;
    reg seq_b_trapped;
    wire [4:0] _4646 = 5'b00000;
    wire [5:0] _1077 = 6'b000000;
    wire [5:0] _1076 = 6'b000000;
    wire [5:0] _1086 = 6'b000000;
    wire [5:0] _1083 = 6'b000001;
    wire [5:0] _1084;
    wire [5:0] _1079 = 6'b111111;
    wire _1080;
    wire _1081;
    wire [1:0] _733 = 2'b11;
    wire _734;
    wire _735;
    wire [1:0] _730 = 2'b11;
    wire _731;
    wire _732;
    wire _736;
    wire _1082;
    wire [5:0] _1085;
    wire _729;
    wire [5:0] _1087;
    wire [5:0] _19;
    reg [5:0] _1078;
    wire [6:0] _4645 = 7'b0000000;
    wire [1:0] _4644 = 2'b00;
    wire [31:0] _4647;
    wire [19:0] _4642 = 20'b00000000000000000000;
    wire [31:0] _4643;
    wire [31:0] _4641;
    wire [7:0] _4639 = 8'b00000000;
    wire [31:0] _4640;
    wire [7:0] _4637 = 8'b00000000;
    wire [31:0] _4638;
    wire [2:0] _4634 = 3'b000;
    wire [14:0] _4635;
    wire [16:0] _4633 = 17'b00000000000000000;
    wire [31:0] _4636;
    wire [31:0] _4632 = 32'b00000000000000000000000000000000;
    wire [31:0] _4631 = 32'b00000000000000000000000000000000;
    wire [31:0] _4630 = 32'b00000000000000000000000000000000;
    wire [7:0] _1293 = 8'b00000000;
    wire [7:0] _1292 = 8'b00000000;
    wire [7:0] _1302 = 8'b00000000;
    wire [7:0] _1298 = 8'b00000001;
    wire [7:0] _1299;
    wire [7:0] _1295 = 8'b11111111;
    wire _1296;
    wire _1297;
    wire [7:0] _1300;
    wire [7:0] _1301;
    wire [7:0] _1303;
    wire [7:0] _20;
    reg [7:0] mon0_intervals;
    wire [7:0] _1486 = 8'b00000000;
    wire [7:0] _1485 = 8'b00000000;
    wire [7:0] _1495 = 8'b00000000;
    wire [7:0] _1491 = 8'b00000001;
    wire [7:0] _1492;
    wire [7:0] _1488 = 8'b11111111;
    wire _1489;
    wire _1490;
    wire [7:0] _1493;
    wire [7:0] _1494;
    wire [7:0] _1496;
    wire [7:0] _21;
    reg [7:0] mon1_intervals;
    wire [7:0] _1679 = 8'b00000000;
    wire [7:0] _1678 = 8'b00000000;
    wire [7:0] _1688 = 8'b00000000;
    wire [7:0] _1684 = 8'b00000001;
    wire [7:0] _1685;
    wire [7:0] _1681 = 8'b11111111;
    wire _1682;
    wire _1683;
    wire [7:0] _1686;
    wire [7:0] _1687;
    wire [7:0] _1689;
    wire [7:0] _22;
    reg [7:0] mon2_intervals;
    wire [7:0] _1872 = 8'b00000000;
    wire [7:0] _1871 = 8'b00000000;
    wire [7:0] _1881 = 8'b00000000;
    wire [7:0] _1877 = 8'b00000001;
    wire [7:0] _1878;
    wire [7:0] _1874 = 8'b11111111;
    wire _1875;
    wire _1876;
    wire [7:0] _1879;
    wire [7:0] _1880;
    wire [7:0] _1882;
    wire [7:0] _23;
    reg [7:0] mon3_intervals;
    wire [31:0] _4629;
    wire [15:0] _1884 = 16'b0000000000000000;
    wire [15:0] _1883 = 16'b0000000000000000;
    wire [15:0] _1889 = 16'b1111111111111111;
    wire _1886;
    wire [15:0] _1887;
    wire [15:0] _1888;
    wire [15:0] _1890;
    wire [15:0] _24;
    reg [15:0] mon3_min_seen;
    wire [15:0] _1892 = 16'b0000000000000000;
    wire [15:0] _1891 = 16'b0000000000000000;
    wire [15:0] _1897 = 16'b0000000000000000;
    wire _1894;
    wire [15:0] _1895;
    wire _1870;
    wire [15:0] _1896;
    wire [15:0] _1898;
    wire [15:0] _25;
    reg [15:0] mon3_max_seen;
    wire [31:0] _4628;
    wire [15:0] _1900 = 16'b0000000000000000;
    wire [15:0] _1899 = 16'b0000000000000000;
    wire [15:0] _1905 = 16'b1111111111111111;
    wire _1902;
    wire [15:0] _1903;
    wire [15:0] _1904;
    wire [15:0] _1906;
    wire [15:0] _26;
    reg [15:0] mon2_min_seen;
    wire [15:0] _1908 = 16'b0000000000000000;
    wire [15:0] _1907 = 16'b0000000000000000;
    wire [15:0] _1913 = 16'b0000000000000000;
    wire _1910;
    wire [15:0] _1911;
    wire _1677;
    wire [15:0] _1912;
    wire [15:0] _1914;
    wire [15:0] _27;
    reg [15:0] mon2_max_seen;
    wire [31:0] _4627;
    wire [15:0] _1916 = 16'b0000000000000000;
    wire [15:0] _1915 = 16'b0000000000000000;
    wire [15:0] _1921 = 16'b1111111111111111;
    wire _1918;
    wire [15:0] _1919;
    wire [15:0] _1920;
    wire [15:0] _1922;
    wire [15:0] _28;
    reg [15:0] mon1_min_seen;
    wire [15:0] _1924 = 16'b0000000000000000;
    wire [15:0] _1923 = 16'b0000000000000000;
    wire [15:0] _1929 = 16'b0000000000000000;
    wire _1926;
    wire [15:0] _1927;
    wire _1484;
    wire [15:0] _1928;
    wire [15:0] _1930;
    wire [15:0] _29;
    reg [15:0] mon1_max_seen;
    wire [31:0] _4626;
    wire [15:0] _1932 = 16'b0000000000000000;
    wire [15:0] _1931 = 16'b0000000000000000;
    wire [15:0] _1937 = 16'b1111111111111111;
    wire _1934;
    wire [15:0] _1935;
    wire [15:0] _1936;
    wire [15:0] _1938;
    wire [15:0] _30;
    reg [15:0] mon0_min_seen;
    wire [15:0] _1940 = 16'b0000000000000000;
    wire [15:0] _1939 = 16'b0000000000000000;
    wire [15:0] _1945 = 16'b0000000000000000;
    wire _1942;
    wire [15:0] _1943;
    wire _1291;
    wire [15:0] _1944;
    wire [15:0] _1946;
    wire [15:0] _31;
    reg [15:0] mon0_max_seen;
    wire [31:0] _4625;
    wire [31:0] _4624 = 32'b00000000000000000000000000000000;
    wire [31:0] _4623 = 32'b00000000000000000000000000000000;
    wire [31:0] _4622 = 32'b00000000000000000000000000000000;
    wire [31:0] _4621 = 32'b00000000000000000000000000000000;
    wire [17:0] _4619 = 18'b000000000000000000;
    wire [31:0] _4620;
    wire [4:0] _4616 = 5'b00000;
    wire [4:0] _4615 = 5'b00000;
    wire [4:0] _4613 = 5'b00000;
    wire [4:0] _4612 = 5'b00000;
    wire [4:0] _4611;
    reg [4:0] _4614;
    reg [4:0] _4617;
    wire [26:0] _4610 = 27'b000000000000000000000000000;
    wire [31:0] _4618;
    wire [31:0] _1956 = 32'b00000000000000000000000000000000;
    wire [31:0] _1955 = 32'b00000000000000000000000000000000;
    wire [31:0] _1980 = 32'b00000000000000000000000000000000;
    wire _1975;
    wire _1974;
    wire _1973;
    wire _1972;
    wire _1971;
    wire _1970;
    wire _1969;
    wire _1968;
    reg _1976;
    wire _1966;
    wire _1965;
    wire _1964;
    wire _1963;
    wire _1962;
    wire _1961;
    wire _1960;
    wire _1959;
    reg _1967;
    wire _1977;
    wire [30:0] _1958;
    wire [31:0] _1978;
    wire [31:0] _1979;
    wire [31:0] _1981;
    wire [31:0] _32;
    reg [31:0] _1957;
    wire _2177 = 1'b0;
    wire _2176 = 1'b0;
    wire _2179;
    wire _2180;
    wire _2181;
    wire _33;
    reg seq_a_halted;
    wire _2183 = 1'b0;
    wire _2182 = 1'b0;
    wire [23:0] _2189;
    wire [23:0] _2190;
    wire _2191;
    wire _2192;
    wire [23:0] _2185;
    wire [23:0] _2186;
    wire _2187;
    wire _2188;
    wire _2193;
    wire _2194;
    wire _2195;
    wire _34;
    reg _2184;
    wire _2261 = 1'b0;
    wire _2260 = 1'b0;
    wire [23:0] _2210 = 24'b000000000000000000000000;
    wire [23:0] _2209 = 24'b000000000000000000000000;
    wire [23:0] _2255;
    wire [23:0] _35;
    reg [23:0] queue_a_last_due;
    wire [23:0] _2264;
    wire _2265;
    wire _2257 = 1'b0;
    wire _2256 = 1'b0;
    wire _2259;
    wire _36;
    reg queue_a_last_valid;
    wire _2263;
    wire _2266;
    wire _2267;
    wire _2268;
    wire _37;
    reg _2262;
    wire _2270 = 1'b0;
    wire _2269 = 1'b0;
    wire [23:0] _2276 = 24'b110000000000000000000000;
    wire _2277;
    wire _2274;
    wire [23:0] _2272;
    wire _2273;
    wire _2275;
    wire _2278;
    wire _2279;
    wire _2280;
    wire _2281;
    wire _38;
    reg _2271;
    wire _2283 = 1'b0;
    wire _2282 = 1'b0;
    wire _2285;
    wire _2286;
    wire _39;
    reg seq_a_trapped;
    wire [4:0] _4608 = 5'b00000;
    wire [5:0] _2288 = 6'b000000;
    wire [5:0] _2287 = 6'b000000;
    wire [5:0] _2297 = 6'b000000;
    wire [5:0] _2294 = 6'b000001;
    wire [5:0] _2295;
    wire [5:0] _2290 = 6'b111111;
    wire _2291;
    wire _2292;
    wire [1:0] _1951 = 2'b11;
    wire _1952;
    wire _1953;
    wire [1:0] _1948 = 2'b11;
    wire _1949;
    wire _1950;
    wire _1954;
    wire _2293;
    wire [5:0] _2296;
    wire _727 = 1'b0;
    wire _726 = 1'b0;
    wire _724;
    wire _725;
    reg ctrl_bit2;
    wire _1947;
    wire [5:0] _2298;
    wire [5:0] _40;
    reg [5:0] _2289;
    wire [1:0] _4607 = 2'b00;
    wire _2410 = 1'b0;
    wire _2409 = 1'b0;
    wire _2406;
    wire [15:0] _2403;
    wire _2404;
    wire _2401;
    wire _1192;
    wire _1191;
    wire _1190;
    wire _1189;
    wire _1188;
    wire _1187;
    wire _1186;
    wire _1185;
    reg _1193;
    wire _1194;
    wire _1179;
    wire _1178;
    wire _1177;
    wire _1176;
    wire _1175;
    wire _1174;
    wire _1173;
    wire _1172;
    reg _1180;
    wire _1181;
    wire _1195;
    wire _1164;
    wire _1165;
    wire _1196;
    wire _1160;
    wire _1158;
    wire _1157;
    wire _1156;
    wire _1155;
    wire _1154;
    wire _1153;
    wire _1152;
    wire _1151;
    wire [2:0] _1150;
    reg _1159;
    wire _1161;
    wire _1148;
    wire _1149;
    wire _1162;
    wire _1146;
    wire _1144;
    wire _1145;
    wire _1141;
    wire _1140;
    wire _1139;
    wire _1138;
    wire _1137;
    wire _1136;
    wire _1135;
    wire _1134;
    reg _1142;
    wire _1131;
    wire _1130;
    wire _1129;
    wire _1128;
    wire _1127;
    wire _1126;
    wire _1125;
    wire _1124;
    wire [2:0] _1114;
    reg _1132;
    wire _1133;
    wire _1143;
    wire [1:0] _1113;
    reg _1147;
    wire _1163;
    wire _1197;
    wire _1104 = 1'b0;
    wire _1103 = 1'b0;
    wire _2371;
    wire _1289;
    wire _1214;
    wire [15:0] _1209 = 16'b0000000000000000;
    wire [15:0] _1208 = 16'b0000000000000000;
    wire [15:0] _2396 = 16'b0000000000000001;
    wire [15:0] _2393 = 16'b0000000000000001;
    wire [15:0] _2394;
    wire [15:0] _2389 = 16'b1111111111111111;
    wire _2390;
    wire _2391;
    wire [11:0] _2385 = 12'b111111111111;
    wire _2386;
    wire [7:0] _2383 = 8'b11111111;
    wire [7:0] _2382;
    wire _2384;
    wire [3:0] _2380 = 4'b1111;
    wire [3:0] _2379;
    wire _2381;
    wire [1:0] _2375;
    reg _2387;
    wire _2388;
    wire _2392;
    wire [15:0] _2395;
    wire [15:0] _2397;
    wire [15:0] _2398;
    wire [15:0] _41;
    reg [15:0] mon0_count_cycles;
    wire [6:0] _1203 = 7'b1001001;
    wire _1204;
    wire _1205;
    wire [31:0] _1202 = 32'b00000000000000000000000000000000;
    wire [31:0] _1201 = 32'b00000000000000000000000000000000;
    reg [31:0] _1206;
    wire [15:0] _1207;
    wire _1211;
    wire _1200;
    wire _1212;
    wire _1199;
    wire _1213;
    wire _1215;
    wire _1290;
    wire _1287;
    wire _1280;
    wire _1279;
    wire _1278;
    wire _1277;
    wire _1276;
    wire _1275;
    wire _1274;
    wire _1273;
    reg _1281;
    wire _1282;
    wire _1270;
    wire _1269;
    wire _1268;
    wire _1267;
    wire _1266;
    wire _1265;
    wire _1264;
    wire _1263;
    reg _1271;
    wire _1272;
    wire _1283;
    wire _1261;
    wire _1262;
    wire _1284;
    wire _1257;
    wire _1255;
    wire _1254;
    wire _1253;
    wire _1252;
    wire _1251;
    wire _1250;
    wire _1249;
    wire _1248;
    wire [2:0] _1247;
    reg _1256;
    wire _1258;
    wire _1245;
    wire _1246;
    wire _1259;
    wire _1243;
    wire _1241;
    wire _1242;
    wire _1238;
    wire _1237;
    wire _1236;
    wire _1235;
    wire _1234;
    wire _1233;
    wire _1232;
    wire _1231;
    reg _1239;
    wire _1228;
    wire _1227;
    wire _1226;
    wire _1225;
    wire _1224;
    wire _1223;
    wire _1222;
    wire _1221;
    wire [2:0] _1220;
    reg _1229;
    wire _1230;
    wire _1240;
    wire [1:0] _1219;
    reg _1244;
    wire _1260;
    wire _1285;
    wire _1217;
    wire _1216;
    wire _1218;
    wire _1286;
    wire _1288;
    wire _2367;
    wire _2368;
    wire _2369;
    wire _2370;
    wire _2372;
    wire _2373;
    wire _2360;
    wire _2359;
    wire _2358;
    wire _2357;
    wire _2356;
    wire _2355;
    wire _2354;
    wire _2353;
    reg _2361;
    wire _2362;
    wire _2350;
    wire _2349;
    wire _2348;
    wire _2347;
    wire _2346;
    wire _2345;
    wire _2344;
    wire _2343;
    reg _2351;
    wire _2352;
    wire _2363;
    wire _2341;
    wire _2342;
    wire _2364;
    wire _2337;
    wire _2335;
    wire _2334;
    wire _2333;
    wire _2332;
    wire _2331;
    wire _2330;
    wire _2329;
    wire _2328;
    wire [2:0] _2327;
    reg _2336;
    wire _2338;
    wire _2325;
    wire _2326;
    wire _2339;
    wire _2323;
    wire _2321;
    wire _2322;
    wire _2318;
    wire _2317;
    wire _2316;
    wire _2315;
    wire _2314;
    wire _2313;
    wire _2312;
    wire _2311;
    reg _2319;
    wire _2308;
    wire _2307;
    wire _2306;
    wire _2305;
    wire _2304;
    wire _2303;
    wire _2302;
    wire _2301;
    wire [2:0] _2300;
    reg _2309;
    wire _2310;
    wire _2320;
    wire [6:0] _1109 = 7'b1001000;
    wire _1110;
    wire _1111;
    wire [31:0] _1108 = 32'b00000000000000000000000000000000;
    wire [31:0] _1107 = 32'b00000000000000000000000000000000;
    reg [31:0] _1112;
    wire [1:0] _2299;
    reg _2324;
    wire _2340;
    wire _2365;
    wire _2366;
    wire _2374;
    wire _2399;
    wire _2400;
    wire _42;
    reg mon0_armed;
    wire [6:0] _1097 = 7'b1001010;
    wire _1098;
    wire _1099;
    wire [7:0] _1096 = 8'b00000000;
    wire [7:0] _1095 = 8'b00000000;
    wire [7:0] _1094;
    reg [7:0] _1100;
    wire [23:0] _1093 = 24'b000000000000000000000000;
    wire [31:0] _1101;
    wire _1102;
    wire _1106;
    wire _1198;
    wire _2402;
    wire _2405;
    wire _2407;
    wire _2408;
    wire _2412;
    wire _2413;
    wire _43;
    reg mon0_sticky;
    wire _2522 = 1'b0;
    wire _2521 = 1'b0;
    wire _2518;
    wire [15:0] _2515;
    wire _2516;
    wire _2513;
    wire _1385;
    wire _1384;
    wire _1383;
    wire _1382;
    wire _1381;
    wire _1380;
    wire _1379;
    wire _1378;
    reg _1386;
    wire _1387;
    wire _1375;
    wire _1374;
    wire _1373;
    wire _1372;
    wire _1371;
    wire _1370;
    wire _1369;
    wire _1368;
    reg _1376;
    wire _1377;
    wire _1388;
    wire _1366;
    wire _1367;
    wire _1389;
    wire _1362;
    wire _1360;
    wire _1359;
    wire _1358;
    wire _1357;
    wire _1356;
    wire _1355;
    wire _1354;
    wire _1353;
    wire [2:0] _1352;
    reg _1361;
    wire _1363;
    wire _1350;
    wire _1351;
    wire _1364;
    wire _1348;
    wire _1346;
    wire _1347;
    wire _1343;
    wire _1342;
    wire _1341;
    wire _1340;
    wire _1339;
    wire _1338;
    wire _1337;
    wire _1336;
    reg _1344;
    wire _1333;
    wire _1332;
    wire _1331;
    wire _1330;
    wire _1329;
    wire _1328;
    wire _1327;
    wire _1326;
    wire [2:0] _1325;
    reg _1334;
    wire _1335;
    wire _1345;
    wire [1:0] _1324;
    reg _1349;
    wire _1365;
    wire _1390;
    wire _1315 = 1'b0;
    wire _1314 = 1'b0;
    wire _2486;
    wire _1482;
    wire _1407;
    wire [15:0] _1402 = 16'b0000000000000000;
    wire [15:0] _1401 = 16'b0000000000000000;
    wire [15:0] _2508 = 16'b0000000000000001;
    wire [15:0] _2505 = 16'b0000000000000001;
    wire [15:0] _2506;
    wire [15:0] _2501 = 16'b1111111111111111;
    wire _2502;
    wire _2503;
    wire [11:0] _2497 = 12'b111111111111;
    wire _2498;
    wire [7:0] _2495 = 8'b11111111;
    wire [7:0] _2494;
    wire _2496;
    wire [3:0] _2492 = 4'b1111;
    wire [3:0] _2491;
    wire _2493;
    wire [1:0] _2490;
    reg _2499;
    wire _2500;
    wire _2504;
    wire [15:0] _2507;
    wire [15:0] _2509;
    wire [15:0] _2510;
    wire [15:0] _44;
    reg [15:0] mon1_count_cycles;
    wire [6:0] _1396 = 7'b1001100;
    wire _1397;
    wire _1398;
    wire [31:0] _1395 = 32'b00000000000000000000000000000000;
    wire [31:0] _1394 = 32'b00000000000000000000000000000000;
    reg [31:0] _1399;
    wire [15:0] _1400;
    wire _1404;
    wire _1393;
    wire _1405;
    wire _1392;
    wire _1406;
    wire _1408;
    wire _1483;
    wire _1480;
    wire _1473;
    wire _1472;
    wire _1471;
    wire _1470;
    wire _1469;
    wire _1468;
    wire _1467;
    wire _1466;
    reg _1474;
    wire _1475;
    wire _1463;
    wire _1462;
    wire _1461;
    wire _1460;
    wire _1459;
    wire _1458;
    wire _1457;
    wire _1456;
    reg _1464;
    wire _1465;
    wire _1476;
    wire _1454;
    wire _1455;
    wire _1477;
    wire _1450;
    wire _1448;
    wire _1447;
    wire _1446;
    wire _1445;
    wire _1444;
    wire _1443;
    wire _1442;
    wire _1441;
    wire [2:0] _1440;
    reg _1449;
    wire _1451;
    wire _1438;
    wire _1439;
    wire _1452;
    wire _1436;
    wire _1434;
    wire _1435;
    wire _1431;
    wire _1430;
    wire _1429;
    wire _1428;
    wire _1427;
    wire _1426;
    wire _1425;
    wire _1424;
    reg _1432;
    wire _1421;
    wire _1420;
    wire _1419;
    wire _1418;
    wire _1417;
    wire _1416;
    wire _1415;
    wire _1414;
    wire [2:0] _1413;
    reg _1422;
    wire _1423;
    wire _1433;
    wire [1:0] _1412;
    reg _1437;
    wire _1453;
    wire _1478;
    wire _1410;
    wire _1409;
    wire _1411;
    wire _1479;
    wire _1481;
    wire _2482;
    wire _2483;
    wire _2484;
    wire _2485;
    wire _2487;
    wire _2488;
    wire _2475;
    wire _2474;
    wire _2473;
    wire _2472;
    wire _2471;
    wire _2470;
    wire _2469;
    wire _2468;
    reg _2476;
    wire _2477;
    wire _2465;
    wire _2464;
    wire _2463;
    wire _2462;
    wire _2461;
    wire _2460;
    wire _2459;
    wire _2458;
    reg _2466;
    wire _2467;
    wire _2478;
    wire _2456;
    wire _2457;
    wire _2479;
    wire _2452;
    wire _2450;
    wire _2449;
    wire _2448;
    wire _2447;
    wire _2446;
    wire _2445;
    wire _2444;
    wire _2443;
    wire [2:0] _2442;
    reg _2451;
    wire _2453;
    wire _2440;
    wire _2441;
    wire _2454;
    wire _2438;
    wire _2436;
    wire _2437;
    wire _2433;
    wire _2432;
    wire _2431;
    wire _2430;
    wire _2429;
    wire _2428;
    wire _2427;
    wire _2426;
    reg _2434;
    wire _2423;
    wire _2422;
    wire _2421;
    wire _2420;
    wire _2419;
    wire _2418;
    wire _2417;
    wire _2416;
    wire [2:0] _2415;
    reg _2424;
    wire _2425;
    wire _2435;
    wire [6:0] _1320 = 7'b1001011;
    wire _1321;
    wire _1322;
    wire [31:0] _1319 = 32'b00000000000000000000000000000000;
    wire [31:0] _1318 = 32'b00000000000000000000000000000000;
    reg [31:0] _1323;
    wire [1:0] _2414;
    reg _2439;
    wire _2455;
    wire _2480;
    wire _2481;
    wire _2489;
    wire _2511;
    wire _2512;
    wire _45;
    reg mon1_armed;
    wire [6:0] _1308 = 7'b1001101;
    wire _1309;
    wire _1310;
    wire [7:0] _1307 = 8'b00000000;
    wire [7:0] _1306 = 8'b00000000;
    wire [7:0] _1305;
    reg [7:0] _1311;
    wire [23:0] _1304 = 24'b000000000000000000000000;
    wire [31:0] _1312;
    wire _1313;
    wire _1317;
    wire _1391;
    wire _2514;
    wire _2517;
    wire _2519;
    wire _2520;
    wire _2524;
    wire _2525;
    wire _46;
    reg mon1_sticky;
    wire _2634 = 1'b0;
    wire _2633 = 1'b0;
    wire _2630;
    wire [15:0] _2627;
    wire _2628;
    wire _2625;
    wire _1578;
    wire _1577;
    wire _1576;
    wire _1575;
    wire _1574;
    wire _1573;
    wire _1572;
    wire _1571;
    reg _1579;
    wire _1580;
    wire _1568;
    wire _1567;
    wire _1566;
    wire _1565;
    wire _1564;
    wire _1563;
    wire _1562;
    wire _1561;
    reg _1569;
    wire _1570;
    wire _1581;
    wire _1559;
    wire _1560;
    wire _1582;
    wire _1555;
    wire _1553;
    wire _1552;
    wire _1551;
    wire _1550;
    wire _1549;
    wire _1548;
    wire _1547;
    wire _1546;
    wire [2:0] _1545;
    reg _1554;
    wire _1556;
    wire _1543;
    wire _1544;
    wire _1557;
    wire _1541;
    wire _1539;
    wire _1540;
    wire _1536;
    wire _1535;
    wire _1534;
    wire _1533;
    wire _1532;
    wire _1531;
    wire _1530;
    wire _1529;
    reg _1537;
    wire _1526;
    wire _1525;
    wire _1524;
    wire _1523;
    wire _1522;
    wire _1521;
    wire _1520;
    wire _1519;
    wire [2:0] _1518;
    reg _1527;
    wire _1528;
    wire _1538;
    wire [1:0] _1517;
    reg _1542;
    wire _1558;
    wire _1583;
    wire _1508 = 1'b0;
    wire _1507 = 1'b0;
    wire _2598;
    wire _1675;
    wire _1600;
    wire [15:0] _1595 = 16'b0000000000000000;
    wire [15:0] _1594 = 16'b0000000000000000;
    wire [15:0] _2620 = 16'b0000000000000001;
    wire [15:0] _2617 = 16'b0000000000000001;
    wire [15:0] _2618;
    wire [15:0] _2613 = 16'b1111111111111111;
    wire _2614;
    wire _2615;
    wire [11:0] _2609 = 12'b111111111111;
    wire _2610;
    wire [7:0] _2607 = 8'b11111111;
    wire [7:0] _2606;
    wire _2608;
    wire [3:0] _2604 = 4'b1111;
    wire [3:0] _2603;
    wire _2605;
    wire [1:0] _2602;
    reg _2611;
    wire _2612;
    wire _2616;
    wire [15:0] _2619;
    wire [15:0] _2621;
    wire [15:0] _2622;
    wire [15:0] _47;
    reg [15:0] mon2_count_cycles;
    wire [6:0] _1589 = 7'b1001111;
    wire _1590;
    wire _1591;
    wire [31:0] _1588 = 32'b00000000000000000000000000000000;
    wire [31:0] _1587 = 32'b00000000000000000000000000000000;
    reg [31:0] _1592;
    wire [15:0] _1593;
    wire _1597;
    wire _1586;
    wire _1598;
    wire _1585;
    wire _1599;
    wire _1601;
    wire _1676;
    wire _1673;
    wire _1666;
    wire _1665;
    wire _1664;
    wire _1663;
    wire _1662;
    wire _1661;
    wire _1660;
    wire _1659;
    reg _1667;
    wire _1668;
    wire _1656;
    wire _1655;
    wire _1654;
    wire _1653;
    wire _1652;
    wire _1651;
    wire _1650;
    wire _1649;
    reg _1657;
    wire _1658;
    wire _1669;
    wire _1647;
    wire _1648;
    wire _1670;
    wire _1643;
    wire _1641;
    wire _1640;
    wire _1639;
    wire _1638;
    wire _1637;
    wire _1636;
    wire _1635;
    wire _1634;
    wire [2:0] _1633;
    reg _1642;
    wire _1644;
    wire _1631;
    wire _1632;
    wire _1645;
    wire _1629;
    wire _1627;
    wire _1628;
    wire _1624;
    wire _1623;
    wire _1622;
    wire _1621;
    wire _1620;
    wire _1619;
    wire _1618;
    wire _1617;
    reg _1625;
    wire _1614;
    wire _1613;
    wire _1612;
    wire _1611;
    wire _1610;
    wire _1609;
    wire _1608;
    wire _1607;
    wire [2:0] _1606;
    reg _1615;
    wire _1616;
    wire _1626;
    wire [1:0] _1605;
    reg _1630;
    wire _1646;
    wire _1671;
    wire _1603;
    wire _1602;
    wire _1604;
    wire _1672;
    wire _1674;
    wire _2594;
    wire _2595;
    wire _2596;
    wire _2597;
    wire _2599;
    wire _2600;
    wire _2587;
    wire _2586;
    wire _2585;
    wire _2584;
    wire _2583;
    wire _2582;
    wire _2581;
    wire _2580;
    reg _2588;
    wire _2589;
    wire _2577;
    wire _2576;
    wire _2575;
    wire _2574;
    wire _2573;
    wire _2572;
    wire _2571;
    wire _2570;
    reg _2578;
    wire _2579;
    wire _2590;
    wire _2568;
    wire _2569;
    wire _2591;
    wire _2564;
    wire _2562;
    wire _2561;
    wire _2560;
    wire _2559;
    wire _2558;
    wire _2557;
    wire _2556;
    wire _2555;
    wire [2:0] _2554;
    reg _2563;
    wire _2565;
    wire _2552;
    wire _2553;
    wire _2566;
    wire _2550;
    wire _2548;
    wire _2549;
    wire _2545;
    wire _2544;
    wire _2543;
    wire _2542;
    wire _2541;
    wire _2540;
    wire _2539;
    wire _2538;
    reg _2546;
    wire _2535;
    wire _2534;
    wire _2533;
    wire _2532;
    wire _2531;
    wire _2530;
    wire _2529;
    wire _2528;
    wire [2:0] _2527;
    reg _2536;
    wire _2537;
    wire _2547;
    wire [6:0] _1513 = 7'b1001110;
    wire _1514;
    wire _1515;
    wire [31:0] _1512 = 32'b00000000000000000000000000000000;
    wire [31:0] _1511 = 32'b00000000000000000000000000000000;
    reg [31:0] _1516;
    wire [1:0] _2526;
    reg _2551;
    wire _2567;
    wire _2592;
    wire _2593;
    wire _2601;
    wire _2623;
    wire _2624;
    wire _48;
    reg mon2_armed;
    wire [6:0] _1501 = 7'b1010000;
    wire _1502;
    wire _1503;
    wire [7:0] _1500 = 8'b00000000;
    wire [7:0] _1499 = 8'b00000000;
    wire [7:0] _1498;
    reg [7:0] _1504;
    wire [23:0] _1497 = 24'b000000000000000000000000;
    wire [31:0] _1505;
    wire _1506;
    wire _1510;
    wire _1584;
    wire _2626;
    wire _2629;
    wire _2631;
    wire _2632;
    wire _2636;
    wire _2637;
    wire _49;
    reg mon2_sticky;
    wire _2908 = 1'b0;
    wire _2907 = 1'b0;
    wire _2904;
    wire [15:0] _2901;
    wire _2902;
    wire _2899;
    wire _1771;
    wire _1770;
    wire _1769;
    wire _1768;
    wire _1767;
    wire _1766;
    wire _1765;
    wire _1764;
    reg _1772;
    wire _1773;
    wire _1761;
    wire _1760;
    wire _1759;
    wire _1758;
    wire _1757;
    wire _1756;
    wire _1755;
    wire _1754;
    reg _1762;
    wire _1763;
    wire _1774;
    wire _1752;
    wire _1753;
    wire _1775;
    wire _1748;
    wire _1746;
    wire _1745;
    wire _1744;
    wire _1743;
    wire _1742;
    wire _1741;
    wire _1740;
    wire _1739;
    wire [2:0] _1738;
    reg _1747;
    wire _1749;
    wire _1736;
    wire _1737;
    wire _1750;
    wire _1734;
    wire _1732;
    wire _1733;
    wire _1729;
    wire _1728;
    wire _1727;
    wire _1726;
    wire _1725;
    wire _1724;
    wire _1723;
    wire _1722;
    reg _1730;
    wire _1719;
    wire _1718;
    wire _1717;
    wire _1716;
    wire _1715;
    wire _1714;
    wire _1713;
    wire _1712;
    wire [2:0] _1711;
    reg _1720;
    wire _1721;
    wire _1731;
    wire [1:0] _1710;
    reg _1735;
    wire _1751;
    wire _1776;
    wire _1701 = 1'b0;
    wire _1700 = 1'b0;
    wire _2712;
    wire _1868;
    wire _1793;
    wire [15:0] _1788 = 16'b0000000000000000;
    wire [15:0] _1787 = 16'b0000000000000000;
    wire [15:0] _2734 = 16'b0000000000000001;
    wire [15:0] _2731 = 16'b0000000000000001;
    wire [15:0] _2732;
    wire [15:0] _2727 = 16'b1111111111111111;
    wire _2728;
    wire _2729;
    wire [11:0] _2723 = 12'b111111111111;
    wire _2724;
    wire [7:0] _2721 = 8'b11111111;
    wire [7:0] _2720;
    wire _2722;
    wire [3:0] _2718 = 4'b1111;
    wire [11:0] _2377 = 12'b000000000000;
    wire [11:0] _2376 = 12'b000000000000;
    wire [11:0] _2638 = 12'b000000000001;
    wire [11:0] _2639;
    wire [11:0] _50;
    reg [11:0] _2378;
    wire [3:0] _2717;
    wire _2719;
    wire [1:0] _2716;
    reg _2725;
    wire _2726;
    wire _2730;
    wire [15:0] _2733;
    wire [15:0] _2735;
    wire [15:0] _2736;
    wire [15:0] _51;
    reg [15:0] mon3_count_cycles;
    wire [6:0] _1782 = 7'b1010010;
    wire _1783;
    wire _1784;
    wire [31:0] _1781 = 32'b00000000000000000000000000000000;
    wire [31:0] _1780 = 32'b00000000000000000000000000000000;
    reg [31:0] _1785;
    wire [15:0] _1786;
    wire _1790;
    wire _1779;
    wire _1791;
    wire _1778;
    wire _1792;
    wire _1794;
    wire _1869;
    wire _1866;
    wire _1859;
    wire _1858;
    wire _1857;
    wire _1856;
    wire _1855;
    wire _1854;
    wire _1853;
    wire _1852;
    reg _1860;
    wire _1861;
    wire _1849;
    wire _1848;
    wire _1847;
    wire _1846;
    wire _1845;
    wire _1844;
    wire _1843;
    wire _1842;
    reg _1850;
    wire _1851;
    wire _1862;
    wire _1840;
    wire _1841;
    wire _1863;
    wire _1836;
    wire _1834;
    wire _1833;
    wire _1832;
    wire _1831;
    wire _1830;
    wire _1829;
    wire _1828;
    wire _1827;
    wire [2:0] _1826;
    reg _1835;
    wire _1837;
    wire _1824;
    wire _1825;
    wire _1838;
    wire _1822;
    wire _1820;
    wire _1821;
    wire _1817;
    wire _1816;
    wire _1815;
    wire _1814;
    wire _1813;
    wire _1812;
    wire _1811;
    wire _1810;
    reg _1818;
    wire _1807;
    wire _1806;
    wire _1805;
    wire _1804;
    wire _1803;
    wire _1802;
    wire _1801;
    wire _1800;
    wire [2:0] _1799;
    reg _1808;
    wire _1809;
    wire _1819;
    wire [1:0] _1798;
    reg _1823;
    wire _1839;
    wire _1864;
    wire _1796;
    wire _1795;
    wire _1797;
    wire _1865;
    wire _1867;
    wire _2708;
    wire _2709;
    wire _2710;
    wire _2711;
    wire _2713;
    wire _2714;
    wire _2701;
    wire _2700;
    wire _2699;
    wire _2698;
    wire _2697;
    wire _2696;
    wire _2695;
    wire [7:0] _1183 = 8'b00000000;
    wire [7:0] _1182 = 8'b00000000;
    reg [7:0] _1184;
    wire _2694;
    reg _2702;
    wire _2703;
    wire _2691;
    wire _2690;
    wire _2689;
    wire _2688;
    wire _2687;
    wire _2686;
    wire _2685;
    wire [7:0] _1170 = 8'b00000000;
    wire [7:0] _1169 = 8'b00000000;
    wire [7:0] _1167 = 8'b00000000;
    wire [7:0] _1166 = 8'b00000000;
    wire _186 = 1'b0;
    wire _185 = 1'b0;
    wire [1:0] _2749 = 2'b10;
    wire _2750;
    wire [1:0] _347 = 2'b01;
    wire _348;
    wire [1:0] _345 = 2'b00;
    wire _346;
    wire _349;
    wire _2751;
    wire [2:0] _341 = 3'b000;
    wire _342;
    wire _343;
    wire _2752;
    wire _2753;
    wire [1:0] _2745 = 2'b10;
    wire _2746;
    wire [1:0] _336 = 2'b01;
    wire _337;
    wire [1:0] _334 = 2'b00;
    wire _335;
    wire _338;
    wire _2747;
    wire [2:0] _330 = 3'b000;
    wire _331;
    wire _332;
    wire _2748;
    wire _2754;
    wire [1:0] _2741 = 2'b10;
    wire _2742;
    wire [1:0] _274 = 2'b01;
    wire _275;
    wire [1:0] _272 = 2'b00;
    wire _273;
    wire _276;
    wire _2743;
    wire [2:0] _268 = 3'b000;
    wire _269;
    wire _270;
    wire _2744;
    wire _2755;
    wire [1:0] _2737 = 2'b10;
    wire _2738;
    wire [1:0] _263 = 2'b01;
    wire _264;
    wire [1:0] _261 = 2'b00;
    wire _262;
    wire _265;
    wire _2739;
    wire [2:0] _257 = 3'b000;
    wire _258;
    wire _259;
    wire _2740;
    wire _2756;
    wire _52;
    reg pin0_oe;
    wire _183 = 1'b0;
    wire _182 = 1'b0;
    wire [1:0] _2769 = 2'b10;
    wire _2770;
    wire [1:0] _398 = 2'b01;
    wire _399;
    wire [1:0] _396 = 2'b00;
    wire _397;
    wire _400;
    wire _2771;
    wire [2:0] _393 = 3'b001;
    wire _394;
    wire _395;
    wire _2772;
    wire _2773;
    wire [1:0] _2765 = 2'b10;
    wire _2766;
    wire [1:0] _389 = 2'b01;
    wire _390;
    wire [1:0] _387 = 2'b00;
    wire _388;
    wire _391;
    wire _2767;
    wire [2:0] _384 = 3'b001;
    wire _385;
    wire _386;
    wire _2768;
    wire _2774;
    wire [1:0] _2761 = 2'b10;
    wire _2762;
    wire [1:0] _380 = 2'b01;
    wire _381;
    wire [1:0] _378 = 2'b00;
    wire _379;
    wire _382;
    wire _2763;
    wire [2:0] _375 = 3'b001;
    wire _376;
    wire _377;
    wire _2764;
    wire _2775;
    wire [1:0] _2757 = 2'b10;
    wire _2758;
    wire [1:0] _371 = 2'b01;
    wire _372;
    wire [1:0] _369 = 2'b00;
    wire _370;
    wire _373;
    wire _2759;
    wire [2:0] _366 = 3'b001;
    wire _367;
    wire _368;
    wire _2760;
    wire _2776;
    wire _53;
    reg pin1_oe;
    wire _180 = 1'b0;
    wire _179 = 1'b0;
    wire [1:0] _2789 = 2'b10;
    wire _2790;
    wire [1:0] _449 = 2'b01;
    wire _450;
    wire [1:0] _447 = 2'b00;
    wire _448;
    wire _451;
    wire _2791;
    wire [2:0] _444 = 3'b010;
    wire _445;
    wire _446;
    wire _2792;
    wire _2793;
    wire [1:0] _2785 = 2'b10;
    wire _2786;
    wire [1:0] _440 = 2'b01;
    wire _441;
    wire [1:0] _438 = 2'b00;
    wire _439;
    wire _442;
    wire _2787;
    wire [2:0] _435 = 3'b010;
    wire _436;
    wire _437;
    wire _2788;
    wire _2794;
    wire [1:0] _2781 = 2'b10;
    wire _2782;
    wire [1:0] _431 = 2'b01;
    wire _432;
    wire [1:0] _429 = 2'b00;
    wire _430;
    wire _433;
    wire _2783;
    wire [2:0] _426 = 3'b010;
    wire _427;
    wire _428;
    wire _2784;
    wire _2795;
    wire [1:0] _2777 = 2'b10;
    wire _2778;
    wire [1:0] _422 = 2'b01;
    wire _423;
    wire [1:0] _420 = 2'b00;
    wire _421;
    wire _424;
    wire _2779;
    wire [2:0] _417 = 3'b010;
    wire _418;
    wire _419;
    wire _2780;
    wire _2796;
    wire _54;
    reg pin2_oe;
    wire _177 = 1'b0;
    wire _176 = 1'b0;
    wire [1:0] _2809 = 2'b10;
    wire _2810;
    wire [1:0] _500 = 2'b01;
    wire _501;
    wire [1:0] _498 = 2'b00;
    wire _499;
    wire _502;
    wire _2811;
    wire [2:0] _495 = 3'b011;
    wire _496;
    wire _497;
    wire _2812;
    wire _2813;
    wire [1:0] _2805 = 2'b10;
    wire _2806;
    wire [1:0] _491 = 2'b01;
    wire _492;
    wire [1:0] _489 = 2'b00;
    wire _490;
    wire _493;
    wire _2807;
    wire [2:0] _486 = 3'b011;
    wire _487;
    wire _488;
    wire _2808;
    wire _2814;
    wire [1:0] _2801 = 2'b10;
    wire _2802;
    wire [1:0] _482 = 2'b01;
    wire _483;
    wire [1:0] _480 = 2'b00;
    wire _481;
    wire _484;
    wire _2803;
    wire [2:0] _477 = 3'b011;
    wire _478;
    wire _479;
    wire _2804;
    wire _2815;
    wire [1:0] _2797 = 2'b10;
    wire _2798;
    wire [1:0] _473 = 2'b01;
    wire _474;
    wire [1:0] _471 = 2'b00;
    wire _472;
    wire _475;
    wire _2799;
    wire [2:0] _468 = 3'b011;
    wire _469;
    wire _470;
    wire _2800;
    wire _2816;
    wire _55;
    reg pin3_oe;
    wire _174 = 1'b0;
    wire _173 = 1'b0;
    wire [1:0] _2829 = 2'b10;
    wire _2830;
    wire [1:0] _551 = 2'b01;
    wire _552;
    wire [1:0] _549 = 2'b00;
    wire _550;
    wire _553;
    wire _2831;
    wire [2:0] _546 = 3'b100;
    wire _547;
    wire _548;
    wire _2832;
    wire _2833;
    wire [1:0] _2825 = 2'b10;
    wire _2826;
    wire [1:0] _542 = 2'b01;
    wire _543;
    wire [1:0] _540 = 2'b00;
    wire _541;
    wire _544;
    wire _2827;
    wire [2:0] _537 = 3'b100;
    wire _538;
    wire _539;
    wire _2828;
    wire _2834;
    wire [1:0] _2821 = 2'b10;
    wire _2822;
    wire [1:0] _533 = 2'b01;
    wire _534;
    wire [1:0] _531 = 2'b00;
    wire _532;
    wire _535;
    wire _2823;
    wire [2:0] _528 = 3'b100;
    wire _529;
    wire _530;
    wire _2824;
    wire _2835;
    wire [1:0] _2817 = 2'b10;
    wire _2818;
    wire [1:0] _524 = 2'b01;
    wire _525;
    wire [1:0] _522 = 2'b00;
    wire _523;
    wire _526;
    wire _2819;
    wire [2:0] _519 = 3'b100;
    wire _520;
    wire _521;
    wire _2820;
    wire _2836;
    wire _56;
    reg pin4_oe;
    wire _171 = 1'b0;
    wire _170 = 1'b0;
    wire [1:0] _2849 = 2'b10;
    wire _2850;
    wire [1:0] _602 = 2'b01;
    wire _603;
    wire [1:0] _600 = 2'b00;
    wire _601;
    wire _604;
    wire _2851;
    wire [2:0] _597 = 3'b101;
    wire _598;
    wire _599;
    wire _2852;
    wire _2853;
    wire [1:0] _2845 = 2'b10;
    wire _2846;
    wire [1:0] _593 = 2'b01;
    wire _594;
    wire [1:0] _591 = 2'b00;
    wire _592;
    wire _595;
    wire _2847;
    wire [2:0] _588 = 3'b101;
    wire _589;
    wire _590;
    wire _2848;
    wire _2854;
    wire [1:0] _2841 = 2'b10;
    wire _2842;
    wire [1:0] _584 = 2'b01;
    wire _585;
    wire [1:0] _582 = 2'b00;
    wire _583;
    wire _586;
    wire _2843;
    wire [2:0] _579 = 3'b101;
    wire _580;
    wire _581;
    wire _2844;
    wire _2855;
    wire [1:0] _2837 = 2'b10;
    wire _2838;
    wire [1:0] _575 = 2'b01;
    wire _576;
    wire [1:0] _573 = 2'b00;
    wire _574;
    wire _577;
    wire _2839;
    wire [2:0] _570 = 3'b101;
    wire _571;
    wire _572;
    wire _2840;
    wire _2856;
    wire _57;
    reg pin5_oe;
    wire _168 = 1'b0;
    wire _167 = 1'b0;
    wire [1:0] _2869 = 2'b10;
    wire _2870;
    wire [1:0] _653 = 2'b01;
    wire _654;
    wire [1:0] _651 = 2'b00;
    wire _652;
    wire _655;
    wire _2871;
    wire [2:0] _648 = 3'b110;
    wire _649;
    wire _650;
    wire _2872;
    wire _2873;
    wire [1:0] _2865 = 2'b10;
    wire _2866;
    wire [1:0] _644 = 2'b01;
    wire _645;
    wire [1:0] _642 = 2'b00;
    wire _643;
    wire _646;
    wire _2867;
    wire [2:0] _639 = 3'b110;
    wire _640;
    wire _641;
    wire _2868;
    wire _2874;
    wire [1:0] _2861 = 2'b10;
    wire _2862;
    wire [1:0] _635 = 2'b01;
    wire _636;
    wire [1:0] _633 = 2'b00;
    wire _634;
    wire _637;
    wire _2863;
    wire [2:0] _630 = 3'b110;
    wire _631;
    wire _632;
    wire _2864;
    wire _2875;
    wire [1:0] _2857 = 2'b10;
    wire _2858;
    wire [1:0] _626 = 2'b01;
    wire _627;
    wire [1:0] _624 = 2'b00;
    wire _625;
    wire _628;
    wire _2859;
    wire [2:0] _621 = 3'b110;
    wire _622;
    wire _623;
    wire _2860;
    wire _2876;
    wire _58;
    reg pin6_oe;
    wire _165 = 1'b0;
    wire _156 = 1'b0;
    wire [1:0] _2889 = 2'b10;
    wire _2890;
    wire [1:0] _704 = 2'b01;
    wire _705;
    wire [1:0] _702 = 2'b00;
    wire _703;
    wire _706;
    wire _2891;
    wire [2:0] _699 = 3'b111;
    wire _700;
    wire _701;
    wire _2892;
    wire _2893;
    wire [1:0] _2885 = 2'b10;
    wire _2886;
    wire [1:0] _695 = 2'b01;
    wire _696;
    wire [1:0] _693 = 2'b00;
    wire _694;
    wire _697;
    wire _2887;
    wire [2:0] _690 = 3'b111;
    wire _691;
    wire _692;
    wire _2888;
    wire _2894;
    wire [1:0] _2881 = 2'b10;
    wire _2882;
    wire [1:0] _686 = 2'b01;
    wire _687;
    wire [1:0] _684 = 2'b00;
    wire _685;
    wire _688;
    wire _2883;
    wire [2:0] _681 = 3'b111;
    wire _682;
    wire _683;
    wire _2884;
    wire _2895;
    wire [1:0] _2877 = 2'b10;
    wire _2878;
    wire [1:0] _677 = 2'b01;
    wire _678;
    wire [1:0] _675 = 2'b00;
    wire _676;
    wire _679;
    wire _2879;
    wire [2:0] _672 = 3'b111;
    wire _673;
    wire _674;
    wire _2880;
    wire _2896;
    wire _59;
    reg pin7_oe;
    wire [7:0] _188;
    reg [7:0] _1168;
    reg [7:0] _1171;
    wire _2684;
    reg _2692;
    wire _2693;
    wire _2704;
    wire _2682;
    wire _2683;
    wire _2705;
    wire _2678;
    wire _2676;
    wire _2675;
    wire _2674;
    wire _2673;
    wire _2672;
    wire _2671;
    wire _2670;
    wire _2669;
    wire [2:0] _2668;
    reg _2677;
    wire _2679;
    wire _2666;
    wire _2667;
    wire _2680;
    wire _2664;
    wire _2662;
    wire _2663;
    wire _2659;
    wire _2658;
    wire _2657;
    wire _2656;
    wire _2655;
    wire _2654;
    wire _2653;
    wire _2652;
    reg _2660;
    wire _2649;
    wire _2648;
    wire _2647;
    wire _2646;
    wire _2645;
    wire _2644;
    wire _2643;
    wire [7:0] _1122 = 8'b00000000;
    wire [7:0] _1121 = 8'b00000000;
    wire [7:0] _1119 = 8'b00000000;
    wire [7:0] _1118 = 8'b00000000;
    wire [7:0] _1116 = 8'b00000000;
    wire [7:0] _1115 = 8'b00000000;
    reg [7:0] _1117;
    reg [7:0] _1120;
    reg [7:0] _1123;
    wire _2642;
    wire [2:0] _2641;
    reg _2650;
    wire _2651;
    wire _2661;
    wire [6:0] _1706 = 7'b1010001;
    wire _1707;
    wire _1708;
    wire [31:0] _1705 = 32'b00000000000000000000000000000000;
    wire [31:0] _1704 = 32'b00000000000000000000000000000000;
    reg [31:0] _1709;
    wire [1:0] _2640;
    reg _2665;
    wire _2681;
    wire _2706;
    wire _2707;
    wire _2715;
    wire _2897;
    wire _2898;
    wire _60;
    reg mon3_armed;
    wire [6:0] _1694 = 7'b1010011;
    wire _1695;
    wire _1696;
    wire [7:0] _1693 = 8'b00000000;
    wire [7:0] _1692 = 8'b00000000;
    wire [7:0] _1691;
    reg [7:0] _1697;
    wire [23:0] _1690 = 24'b000000000000000000000000;
    wire [31:0] _1698;
    wire _1699;
    wire _1703;
    wire _1777;
    wire _2900;
    wire _2903;
    wire _2905;
    wire _2906;
    wire _2910;
    wire _1091 = 1'b0;
    wire _1090 = 1'b0;
    wire _1088;
    wire _1089;
    reg ctrl_bit1;
    wire _2911;
    wire _61;
    reg mon3_sticky;
    wire [3:0] _4606;
    wire _4604 = 1'b0;
    wire _4603 = 1'b0;
    wire _4601 = 1'b0;
    wire _4600 = 1'b0;
    wire _63;
    reg _4602;
    reg _4605;
    wire _4405 = 1'b0;
    wire _4404 = 1'b0;
    wire _4451;
    wire [1:0] _4446 = 2'b11;
    wire _4447;
    wire _4448;
    wire _4449;
    wire [1:0] _4442 = 2'b11;
    wire _4443;
    wire _4444;
    wire _4445;
    wire _4450;
    wire _4452;
    wire [2:0] _256;
    wire _4439;
    wire [1:0] _4434 = 2'b11;
    wire _4435;
    wire _4436;
    wire _4437;
    wire [1:0] _4430 = 2'b11;
    wire [1:0] _260;
    wire _4431;
    wire _4432;
    wire _4433;
    wire _4438;
    wire _4440;
    wire [2:0] _329;
    wire _4427;
    wire [1:0] _4422 = 2'b11;
    wire [1:0] _333;
    wire _4423;
    wire _4424;
    wire _4425;
    wire [1:0] _4418 = 2'b11;
    wire _4419;
    wire _4420;
    wire _4421;
    wire _4426;
    wire _4428;
    wire [2:0] _340;
    wire [2:0] _267;
    wire _4416;
    wire [1:0] _4411 = 2'b11;
    wire [1:0] _344;
    wire _4412;
    wire _4413;
    wire [23:0] _310 = 24'b000000000000000000000000;
    wire [23:0] _308;
    wire [23:0] _309;
    wire _311;
    reg [28:0] _304;
    wire [23:0] _305;
    wire [23:0] _306;
    wire _307;
    wire _312;
    wire [2:0] _286 = 3'b000;
    wire [2:0] _279 = 3'b000;
    wire [23:0] _325 = 24'b000000000000000000000000;
    wire [23:0] _323;
    wire [23:0] _324;
    wire _326;
    wire [28:0] _302 = 29'b00000000000000000000000000000;
    wire [28:0] _301 = 29'b00000000000000000000000000000;
    wire [1:0] _2915 = 2'b11;
    wire _2916;
    wire [28:0] _2994;
    wire [28:0] _2995;
    wire [28:0] _64;
    reg [28:0] queue_b_entry3;
    wire [28:0] _299 = 29'b00000000000000000000000000000;
    wire [28:0] _298 = 29'b00000000000000000000000000000;
    wire [1:0] _2996 = 2'b10;
    wire _2997;
    wire [28:0] _2998;
    wire [28:0] _2999;
    wire [28:0] _65;
    reg [28:0] queue_b_entry2;
    wire [28:0] _296 = 29'b00000000000000000000000000000;
    wire [28:0] _295 = 29'b00000000000000000000000000000;
    wire [1:0] _3000 = 2'b01;
    wire _3001;
    wire [28:0] _3002;
    wire [28:0] _3003;
    wire [28:0] _66;
    reg [28:0] queue_b_entry1;
    wire [28:0] _293 = 29'b00000000000000000000000000000;
    wire [28:0] _292 = 29'b00000000000000000000000000000;
    wire [1:0] _2988 = 2'b01;
    wire [1:0] _2987 = 2'b10;
    wire [1:0] _2989;
    wire [1:0] _2983 = 2'b00;
    wire [1:0] _2980 = 2'b00;
    wire [1:0] _2979 = 2'b00;
    wire [1:0] _3106 = 2'b10;
    wire [1:0] _3102;
    wire [1:0] _3103;
    wire [1:0] _3104;
    wire [1:0] _3105;
    wire [1:0] _3107;
    wire [1:0] _67;
    reg [1:0] seq_b_shadow_clk;
    wire [1:0] _2977 = 2'b00;
    wire [1:0] _2976 = 2'b00;
    wire [1:0] _3112 = 2'b10;
    wire [1:0] _3108;
    wire [2:0] _3098 = 3'b111;
    wire _3099;
    wire [2:0] _3095 = 3'b110;
    wire _3096;
    wire [2:0] _3093 = 3'b101;
    wire _3094;
    wire _3097;
    wire _3100;
    wire _3101;
    wire [1:0] _3109;
    wire [1:0] _3110;
    wire [1:0] _3111;
    wire [1:0] _3113;
    wire [1:0] _68;
    reg [1:0] seq_b_shadow_data;
    wire [1:0] _2982;
    wire _2984;
    wire [1:0] _2985;
    wire [1:0] _2973 = 2'b10;
    wire [1:0] _2972 = 2'b01;
    wire _2971;
    wire [1:0] _2974;
    wire [3:0] _2967 = 4'b0000;
    wire [3:0] _2966 = 4'b0000;
    wire [3:0] _3125 = 4'b0000;
    wire [3:0] _3122;
    wire [3:0] _3118 = 4'b0101;
    wire _3119;
    wire [3:0] _3114 = 4'b0101;
    wire _3115;
    wire _3116;
    wire _3120;
    wire [3:0] _3123;
    wire [3:0] _3124;
    wire [3:0] _3126;
    wire [3:0] _69;
    reg [3:0] seq_b_coder;
    wire _2969;
    wire [31:0] _2963 = 32'b00000000000000000000000000000000;
    wire [31:0] _2962 = 32'b00000000000000000000000000000000;
    wire [31:0] _3186 = 32'b00000000000000000000000000000000;
    wire [31:0] _3140 = 32'b00000000000000000000000000000000;
    wire [31:0] _3139 = 32'b00000000000000000000000000000000;
    wire [1:0] _3136 = 2'b11;
    wire _3137;
    wire _3138;
    wire [31:0] _3142;
    wire [31:0] _70;
    reg [31:0] _3141;
    wire [31:0] _3147 = 32'b00000000000000000000000000000000;
    wire [31:0] _3146 = 32'b00000000000000000000000000000000;
    wire [1:0] _3143 = 2'b10;
    wire _3144;
    wire _3145;
    wire [31:0] _3149;
    wire [31:0] _71;
    reg [31:0] _3148;
    wire [31:0] _3154 = 32'b00000000000000000000000000000000;
    wire [31:0] _3153 = 32'b00000000000000000000000000000000;
    wire [1:0] _3150 = 2'b01;
    wire _3151;
    wire _3152;
    wire [31:0] _3156;
    wire [31:0] _72;
    reg [31:0] _3155;
    wire [31:0] _3164 = 32'b00000000000000000000000000000000;
    wire [31:0] _3163 = 32'b00000000000000000000000000000000;
    wire [1:0] _3160 = 2'b00;
    wire [1:0] _3134 = 2'b00;
    wire [1:0] _3133 = 2'b00;
    wire [1:0] _3157 = 2'b01;
    wire [1:0] _3158;
    wire [1:0] _3159;
    wire [1:0] _73;
    reg [1:0] _3135;
    wire _3161;
    wire _3162;
    wire [31:0] _3166;
    wire [31:0] _74;
    reg [31:0] _3165;
    wire [1:0] _3171 = 2'b00;
    wire [1:0] _3170 = 2'b00;
    wire [1:0] _3173 = 2'b01;
    wire [1:0] _3174;
    wire [1:0] _3175;
    wire [1:0] _75;
    reg [1:0] _3172;
    reg [31:0] _3183;
    wire _3179 = 1'b0;
    wire [30:0] _3178;
    wire [31:0] _3180;
    wire [2:0] _3176 = 3'b100;
    wire _3177;
    wire [31:0] _3181;
    wire [31:0] _3182;
    wire [31:0] _3184;
    wire [31:0] _3185;
    wire [31:0] _3187;
    wire [31:0] _76;
    reg [31:0] seq_b_osr;
    wire _2965;
    wire _2970;
    wire [1:0] _2975;
    wire [1:0] _2986;
    wire [1:0] _2990;
    wire [1:0] _2960 = 2'b11;
    wire [1:0] _2959 = 2'b01;
    wire [1:0] _2961;
    wire [1:0] _2991;
    wire [1:0] _2958 = 2'b00;
    wire [2:0] _2954 = 3'b111;
    wire _2955;
    wire [2:0] _2952 = 3'b101;
    wire _2953;
    wire _2956;
    wire [2:0] _2948 = 3'b100;
    wire _2949;
    wire [2:0] _2946 = 3'b011;
    wire _2947;
    wire _2950;
    wire [2:0] _2943 = 3'b010;
    wire _2944;
    wire [2:0] _2941 = 3'b001;
    wire _2942;
    wire _2945;
    wire _2951;
    wire _2957;
    wire [1:0] _2992;
    wire [2:0] _2939;
    wire _2926;
    wire [2:0] _2936;
    wire [2:0] _2922 = 3'b111;
    wire _2923;
    wire [2:0] _2920 = 3'b110;
    wire _2921;
    wire _2924;
    wire [2:0] _2918 = 3'b101;
    wire [2:0] _2917;
    wire _2919;
    wire _2925;
    wire [2:0] _2940;
    wire [5:0] _1040 = 6'b000000;
    wire [17:0] _1039;
    wire [23:0] _1041;
    wire [3:0] _1037 = 4'b0000;
    wire [19:0] _1036;
    wire [23:0] _1038;
    wire [1:0] _1034 = 2'b00;
    wire [21:0] _1033;
    wire [23:0] _1035;
    wire [5:0] _1030;
    wire [7:0] _1019 = 8'b00000000;
    wire [7:0] _1018 = 8'b00000000;
    wire [3:0] _3191 = 4'b0100;
    wire _3192;
    wire [3:0] _3188 = 4'b0101;
    wire _3189;
    wire _3190;
    wire _3193;
    wire [7:0] _3194;
    wire [7:0] _3195;
    wire [7:0] _3204;
    wire [7:0] _77;
    reg [7:0] seq_b_k3;
    wire [7:0] _1016 = 8'b00000000;
    wire [7:0] _1015 = 8'b00000000;
    wire [3:0] _3208 = 4'b0011;
    wire _3209;
    wire [3:0] _3205 = 4'b0101;
    wire _3206;
    wire _3207;
    wire _3210;
    wire [7:0] _3211;
    wire [7:0] _3212;
    wire [7:0] _3214;
    wire [7:0] _78;
    reg [7:0] seq_b_k2;
    wire [7:0] _1013 = 8'b00000000;
    wire [7:0] _1012 = 8'b00000000;
    wire [3:0] _3218 = 4'b0010;
    wire _3219;
    wire [3:0] _3215 = 4'b0101;
    wire _3216;
    wire _3217;
    wire _3220;
    wire [7:0] _3221;
    wire [7:0] _3222;
    wire [7:0] _3224;
    wire [7:0] _79;
    reg [7:0] seq_b_k1;
    wire [7:0] _1011 = 8'b00000000;
    wire [1:0] _1010;
    reg [7:0] _1021;
    wire _1022;
    wire [1:0] _1023;
    wire [9:0] _1024;
    wire [5:0] _1008;
    wire [3:0] _1007 = 4'b0000;
    wire [9:0] _1009;
    wire [9:0] _1025;
    wire _1026;
    wire [1:0] _1027;
    wire [3:0] _1028;
    wire [7:0] _1029;
    wire [13:0] _1031;
    wire [23:0] _1032;
    reg [23:0] _1042;
    wire [23:0] _1043;
    wire [28:0] _2993;
    wire [1:0] _3228 = 2'b00;
    wire [1:0] _2913 = 2'b00;
    wire [1:0] _2912 = 2'b00;
    wire [1:0] _3225 = 2'b01;
    wire [1:0] _3226;
    wire [1:0] _3227;
    wire [1:0] _80;
    reg [1:0] queue_b_write_ptr;
    wire _3229;
    wire [28:0] _3230;
    wire [28:0] _3231;
    wire [28:0] _81;
    reg [28:0] queue_b_entry0;
    wire [1:0] _317 = 2'b01;
    wire [1:0] _290 = 2'b00;
    wire _285;
    wire [1:0] _289 = 2'b00;
    wire [1:0] _3237;
    wire [1:0] _3238;
    wire [1:0] _82;
    reg [1:0] queue_b_read_ptr;
    wire [1:0] _318;
    reg [28:0] _319;
    wire [23:0] _320;
    wire [23:0] _321;
    wire _322;
    wire _327;
    wire [2:0] _314 = 3'b001;
    wire _315;
    wire _316;
    wire _328;
    wire [1:0] _3234 = 2'b00;
    wire [2:0] _3235;
    wire [1:0] _3232 = 2'b00;
    wire [2:0] _3233;
    wire [2:0] _3236;
    wire _993;
    wire [2:0] _995 = 3'b100;
    wire _996;
    wire _83;
    wire [3:0] _985 = 4'b0001;
    wire _986;
    wire _987;
    wire _771 = 1'b0;
    wire _770 = 1'b0;
    wire _963;
    wire _3662;
    wire [15:0] _943 = 16'b0000000000000000;
    wire [15:0] _941 = 16'b0000001111111111;
    wire [15:0] _942;
    wire _944;
    wire _938 = 1'b1;
    wire _937;
    wire _939;
    wire _934 = 1'b0;
    wire _933;
    wire _935;
    wire [3:0] _931 = 4'b0111;
    wire [3:0] _930;
    wire _932;
    wire _936;
    wire _940;
    wire _945;
    wire [3:0] _925 = 4'b1001;
    wire [3:0] _924;
    wire _926;
    wire [3:0] _921 = 4'b1000;
    wire [3:0] _920;
    wire _922;
    wire [3:0] _917 = 4'b0111;
    wire [3:0] _916;
    wire _918;
    wire [3:0] _913 = 4'b0101;
    wire [3:0] _912;
    wire _914;
    wire [3:0] _909 = 4'b0100;
    wire [3:0] _908;
    wire _910;
    wire [3:0] _905 = 4'b0011;
    wire [3:0] _904;
    wire _906;
    wire [3:0] _901 = 4'b0010;
    wire [3:0] _900;
    wire _902;
    wire [3:0] _897 = 4'b0001;
    wire [3:0] _896;
    wire _898;
    wire [3:0] _894 = 4'b0000;
    wire [3:0] _893;
    wire _895;
    wire _899;
    wire _903;
    wire _907;
    wire _911;
    wire _915;
    wire _919;
    wire _923;
    wire _927;
    wire [3:0] _891 = 4'b0101;
    wire [3:0] _890;
    wire _892;
    wire _928;
    wire [15:0] _886 = 16'b0000000000000000;
    wire [15:0] _884 = 16'b0000000011000000;
    wire [15:0] _885;
    wire _887;
    wire [3:0] _880 = 4'b0100;
    wire [3:0] _879;
    wire _881;
    wire [3:0] _876 = 4'b0011;
    wire [3:0] _875;
    wire _877;
    wire [3:0] _872 = 4'b0010;
    wire [3:0] _871;
    wire _873;
    wire [3:0] _868 = 4'b0001;
    wire [3:0] _867;
    wire _869;
    wire [3:0] _865 = 4'b0000;
    wire [3:0] _864;
    wire _866;
    wire _870;
    wire _874;
    wire _878;
    wire _882;
    wire [3:0] _862 = 4'b0100;
    wire [3:0] _861;
    wire _863;
    wire _883;
    wire _888;
    wire [15:0] _857 = 16'b0000000000000000;
    wire [15:0] _855 = 16'b0000000000111111;
    wire [15:0] _856;
    wire _858;
    wire [1:0] _851 = 2'b10;
    wire [1:0] _850;
    wire _852;
    wire [1:0] _847 = 2'b01;
    wire [1:0] _846;
    wire _848;
    wire [1:0] _844 = 2'b00;
    wire [1:0] _843;
    wire _845;
    wire _849;
    wire _853;
    wire [2:0] _839 = 3'b011;
    wire [2:0] _838;
    wire _840;
    wire [2:0] _835 = 3'b010;
    wire [2:0] _834;
    wire _836;
    wire [2:0] _831 = 3'b001;
    wire [2:0] _830;
    wire _832;
    wire [2:0] _828 = 3'b000;
    wire [2:0] _827;
    wire _829;
    wire _833;
    wire _837;
    wire _841;
    wire [3:0] _825 = 4'b0011;
    wire [3:0] _824;
    wire _826;
    wire _842;
    wire _854;
    wire _859;
    wire [3:0] _821 = 4'b0010;
    wire [3:0] _820;
    wire _822;
    wire [2:0] _815 = 3'b111;
    wire [2:0] _814;
    wire _816;
    wire [2:0] _811 = 3'b110;
    wire [2:0] _810;
    wire _812;
    wire [2:0] _807 = 3'b101;
    wire [2:0] _806;
    wire _808;
    wire [2:0] _803 = 3'b100;
    wire [2:0] _802;
    wire _804;
    wire [2:0] _799 = 3'b011;
    wire [2:0] _798;
    wire _800;
    wire [2:0] _795 = 3'b010;
    wire [2:0] _794;
    wire _796;
    wire [2:0] _791 = 3'b001;
    wire [2:0] _790;
    wire _792;
    wire [2:0] _788 = 3'b000;
    wire [2:0] _787;
    wire _789;
    wire _793;
    wire _797;
    wire _801;
    wire _805;
    wire _809;
    wire _813;
    wire _817;
    wire [3:0] _785 = 4'b0001;
    wire [3:0] _784;
    wire _786;
    wire _818;
    wire [15:0] _781 = 16'b0000000000000000;
    wire [15:0] _779 = 16'b0000111111111111;
    wire [15:0] _780;
    wire _782;
    wire [3:0] _777 = 4'b0000;
    wire [15:0] _774 = 16'b0000000000000000;
    wire [15:0] _773 = 16'b0000000000000000;
    wire [5:0] _3292;
    wire [4:0] _3293;
    reg [15:0] _3491;
    wire [15:0] _84;
    wire _3091;
    wire [5:0] _959 = 6'b000000;
    wire [5:0] _958 = 6'b000000;
    wire [5:0] _3290 = 6'b100000;
    wire [5:0] _3289;
    wire [5:0] _3291;
    wire [5:0] _3279 = 6'b000001;
    wire [5:0] _3280;
    wire _3275;
    wire _3274;
    wire _3273;
    wire _3272;
    wire _3271;
    wire _3270;
    wire _3269;
    wire _3268;
    reg _3276;
    wire [3:0] _3264 = 4'b0100;
    wire _3265;
    wire _3266;
    wire _3267;
    wire _3277;
    wire _3260 = 1'b0;
    wire _3259 = 1'b0;
    wire _3492;
    wire _3493;
    wire _3494;
    wire _3495;
    wire _85;
    reg seq_b_flag;
    wire [3:0] _3256 = 4'b0011;
    wire _3257;
    wire _3258;
    wire _3262;
    wire [15:0] _3250 = 16'b0000000000000000;
    wire _3251;
    wire _3252;
    wire [3:0] _3248 = 4'b0010;
    wire _3249;
    wire _3253;
    wire [15:0] _3243 = 16'b0000000000000000;
    wire _3244;
    wire _3245;
    wire [3:0] _3241 = 4'b0001;
    wire _3242;
    wire _3246;
    wire [3:0] _3239 = 4'b0000;
    wire _3240;
    wire _3247;
    wire _3254;
    wire _3255;
    wire _3263;
    wire _3278;
    wire [5:0] _3281;
    wire [5:0] _3496;
    wire [5:0] _3497;
    wire [5:0] _86;
    reg [5:0] seq_b_ir_pc;
    wire [5:0] _957;
    wire _961;
    wire [3:0] _954 = 4'b0000;
    wire _955;
    wire _956;
    wire _962;
    wire _3089;
    wire _3084;
    wire [3:0] _3081 = 4'b0100;
    wire _3082;
    wire _3083;
    wire _3085;
    wire [15:0] _3072 = 16'b1111111111111111;
    wire [15:0] _3070 = 16'b0000000000000000;
    wire [15:0] _3069 = 16'b0000000000000000;
    wire [15:0] _3527 = 16'b0000000000000000;
    wire [7:0] _3523;
    wire [15:0] _3524;
    wire [7:0] _3520 = 8'b00000000;
    wire [15:0] _3521;
    wire [15:0] _3517 = 16'b0000000000000001;
    wire [15:0] _3518;
    wire [15:0] _3513 = 16'b0000000000000000;
    wire _3514;
    wire _3515;
    wire [3:0] _3510 = 4'b0010;
    wire _3511;
    wire _3512;
    wire _3516;
    wire [15:0] _3519;
    wire [3:0] _3507 = 4'b0001;
    wire _3508;
    wire [3:0] _3504 = 4'b0101;
    wire _3505;
    wire _3506;
    wire _3509;
    wire [15:0] _3522;
    wire [3:0] _3501 = 4'b1001;
    wire _3502;
    wire [3:0] _3498 = 4'b0101;
    wire _3499;
    wire _3500;
    wire _3503;
    wire [15:0] _3525;
    wire [15:0] _3526;
    wire [15:0] _3528;
    wire [15:0] _87;
    reg [15:0] seq_b_y;
    wire [15:0] _3067 = 16'b0000000000000000;
    wire [15:0] _3066 = 16'b0000000000000000;
    wire [15:0] _3558 = 16'b0000000000000000;
    wire [7:0] _3554;
    wire [15:0] _3555;
    wire [7:0] _3551 = 8'b00000000;
    wire [15:0] _3552;
    wire [15:0] _3548 = 16'b0000000000000001;
    wire [15:0] _3549;
    wire [15:0] _3544 = 16'b0000000000000000;
    wire _3545;
    wire _3546;
    wire [3:0] _3541 = 4'b0001;
    wire [3:0] _953;
    wire _3542;
    wire [3:0] _950 = 4'b0100;
    wire _951;
    wire _952;
    wire _3543;
    wire _3547;
    wire [15:0] _3550;
    wire [3:0] _3538 = 4'b0000;
    wire _3539;
    wire [3:0] _3535 = 4'b0101;
    wire _3536;
    wire _3537;
    wire _3540;
    wire [15:0] _3553;
    wire [3:0] _3532 = 4'b1000;
    wire _3533;
    wire [3:0] _3529 = 4'b0101;
    wire _3530;
    wire _3531;
    wire _3534;
    wire [15:0] _3556;
    wire [15:0] _3557;
    wire [15:0] _3559;
    wire [15:0] _88;
    reg [15:0] seq_b_x;
    wire [15:0] _3065 = 16'b1111111111111111;
    reg [15:0] _3073;
    wire [15:0] _3063 = 16'b0000000000000000;
    wire [15:0] _3062 = 16'b0000000000000000;
    wire [15:0] _3568 = 16'b0000000000000000;
    wire [15:0] _3565 = 16'b0000000000000001;
    wire [15:0] _3566;
    wire [15:0] _3564 = 16'b0000000000000000;
    wire _3562;
    wire _3560;
    wire _3561;
    wire _3563;
    wire [15:0] _3567;
    wire [15:0] _3569;
    wire [15:0] _89;
    reg [15:0] seq_b_wait_count;
    wire _3074;
    wire [1:0] _3059 = 2'b00;
    wire [1:0] _3058;
    wire _3060;
    wire _3061;
    wire _3075;
    wire _3056;
    wire _3054;
    wire _3053;
    wire _3052;
    wire _3051;
    wire _3050;
    wire _3049;
    wire _3048;
    wire _3047;
    wire [2:0] _2937;
    wire [2:0] _2935;
    wire [2:0] _2934;
    wire [6:0] _2930 = 7'b1100100;
    wire _2931;
    wire _2932;
    wire [11:0] _2929 = 12'b000000000000;
    wire [11:0] _2928 = 12'b000000000000;
    wire [11:0] _2927;
    reg [11:0] _2933;
    wire [2:0] _2938;
    wire [2:0] _3044;
    wire [1:0] _3045;
    reg [2:0] _3046;
    reg _3055;
    wire _3057;
    wire _3076;
    wire _3042 = 1'b0;
    wire _3041 = 1'b0;
    wire [23:0] _3621 = 24'b000000000000000000000000;
    wire _3622;
    wire [23:0] _3617 = 24'b000000000000000000000001;
    wire [23:0] _3618;
    wire [23:0] _3619;
    wire _3620;
    wire _3623;
    wire [23:0] _3600 = 24'b000000000000000000000000;
    wire _3601;
    wire [23:0] _3596 = 24'b000000000000000000000001;
    wire [23:0] _3597;
    wire [23:0] _3598;
    wire _3599;
    wire _3602;
    wire _3624;
    wire _3625;
    wire [23:0] _3579 = 24'b000000000000000000000000;
    wire _3580;
    wire [23:0] _3575 = 24'b000000000000000000000001;
    wire [23:0] _3576;
    wire [23:0] _3577;
    wire _3578;
    wire _3581;
    wire _3573;
    wire _3571;
    wire _3570;
    wire _3572;
    wire _3574;
    wire _3626;
    wire _3627;
    wire _90;
    reg seq_b_caught_up;
    wire _3077;
    wire _3078;
    wire _3079;
    wire [2:0] _3031 = 3'b000;
    wire [2:0] _3030 = 3'b000;
    wire [2:0] _3167 = 3'b000;
    wire _3168;
    wire _91;
    wire _3169;
    wire [1:0] _3631 = 2'b00;
    wire [2:0] _3632;
    wire [2:0] _3130 = 3'b100;
    wire _3131;
    wire [6:0] _3127 = 7'b1100110;
    wire _3128;
    wire _3129;
    wire _3132;
    wire [1:0] _3628 = 2'b00;
    wire [2:0] _3629;
    wire [2:0] _3630;
    wire [2:0] _3633;
    wire [2:0] _92;
    reg [2:0] _3032;
    wire [2:0] _3029 = 3'b000;
    wire _3033;
    wire _3028;
    wire _3034;
    wire _3035;
    wire _3025 = 1'b0;
    wire _3024;
    wire _3026;
    wire [3:0] _3021 = 4'b0111;
    wire _3022;
    wire _3023;
    wire _3027;
    wire _3036;
    wire _991 = 1'b0;
    wire _990 = 1'b0;
    wire _3656;
    wire _3655;
    wire _3657;
    wire [23:0] _1002 = 24'b000000000000000000000000;
    wire [23:0] _1001 = 24'b000000000000000000000000;
    wire [23:0] _3649 = 24'b000000000000000001000000;
    wire [23:0] _3650;
    wire [5:0] _3592 = 6'b000000;
    wire [17:0] _3591;
    wire [23:0] _3593;
    wire [3:0] _3589 = 4'b0000;
    wire [19:0] _3588;
    wire [23:0] _3590;
    wire [1:0] _3586 = 2'b00;
    wire [21:0] _3585;
    wire [23:0] _3587;
    wire [11:0] _3583;
    wire [11:0] _3582 = 12'b000000000000;
    wire [23:0] _3584;
    reg [23:0] _3594;
    wire [23:0] _3595;
    wire [5:0] _3613 = 6'b000000;
    wire [17:0] _3612;
    wire [23:0] _3614;
    wire [3:0] _3610 = 4'b0000;
    wire [19:0] _3609;
    wire [23:0] _3611;
    wire [1:0] _3607 = 2'b00;
    wire [21:0] _3606;
    wire [23:0] _3608;
    wire [5:0] _3604;
    wire [17:0] _3603 = 18'b000000000000000000;
    wire [23:0] _3605;
    wire [1:0] _1005 = 2'b00;
    wire [1:0] _1004 = 2'b00;
    wire [1:0] _3643 = 2'b00;
    wire [7:0] _3121;
    wire [1:0] _3640;
    wire [3:0] _3637 = 4'b0111;
    wire [3:0] _3117;
    wire _3638;
    wire [3:0] _3634 = 4'b0101;
    wire _3635;
    wire _3636;
    wire _3639;
    wire [1:0] _3641;
    wire [1:0] _3642;
    wire [1:0] _3644;
    wire [1:0] _93;
    reg [1:0] seq_b_prescale;
    reg [23:0] _3615;
    wire [23:0] _3616;
    wire [23:0] _3645;
    wire [23:0] _3646;
    wire [3:0] _3038 = 4'b0011;
    wire _3039;
    wire _3040;
    wire [23:0] _3647;
    wire [23:0] _3648;
    wire [23:0] _3651;
    wire [23:0] _94;
    reg [23:0] seq_b_sched_s;
    wire [23:0] _3652;
    wire _3653;
    wire _3654;
    wire _3658;
    wire _3659;
    wire _95;
    reg seq_b_far;
    wire _3016;
    wire [3:0] _3012 = 4'b0010;
    wire _3013;
    wire _3014;
    wire _3015;
    wire _3017;
    wire _3018;
    wire [3:0] _3009 = 4'b0010;
    wire _3010;
    wire _3011;
    wire _3019;
    wire _3007;
    wire [3:0] _3004 = 4'b0001;
    wire [3:0] _949;
    wire _3005;
    wire _3006;
    wire _3008;
    wire _3020;
    wire _3037;
    wire _3080;
    wire _3086;
    wire _3087;
    wire _3088;
    wire _3090;
    wire _3092;
    wire [15:0] _3660;
    wire [15:0] _3661;
    wire [15:0] _96;
    reg [15:0] seq_b_ir;
    wire [3:0] _776;
    wire _778;
    wire _783;
    wire _819;
    wire _823;
    wire _860;
    wire _889;
    wire _929;
    wire _946;
    wire _947;
    wire _948;
    wire _3663;
    wire _3664;
    wire _97;
    reg seq_b_running;
    wire _988;
    wire _989;
    wire _994;
    wire _997;
    wire [1:0] _3665 = 2'b00;
    wire [2:0] _3666;
    wire [2:0] _3667;
    wire [2:0] _3668;
    wire [2:0] _98;
    reg [2:0] queue_b_count;
    wire [2:0] _278 = 3'b000;
    wire _288;
    wire _313;
    wire _4414;
    wire [1:0] _4407 = 2'b11;
    wire [1:0] _271;
    wire _4408;
    wire _4409;
    wire [23:0] _237 = 24'b000000000000000000000000;
    wire [23:0] _235;
    wire [23:0] _236;
    wire _238;
    reg [28:0] _228;
    wire [23:0] _229;
    wire [23:0] _233;
    wire _234;
    wire _239;
    wire [2:0] _210 = 3'b000;
    wire [2:0] _190 = 3'b000;
    wire [23:0] _252 = 24'b000000000000000000000000;
    wire [23:0] _250;
    wire [23:0] _251;
    wire _253;
    wire [28:0] _226 = 29'b00000000000000000000000000000;
    wire [28:0] _225 = 29'b00000000000000000000000000000;
    wire [1:0] _3672 = 2'b11;
    wire _3673;
    wire [28:0] _3751;
    wire [28:0] _3752;
    wire [28:0] _99;
    reg [28:0] queue_a_entry3;
    wire [28:0] _223 = 29'b00000000000000000000000000000;
    wire [28:0] _222 = 29'b00000000000000000000000000000;
    wire [1:0] _3753 = 2'b10;
    wire _3754;
    wire [28:0] _3755;
    wire [28:0] _3756;
    wire [28:0] _100;
    reg [28:0] queue_a_entry2;
    wire [28:0] _220 = 29'b00000000000000000000000000000;
    wire [28:0] _219 = 29'b00000000000000000000000000000;
    wire [1:0] _3757 = 2'b01;
    wire _3758;
    wire [28:0] _3759;
    wire [28:0] _3760;
    wire [28:0] _101;
    reg [28:0] queue_a_entry1;
    wire [28:0] _217 = 29'b00000000000000000000000000000;
    wire [28:0] _216 = 29'b00000000000000000000000000000;
    wire [1:0] _3745 = 2'b01;
    wire [1:0] _3744 = 2'b10;
    wire [1:0] _3746;
    wire [1:0] _3740 = 2'b00;
    wire [1:0] _3737 = 2'b00;
    wire [1:0] _3736 = 2'b00;
    wire [1:0] _3863 = 2'b10;
    wire [1:0] _3859;
    wire [1:0] _3860;
    wire [1:0] _3861;
    wire [1:0] _3862;
    wire [1:0] _3864;
    wire [1:0] _102;
    reg [1:0] seq_a_shadow_clk;
    wire [1:0] _3734 = 2'b00;
    wire [1:0] _3733 = 2'b00;
    wire [1:0] _3869 = 2'b10;
    wire [1:0] _3865;
    wire [2:0] _3855 = 3'b111;
    wire _3856;
    wire [2:0] _3852 = 3'b110;
    wire _3853;
    wire [2:0] _3850 = 3'b101;
    wire _3851;
    wire _3854;
    wire _3857;
    wire _3858;
    wire [1:0] _3866;
    wire [1:0] _3867;
    wire [1:0] _3868;
    wire [1:0] _3870;
    wire [1:0] _103;
    reg [1:0] seq_a_shadow_data;
    wire [1:0] _3739;
    wire _3741;
    wire [1:0] _3742;
    wire [1:0] _3730 = 2'b10;
    wire [1:0] _3729 = 2'b01;
    wire _3728;
    wire [1:0] _3731;
    wire [3:0] _3724 = 4'b0000;
    wire [3:0] _3723 = 4'b0000;
    wire [3:0] _3882 = 4'b0000;
    wire [3:0] _3879;
    wire [3:0] _3875 = 4'b0101;
    wire _3876;
    wire [3:0] _3871 = 4'b0101;
    wire _3872;
    wire _3873;
    wire _3877;
    wire [3:0] _3880;
    wire [3:0] _3881;
    wire [3:0] _3883;
    wire [3:0] _104;
    reg [3:0] seq_a_coder;
    wire _3726;
    wire [31:0] _3720 = 32'b00000000000000000000000000000000;
    wire [31:0] _3719 = 32'b00000000000000000000000000000000;
    wire [31:0] _3943 = 32'b00000000000000000000000000000000;
    wire [31:0] _3897 = 32'b00000000000000000000000000000000;
    wire [31:0] _3896 = 32'b00000000000000000000000000000000;
    wire [1:0] _3893 = 2'b11;
    wire _3894;
    wire _3895;
    wire [31:0] _3899;
    wire [31:0] _105;
    reg [31:0] _3898;
    wire [31:0] _3904 = 32'b00000000000000000000000000000000;
    wire [31:0] _3903 = 32'b00000000000000000000000000000000;
    wire [1:0] _3900 = 2'b10;
    wire _3901;
    wire _3902;
    wire [31:0] _3906;
    wire [31:0] _106;
    reg [31:0] _3905;
    wire [31:0] _3911 = 32'b00000000000000000000000000000000;
    wire [31:0] _3910 = 32'b00000000000000000000000000000000;
    wire [1:0] _3907 = 2'b01;
    wire _3908;
    wire _3909;
    wire [31:0] _3913;
    wire [31:0] _107;
    reg [31:0] _3912;
    wire [31:0] _3921 = 32'b00000000000000000000000000000000;
    wire [31:0] _3920 = 32'b00000000000000000000000000000000;
    wire [1:0] _3917 = 2'b00;
    wire [1:0] _3891 = 2'b00;
    wire [1:0] _3890 = 2'b00;
    wire [1:0] _3914 = 2'b01;
    wire [1:0] _3915;
    wire [1:0] _3916;
    wire [1:0] _108;
    reg [1:0] _3892;
    wire _3918;
    wire _3919;
    wire [31:0] _3923;
    wire [31:0] _109;
    reg [31:0] _3922;
    wire [1:0] _3928 = 2'b00;
    wire [1:0] _3927 = 2'b00;
    wire [1:0] _3930 = 2'b01;
    wire [1:0] _3931;
    wire [1:0] _3932;
    wire [1:0] _110;
    reg [1:0] _3929;
    reg [31:0] _3940;
    wire _3936 = 1'b0;
    wire [30:0] _3935;
    wire [31:0] _3937;
    wire [2:0] _3933 = 3'b100;
    wire _3934;
    wire [31:0] _3938;
    wire [31:0] _3939;
    wire [31:0] _3941;
    wire [31:0] _3942;
    wire [31:0] _3944;
    wire [31:0] _111;
    reg [31:0] seq_a_osr;
    wire _3722;
    wire _3727;
    wire [1:0] _3732;
    wire [1:0] _3743;
    wire [1:0] _3747;
    wire [1:0] _3717 = 2'b11;
    wire [1:0] _3716 = 2'b01;
    wire [1:0] _3718;
    wire [1:0] _3748;
    wire [1:0] _3715 = 2'b00;
    wire [2:0] _3711 = 3'b111;
    wire _3712;
    wire [2:0] _3709 = 3'b101;
    wire _3710;
    wire _3713;
    wire [2:0] _3705 = 3'b100;
    wire _3706;
    wire [2:0] _3703 = 3'b011;
    wire _3704;
    wire _3707;
    wire [2:0] _3700 = 3'b010;
    wire _3701;
    wire [2:0] _3698 = 3'b001;
    wire _3699;
    wire _3702;
    wire _3708;
    wire _3714;
    wire [1:0] _3749;
    wire [2:0] _3696;
    wire _3683;
    wire [2:0] _3693;
    wire [2:0] _3679 = 3'b111;
    wire _3680;
    wire [2:0] _3677 = 3'b110;
    wire _3678;
    wire _3681;
    wire [2:0] _3675 = 3'b101;
    wire [2:0] _3674;
    wire _3676;
    wire _3682;
    wire [2:0] _3697;
    wire [5:0] _2251 = 6'b000000;
    wire [17:0] _2250;
    wire [23:0] _2252;
    wire [3:0] _2248 = 4'b0000;
    wire [19:0] _2247;
    wire [23:0] _2249;
    wire [1:0] _2245 = 2'b00;
    wire [21:0] _2244;
    wire [23:0] _2246;
    wire [5:0] _2241;
    wire [7:0] _2230 = 8'b00000000;
    wire [7:0] _2229 = 8'b00000000;
    wire [7:0] _3203;
    wire [3:0] _3948 = 4'b0100;
    wire _3949;
    wire [3:0] _3945 = 4'b0101;
    wire _3946;
    wire _3947;
    wire _3950;
    wire [7:0] _3951;
    wire [7:0] _3952;
    wire [7:0] _3953;
    wire [7:0] _112;
    reg [7:0] seq_a_k3;
    wire [7:0] _2227 = 8'b00000000;
    wire [7:0] _2226 = 8'b00000000;
    wire [7:0] _3213;
    wire [3:0] _3957 = 4'b0011;
    wire _3958;
    wire [3:0] _3954 = 4'b0101;
    wire _3955;
    wire _3956;
    wire _3959;
    wire [7:0] _3960;
    wire [7:0] _3961;
    wire [7:0] _3962;
    wire [7:0] _113;
    reg [7:0] seq_a_k2;
    wire [7:0] _2224 = 8'b00000000;
    wire [7:0] _2223 = 8'b00000000;
    wire [7:0] _3223;
    wire [3:0] _3966 = 4'b0010;
    wire _3967;
    wire [3:0] _3963 = 4'b0101;
    wire _3964;
    wire _3965;
    wire _3968;
    wire [7:0] _3969;
    wire [7:0] _3970;
    wire [7:0] _3971;
    wire [7:0] _114;
    reg [7:0] seq_a_k1;
    wire [7:0] _2222 = 8'b00000000;
    wire [1:0] _2221;
    reg [7:0] _2232;
    wire _2233;
    wire [1:0] _2234;
    wire [9:0] _2235;
    wire [5:0] _2219;
    wire [3:0] _2218 = 4'b0000;
    wire [9:0] _2220;
    wire [9:0] _2236;
    wire _2237;
    wire [1:0] _2238;
    wire [3:0] _2239;
    wire [7:0] _2240;
    wire [13:0] _2242;
    wire [23:0] _2243;
    reg [23:0] _2253;
    wire [23:0] _2254;
    wire [28:0] _3750;
    wire [1:0] _3975 = 2'b00;
    wire [1:0] _3670 = 2'b00;
    wire [1:0] _3669 = 2'b00;
    wire [1:0] _3972 = 2'b01;
    wire [1:0] _3973;
    wire [1:0] _3974;
    wire [1:0] _115;
    reg [1:0] queue_a_write_ptr;
    wire _3976;
    wire [28:0] _3977;
    wire [28:0] _3978;
    wire [28:0] _116;
    reg [28:0] queue_a_entry0;
    wire [1:0] _244 = 2'b01;
    wire [1:0] _214 = 2'b00;
    wire _209;
    wire [1:0] _213 = 2'b00;
    wire [1:0] _3984;
    wire [1:0] _3985;
    wire [1:0] _117;
    reg [1:0] queue_a_read_ptr;
    wire [1:0] _245;
    reg [28:0] _246;
    wire [23:0] _247;
    wire [23:0] _248;
    wire _249;
    wire _254;
    wire [2:0] _241 = 3'b001;
    wire _242;
    wire _243;
    wire _255;
    wire [1:0] _3981 = 2'b00;
    wire [2:0] _3982;
    wire [1:0] _3979 = 2'b00;
    wire [2:0] _3980;
    wire [2:0] _3983;
    wire _2204;
    wire [2:0] _2206 = 3'b100;
    wire _2207;
    wire _118;
    wire [3:0] _2196 = 4'b0001;
    wire _2197;
    wire _2198;
    wire _1983 = 1'b0;
    wire _1982 = 1'b0;
    wire _2175;
    wire _4396;
    wire [15:0] _2155 = 16'b0000000000000000;
    wire [15:0] _2153 = 16'b0000001111111111;
    wire [15:0] _2154;
    wire _2156;
    wire _2150 = 1'b1;
    wire _2149;
    wire _2151;
    wire _2146 = 1'b0;
    wire _2145;
    wire _2147;
    wire [3:0] _2143 = 4'b0111;
    wire [3:0] _2142;
    wire _2144;
    wire _2148;
    wire _2152;
    wire _2157;
    wire [3:0] _2137 = 4'b1001;
    wire [3:0] _2136;
    wire _2138;
    wire [3:0] _2133 = 4'b1000;
    wire [3:0] _2132;
    wire _2134;
    wire [3:0] _2129 = 4'b0111;
    wire [3:0] _2128;
    wire _2130;
    wire [3:0] _2125 = 4'b0101;
    wire [3:0] _2124;
    wire _2126;
    wire [3:0] _2121 = 4'b0100;
    wire [3:0] _2120;
    wire _2122;
    wire [3:0] _2117 = 4'b0011;
    wire [3:0] _2116;
    wire _2118;
    wire [3:0] _2113 = 4'b0010;
    wire [3:0] _2112;
    wire _2114;
    wire [3:0] _2109 = 4'b0001;
    wire [3:0] _2108;
    wire _2110;
    wire [3:0] _2106 = 4'b0000;
    wire [3:0] _2105;
    wire _2107;
    wire _2111;
    wire _2115;
    wire _2119;
    wire _2123;
    wire _2127;
    wire _2131;
    wire _2135;
    wire _2139;
    wire [3:0] _2103 = 4'b0101;
    wire [3:0] _2102;
    wire _2104;
    wire _2140;
    wire [15:0] _2098 = 16'b0000000000000000;
    wire [15:0] _2096 = 16'b0000000011000000;
    wire [15:0] _2097;
    wire _2099;
    wire [3:0] _2092 = 4'b0100;
    wire [3:0] _2091;
    wire _2093;
    wire [3:0] _2088 = 4'b0011;
    wire [3:0] _2087;
    wire _2089;
    wire [3:0] _2084 = 4'b0010;
    wire [3:0] _2083;
    wire _2085;
    wire [3:0] _2080 = 4'b0001;
    wire [3:0] _2079;
    wire _2081;
    wire [3:0] _2077 = 4'b0000;
    wire [3:0] _2076;
    wire _2078;
    wire _2082;
    wire _2086;
    wire _2090;
    wire _2094;
    wire [3:0] _2074 = 4'b0100;
    wire [3:0] _2073;
    wire _2075;
    wire _2095;
    wire _2100;
    wire [15:0] _2069 = 16'b0000000000000000;
    wire [15:0] _2067 = 16'b0000000000111111;
    wire [15:0] _2068;
    wire _2070;
    wire [1:0] _2063 = 2'b10;
    wire [1:0] _2062;
    wire _2064;
    wire [1:0] _2059 = 2'b01;
    wire [1:0] _2058;
    wire _2060;
    wire [1:0] _2056 = 2'b00;
    wire [1:0] _2055;
    wire _2057;
    wire _2061;
    wire _2065;
    wire [2:0] _2051 = 3'b011;
    wire [2:0] _2050;
    wire _2052;
    wire [2:0] _2047 = 3'b010;
    wire [2:0] _2046;
    wire _2048;
    wire [2:0] _2043 = 3'b001;
    wire [2:0] _2042;
    wire _2044;
    wire [2:0] _2040 = 3'b000;
    wire [2:0] _2039;
    wire _2041;
    wire _2045;
    wire _2049;
    wire _2053;
    wire [3:0] _2037 = 4'b0011;
    wire [3:0] _2036;
    wire _2038;
    wire _2054;
    wire _2066;
    wire _2071;
    wire [3:0] _2033 = 4'b0010;
    wire [3:0] _2032;
    wire _2034;
    wire [2:0] _2027 = 3'b111;
    wire [2:0] _2026;
    wire _2028;
    wire [2:0] _2023 = 3'b110;
    wire [2:0] _2022;
    wire _2024;
    wire [2:0] _2019 = 3'b101;
    wire [2:0] _2018;
    wire _2020;
    wire [2:0] _2015 = 3'b100;
    wire [2:0] _2014;
    wire _2016;
    wire [2:0] _2011 = 3'b011;
    wire [2:0] _2010;
    wire _2012;
    wire [2:0] _2007 = 3'b010;
    wire [2:0] _2006;
    wire _2008;
    wire [2:0] _2003 = 3'b001;
    wire [2:0] _2002;
    wire _2004;
    wire [2:0] _2000 = 3'b000;
    wire [2:0] _1999;
    wire _2001;
    wire _2005;
    wire _2009;
    wire _2013;
    wire _2017;
    wire _2021;
    wire _2025;
    wire _2029;
    wire [3:0] _1997 = 4'b0001;
    wire [3:0] _1996;
    wire _1998;
    wire _2030;
    wire [15:0] _1993 = 16'b0000000000000000;
    wire [15:0] _1991 = 16'b0000111111111111;
    wire [15:0] _1992;
    wire _1994;
    wire [3:0] _1989 = 4'b0000;
    wire [15:0] _1986 = 16'b0000000000000000;
    wire [15:0] _1985 = 16'b0000000000000000;
    wire [5:0] _3487 = 6'b111111;
    wire _3488;
    wire _3489;
    wire [15:0] _3486 = 16'b0000000000000000;
    wire [15:0] _3485 = 16'b0000000000000000;
    reg [15:0] imem_63;
    wire [5:0] _3481 = 6'b111110;
    wire _3482;
    wire _3483;
    wire [15:0] _3480 = 16'b0000000000000000;
    wire [15:0] _3479 = 16'b0000000000000000;
    reg [15:0] imem_62;
    wire [5:0] _3475 = 6'b111101;
    wire _3476;
    wire _3477;
    wire [15:0] _3474 = 16'b0000000000000000;
    wire [15:0] _3473 = 16'b0000000000000000;
    reg [15:0] imem_61;
    wire [5:0] _3469 = 6'b111100;
    wire _3470;
    wire _3471;
    wire [15:0] _3468 = 16'b0000000000000000;
    wire [15:0] _3467 = 16'b0000000000000000;
    reg [15:0] imem_60;
    wire [5:0] _3463 = 6'b111011;
    wire _3464;
    wire _3465;
    wire [15:0] _3462 = 16'b0000000000000000;
    wire [15:0] _3461 = 16'b0000000000000000;
    reg [15:0] imem_59;
    wire [5:0] _3457 = 6'b111010;
    wire _3458;
    wire _3459;
    wire [15:0] _3456 = 16'b0000000000000000;
    wire [15:0] _3455 = 16'b0000000000000000;
    reg [15:0] imem_58;
    wire [5:0] _3451 = 6'b111001;
    wire _3452;
    wire _3453;
    wire [15:0] _3450 = 16'b0000000000000000;
    wire [15:0] _3449 = 16'b0000000000000000;
    reg [15:0] imem_57;
    wire [5:0] _3445 = 6'b111000;
    wire _3446;
    wire _3447;
    wire [15:0] _3444 = 16'b0000000000000000;
    wire [15:0] _3443 = 16'b0000000000000000;
    reg [15:0] imem_56;
    wire [5:0] _3439 = 6'b110111;
    wire _3440;
    wire _3441;
    wire [15:0] _3438 = 16'b0000000000000000;
    wire [15:0] _3437 = 16'b0000000000000000;
    reg [15:0] imem_55;
    wire [5:0] _3433 = 6'b110110;
    wire _3434;
    wire _3435;
    wire [15:0] _3432 = 16'b0000000000000000;
    wire [15:0] _3431 = 16'b0000000000000000;
    reg [15:0] imem_54;
    wire [5:0] _3427 = 6'b110101;
    wire _3428;
    wire _3429;
    wire [15:0] _3426 = 16'b0000000000000000;
    wire [15:0] _3425 = 16'b0000000000000000;
    reg [15:0] imem_53;
    wire [5:0] _3421 = 6'b110100;
    wire _3422;
    wire _3423;
    wire [15:0] _3420 = 16'b0000000000000000;
    wire [15:0] _3419 = 16'b0000000000000000;
    reg [15:0] imem_52;
    wire [5:0] _3415 = 6'b110011;
    wire _3416;
    wire _3417;
    wire [15:0] _3414 = 16'b0000000000000000;
    wire [15:0] _3413 = 16'b0000000000000000;
    reg [15:0] imem_51;
    wire [5:0] _3409 = 6'b110010;
    wire _3410;
    wire _3411;
    wire [15:0] _3408 = 16'b0000000000000000;
    wire [15:0] _3407 = 16'b0000000000000000;
    reg [15:0] imem_50;
    wire [5:0] _3403 = 6'b110001;
    wire _3404;
    wire _3405;
    wire [15:0] _3402 = 16'b0000000000000000;
    wire [15:0] _3401 = 16'b0000000000000000;
    reg [15:0] imem_49;
    wire [5:0] _3397 = 6'b110000;
    wire _3398;
    wire _3399;
    wire [15:0] _3396 = 16'b0000000000000000;
    wire [15:0] _3395 = 16'b0000000000000000;
    reg [15:0] imem_48;
    wire [5:0] _3391 = 6'b101111;
    wire _3392;
    wire _3393;
    wire [15:0] _3390 = 16'b0000000000000000;
    wire [15:0] _3389 = 16'b0000000000000000;
    reg [15:0] imem_47;
    wire [5:0] _3385 = 6'b101110;
    wire _3386;
    wire _3387;
    wire [15:0] _3384 = 16'b0000000000000000;
    wire [15:0] _3383 = 16'b0000000000000000;
    reg [15:0] imem_46;
    wire [5:0] _3379 = 6'b101101;
    wire _3380;
    wire _3381;
    wire [15:0] _3378 = 16'b0000000000000000;
    wire [15:0] _3377 = 16'b0000000000000000;
    reg [15:0] imem_45;
    wire [5:0] _3373 = 6'b101100;
    wire _3374;
    wire _3375;
    wire [15:0] _3372 = 16'b0000000000000000;
    wire [15:0] _3371 = 16'b0000000000000000;
    reg [15:0] imem_44;
    wire [5:0] _3367 = 6'b101011;
    wire _3368;
    wire _3369;
    wire [15:0] _3366 = 16'b0000000000000000;
    wire [15:0] _3365 = 16'b0000000000000000;
    reg [15:0] imem_43;
    wire [5:0] _3361 = 6'b101010;
    wire _3362;
    wire _3363;
    wire [15:0] _3360 = 16'b0000000000000000;
    wire [15:0] _3359 = 16'b0000000000000000;
    reg [15:0] imem_42;
    wire [5:0] _3355 = 6'b101001;
    wire _3356;
    wire _3357;
    wire [15:0] _3354 = 16'b0000000000000000;
    wire [15:0] _3353 = 16'b0000000000000000;
    reg [15:0] imem_41;
    wire [5:0] _3349 = 6'b101000;
    wire _3350;
    wire _3351;
    wire [15:0] _3348 = 16'b0000000000000000;
    wire [15:0] _3347 = 16'b0000000000000000;
    reg [15:0] imem_40;
    wire [5:0] _3343 = 6'b100111;
    wire _3344;
    wire _3345;
    wire [15:0] _3342 = 16'b0000000000000000;
    wire [15:0] _3341 = 16'b0000000000000000;
    reg [15:0] imem_39;
    wire [5:0] _3337 = 6'b100110;
    wire _3338;
    wire _3339;
    wire [15:0] _3336 = 16'b0000000000000000;
    wire [15:0] _3335 = 16'b0000000000000000;
    reg [15:0] imem_38;
    wire [5:0] _3331 = 6'b100101;
    wire _3332;
    wire _3333;
    wire [15:0] _3330 = 16'b0000000000000000;
    wire [15:0] _3329 = 16'b0000000000000000;
    reg [15:0] imem_37;
    wire [5:0] _3325 = 6'b100100;
    wire _3326;
    wire _3327;
    wire [15:0] _3324 = 16'b0000000000000000;
    wire [15:0] _3323 = 16'b0000000000000000;
    reg [15:0] imem_36;
    wire [5:0] _3319 = 6'b100011;
    wire _3320;
    wire _3321;
    wire [15:0] _3318 = 16'b0000000000000000;
    wire [15:0] _3317 = 16'b0000000000000000;
    reg [15:0] imem_35;
    wire [5:0] _3313 = 6'b100010;
    wire _3314;
    wire _3315;
    wire [15:0] _3312 = 16'b0000000000000000;
    wire [15:0] _3311 = 16'b0000000000000000;
    reg [15:0] imem_34;
    wire [5:0] _3307 = 6'b100001;
    wire _3308;
    wire _3309;
    wire [15:0] _3306 = 16'b0000000000000000;
    wire [15:0] _3305 = 16'b0000000000000000;
    reg [15:0] imem_33;
    wire [5:0] _3301 = 6'b100000;
    wire _3302;
    wire _3303;
    wire [15:0] _3296 = 16'b0000000000000000;
    wire [15:0] _3295 = 16'b0000000000000000;
    reg [15:0] imem_32;
    wire [5:0] _4219 = 6'b011111;
    wire _4220;
    wire _4221;
    wire [15:0] _4218 = 16'b0000000000000000;
    wire [15:0] _4217 = 16'b0000000000000000;
    reg [15:0] imem_31;
    wire [5:0] _4213 = 6'b011110;
    wire _4214;
    wire _4215;
    wire [15:0] _4212 = 16'b0000000000000000;
    wire [15:0] _4211 = 16'b0000000000000000;
    reg [15:0] imem_30;
    wire [5:0] _4207 = 6'b011101;
    wire _4208;
    wire _4209;
    wire [15:0] _4206 = 16'b0000000000000000;
    wire [15:0] _4205 = 16'b0000000000000000;
    reg [15:0] imem_29;
    wire [5:0] _4201 = 6'b011100;
    wire _4202;
    wire _4203;
    wire [15:0] _4200 = 16'b0000000000000000;
    wire [15:0] _4199 = 16'b0000000000000000;
    reg [15:0] imem_28;
    wire [5:0] _4195 = 6'b011011;
    wire _4196;
    wire _4197;
    wire [15:0] _4194 = 16'b0000000000000000;
    wire [15:0] _4193 = 16'b0000000000000000;
    reg [15:0] imem_27;
    wire [5:0] _4189 = 6'b011010;
    wire _4190;
    wire _4191;
    wire [15:0] _4188 = 16'b0000000000000000;
    wire [15:0] _4187 = 16'b0000000000000000;
    reg [15:0] imem_26;
    wire [5:0] _4183 = 6'b011001;
    wire _4184;
    wire _4185;
    wire [15:0] _4182 = 16'b0000000000000000;
    wire [15:0] _4181 = 16'b0000000000000000;
    reg [15:0] imem_25;
    wire [5:0] _4177 = 6'b011000;
    wire _4178;
    wire _4179;
    wire [15:0] _4176 = 16'b0000000000000000;
    wire [15:0] _4175 = 16'b0000000000000000;
    reg [15:0] imem_24;
    wire [5:0] _4171 = 6'b010111;
    wire _4172;
    wire _4173;
    wire [15:0] _4170 = 16'b0000000000000000;
    wire [15:0] _4169 = 16'b0000000000000000;
    reg [15:0] imem_23;
    wire [5:0] _4165 = 6'b010110;
    wire _4166;
    wire _4167;
    wire [15:0] _4164 = 16'b0000000000000000;
    wire [15:0] _4163 = 16'b0000000000000000;
    reg [15:0] imem_22;
    wire [5:0] _4159 = 6'b010101;
    wire _4160;
    wire _4161;
    wire [15:0] _4158 = 16'b0000000000000000;
    wire [15:0] _4157 = 16'b0000000000000000;
    reg [15:0] imem_21;
    wire [5:0] _4153 = 6'b010100;
    wire _4154;
    wire _4155;
    wire [15:0] _4152 = 16'b0000000000000000;
    wire [15:0] _4151 = 16'b0000000000000000;
    reg [15:0] imem_20;
    wire [5:0] _4147 = 6'b010011;
    wire _4148;
    wire _4149;
    wire [15:0] _4146 = 16'b0000000000000000;
    wire [15:0] _4145 = 16'b0000000000000000;
    reg [15:0] imem_19;
    wire [5:0] _4141 = 6'b010010;
    wire _4142;
    wire _4143;
    wire [15:0] _4140 = 16'b0000000000000000;
    wire [15:0] _4139 = 16'b0000000000000000;
    reg [15:0] imem_18;
    wire [5:0] _4135 = 6'b010001;
    wire _4136;
    wire _4137;
    wire [15:0] _4134 = 16'b0000000000000000;
    wire [15:0] _4133 = 16'b0000000000000000;
    reg [15:0] imem_17;
    wire [5:0] _4129 = 6'b010000;
    wire _4130;
    wire _4131;
    wire [15:0] _4128 = 16'b0000000000000000;
    wire [15:0] _4127 = 16'b0000000000000000;
    reg [15:0] imem_16;
    wire [5:0] _4123 = 6'b001111;
    wire _4124;
    wire _4125;
    wire [15:0] _4122 = 16'b0000000000000000;
    wire [15:0] _4121 = 16'b0000000000000000;
    reg [15:0] imem_15;
    wire [5:0] _4117 = 6'b001110;
    wire _4118;
    wire _4119;
    wire [15:0] _4116 = 16'b0000000000000000;
    wire [15:0] _4115 = 16'b0000000000000000;
    reg [15:0] imem_14;
    wire [5:0] _4111 = 6'b001101;
    wire _4112;
    wire _4113;
    wire [15:0] _4110 = 16'b0000000000000000;
    wire [15:0] _4109 = 16'b0000000000000000;
    reg [15:0] imem_13;
    wire [5:0] _4105 = 6'b001100;
    wire _4106;
    wire _4107;
    wire [15:0] _4104 = 16'b0000000000000000;
    wire [15:0] _4103 = 16'b0000000000000000;
    reg [15:0] imem_12;
    wire [5:0] _4099 = 6'b001011;
    wire _4100;
    wire _4101;
    wire [15:0] _4098 = 16'b0000000000000000;
    wire [15:0] _4097 = 16'b0000000000000000;
    reg [15:0] imem_11;
    wire [5:0] _4093 = 6'b001010;
    wire _4094;
    wire _4095;
    wire [15:0] _4092 = 16'b0000000000000000;
    wire [15:0] _4091 = 16'b0000000000000000;
    reg [15:0] imem_10;
    wire [5:0] _4087 = 6'b001001;
    wire _4088;
    wire _4089;
    wire [15:0] _4086 = 16'b0000000000000000;
    wire [15:0] _4085 = 16'b0000000000000000;
    reg [15:0] imem_09;
    wire [5:0] _4081 = 6'b001000;
    wire _4082;
    wire _4083;
    wire [15:0] _4080 = 16'b0000000000000000;
    wire [15:0] _4079 = 16'b0000000000000000;
    reg [15:0] imem_08;
    wire [5:0] _4075 = 6'b000111;
    wire _4076;
    wire _4077;
    wire [15:0] _4074 = 16'b0000000000000000;
    wire [15:0] _4073 = 16'b0000000000000000;
    reg [15:0] imem_07;
    wire [5:0] _4069 = 6'b000110;
    wire _4070;
    wire _4071;
    wire [15:0] _4068 = 16'b0000000000000000;
    wire [15:0] _4067 = 16'b0000000000000000;
    reg [15:0] imem_06;
    wire [5:0] _4063 = 6'b000101;
    wire _4064;
    wire _4065;
    wire [15:0] _4062 = 16'b0000000000000000;
    wire [15:0] _4061 = 16'b0000000000000000;
    reg [15:0] imem_05;
    wire [5:0] _4057 = 6'b000100;
    wire _4058;
    wire _4059;
    wire [15:0] _4056 = 16'b0000000000000000;
    wire [15:0] _4055 = 16'b0000000000000000;
    reg [15:0] imem_04;
    wire [5:0] _4051 = 6'b000011;
    wire _4052;
    wire _4053;
    wire [15:0] _4050 = 16'b0000000000000000;
    wire [15:0] _4049 = 16'b0000000000000000;
    reg [15:0] imem_03;
    wire [5:0] _4045 = 6'b000010;
    wire _4046;
    wire _4047;
    wire [15:0] _4044 = 16'b0000000000000000;
    wire [15:0] _4043 = 16'b0000000000000000;
    reg [15:0] imem_02;
    wire [5:0] _4039 = 6'b000001;
    wire _4040;
    wire _4041;
    wire [15:0] _4038 = 16'b0000000000000000;
    wire [15:0] _4037 = 16'b0000000000000000;
    reg [15:0] imem_01;
    wire [5:0] _4033 = 6'b000000;
    wire [5:0] _3300;
    wire _4034;
    wire [6:0] _3297 = 7'b1000000;
    wire _3298;
    wire _3299;
    wire _4035;
    wire [15:0] _4032 = 16'b0000000000000000;
    wire [15:0] _4031 = 16'b0000000000000000;
    wire [15:0] _3294;
    reg [15:0] imem_00;
    wire [5:0] _4030;
    reg [15:0] _4223;
    wire [15:0] _119;
    wire _3848;
    wire [5:0] _2171 = 6'b000000;
    wire [5:0] _2170 = 6'b000000;
    wire [6:0] _3285 = 7'b1000111;
    wire _3286;
    wire _3287;
    wire [13:0] _3284 = 14'b00000000000000;
    wire [13:0] _3283 = 14'b00000000000000;
    wire [13:0] _3282;
    reg [13:0] _3288;
    wire [5:0] _4029;
    wire [5:0] _4026 = 6'b000001;
    wire [5:0] _4027;
    wire _4022;
    wire _4021;
    wire _4020;
    wire _4019;
    wire _4018;
    wire _4017;
    wire _4016;
    wire _4015;
    reg _4023;
    wire [3:0] _4011 = 4'b0100;
    wire _4012;
    wire _4013;
    wire _4014;
    wire _4024;
    wire _4007 = 1'b0;
    wire _4006 = 1'b0;
    wire _4224;
    wire _4225;
    wire _4226;
    wire _4227;
    wire _120;
    reg seq_a_flag;
    wire [3:0] _4003 = 4'b0011;
    wire _4004;
    wire _4005;
    wire _4009;
    wire [15:0] _3997 = 16'b0000000000000000;
    wire _3998;
    wire _3999;
    wire [3:0] _3995 = 4'b0010;
    wire _3996;
    wire _4000;
    wire [15:0] _3990 = 16'b0000000000000000;
    wire _3991;
    wire _3992;
    wire [3:0] _3988 = 4'b0001;
    wire _3989;
    wire _3993;
    wire [3:0] _3986 = 4'b0000;
    wire _3987;
    wire _3994;
    wire _4001;
    wire _4002;
    wire _4010;
    wire _4025;
    wire [5:0] _4028;
    wire [5:0] _4228;
    wire [5:0] _4229;
    wire [5:0] _121;
    reg [5:0] seq_a_ir_pc;
    wire [5:0] _2169;
    wire _2173;
    wire [3:0] _2166 = 4'b0000;
    wire _2167;
    wire _2168;
    wire _2174;
    wire _3846;
    wire _3841;
    wire [3:0] _3838 = 4'b0100;
    wire _3839;
    wire _3840;
    wire _3842;
    wire [15:0] _3829 = 16'b1111111111111111;
    wire [15:0] _3827 = 16'b0000000000000000;
    wire [15:0] _3826 = 16'b0000000000000000;
    wire [15:0] _4259 = 16'b0000000000000000;
    wire [7:0] _4255;
    wire [15:0] _4256;
    wire [7:0] _4252 = 8'b00000000;
    wire [15:0] _4253;
    wire [15:0] _4249 = 16'b0000000000000001;
    wire [15:0] _4250;
    wire [15:0] _4245 = 16'b0000000000000000;
    wire _4246;
    wire _4247;
    wire [3:0] _4242 = 4'b0010;
    wire _4243;
    wire _4244;
    wire _4248;
    wire [15:0] _4251;
    wire [3:0] _4239 = 4'b0001;
    wire _4240;
    wire [3:0] _4236 = 4'b0101;
    wire _4237;
    wire _4238;
    wire _4241;
    wire [15:0] _4254;
    wire [3:0] _4233 = 4'b1001;
    wire _4234;
    wire [3:0] _4230 = 4'b0101;
    wire _4231;
    wire _4232;
    wire _4235;
    wire [15:0] _4257;
    wire [15:0] _4258;
    wire [15:0] _4260;
    wire [15:0] _122;
    reg [15:0] seq_a_y;
    wire [15:0] _3824 = 16'b0000000000000000;
    wire [15:0] _3823 = 16'b0000000000000000;
    wire [15:0] _4290 = 16'b0000000000000000;
    wire [7:0] _4286;
    wire [15:0] _4287;
    wire [7:0] _4283 = 8'b00000000;
    wire [15:0] _4284;
    wire [15:0] _4280 = 16'b0000000000000001;
    wire [15:0] _4281;
    wire [15:0] _4276 = 16'b0000000000000000;
    wire _4277;
    wire _4278;
    wire [3:0] _4273 = 4'b0001;
    wire [3:0] _2165;
    wire _4274;
    wire [3:0] _2162 = 4'b0100;
    wire _2163;
    wire _2164;
    wire _4275;
    wire _4279;
    wire [15:0] _4282;
    wire [3:0] _4270 = 4'b0000;
    wire _4271;
    wire [3:0] _4267 = 4'b0101;
    wire _4268;
    wire _4269;
    wire _4272;
    wire [15:0] _4285;
    wire [3:0] _4264 = 4'b1000;
    wire _4265;
    wire [3:0] _4261 = 4'b0101;
    wire _4262;
    wire _4263;
    wire _4266;
    wire [15:0] _4288;
    wire [15:0] _4289;
    wire [15:0] _4291;
    wire [15:0] _123;
    reg [15:0] seq_a_x;
    wire [15:0] _3822 = 16'b1111111111111111;
    reg [15:0] _3830;
    wire [15:0] _3820 = 16'b0000000000000000;
    wire [15:0] _3819 = 16'b0000000000000000;
    wire [15:0] _4300 = 16'b0000000000000000;
    wire [15:0] _4297 = 16'b0000000000000001;
    wire [15:0] _4298;
    wire [15:0] _4296 = 16'b0000000000000000;
    wire _4294;
    wire _4292;
    wire _4293;
    wire _4295;
    wire [15:0] _4299;
    wire [15:0] _4301;
    wire [15:0] _124;
    reg [15:0] seq_a_wait_count;
    wire _3831;
    wire [1:0] _3816 = 2'b00;
    wire [1:0] _3815;
    wire _3817;
    wire _3818;
    wire _3832;
    wire _3813;
    wire _3811;
    wire _3810;
    wire _3809;
    wire _3808;
    wire _3807;
    wire _3806;
    wire _3805;
    wire [7:0] _745 = 8'b00000000;
    wire [7:0] _744 = 8'b00000000;
    wire [7:0] _742 = 8'b00000000;
    wire [7:0] _741 = 8'b00000000;
    wire [7:0] _126;
    reg [7:0] pins_sync1;
    reg [7:0] pins_sync;
    wire _3804;
    wire [2:0] _3694;
    wire [2:0] _3692;
    wire [2:0] _3691;
    wire [2:0] _3695;
    wire [2:0] _3801;
    wire [1:0] _3802;
    reg [2:0] _3803;
    reg _3812;
    wire _3814;
    wire _3833;
    wire _3799 = 1'b0;
    wire _3798 = 1'b0;
    wire [23:0] _4353 = 24'b000000000000000000000000;
    wire _4354;
    wire [23:0] _4349 = 24'b000000000000000000000001;
    wire [23:0] _4350;
    wire [23:0] _4351;
    wire _4352;
    wire _4355;
    wire [23:0] _4332 = 24'b000000000000000000000000;
    wire _4333;
    wire [23:0] _4328 = 24'b000000000000000000000001;
    wire [23:0] _4329;
    wire [23:0] _4330;
    wire _4331;
    wire _4334;
    wire _4356;
    wire _4357;
    wire [23:0] _4311 = 24'b000000000000000000000000;
    wire _4312;
    wire [23:0] _4307 = 24'b000000000000000000000001;
    wire [23:0] _4308;
    wire [23:0] _4309;
    wire _4310;
    wire _4313;
    wire _4305;
    wire _4303;
    wire _4302;
    wire _4304;
    wire _4306;
    wire _4358;
    wire _4359;
    wire _127;
    reg seq_a_caught_up;
    wire _3834;
    wire _3835;
    wire _3836;
    wire [2:0] _3788 = 3'b000;
    wire [2:0] _3787 = 3'b000;
    wire [2:0] _3924 = 3'b000;
    wire _3925;
    wire _128;
    wire _3926;
    wire [1:0] _4363 = 2'b00;
    wire [2:0] _4364;
    wire [2:0] _3887 = 3'b100;
    wire _3888;
    wire [6:0] _3884 = 7'b1000011;
    wire _3885;
    wire _3886;
    wire _3889;
    wire [1:0] _4360 = 2'b00;
    wire [2:0] _4361;
    wire [2:0] _4362;
    wire [2:0] _4365;
    wire [2:0] _129;
    reg [2:0] _3789;
    wire [2:0] _3786 = 3'b000;
    wire _3790;
    wire _3785;
    wire _3791;
    wire _3792;
    wire _3782 = 1'b0;
    wire _3781;
    wire _3783;
    wire [3:0] _3778 = 4'b0111;
    wire _3779;
    wire _3780;
    wire _3784;
    wire _3793;
    wire _2202 = 1'b0;
    wire _2201 = 1'b0;
    wire _4390;
    wire _4389;
    wire _4391;
    wire [23:0] _2213 = 24'b000000000000000000000000;
    wire [23:0] _2212 = 24'b000000000000000000000000;
    wire [23:0] _4383 = 24'b000000000000000001000000;
    wire [23:0] _4384;
    wire [23:0] _231 = 24'b000000000000000000000000;
    wire [23:0] _230 = 24'b000000000000000000000000;
    wire [23:0] _4366 = 24'b000000000000000000000001;
    wire [23:0] _4367;
    wire [23:0] _130;
    reg [23:0] timebase;
    wire [5:0] _4324 = 6'b000000;
    wire [17:0] _4323;
    wire [23:0] _4325;
    wire [3:0] _4321 = 4'b0000;
    wire [19:0] _4320;
    wire [23:0] _4322;
    wire [1:0] _4318 = 2'b00;
    wire [21:0] _4317;
    wire [23:0] _4319;
    wire [11:0] _4315;
    wire [11:0] _4314 = 12'b000000000000;
    wire [23:0] _4316;
    reg [23:0] _4326;
    wire [23:0] _4327;
    wire [5:0] _4345 = 6'b000000;
    wire [17:0] _4344;
    wire [23:0] _4346;
    wire [3:0] _4342 = 4'b0000;
    wire [19:0] _4341;
    wire [23:0] _4343;
    wire [1:0] _4339 = 2'b00;
    wire [21:0] _4338;
    wire [23:0] _4340;
    wire [5:0] _4336;
    wire [17:0] _4335 = 18'b000000000000000000;
    wire [23:0] _4337;
    wire [1:0] _2216 = 2'b00;
    wire [1:0] _2215 = 2'b00;
    wire [1:0] _4377 = 2'b00;
    wire [7:0] _3878;
    wire [1:0] _4374;
    wire [3:0] _4371 = 4'b0111;
    wire [3:0] _3874;
    wire _4372;
    wire [3:0] _4368 = 4'b0101;
    wire _4369;
    wire _4370;
    wire _4373;
    wire [1:0] _4375;
    wire [1:0] _4376;
    wire [1:0] _4378;
    wire [1:0] _131;
    reg [1:0] seq_a_prescale;
    reg [23:0] _4347;
    wire [23:0] _4348;
    wire [23:0] _4379;
    wire [23:0] _4380;
    wire [3:0] _3795 = 4'b0011;
    wire _3796;
    wire _3797;
    wire [23:0] _4381;
    wire [23:0] _4382;
    wire [23:0] _4385;
    wire [23:0] _132;
    reg [23:0] seq_a_sched_s;
    wire [23:0] _4386;
    wire _4387;
    wire _4388;
    wire _4392;
    wire _4393;
    wire _133;
    reg seq_a_far;
    wire _3773;
    wire [3:0] _3769 = 4'b0010;
    wire _3770;
    wire _3771;
    wire _3772;
    wire _3774;
    wire _3775;
    wire [3:0] _3766 = 4'b0010;
    wire _3767;
    wire _3768;
    wire _3776;
    wire _3764;
    wire [3:0] _3761 = 4'b0001;
    wire [3:0] _2161;
    wire _3762;
    wire _3763;
    wire _3765;
    wire _3777;
    wire _3794;
    wire _3837;
    wire _3843;
    wire _3844;
    wire _3845;
    wire _3847;
    wire _3849;
    wire [15:0] _4394;
    wire [15:0] _4395;
    wire [15:0] _134;
    reg [15:0] seq_a_ir;
    wire [3:0] _1988;
    wire _1990;
    wire _1995;
    wire _2031;
    wire _2035;
    wire _2072;
    wire _2101;
    wire _2141;
    wire _2158;
    wire _2159;
    wire _2160;
    wire _4397;
    wire _4398;
    wire _135;
    reg seq_a_running;
    wire _2199;
    wire _2200;
    wire _2205;
    wire _2208;
    wire [1:0] _4399 = 2'b00;
    wire [2:0] _4400;
    wire [2:0] _4401;
    wire [2:0] _4402;
    wire [2:0] _136;
    reg [2:0] queue_a_count;
    wire [2:0] _189 = 3'b000;
    wire _212;
    wire _240;
    wire _4410;
    wire _4415;
    wire _4417;
    wire _4429;
    wire _4441;
    wire _4453;
    wire _4454;
    wire _283 = 1'b0;
    wire _282 = 1'b0;
    wire _280;
    wire _281;
    reg ctrl_bit3;
    wire _207 = 1'b0;
    wire _206 = 1'b0;
    wire _204;
    wire _205;
    reg ctrl_bit0;
    wire _4403;
    wire _4455;
    wire _137;
    reg _4406;
    wire _4462 = 1'b0;
    wire _4461 = 1'b0;
    wire [5:0] _4502 = 6'b101000;
    wire _4503;
    wire _4504;
    wire [5:0] _4498 = 6'b000000;
    wire _4499;
    wire _4500;
    wire _4494 = 1'b0;
    wire _4493 = 1'b0;
    reg _4495;
    wire _4496;
    wire _4497;
    wire _4501;
    wire _4505;
    wire [5:0] _4488 = 6'b101000;
    wire _4489;
    wire _4490;
    wire _4491;
    wire _4492;
    wire _4506;
    wire _4459 = 1'b0;
    wire _4458 = 1'b0;
    wire _4456;
    wire [6:0] _198 = 7'b1000000;
    wire _199;
    wire _200;
    wire _4457;
    reg ctrl_bit4;
    wire _138;
    wire _4507;
    wire _139;
    reg _4463;
    wire [31:0] _4609;
    wire [31:0] _4599 = 32'b00000000000000000000000000000000;
    wire [6:0] _3199 = 7'b1000010;
    wire _3200;
    wire _3201;
    wire [23:0] _3198 = 24'b000000000000000000000000;
    wire [23:0] _3197 = 24'b000000000000000000000000;
    wire [23:0] _3196;
    reg [23:0] _3202;
    wire [7:0] _4597 = 8'b00000000;
    wire [31:0] _4598;
    wire [6:0] _3687 = 7'b1000001;
    wire _3688;
    wire _192 = 1'b0;
    wire _191 = 1'b0;
    wire _4512;
    wire _4513;
    wire _4514;
    wire _140;
    reg spi_wr;
    wire _3689;
    wire [11:0] _3686 = 12'b000000000000;
    wire [11:0] _3685 = 12'b000000000000;
    wire [31:0] _202 = 32'b00000000000000000000000000000000;
    wire [31:0] _201 = 32'b00000000000000000000000000000000;
    wire [5:0] _4508 = 6'b100111;
    wire _4509;
    wire _4511;
    wire [31:0] _4527;
    wire [31:0] _4528;
    wire [31:0] _4529;
    wire [31:0] _141;
    reg [31:0] spi_wdata;
    wire [11:0] _3684;
    reg [11:0] _3690;
    wire [19:0] _4595 = 20'b00000000000000000000;
    wire [31:0] _4596;
    wire [31:0] _4594 = 32'b00000000000000000000000000000000;
    wire [31:0] _4593 = 32'b00000000000000000000000000000000;
    wire [31:0] _4592 = 32'b00000000000000000000000000000000;
    wire [31:0] _4591 = 32'b00000000000000000000000000000000;
    wire [31:0] _4590 = 32'b00000000000000000000000000000000;
    wire [31:0] _4589 = 32'b00000000000000000000000000000000;
    wire [31:0] _4588 = 32'b00000000000000000000000000000000;
    wire [31:0] _4587 = 32'b00000000000000000000000000000000;
    wire [31:0] _4586 = 32'b00000000000000000000000000000000;
    wire [31:0] _4585 = 32'b00000000000000000000000000000000;
    wire [31:0] _4584 = 32'b00000000000000000000000000000000;
    wire [31:0] _4583 = 32'b00000000000000000000000000000000;
    wire [31:0] _4582 = 32'b00000000000000000000000000000000;
    wire [31:0] _4581 = 32'b00000000000000000000000000000000;
    wire [31:0] _4580 = 32'b00000000000000000000000000000000;
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
    wire [6:0] _197;
    reg [31:0] _4677;
    wire [31:0] _142;
    wire _4696;
    wire _4694 = 1'b0;
    wire _4693 = 1'b0;
    wire _4680;
    wire gnd = 1'b0;
    wire _4681;
    wire _4682;
    wire _143;
    reg spi_load;
    wire _4697;
    wire [31:0] _4701;
    wire [31:0] _4705;
    wire [31:0] _4706;
    wire [31:0] _144;
    reg [31:0] spi_out;
    wire _4725;
    wire [7:0] _195 = 8'b00000000;
    wire [7:0] _194 = 8'b00000000;
    wire _4524 = 1'b0;
    wire _4523 = 1'b0;
    wire _4521 = 1'b0;
    wire _4520 = 1'b0;
    wire _4519;
    reg _4522;
    reg _4525;
    wire [31:0] _4516 = 32'b00000000000000000000000000000000;
    wire [31:0] _4515 = 32'b00000000000000000000000000000000;
    wire [31:0] _4707;
    wire [31:0] _4708;
    wire [31:0] _145;
    reg [31:0] spi_shift_in;
    wire [30:0] _4518;
    wire [31:0] _4526;
    wire [7:0] _4709;
    wire [5:0] _4678 = 6'b000111;
    wire _4679;
    wire [7:0] _4710;
    wire [7:0] _4711;
    wire [7:0] _4712;
    wire [7:0] _146;
    reg [7:0] spi_cmd;
    wire _4510;
    wire _4691;
    wire [5:0] _4687 = 6'b001000;
    wire [5:0] _4486 = 6'b000000;
    wire [5:0] _4485 = 6'b000000;
    wire [5:0] _4720 = 6'b000000;
    wire [5:0] _4716 = 6'b000001;
    wire [5:0] _4717;
    wire [5:0] _4713 = 6'b111111;
    wire _4714;
    wire _4715;
    wire [5:0] _4718;
    wire _4483;
    wire _4474;
    wire _4475;
    wire _4484;
    wire [5:0] _4719;
    wire [5:0] _4721;
    wire [5:0] _147;
    reg [5:0] spi_bitcnt;
    wire _4688;
    wire _4689;
    wire _4685;
    wire _4472 = 1'b0;
    wire _162 = 1'b0;
    wire _161 = 1'b0;
    wire _158 = 1'b0;
    wire _157 = 1'b0;
    wire _149;
    reg _160;
    reg _163;
    wire _164;
    wire _4471 = 1'b0;
    reg _4473;
    wire _4469 = 1'b0;
    wire _4468 = 1'b0;
    wire _4466 = 1'b0;
    wire _4465 = 1'b0;
    wire _4464;
    reg _4467;
    reg _4470;
    wire _4683;
    wire _4684;
    wire _4686;
    wire _4690;
    wire _4692;
    wire _4726;
    wire _4481 = 1'b0;
    wire _4480 = 1'b0;
    wire vdd = 1'b1;
    wire _4478 = 1'b0;
    wire _4477 = 1'b0;
    wire _151;
    wire [7:0] _153;
    wire _4476;
    reg _4479;
    reg _4482;
    wire _4727;
    wire _154;
    reg spi_miso;
    wire [7:0] _4738;

    /* logic */
    assign _364 = _260 == _363;
    assign _361 = _271 == _360;
    assign _358 = _333 == _357;
    assign _355 = _344 == _354;
    assign _350 = _343 & _349;
    assign _356 = _350 ? _355 : pin0_out;
    assign _339 = _332 & _338;
    assign _359 = _339 ? _358 : _356;
    assign _277 = _270 & _276;
    assign _362 = _277 ? _361 : _359;
    assign _266 = _259 & _265;
    assign _365 = _266 ? _364 : _362;
    assign _2 = _365;
    always @(posedge _151) begin
        if (_164)
            pin0_out <= _352;
        else
            pin0_out <= _2;
    end
    assign _415 = _260 == _414;
    assign _412 = _271 == _411;
    assign _409 = _333 == _408;
    assign _406 = _344 == _405;
    assign _401 = _395 & _400;
    assign _407 = _401 ? _406 : pin1_out;
    assign _392 = _386 & _391;
    assign _410 = _392 ? _409 : _407;
    assign _383 = _377 & _382;
    assign _413 = _383 ? _412 : _410;
    assign _374 = _368 & _373;
    assign _416 = _374 ? _415 : _413;
    assign _3 = _416;
    always @(posedge _151) begin
        if (_164)
            pin1_out <= _403;
        else
            pin1_out <= _3;
    end
    assign _466 = _260 == _465;
    assign _463 = _271 == _462;
    assign _460 = _333 == _459;
    assign _457 = _344 == _456;
    assign _452 = _446 & _451;
    assign _458 = _452 ? _457 : pin2_out;
    assign _443 = _437 & _442;
    assign _461 = _443 ? _460 : _458;
    assign _434 = _428 & _433;
    assign _464 = _434 ? _463 : _461;
    assign _425 = _419 & _424;
    assign _467 = _425 ? _466 : _464;
    assign _4 = _467;
    always @(posedge _151) begin
        if (_164)
            pin2_out <= _454;
        else
            pin2_out <= _4;
    end
    assign _517 = _260 == _516;
    assign _514 = _271 == _513;
    assign _511 = _333 == _510;
    assign _508 = _344 == _507;
    assign _503 = _497 & _502;
    assign _509 = _503 ? _508 : pin3_out;
    assign _494 = _488 & _493;
    assign _512 = _494 ? _511 : _509;
    assign _485 = _479 & _484;
    assign _515 = _485 ? _514 : _512;
    assign _476 = _470 & _475;
    assign _518 = _476 ? _517 : _515;
    assign _5 = _518;
    always @(posedge _151) begin
        if (_164)
            pin3_out <= _505;
        else
            pin3_out <= _5;
    end
    assign _568 = _260 == _567;
    assign _565 = _271 == _564;
    assign _562 = _333 == _561;
    assign _559 = _344 == _558;
    assign _554 = _548 & _553;
    assign _560 = _554 ? _559 : pin4_out;
    assign _545 = _539 & _544;
    assign _563 = _545 ? _562 : _560;
    assign _536 = _530 & _535;
    assign _566 = _536 ? _565 : _563;
    assign _527 = _521 & _526;
    assign _569 = _527 ? _568 : _566;
    assign _6 = _569;
    always @(posedge _151) begin
        if (_164)
            pin4_out <= _556;
        else
            pin4_out <= _6;
    end
    assign _619 = _260 == _618;
    assign _616 = _271 == _615;
    assign _613 = _333 == _612;
    assign _610 = _344 == _609;
    assign _605 = _599 & _604;
    assign _611 = _605 ? _610 : pin5_out;
    assign _596 = _590 & _595;
    assign _614 = _596 ? _613 : _611;
    assign _587 = _581 & _586;
    assign _617 = _587 ? _616 : _614;
    assign _578 = _572 & _577;
    assign _620 = _578 ? _619 : _617;
    assign _7 = _620;
    always @(posedge _151) begin
        if (_164)
            pin5_out <= _607;
        else
            pin5_out <= _7;
    end
    assign _670 = _260 == _669;
    assign _667 = _271 == _666;
    assign _664 = _333 == _663;
    assign _661 = _344 == _660;
    assign _656 = _650 & _655;
    assign _662 = _656 ? _661 : pin6_out;
    assign _647 = _641 & _646;
    assign _665 = _647 ? _664 : _662;
    assign _638 = _632 & _637;
    assign _668 = _638 ? _667 : _665;
    assign _629 = _623 & _628;
    assign _671 = _629 ? _670 : _668;
    assign _8 = _671;
    always @(posedge _151) begin
        if (_164)
            pin6_out <= _658;
        else
            pin6_out <= _8;
    end
    assign _721 = _260 == _720;
    assign _718 = _271 == _717;
    assign _715 = _333 == _714;
    assign _712 = _344 == _711;
    assign _707 = _701 & _706;
    assign _713 = _707 ? _712 : pin7_out;
    assign _698 = _692 & _697;
    assign _716 = _698 ? _715 : _713;
    assign _689 = _683 & _688;
    assign _719 = _689 ? _718 : _716;
    assign _680 = _674 & _679;
    assign _722 = _680 ? _721 : _719;
    assign _9 = _722;
    always @(posedge _151) begin
        if (_164)
            pin7_out <= _709;
        else
            pin7_out <= _9;
    end
    assign _723 = { pin7_out, pin6_out, pin5_out, pin4_out, pin3_out, pin2_out, pin1_out, pin0_out };
    assign _4732 = _4606 == _4731;
    assign _4733 = ~ _4732;
    assign _4728 = _2408 | _2520;
    assign _4729 = _4728 | _2632;
    assign _4730 = _4729 | _2906;
    assign _4734 = { _4730, _1977, _1954, _4733, _2262, _2184, seq_a_halted };
    always @(posedge _151) begin
        if (_164)
            _4737 <= _4736;
        else
            _4737 <= _4734;
    end
    assign _4702 = spi_out[30:0];
    assign _4704 = { _4702, _4703 };
    assign _4655 = { seq_b_y, seq_b_x };
    assign _4654 = { _4653, seq_b_sched_s };
    assign _4651 = { queue_b_count, _4650, seq_b_flag, seq_b_halted, seq_b_running, seq_b_ir_pc };
    assign _4652 = { _4649, _4651 };
    assign _763 = pins_sync[7:7];
    assign _762 = pins_sync[6:6];
    assign _761 = pins_sync[5:5];
    assign _760 = pins_sync[4:4];
    assign _759 = pins_sync[3:3];
    assign _758 = pins_sync[2:2];
    assign _757 = pins_sync[1:1];
    assign _756 = pins_sync[0:0];
    always @* begin
        case (_340)
        0: _764 <= _756;
        1: _764 <= _757;
        2: _764 <= _758;
        3: _764 <= _759;
        4: _764 <= _760;
        5: _764 <= _761;
        6: _764 <= _762;
        default: _764 <= _763;
        endcase
    end
    assign _754 = pins_sync[7:7];
    assign _753 = pins_sync[6:6];
    assign _752 = pins_sync[5:5];
    assign _751 = pins_sync[4:4];
    assign _750 = pins_sync[3:3];
    assign _749 = pins_sync[2:2];
    assign _748 = pins_sync[1:1];
    assign _747 = pins_sync[0:0];
    always @* begin
        case (_329)
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
    assign _765 = _732 ? _764 : _755;
    assign _740 = _739[30:0];
    assign _766 = { _740, _765 };
    assign _767 = _736 ? _766 : _739;
    assign _769 = _729 ? _768 : _767;
    assign _11 = _769;
    always @(posedge _151) begin
        if (_164)
            _739 <= _738;
        else
            _739 <= _11;
    end
    assign _967 = _963 ? vdd : seq_b_halted;
    assign _968 = _948 ? vdd : _967;
    assign _970 = ctrl_bit3 ? gnd : _968;
    assign _12 = _970;
    always @(posedge _151) begin
        if (_164)
            seq_b_halted <= _965;
        else
            seq_b_halted <= _12;
    end
    assign _978 = _319[28:5];
    assign _979 = _978 - timebase;
    assign _980 = _979[23:23];
    assign _981 = _328 & _980;
    assign _974 = _304[28:5];
    assign _975 = _974 - timebase;
    assign _976 = _975[23:23];
    assign _977 = _313 & _976;
    assign _982 = _977 | _981;
    assign _983 = _973 | _982;
    assign _984 = ctrl_bit3 ? gnd : _983;
    assign _13 = _984;
    always @(posedge _151) begin
        if (_164)
            _973 <= _972;
        else
            _973 <= _13;
    end
    assign _1044 = _997 ? _1043 : queue_b_last_due;
    assign _14 = _1044;
    always @(posedge _151) begin
        if (_285)
            queue_b_last_due <= _999;
        else
            queue_b_last_due <= _14;
    end
    assign _1053 = _1043 - queue_b_last_due;
    assign _1054 = _1053[23:23];
    assign _1048 = _997 ? vdd : queue_b_last_valid;
    assign _15 = _1048;
    always @(posedge _151) begin
        if (_285)
            queue_b_last_valid <= _1046;
        else
            queue_b_last_valid <= _15;
    end
    assign _1052 = _997 & queue_b_last_valid;
    assign _1055 = _1052 & _1054;
    assign _1056 = _1051 | _1055;
    assign _1057 = ctrl_bit3 ? gnd : _1056;
    assign _16 = _1057;
    always @(posedge _151) begin
        if (_164)
            _1051 <= _1050;
        else
            _1051 <= _16;
    end
    assign _1066 = _1061 == _1065;
    assign _1063 = _1061[22:22];
    assign _1061 = _1043 - timebase;
    assign _1062 = _1061[23:23];
    assign _1064 = _1062 ^ _1063;
    assign _1067 = _1064 | _1066;
    assign _1068 = _997 & _1067;
    assign _1069 = _1060 | _1068;
    assign _1070 = ctrl_bit3 ? gnd : _1069;
    assign _17 = _1070;
    always @(posedge _151) begin
        if (_164)
            _1060 <= _1059;
        else
            _1060 <= _17;
    end
    assign _1074 = _948 ? vdd : seq_b_trapped;
    assign _1075 = ctrl_bit3 ? gnd : _1074;
    assign _18 = _1075;
    always @(posedge _151) begin
        if (_164)
            seq_b_trapped <= _1072;
        else
            seq_b_trapped <= _18;
    end
    assign _1084 = _1078 + _1083;
    assign _1080 = _1078 == _1079;
    assign _1081 = ~ _1080;
    assign _734 = _333 == _733;
    assign _735 = _328 & _734;
    assign _731 = _344 == _730;
    assign _732 = _313 & _731;
    assign _736 = _732 | _735;
    assign _1082 = _736 & _1081;
    assign _1085 = _1082 ? _1084 : _1078;
    assign _729 = ctrl_bit2 | ctrl_bit3;
    assign _1087 = _729 ? _1086 : _1085;
    assign _19 = _1087;
    always @(posedge _151) begin
        if (_164)
            _1078 <= _1077;
        else
            _1078 <= _19;
    end
    assign _4647 = { _4644, _4406, _4645, _1078, _4646, _3032, seq_b_trapped, queue_b_count, _1060, _1051, _973, seq_b_halted };
    assign _4643 = { _4642, _2933 };
    assign _4641 = { seq_a_y, seq_a_x };
    assign _4640 = { _4639, timebase };
    assign _4638 = { _4637, seq_a_sched_s };
    assign _4635 = { queue_a_count, _4634, seq_a_flag, seq_a_halted, seq_a_running, seq_a_ir_pc };
    assign _4636 = { _4633, _4635 };
    assign _1299 = mon0_intervals + _1298;
    assign _1296 = mon0_intervals == _1295;
    assign _1297 = ~ _1296;
    assign _1300 = _1297 ? _1299 : mon0_intervals;
    assign _1301 = _1291 ? _1300 : mon0_intervals;
    assign _1303 = ctrl_bit1 ? _1302 : _1301;
    assign _20 = _1303;
    always @(posedge _151) begin
        if (_164)
            mon0_intervals <= _1293;
        else
            mon0_intervals <= _20;
    end
    assign _1492 = mon1_intervals + _1491;
    assign _1489 = mon1_intervals == _1488;
    assign _1490 = ~ _1489;
    assign _1493 = _1490 ? _1492 : mon1_intervals;
    assign _1494 = _1484 ? _1493 : mon1_intervals;
    assign _1496 = ctrl_bit1 ? _1495 : _1494;
    assign _21 = _1496;
    always @(posedge _151) begin
        if (_164)
            mon1_intervals <= _1486;
        else
            mon1_intervals <= _21;
    end
    assign _1685 = mon2_intervals + _1684;
    assign _1682 = mon2_intervals == _1681;
    assign _1683 = ~ _1682;
    assign _1686 = _1683 ? _1685 : mon2_intervals;
    assign _1687 = _1677 ? _1686 : mon2_intervals;
    assign _1689 = ctrl_bit1 ? _1688 : _1687;
    assign _22 = _1689;
    always @(posedge _151) begin
        if (_164)
            mon2_intervals <= _1679;
        else
            mon2_intervals <= _22;
    end
    assign _1878 = mon3_intervals + _1877;
    assign _1875 = mon3_intervals == _1874;
    assign _1876 = ~ _1875;
    assign _1879 = _1876 ? _1878 : mon3_intervals;
    assign _1880 = _1870 ? _1879 : mon3_intervals;
    assign _1882 = ctrl_bit1 ? _1881 : _1880;
    assign _23 = _1882;
    always @(posedge _151) begin
        if (_164)
            mon3_intervals <= _1872;
        else
            mon3_intervals <= _23;
    end
    assign _4629 = { mon3_intervals, mon2_intervals, mon1_intervals, mon0_intervals };
    assign _1886 = mon3_count_cycles < mon3_min_seen;
    assign _1887 = _1886 ? mon3_count_cycles : mon3_min_seen;
    assign _1888 = _1870 ? _1887 : mon3_min_seen;
    assign _1890 = ctrl_bit1 ? _1889 : _1888;
    assign _24 = _1890;
    always @(posedge _151) begin
        if (_164)
            mon3_min_seen <= _1884;
        else
            mon3_min_seen <= _24;
    end
    assign _1894 = mon3_max_seen < mon3_count_cycles;
    assign _1895 = _1894 ? mon3_count_cycles : mon3_max_seen;
    assign _1870 = _1777 | _1869;
    assign _1896 = _1870 ? _1895 : mon3_max_seen;
    assign _1898 = ctrl_bit1 ? _1897 : _1896;
    assign _25 = _1898;
    always @(posedge _151) begin
        if (_164)
            mon3_max_seen <= _1892;
        else
            mon3_max_seen <= _25;
    end
    assign _4628 = { mon3_max_seen, mon3_min_seen };
    assign _1902 = mon2_count_cycles < mon2_min_seen;
    assign _1903 = _1902 ? mon2_count_cycles : mon2_min_seen;
    assign _1904 = _1677 ? _1903 : mon2_min_seen;
    assign _1906 = ctrl_bit1 ? _1905 : _1904;
    assign _26 = _1906;
    always @(posedge _151) begin
        if (_164)
            mon2_min_seen <= _1900;
        else
            mon2_min_seen <= _26;
    end
    assign _1910 = mon2_max_seen < mon2_count_cycles;
    assign _1911 = _1910 ? mon2_count_cycles : mon2_max_seen;
    assign _1677 = _1584 | _1676;
    assign _1912 = _1677 ? _1911 : mon2_max_seen;
    assign _1914 = ctrl_bit1 ? _1913 : _1912;
    assign _27 = _1914;
    always @(posedge _151) begin
        if (_164)
            mon2_max_seen <= _1908;
        else
            mon2_max_seen <= _27;
    end
    assign _4627 = { mon2_max_seen, mon2_min_seen };
    assign _1918 = mon1_count_cycles < mon1_min_seen;
    assign _1919 = _1918 ? mon1_count_cycles : mon1_min_seen;
    assign _1920 = _1484 ? _1919 : mon1_min_seen;
    assign _1922 = ctrl_bit1 ? _1921 : _1920;
    assign _28 = _1922;
    always @(posedge _151) begin
        if (_164)
            mon1_min_seen <= _1916;
        else
            mon1_min_seen <= _28;
    end
    assign _1926 = mon1_max_seen < mon1_count_cycles;
    assign _1927 = _1926 ? mon1_count_cycles : mon1_max_seen;
    assign _1484 = _1391 | _1483;
    assign _1928 = _1484 ? _1927 : mon1_max_seen;
    assign _1930 = ctrl_bit1 ? _1929 : _1928;
    assign _29 = _1930;
    always @(posedge _151) begin
        if (_164)
            mon1_max_seen <= _1924;
        else
            mon1_max_seen <= _29;
    end
    assign _4626 = { mon1_max_seen, mon1_min_seen };
    assign _1934 = mon0_count_cycles < mon0_min_seen;
    assign _1935 = _1934 ? mon0_count_cycles : mon0_min_seen;
    assign _1936 = _1291 ? _1935 : mon0_min_seen;
    assign _1938 = ctrl_bit1 ? _1937 : _1936;
    assign _30 = _1938;
    always @(posedge _151) begin
        if (_164)
            mon0_min_seen <= _1932;
        else
            mon0_min_seen <= _30;
    end
    assign _1942 = mon0_max_seen < mon0_count_cycles;
    assign _1943 = _1942 ? mon0_count_cycles : mon0_max_seen;
    assign _1291 = _1198 | _1290;
    assign _1944 = _1291 ? _1943 : mon0_max_seen;
    assign _1946 = ctrl_bit1 ? _1945 : _1944;
    assign _31 = _1946;
    always @(posedge _151) begin
        if (_164)
            mon0_max_seen <= _1940;
        else
            mon0_max_seen <= _31;
    end
    assign _4625 = { mon0_max_seen, mon0_min_seen };
    assign _4620 = { _4619, _3288 };
    assign _4611 = _153[7:3];
    always @(posedge _151) begin
        _4614 <= _4611;
    end
    always @(posedge _151) begin
        _4617 <= _4614;
    end
    assign _4618 = { _4610, _4617 };
    assign _1975 = pins_sync[7:7];
    assign _1974 = pins_sync[6:6];
    assign _1973 = pins_sync[5:5];
    assign _1972 = pins_sync[4:4];
    assign _1971 = pins_sync[3:3];
    assign _1970 = pins_sync[2:2];
    assign _1969 = pins_sync[1:1];
    assign _1968 = pins_sync[0:0];
    always @* begin
        case (_267)
        0: _1976 <= _1968;
        1: _1976 <= _1969;
        2: _1976 <= _1970;
        3: _1976 <= _1971;
        4: _1976 <= _1972;
        5: _1976 <= _1973;
        6: _1976 <= _1974;
        default: _1976 <= _1975;
        endcase
    end
    assign _1966 = pins_sync[7:7];
    assign _1965 = pins_sync[6:6];
    assign _1964 = pins_sync[5:5];
    assign _1963 = pins_sync[4:4];
    assign _1962 = pins_sync[3:3];
    assign _1961 = pins_sync[2:2];
    assign _1960 = pins_sync[1:1];
    assign _1959 = pins_sync[0:0];
    always @* begin
        case (_256)
        0: _1967 <= _1959;
        1: _1967 <= _1960;
        2: _1967 <= _1961;
        3: _1967 <= _1962;
        4: _1967 <= _1963;
        5: _1967 <= _1964;
        6: _1967 <= _1965;
        default: _1967 <= _1966;
        endcase
    end
    assign _1977 = _1950 ? _1976 : _1967;
    assign _1958 = _1957[30:0];
    assign _1978 = { _1958, _1977 };
    assign _1979 = _1954 ? _1978 : _1957;
    assign _1981 = _1947 ? _1980 : _1979;
    assign _32 = _1981;
    always @(posedge _151) begin
        if (_164)
            _1957 <= _1956;
        else
            _1957 <= _32;
    end
    assign _2179 = _2175 ? vdd : seq_a_halted;
    assign _2180 = _2160 ? vdd : _2179;
    assign _2181 = ctrl_bit0 ? gnd : _2180;
    assign _33 = _2181;
    always @(posedge _151) begin
        if (_164)
            seq_a_halted <= _2177;
        else
            seq_a_halted <= _33;
    end
    assign _2189 = _246[28:5];
    assign _2190 = _2189 - timebase;
    assign _2191 = _2190[23:23];
    assign _2192 = _255 & _2191;
    assign _2185 = _228[28:5];
    assign _2186 = _2185 - timebase;
    assign _2187 = _2186[23:23];
    assign _2188 = _240 & _2187;
    assign _2193 = _2188 | _2192;
    assign _2194 = _2184 | _2193;
    assign _2195 = ctrl_bit0 ? gnd : _2194;
    assign _34 = _2195;
    always @(posedge _151) begin
        if (_164)
            _2184 <= _2183;
        else
            _2184 <= _34;
    end
    assign _2255 = _2208 ? _2254 : queue_a_last_due;
    assign _35 = _2255;
    always @(posedge _151) begin
        if (_209)
            queue_a_last_due <= _2210;
        else
            queue_a_last_due <= _35;
    end
    assign _2264 = _2254 - queue_a_last_due;
    assign _2265 = _2264[23:23];
    assign _2259 = _2208 ? vdd : queue_a_last_valid;
    assign _36 = _2259;
    always @(posedge _151) begin
        if (_209)
            queue_a_last_valid <= _2257;
        else
            queue_a_last_valid <= _36;
    end
    assign _2263 = _2208 & queue_a_last_valid;
    assign _2266 = _2263 & _2265;
    assign _2267 = _2262 | _2266;
    assign _2268 = ctrl_bit0 ? gnd : _2267;
    assign _37 = _2268;
    always @(posedge _151) begin
        if (_164)
            _2262 <= _2261;
        else
            _2262 <= _37;
    end
    assign _2277 = _2272 == _2276;
    assign _2274 = _2272[22:22];
    assign _2272 = _2254 - timebase;
    assign _2273 = _2272[23:23];
    assign _2275 = _2273 ^ _2274;
    assign _2278 = _2275 | _2277;
    assign _2279 = _2208 & _2278;
    assign _2280 = _2271 | _2279;
    assign _2281 = ctrl_bit0 ? gnd : _2280;
    assign _38 = _2281;
    always @(posedge _151) begin
        if (_164)
            _2271 <= _2270;
        else
            _2271 <= _38;
    end
    assign _2285 = _2160 ? vdd : seq_a_trapped;
    assign _2286 = ctrl_bit0 ? gnd : _2285;
    assign _39 = _2286;
    always @(posedge _151) begin
        if (_164)
            seq_a_trapped <= _2283;
        else
            seq_a_trapped <= _39;
    end
    assign _2295 = _2289 + _2294;
    assign _2291 = _2289 == _2290;
    assign _2292 = ~ _2291;
    assign _1952 = _260 == _1951;
    assign _1953 = _255 & _1952;
    assign _1949 = _271 == _1948;
    assign _1950 = _240 & _1949;
    assign _1954 = _1950 | _1953;
    assign _2293 = _1954 & _2292;
    assign _2296 = _2293 ? _2295 : _2289;
    assign _724 = spi_wdata[2:2];
    assign _725 = _200 & _724;
    always @(posedge _151) begin
        if (_164)
            ctrl_bit2 <= _727;
        else
            ctrl_bit2 <= _725;
    end
    assign _1947 = ctrl_bit2 | ctrl_bit0;
    assign _2298 = _1947 ? _2297 : _2296;
    assign _40 = _2298;
    always @(posedge _151) begin
        if (_164)
            _2289 <= _2288;
        else
            _2289 <= _40;
    end
    assign _2406 = _1198 & _1212;
    assign _2403 = _1206[15:0];
    assign _2404 = mon0_count_cycles < _2403;
    assign _2401 = _1101[1:1];
    assign _1192 = _1184[7:7];
    assign _1191 = _1184[6:6];
    assign _1190 = _1184[5:5];
    assign _1189 = _1184[4:4];
    assign _1188 = _1184[3:3];
    assign _1187 = _1184[2:2];
    assign _1186 = _1184[1:1];
    assign _1185 = _1184[0:0];
    always @* begin
        case (_1114)
        0: _1193 <= _1185;
        1: _1193 <= _1186;
        2: _1193 <= _1187;
        3: _1193 <= _1188;
        4: _1193 <= _1189;
        5: _1193 <= _1190;
        6: _1193 <= _1191;
        default: _1193 <= _1192;
        endcase
    end
    assign _1194 = ~ _1193;
    assign _1179 = _1171[7:7];
    assign _1178 = _1171[6:6];
    assign _1177 = _1171[5:5];
    assign _1176 = _1171[4:4];
    assign _1175 = _1171[3:3];
    assign _1174 = _1171[2:2];
    assign _1173 = _1171[1:1];
    assign _1172 = _1171[0:0];
    always @* begin
        case (_1114)
        0: _1180 <= _1172;
        1: _1180 <= _1173;
        2: _1180 <= _1174;
        3: _1180 <= _1175;
        4: _1180 <= _1176;
        5: _1180 <= _1177;
        6: _1180 <= _1178;
        default: _1180 <= _1179;
        endcase
    end
    assign _1181 = ~ _1180;
    assign _1195 = _1181 & _1194;
    assign _1164 = _1101[4:4];
    assign _1165 = ~ _1164;
    assign _1196 = _1165 | _1195;
    assign _1160 = _1112[20:20];
    assign _1158 = _1123[7:7];
    assign _1157 = _1123[6:6];
    assign _1156 = _1123[5:5];
    assign _1155 = _1123[4:4];
    assign _1154 = _1123[3:3];
    assign _1153 = _1123[2:2];
    assign _1152 = _1123[1:1];
    assign _1151 = _1123[0:0];
    assign _1150 = _1112[19:17];
    always @* begin
        case (_1150)
        0: _1159 <= _1151;
        1: _1159 <= _1152;
        2: _1159 <= _1153;
        3: _1159 <= _1154;
        4: _1159 <= _1155;
        5: _1159 <= _1156;
        6: _1159 <= _1157;
        default: _1159 <= _1158;
        endcase
    end
    assign _1161 = _1159 == _1160;
    assign _1148 = _1112[16:16];
    assign _1149 = ~ _1148;
    assign _1162 = _1149 | _1161;
    assign _1146 = _1132 ^ _1142;
    assign _1144 = ~ _1142;
    assign _1145 = _1132 & _1144;
    assign _1141 = _1120[7:7];
    assign _1140 = _1120[6:6];
    assign _1139 = _1120[5:5];
    assign _1138 = _1120[4:4];
    assign _1137 = _1120[3:3];
    assign _1136 = _1120[2:2];
    assign _1135 = _1120[1:1];
    assign _1134 = _1120[0:0];
    always @* begin
        case (_1114)
        0: _1142 <= _1134;
        1: _1142 <= _1135;
        2: _1142 <= _1136;
        3: _1142 <= _1137;
        4: _1142 <= _1138;
        5: _1142 <= _1139;
        6: _1142 <= _1140;
        default: _1142 <= _1141;
        endcase
    end
    assign _1131 = _1123[7:7];
    assign _1130 = _1123[6:6];
    assign _1129 = _1123[5:5];
    assign _1128 = _1123[4:4];
    assign _1127 = _1123[3:3];
    assign _1126 = _1123[2:2];
    assign _1125 = _1123[1:1];
    assign _1124 = _1123[0:0];
    assign _1114 = _1112[13:11];
    always @* begin
        case (_1114)
        0: _1132 <= _1124;
        1: _1132 <= _1125;
        2: _1132 <= _1126;
        3: _1132 <= _1127;
        4: _1132 <= _1128;
        5: _1132 <= _1129;
        6: _1132 <= _1130;
        default: _1132 <= _1131;
        endcase
    end
    assign _1133 = ~ _1132;
    assign _1143 = _1133 & _1142;
    assign _1113 = _1112[15:14];
    always @* begin
        case (_1113)
        0: _1147 <= _1143;
        1: _1147 <= _1145;
        2: _1147 <= _1146;
        default: _1147 <= gnd;
        endcase
    end
    assign _1163 = _1147 & _1162;
    assign _1197 = _1163 & _1196;
    assign _2371 = _1112[0:0];
    assign _1289 = ~ _1288;
    assign _1214 = ~ _1198;
    assign _2394 = mon0_count_cycles + _2393;
    assign _2390 = mon0_count_cycles == _2389;
    assign _2391 = ~ _2390;
    assign _2386 = _2378 == _2385;
    assign _2382 = _2378[7:0];
    assign _2384 = _2382 == _2383;
    assign _2379 = _2378[3:0];
    assign _2381 = _2379 == _2380;
    assign _2375 = _1101[7:6];
    always @* begin
        case (_2375)
        0: _2387 <= vdd;
        1: _2387 <= _2381;
        2: _2387 <= _2384;
        default: _2387 <= _2386;
        endcase
    end
    assign _2388 = _2370 & _2387;
    assign _2392 = _2388 & _2391;
    assign _2395 = _2392 ? _2394 : mon0_count_cycles;
    assign _2397 = _2374 ? _2396 : _2395;
    assign _2398 = ctrl_bit1 ? mon0_count_cycles : _2397;
    assign _41 = _2398;
    always @(posedge _151) begin
        if (_164)
            mon0_count_cycles <= _1209;
        else
            mon0_count_cycles <= _41;
    end
    assign _1204 = _197 == _1203;
    assign _1205 = spi_wr & _1204;
    always @(posedge _151) begin
        if (_164)
            _1206 <= _1202;
        else
            if (_1205)
                _1206 <= spi_wdata;
    end
    assign _1207 = _1206[31:16];
    assign _1211 = _1207 < mon0_count_cycles;
    assign _1200 = _1101[2:2];
    assign _1212 = _1200 & _1211;
    assign _1199 = _1102 & mon0_armed;
    assign _1213 = _1199 & _1212;
    assign _1215 = _1213 & _1214;
    assign _1290 = _1215 & _1289;
    assign _1287 = ~ _1198;
    assign _1280 = _1184[7:7];
    assign _1279 = _1184[6:6];
    assign _1278 = _1184[5:5];
    assign _1277 = _1184[4:4];
    assign _1276 = _1184[3:3];
    assign _1275 = _1184[2:2];
    assign _1274 = _1184[1:1];
    assign _1273 = _1184[0:0];
    always @* begin
        case (_1220)
        0: _1281 <= _1273;
        1: _1281 <= _1274;
        2: _1281 <= _1275;
        3: _1281 <= _1276;
        4: _1281 <= _1277;
        5: _1281 <= _1278;
        6: _1281 <= _1279;
        default: _1281 <= _1280;
        endcase
    end
    assign _1282 = ~ _1281;
    assign _1270 = _1171[7:7];
    assign _1269 = _1171[6:6];
    assign _1268 = _1171[5:5];
    assign _1267 = _1171[4:4];
    assign _1266 = _1171[3:3];
    assign _1265 = _1171[2:2];
    assign _1264 = _1171[1:1];
    assign _1263 = _1171[0:0];
    always @* begin
        case (_1220)
        0: _1271 <= _1263;
        1: _1271 <= _1264;
        2: _1271 <= _1265;
        3: _1271 <= _1266;
        4: _1271 <= _1267;
        5: _1271 <= _1268;
        6: _1271 <= _1269;
        default: _1271 <= _1270;
        endcase
    end
    assign _1272 = ~ _1271;
    assign _1283 = _1272 & _1282;
    assign _1261 = _1101[5:5];
    assign _1262 = ~ _1261;
    assign _1284 = _1262 | _1283;
    assign _1257 = _1112[31:31];
    assign _1255 = _1123[7:7];
    assign _1254 = _1123[6:6];
    assign _1253 = _1123[5:5];
    assign _1252 = _1123[4:4];
    assign _1251 = _1123[3:3];
    assign _1250 = _1123[2:2];
    assign _1249 = _1123[1:1];
    assign _1248 = _1123[0:0];
    assign _1247 = _1112[30:28];
    always @* begin
        case (_1247)
        0: _1256 <= _1248;
        1: _1256 <= _1249;
        2: _1256 <= _1250;
        3: _1256 <= _1251;
        4: _1256 <= _1252;
        5: _1256 <= _1253;
        6: _1256 <= _1254;
        default: _1256 <= _1255;
        endcase
    end
    assign _1258 = _1256 == _1257;
    assign _1245 = _1112[27:27];
    assign _1246 = ~ _1245;
    assign _1259 = _1246 | _1258;
    assign _1243 = _1229 ^ _1239;
    assign _1241 = ~ _1239;
    assign _1242 = _1229 & _1241;
    assign _1238 = _1120[7:7];
    assign _1237 = _1120[6:6];
    assign _1236 = _1120[5:5];
    assign _1235 = _1120[4:4];
    assign _1234 = _1120[3:3];
    assign _1233 = _1120[2:2];
    assign _1232 = _1120[1:1];
    assign _1231 = _1120[0:0];
    always @* begin
        case (_1220)
        0: _1239 <= _1231;
        1: _1239 <= _1232;
        2: _1239 <= _1233;
        3: _1239 <= _1234;
        4: _1239 <= _1235;
        5: _1239 <= _1236;
        6: _1239 <= _1237;
        default: _1239 <= _1238;
        endcase
    end
    assign _1228 = _1123[7:7];
    assign _1227 = _1123[6:6];
    assign _1226 = _1123[5:5];
    assign _1225 = _1123[4:4];
    assign _1224 = _1123[3:3];
    assign _1223 = _1123[2:2];
    assign _1222 = _1123[1:1];
    assign _1221 = _1123[0:0];
    assign _1220 = _1112[24:22];
    always @* begin
        case (_1220)
        0: _1229 <= _1221;
        1: _1229 <= _1222;
        2: _1229 <= _1223;
        3: _1229 <= _1224;
        4: _1229 <= _1225;
        5: _1229 <= _1226;
        6: _1229 <= _1227;
        default: _1229 <= _1228;
        endcase
    end
    assign _1230 = ~ _1229;
    assign _1240 = _1230 & _1239;
    assign _1219 = _1112[26:25];
    always @* begin
        case (_1219)
        0: _1244 <= _1240;
        1: _1244 <= _1242;
        2: _1244 <= _1243;
        default: _1244 <= gnd;
        endcase
    end
    assign _1260 = _1244 & _1259;
    assign _1285 = _1260 & _1284;
    assign _1217 = _1112[21:21];
    assign _1216 = _1102 & mon0_armed;
    assign _1218 = _1216 & _1217;
    assign _1286 = _1218 & _1285;
    assign _1288 = _1286 & _1287;
    assign _2367 = _1198 | _1288;
    assign _2368 = _2367 | _1290;
    assign _2369 = ~ _2368;
    assign _2370 = mon0_armed & _2369;
    assign _2372 = _2370 & _2371;
    assign _2373 = ~ _2372;
    assign _2360 = _1184[7:7];
    assign _2359 = _1184[6:6];
    assign _2358 = _1184[5:5];
    assign _2357 = _1184[4:4];
    assign _2356 = _1184[3:3];
    assign _2355 = _1184[2:2];
    assign _2354 = _1184[1:1];
    assign _2353 = _1184[0:0];
    always @* begin
        case (_2300)
        0: _2361 <= _2353;
        1: _2361 <= _2354;
        2: _2361 <= _2355;
        3: _2361 <= _2356;
        4: _2361 <= _2357;
        5: _2361 <= _2358;
        6: _2361 <= _2359;
        default: _2361 <= _2360;
        endcase
    end
    assign _2362 = ~ _2361;
    assign _2350 = _1171[7:7];
    assign _2349 = _1171[6:6];
    assign _2348 = _1171[5:5];
    assign _2347 = _1171[4:4];
    assign _2346 = _1171[3:3];
    assign _2345 = _1171[2:2];
    assign _2344 = _1171[1:1];
    assign _2343 = _1171[0:0];
    always @* begin
        case (_2300)
        0: _2351 <= _2343;
        1: _2351 <= _2344;
        2: _2351 <= _2345;
        3: _2351 <= _2346;
        4: _2351 <= _2347;
        5: _2351 <= _2348;
        6: _2351 <= _2349;
        default: _2351 <= _2350;
        endcase
    end
    assign _2352 = ~ _2351;
    assign _2363 = _2352 & _2362;
    assign _2341 = _1101[3:3];
    assign _2342 = ~ _2341;
    assign _2364 = _2342 | _2363;
    assign _2337 = _1112[10:10];
    assign _2335 = _1123[7:7];
    assign _2334 = _1123[6:6];
    assign _2333 = _1123[5:5];
    assign _2332 = _1123[4:4];
    assign _2331 = _1123[3:3];
    assign _2330 = _1123[2:2];
    assign _2329 = _1123[1:1];
    assign _2328 = _1123[0:0];
    assign _2327 = _1112[9:7];
    always @* begin
        case (_2327)
        0: _2336 <= _2328;
        1: _2336 <= _2329;
        2: _2336 <= _2330;
        3: _2336 <= _2331;
        4: _2336 <= _2332;
        5: _2336 <= _2333;
        6: _2336 <= _2334;
        default: _2336 <= _2335;
        endcase
    end
    assign _2338 = _2336 == _2337;
    assign _2325 = _1112[6:6];
    assign _2326 = ~ _2325;
    assign _2339 = _2326 | _2338;
    assign _2323 = _2309 ^ _2319;
    assign _2321 = ~ _2319;
    assign _2322 = _2309 & _2321;
    assign _2318 = _1120[7:7];
    assign _2317 = _1120[6:6];
    assign _2316 = _1120[5:5];
    assign _2315 = _1120[4:4];
    assign _2314 = _1120[3:3];
    assign _2313 = _1120[2:2];
    assign _2312 = _1120[1:1];
    assign _2311 = _1120[0:0];
    always @* begin
        case (_2300)
        0: _2319 <= _2311;
        1: _2319 <= _2312;
        2: _2319 <= _2313;
        3: _2319 <= _2314;
        4: _2319 <= _2315;
        5: _2319 <= _2316;
        6: _2319 <= _2317;
        default: _2319 <= _2318;
        endcase
    end
    assign _2308 = _1123[7:7];
    assign _2307 = _1123[6:6];
    assign _2306 = _1123[5:5];
    assign _2305 = _1123[4:4];
    assign _2304 = _1123[3:3];
    assign _2303 = _1123[2:2];
    assign _2302 = _1123[1:1];
    assign _2301 = _1123[0:0];
    assign _2300 = _1112[3:1];
    always @* begin
        case (_2300)
        0: _2309 <= _2301;
        1: _2309 <= _2302;
        2: _2309 <= _2303;
        3: _2309 <= _2304;
        4: _2309 <= _2305;
        5: _2309 <= _2306;
        6: _2309 <= _2307;
        default: _2309 <= _2308;
        endcase
    end
    assign _2310 = ~ _2309;
    assign _2320 = _2310 & _2319;
    assign _1110 = _197 == _1109;
    assign _1111 = spi_wr & _1110;
    always @(posedge _151) begin
        if (_164)
            _1112 <= _1108;
        else
            if (_1111)
                _1112 <= spi_wdata;
    end
    assign _2299 = _1112[5:4];
    always @* begin
        case (_2299)
        0: _2324 <= _2320;
        1: _2324 <= _2322;
        2: _2324 <= _2323;
        default: _2324 <= gnd;
        endcase
    end
    assign _2340 = _2324 & _2339;
    assign _2365 = _2340 & _2364;
    assign _2366 = _1102 & _2365;
    assign _2374 = _2366 & _2373;
    assign _2399 = _2374 ? vdd : _2370;
    assign _2400 = ctrl_bit1 ? gnd : _2399;
    assign _42 = _2400;
    always @(posedge _151) begin
        if (_164)
            mon0_armed <= _1104;
        else
            mon0_armed <= _42;
    end
    assign _1098 = _197 == _1097;
    assign _1099 = spi_wr & _1098;
    assign _1094 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1100 <= _1096;
        else
            if (_1099)
                _1100 <= _1094;
    end
    assign _1101 = { _1093, _1100 };
    assign _1102 = _1101[0:0];
    assign _1106 = _1102 & mon0_armed;
    assign _1198 = _1106 & _1197;
    assign _2402 = _1198 & _2401;
    assign _2405 = _2402 & _2404;
    assign _2407 = _2405 | _2406;
    assign _2408 = _2407 | _1290;
    assign _2412 = _2408 ? vdd : mon0_sticky;
    assign _2413 = ctrl_bit1 ? gnd : _2412;
    assign _43 = _2413;
    always @(posedge _151) begin
        if (_164)
            mon0_sticky <= _2410;
        else
            mon0_sticky <= _43;
    end
    assign _2518 = _1391 & _1405;
    assign _2515 = _1399[15:0];
    assign _2516 = mon1_count_cycles < _2515;
    assign _2513 = _1312[1:1];
    assign _1385 = _1184[7:7];
    assign _1384 = _1184[6:6];
    assign _1383 = _1184[5:5];
    assign _1382 = _1184[4:4];
    assign _1381 = _1184[3:3];
    assign _1380 = _1184[2:2];
    assign _1379 = _1184[1:1];
    assign _1378 = _1184[0:0];
    always @* begin
        case (_1325)
        0: _1386 <= _1378;
        1: _1386 <= _1379;
        2: _1386 <= _1380;
        3: _1386 <= _1381;
        4: _1386 <= _1382;
        5: _1386 <= _1383;
        6: _1386 <= _1384;
        default: _1386 <= _1385;
        endcase
    end
    assign _1387 = ~ _1386;
    assign _1375 = _1171[7:7];
    assign _1374 = _1171[6:6];
    assign _1373 = _1171[5:5];
    assign _1372 = _1171[4:4];
    assign _1371 = _1171[3:3];
    assign _1370 = _1171[2:2];
    assign _1369 = _1171[1:1];
    assign _1368 = _1171[0:0];
    always @* begin
        case (_1325)
        0: _1376 <= _1368;
        1: _1376 <= _1369;
        2: _1376 <= _1370;
        3: _1376 <= _1371;
        4: _1376 <= _1372;
        5: _1376 <= _1373;
        6: _1376 <= _1374;
        default: _1376 <= _1375;
        endcase
    end
    assign _1377 = ~ _1376;
    assign _1388 = _1377 & _1387;
    assign _1366 = _1312[4:4];
    assign _1367 = ~ _1366;
    assign _1389 = _1367 | _1388;
    assign _1362 = _1323[20:20];
    assign _1360 = _1123[7:7];
    assign _1359 = _1123[6:6];
    assign _1358 = _1123[5:5];
    assign _1357 = _1123[4:4];
    assign _1356 = _1123[3:3];
    assign _1355 = _1123[2:2];
    assign _1354 = _1123[1:1];
    assign _1353 = _1123[0:0];
    assign _1352 = _1323[19:17];
    always @* begin
        case (_1352)
        0: _1361 <= _1353;
        1: _1361 <= _1354;
        2: _1361 <= _1355;
        3: _1361 <= _1356;
        4: _1361 <= _1357;
        5: _1361 <= _1358;
        6: _1361 <= _1359;
        default: _1361 <= _1360;
        endcase
    end
    assign _1363 = _1361 == _1362;
    assign _1350 = _1323[16:16];
    assign _1351 = ~ _1350;
    assign _1364 = _1351 | _1363;
    assign _1348 = _1334 ^ _1344;
    assign _1346 = ~ _1344;
    assign _1347 = _1334 & _1346;
    assign _1343 = _1120[7:7];
    assign _1342 = _1120[6:6];
    assign _1341 = _1120[5:5];
    assign _1340 = _1120[4:4];
    assign _1339 = _1120[3:3];
    assign _1338 = _1120[2:2];
    assign _1337 = _1120[1:1];
    assign _1336 = _1120[0:0];
    always @* begin
        case (_1325)
        0: _1344 <= _1336;
        1: _1344 <= _1337;
        2: _1344 <= _1338;
        3: _1344 <= _1339;
        4: _1344 <= _1340;
        5: _1344 <= _1341;
        6: _1344 <= _1342;
        default: _1344 <= _1343;
        endcase
    end
    assign _1333 = _1123[7:7];
    assign _1332 = _1123[6:6];
    assign _1331 = _1123[5:5];
    assign _1330 = _1123[4:4];
    assign _1329 = _1123[3:3];
    assign _1328 = _1123[2:2];
    assign _1327 = _1123[1:1];
    assign _1326 = _1123[0:0];
    assign _1325 = _1323[13:11];
    always @* begin
        case (_1325)
        0: _1334 <= _1326;
        1: _1334 <= _1327;
        2: _1334 <= _1328;
        3: _1334 <= _1329;
        4: _1334 <= _1330;
        5: _1334 <= _1331;
        6: _1334 <= _1332;
        default: _1334 <= _1333;
        endcase
    end
    assign _1335 = ~ _1334;
    assign _1345 = _1335 & _1344;
    assign _1324 = _1323[15:14];
    always @* begin
        case (_1324)
        0: _1349 <= _1345;
        1: _1349 <= _1347;
        2: _1349 <= _1348;
        default: _1349 <= gnd;
        endcase
    end
    assign _1365 = _1349 & _1364;
    assign _1390 = _1365 & _1389;
    assign _2486 = _1323[0:0];
    assign _1482 = ~ _1481;
    assign _1407 = ~ _1391;
    assign _2506 = mon1_count_cycles + _2505;
    assign _2502 = mon1_count_cycles == _2501;
    assign _2503 = ~ _2502;
    assign _2498 = _2378 == _2497;
    assign _2494 = _2378[7:0];
    assign _2496 = _2494 == _2495;
    assign _2491 = _2378[3:0];
    assign _2493 = _2491 == _2492;
    assign _2490 = _1312[7:6];
    always @* begin
        case (_2490)
        0: _2499 <= vdd;
        1: _2499 <= _2493;
        2: _2499 <= _2496;
        default: _2499 <= _2498;
        endcase
    end
    assign _2500 = _2485 & _2499;
    assign _2504 = _2500 & _2503;
    assign _2507 = _2504 ? _2506 : mon1_count_cycles;
    assign _2509 = _2489 ? _2508 : _2507;
    assign _2510 = ctrl_bit1 ? mon1_count_cycles : _2509;
    assign _44 = _2510;
    always @(posedge _151) begin
        if (_164)
            mon1_count_cycles <= _1402;
        else
            mon1_count_cycles <= _44;
    end
    assign _1397 = _197 == _1396;
    assign _1398 = spi_wr & _1397;
    always @(posedge _151) begin
        if (_164)
            _1399 <= _1395;
        else
            if (_1398)
                _1399 <= spi_wdata;
    end
    assign _1400 = _1399[31:16];
    assign _1404 = _1400 < mon1_count_cycles;
    assign _1393 = _1312[2:2];
    assign _1405 = _1393 & _1404;
    assign _1392 = _1313 & mon1_armed;
    assign _1406 = _1392 & _1405;
    assign _1408 = _1406 & _1407;
    assign _1483 = _1408 & _1482;
    assign _1480 = ~ _1391;
    assign _1473 = _1184[7:7];
    assign _1472 = _1184[6:6];
    assign _1471 = _1184[5:5];
    assign _1470 = _1184[4:4];
    assign _1469 = _1184[3:3];
    assign _1468 = _1184[2:2];
    assign _1467 = _1184[1:1];
    assign _1466 = _1184[0:0];
    always @* begin
        case (_1413)
        0: _1474 <= _1466;
        1: _1474 <= _1467;
        2: _1474 <= _1468;
        3: _1474 <= _1469;
        4: _1474 <= _1470;
        5: _1474 <= _1471;
        6: _1474 <= _1472;
        default: _1474 <= _1473;
        endcase
    end
    assign _1475 = ~ _1474;
    assign _1463 = _1171[7:7];
    assign _1462 = _1171[6:6];
    assign _1461 = _1171[5:5];
    assign _1460 = _1171[4:4];
    assign _1459 = _1171[3:3];
    assign _1458 = _1171[2:2];
    assign _1457 = _1171[1:1];
    assign _1456 = _1171[0:0];
    always @* begin
        case (_1413)
        0: _1464 <= _1456;
        1: _1464 <= _1457;
        2: _1464 <= _1458;
        3: _1464 <= _1459;
        4: _1464 <= _1460;
        5: _1464 <= _1461;
        6: _1464 <= _1462;
        default: _1464 <= _1463;
        endcase
    end
    assign _1465 = ~ _1464;
    assign _1476 = _1465 & _1475;
    assign _1454 = _1312[5:5];
    assign _1455 = ~ _1454;
    assign _1477 = _1455 | _1476;
    assign _1450 = _1323[31:31];
    assign _1448 = _1123[7:7];
    assign _1447 = _1123[6:6];
    assign _1446 = _1123[5:5];
    assign _1445 = _1123[4:4];
    assign _1444 = _1123[3:3];
    assign _1443 = _1123[2:2];
    assign _1442 = _1123[1:1];
    assign _1441 = _1123[0:0];
    assign _1440 = _1323[30:28];
    always @* begin
        case (_1440)
        0: _1449 <= _1441;
        1: _1449 <= _1442;
        2: _1449 <= _1443;
        3: _1449 <= _1444;
        4: _1449 <= _1445;
        5: _1449 <= _1446;
        6: _1449 <= _1447;
        default: _1449 <= _1448;
        endcase
    end
    assign _1451 = _1449 == _1450;
    assign _1438 = _1323[27:27];
    assign _1439 = ~ _1438;
    assign _1452 = _1439 | _1451;
    assign _1436 = _1422 ^ _1432;
    assign _1434 = ~ _1432;
    assign _1435 = _1422 & _1434;
    assign _1431 = _1120[7:7];
    assign _1430 = _1120[6:6];
    assign _1429 = _1120[5:5];
    assign _1428 = _1120[4:4];
    assign _1427 = _1120[3:3];
    assign _1426 = _1120[2:2];
    assign _1425 = _1120[1:1];
    assign _1424 = _1120[0:0];
    always @* begin
        case (_1413)
        0: _1432 <= _1424;
        1: _1432 <= _1425;
        2: _1432 <= _1426;
        3: _1432 <= _1427;
        4: _1432 <= _1428;
        5: _1432 <= _1429;
        6: _1432 <= _1430;
        default: _1432 <= _1431;
        endcase
    end
    assign _1421 = _1123[7:7];
    assign _1420 = _1123[6:6];
    assign _1419 = _1123[5:5];
    assign _1418 = _1123[4:4];
    assign _1417 = _1123[3:3];
    assign _1416 = _1123[2:2];
    assign _1415 = _1123[1:1];
    assign _1414 = _1123[0:0];
    assign _1413 = _1323[24:22];
    always @* begin
        case (_1413)
        0: _1422 <= _1414;
        1: _1422 <= _1415;
        2: _1422 <= _1416;
        3: _1422 <= _1417;
        4: _1422 <= _1418;
        5: _1422 <= _1419;
        6: _1422 <= _1420;
        default: _1422 <= _1421;
        endcase
    end
    assign _1423 = ~ _1422;
    assign _1433 = _1423 & _1432;
    assign _1412 = _1323[26:25];
    always @* begin
        case (_1412)
        0: _1437 <= _1433;
        1: _1437 <= _1435;
        2: _1437 <= _1436;
        default: _1437 <= gnd;
        endcase
    end
    assign _1453 = _1437 & _1452;
    assign _1478 = _1453 & _1477;
    assign _1410 = _1323[21:21];
    assign _1409 = _1313 & mon1_armed;
    assign _1411 = _1409 & _1410;
    assign _1479 = _1411 & _1478;
    assign _1481 = _1479 & _1480;
    assign _2482 = _1391 | _1481;
    assign _2483 = _2482 | _1483;
    assign _2484 = ~ _2483;
    assign _2485 = mon1_armed & _2484;
    assign _2487 = _2485 & _2486;
    assign _2488 = ~ _2487;
    assign _2475 = _1184[7:7];
    assign _2474 = _1184[6:6];
    assign _2473 = _1184[5:5];
    assign _2472 = _1184[4:4];
    assign _2471 = _1184[3:3];
    assign _2470 = _1184[2:2];
    assign _2469 = _1184[1:1];
    assign _2468 = _1184[0:0];
    always @* begin
        case (_2415)
        0: _2476 <= _2468;
        1: _2476 <= _2469;
        2: _2476 <= _2470;
        3: _2476 <= _2471;
        4: _2476 <= _2472;
        5: _2476 <= _2473;
        6: _2476 <= _2474;
        default: _2476 <= _2475;
        endcase
    end
    assign _2477 = ~ _2476;
    assign _2465 = _1171[7:7];
    assign _2464 = _1171[6:6];
    assign _2463 = _1171[5:5];
    assign _2462 = _1171[4:4];
    assign _2461 = _1171[3:3];
    assign _2460 = _1171[2:2];
    assign _2459 = _1171[1:1];
    assign _2458 = _1171[0:0];
    always @* begin
        case (_2415)
        0: _2466 <= _2458;
        1: _2466 <= _2459;
        2: _2466 <= _2460;
        3: _2466 <= _2461;
        4: _2466 <= _2462;
        5: _2466 <= _2463;
        6: _2466 <= _2464;
        default: _2466 <= _2465;
        endcase
    end
    assign _2467 = ~ _2466;
    assign _2478 = _2467 & _2477;
    assign _2456 = _1312[3:3];
    assign _2457 = ~ _2456;
    assign _2479 = _2457 | _2478;
    assign _2452 = _1323[10:10];
    assign _2450 = _1123[7:7];
    assign _2449 = _1123[6:6];
    assign _2448 = _1123[5:5];
    assign _2447 = _1123[4:4];
    assign _2446 = _1123[3:3];
    assign _2445 = _1123[2:2];
    assign _2444 = _1123[1:1];
    assign _2443 = _1123[0:0];
    assign _2442 = _1323[9:7];
    always @* begin
        case (_2442)
        0: _2451 <= _2443;
        1: _2451 <= _2444;
        2: _2451 <= _2445;
        3: _2451 <= _2446;
        4: _2451 <= _2447;
        5: _2451 <= _2448;
        6: _2451 <= _2449;
        default: _2451 <= _2450;
        endcase
    end
    assign _2453 = _2451 == _2452;
    assign _2440 = _1323[6:6];
    assign _2441 = ~ _2440;
    assign _2454 = _2441 | _2453;
    assign _2438 = _2424 ^ _2434;
    assign _2436 = ~ _2434;
    assign _2437 = _2424 & _2436;
    assign _2433 = _1120[7:7];
    assign _2432 = _1120[6:6];
    assign _2431 = _1120[5:5];
    assign _2430 = _1120[4:4];
    assign _2429 = _1120[3:3];
    assign _2428 = _1120[2:2];
    assign _2427 = _1120[1:1];
    assign _2426 = _1120[0:0];
    always @* begin
        case (_2415)
        0: _2434 <= _2426;
        1: _2434 <= _2427;
        2: _2434 <= _2428;
        3: _2434 <= _2429;
        4: _2434 <= _2430;
        5: _2434 <= _2431;
        6: _2434 <= _2432;
        default: _2434 <= _2433;
        endcase
    end
    assign _2423 = _1123[7:7];
    assign _2422 = _1123[6:6];
    assign _2421 = _1123[5:5];
    assign _2420 = _1123[4:4];
    assign _2419 = _1123[3:3];
    assign _2418 = _1123[2:2];
    assign _2417 = _1123[1:1];
    assign _2416 = _1123[0:0];
    assign _2415 = _1323[3:1];
    always @* begin
        case (_2415)
        0: _2424 <= _2416;
        1: _2424 <= _2417;
        2: _2424 <= _2418;
        3: _2424 <= _2419;
        4: _2424 <= _2420;
        5: _2424 <= _2421;
        6: _2424 <= _2422;
        default: _2424 <= _2423;
        endcase
    end
    assign _2425 = ~ _2424;
    assign _2435 = _2425 & _2434;
    assign _1321 = _197 == _1320;
    assign _1322 = spi_wr & _1321;
    always @(posedge _151) begin
        if (_164)
            _1323 <= _1319;
        else
            if (_1322)
                _1323 <= spi_wdata;
    end
    assign _2414 = _1323[5:4];
    always @* begin
        case (_2414)
        0: _2439 <= _2435;
        1: _2439 <= _2437;
        2: _2439 <= _2438;
        default: _2439 <= gnd;
        endcase
    end
    assign _2455 = _2439 & _2454;
    assign _2480 = _2455 & _2479;
    assign _2481 = _1313 & _2480;
    assign _2489 = _2481 & _2488;
    assign _2511 = _2489 ? vdd : _2485;
    assign _2512 = ctrl_bit1 ? gnd : _2511;
    assign _45 = _2512;
    always @(posedge _151) begin
        if (_164)
            mon1_armed <= _1315;
        else
            mon1_armed <= _45;
    end
    assign _1309 = _197 == _1308;
    assign _1310 = spi_wr & _1309;
    assign _1305 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1311 <= _1307;
        else
            if (_1310)
                _1311 <= _1305;
    end
    assign _1312 = { _1304, _1311 };
    assign _1313 = _1312[0:0];
    assign _1317 = _1313 & mon1_armed;
    assign _1391 = _1317 & _1390;
    assign _2514 = _1391 & _2513;
    assign _2517 = _2514 & _2516;
    assign _2519 = _2517 | _2518;
    assign _2520 = _2519 | _1483;
    assign _2524 = _2520 ? vdd : mon1_sticky;
    assign _2525 = ctrl_bit1 ? gnd : _2524;
    assign _46 = _2525;
    always @(posedge _151) begin
        if (_164)
            mon1_sticky <= _2522;
        else
            mon1_sticky <= _46;
    end
    assign _2630 = _1584 & _1598;
    assign _2627 = _1592[15:0];
    assign _2628 = mon2_count_cycles < _2627;
    assign _2625 = _1505[1:1];
    assign _1578 = _1184[7:7];
    assign _1577 = _1184[6:6];
    assign _1576 = _1184[5:5];
    assign _1575 = _1184[4:4];
    assign _1574 = _1184[3:3];
    assign _1573 = _1184[2:2];
    assign _1572 = _1184[1:1];
    assign _1571 = _1184[0:0];
    always @* begin
        case (_1518)
        0: _1579 <= _1571;
        1: _1579 <= _1572;
        2: _1579 <= _1573;
        3: _1579 <= _1574;
        4: _1579 <= _1575;
        5: _1579 <= _1576;
        6: _1579 <= _1577;
        default: _1579 <= _1578;
        endcase
    end
    assign _1580 = ~ _1579;
    assign _1568 = _1171[7:7];
    assign _1567 = _1171[6:6];
    assign _1566 = _1171[5:5];
    assign _1565 = _1171[4:4];
    assign _1564 = _1171[3:3];
    assign _1563 = _1171[2:2];
    assign _1562 = _1171[1:1];
    assign _1561 = _1171[0:0];
    always @* begin
        case (_1518)
        0: _1569 <= _1561;
        1: _1569 <= _1562;
        2: _1569 <= _1563;
        3: _1569 <= _1564;
        4: _1569 <= _1565;
        5: _1569 <= _1566;
        6: _1569 <= _1567;
        default: _1569 <= _1568;
        endcase
    end
    assign _1570 = ~ _1569;
    assign _1581 = _1570 & _1580;
    assign _1559 = _1505[4:4];
    assign _1560 = ~ _1559;
    assign _1582 = _1560 | _1581;
    assign _1555 = _1516[20:20];
    assign _1553 = _1123[7:7];
    assign _1552 = _1123[6:6];
    assign _1551 = _1123[5:5];
    assign _1550 = _1123[4:4];
    assign _1549 = _1123[3:3];
    assign _1548 = _1123[2:2];
    assign _1547 = _1123[1:1];
    assign _1546 = _1123[0:0];
    assign _1545 = _1516[19:17];
    always @* begin
        case (_1545)
        0: _1554 <= _1546;
        1: _1554 <= _1547;
        2: _1554 <= _1548;
        3: _1554 <= _1549;
        4: _1554 <= _1550;
        5: _1554 <= _1551;
        6: _1554 <= _1552;
        default: _1554 <= _1553;
        endcase
    end
    assign _1556 = _1554 == _1555;
    assign _1543 = _1516[16:16];
    assign _1544 = ~ _1543;
    assign _1557 = _1544 | _1556;
    assign _1541 = _1527 ^ _1537;
    assign _1539 = ~ _1537;
    assign _1540 = _1527 & _1539;
    assign _1536 = _1120[7:7];
    assign _1535 = _1120[6:6];
    assign _1534 = _1120[5:5];
    assign _1533 = _1120[4:4];
    assign _1532 = _1120[3:3];
    assign _1531 = _1120[2:2];
    assign _1530 = _1120[1:1];
    assign _1529 = _1120[0:0];
    always @* begin
        case (_1518)
        0: _1537 <= _1529;
        1: _1537 <= _1530;
        2: _1537 <= _1531;
        3: _1537 <= _1532;
        4: _1537 <= _1533;
        5: _1537 <= _1534;
        6: _1537 <= _1535;
        default: _1537 <= _1536;
        endcase
    end
    assign _1526 = _1123[7:7];
    assign _1525 = _1123[6:6];
    assign _1524 = _1123[5:5];
    assign _1523 = _1123[4:4];
    assign _1522 = _1123[3:3];
    assign _1521 = _1123[2:2];
    assign _1520 = _1123[1:1];
    assign _1519 = _1123[0:0];
    assign _1518 = _1516[13:11];
    always @* begin
        case (_1518)
        0: _1527 <= _1519;
        1: _1527 <= _1520;
        2: _1527 <= _1521;
        3: _1527 <= _1522;
        4: _1527 <= _1523;
        5: _1527 <= _1524;
        6: _1527 <= _1525;
        default: _1527 <= _1526;
        endcase
    end
    assign _1528 = ~ _1527;
    assign _1538 = _1528 & _1537;
    assign _1517 = _1516[15:14];
    always @* begin
        case (_1517)
        0: _1542 <= _1538;
        1: _1542 <= _1540;
        2: _1542 <= _1541;
        default: _1542 <= gnd;
        endcase
    end
    assign _1558 = _1542 & _1557;
    assign _1583 = _1558 & _1582;
    assign _2598 = _1516[0:0];
    assign _1675 = ~ _1674;
    assign _1600 = ~ _1584;
    assign _2618 = mon2_count_cycles + _2617;
    assign _2614 = mon2_count_cycles == _2613;
    assign _2615 = ~ _2614;
    assign _2610 = _2378 == _2609;
    assign _2606 = _2378[7:0];
    assign _2608 = _2606 == _2607;
    assign _2603 = _2378[3:0];
    assign _2605 = _2603 == _2604;
    assign _2602 = _1505[7:6];
    always @* begin
        case (_2602)
        0: _2611 <= vdd;
        1: _2611 <= _2605;
        2: _2611 <= _2608;
        default: _2611 <= _2610;
        endcase
    end
    assign _2612 = _2597 & _2611;
    assign _2616 = _2612 & _2615;
    assign _2619 = _2616 ? _2618 : mon2_count_cycles;
    assign _2621 = _2601 ? _2620 : _2619;
    assign _2622 = ctrl_bit1 ? mon2_count_cycles : _2621;
    assign _47 = _2622;
    always @(posedge _151) begin
        if (_164)
            mon2_count_cycles <= _1595;
        else
            mon2_count_cycles <= _47;
    end
    assign _1590 = _197 == _1589;
    assign _1591 = spi_wr & _1590;
    always @(posedge _151) begin
        if (_164)
            _1592 <= _1588;
        else
            if (_1591)
                _1592 <= spi_wdata;
    end
    assign _1593 = _1592[31:16];
    assign _1597 = _1593 < mon2_count_cycles;
    assign _1586 = _1505[2:2];
    assign _1598 = _1586 & _1597;
    assign _1585 = _1506 & mon2_armed;
    assign _1599 = _1585 & _1598;
    assign _1601 = _1599 & _1600;
    assign _1676 = _1601 & _1675;
    assign _1673 = ~ _1584;
    assign _1666 = _1184[7:7];
    assign _1665 = _1184[6:6];
    assign _1664 = _1184[5:5];
    assign _1663 = _1184[4:4];
    assign _1662 = _1184[3:3];
    assign _1661 = _1184[2:2];
    assign _1660 = _1184[1:1];
    assign _1659 = _1184[0:0];
    always @* begin
        case (_1606)
        0: _1667 <= _1659;
        1: _1667 <= _1660;
        2: _1667 <= _1661;
        3: _1667 <= _1662;
        4: _1667 <= _1663;
        5: _1667 <= _1664;
        6: _1667 <= _1665;
        default: _1667 <= _1666;
        endcase
    end
    assign _1668 = ~ _1667;
    assign _1656 = _1171[7:7];
    assign _1655 = _1171[6:6];
    assign _1654 = _1171[5:5];
    assign _1653 = _1171[4:4];
    assign _1652 = _1171[3:3];
    assign _1651 = _1171[2:2];
    assign _1650 = _1171[1:1];
    assign _1649 = _1171[0:0];
    always @* begin
        case (_1606)
        0: _1657 <= _1649;
        1: _1657 <= _1650;
        2: _1657 <= _1651;
        3: _1657 <= _1652;
        4: _1657 <= _1653;
        5: _1657 <= _1654;
        6: _1657 <= _1655;
        default: _1657 <= _1656;
        endcase
    end
    assign _1658 = ~ _1657;
    assign _1669 = _1658 & _1668;
    assign _1647 = _1505[5:5];
    assign _1648 = ~ _1647;
    assign _1670 = _1648 | _1669;
    assign _1643 = _1516[31:31];
    assign _1641 = _1123[7:7];
    assign _1640 = _1123[6:6];
    assign _1639 = _1123[5:5];
    assign _1638 = _1123[4:4];
    assign _1637 = _1123[3:3];
    assign _1636 = _1123[2:2];
    assign _1635 = _1123[1:1];
    assign _1634 = _1123[0:0];
    assign _1633 = _1516[30:28];
    always @* begin
        case (_1633)
        0: _1642 <= _1634;
        1: _1642 <= _1635;
        2: _1642 <= _1636;
        3: _1642 <= _1637;
        4: _1642 <= _1638;
        5: _1642 <= _1639;
        6: _1642 <= _1640;
        default: _1642 <= _1641;
        endcase
    end
    assign _1644 = _1642 == _1643;
    assign _1631 = _1516[27:27];
    assign _1632 = ~ _1631;
    assign _1645 = _1632 | _1644;
    assign _1629 = _1615 ^ _1625;
    assign _1627 = ~ _1625;
    assign _1628 = _1615 & _1627;
    assign _1624 = _1120[7:7];
    assign _1623 = _1120[6:6];
    assign _1622 = _1120[5:5];
    assign _1621 = _1120[4:4];
    assign _1620 = _1120[3:3];
    assign _1619 = _1120[2:2];
    assign _1618 = _1120[1:1];
    assign _1617 = _1120[0:0];
    always @* begin
        case (_1606)
        0: _1625 <= _1617;
        1: _1625 <= _1618;
        2: _1625 <= _1619;
        3: _1625 <= _1620;
        4: _1625 <= _1621;
        5: _1625 <= _1622;
        6: _1625 <= _1623;
        default: _1625 <= _1624;
        endcase
    end
    assign _1614 = _1123[7:7];
    assign _1613 = _1123[6:6];
    assign _1612 = _1123[5:5];
    assign _1611 = _1123[4:4];
    assign _1610 = _1123[3:3];
    assign _1609 = _1123[2:2];
    assign _1608 = _1123[1:1];
    assign _1607 = _1123[0:0];
    assign _1606 = _1516[24:22];
    always @* begin
        case (_1606)
        0: _1615 <= _1607;
        1: _1615 <= _1608;
        2: _1615 <= _1609;
        3: _1615 <= _1610;
        4: _1615 <= _1611;
        5: _1615 <= _1612;
        6: _1615 <= _1613;
        default: _1615 <= _1614;
        endcase
    end
    assign _1616 = ~ _1615;
    assign _1626 = _1616 & _1625;
    assign _1605 = _1516[26:25];
    always @* begin
        case (_1605)
        0: _1630 <= _1626;
        1: _1630 <= _1628;
        2: _1630 <= _1629;
        default: _1630 <= gnd;
        endcase
    end
    assign _1646 = _1630 & _1645;
    assign _1671 = _1646 & _1670;
    assign _1603 = _1516[21:21];
    assign _1602 = _1506 & mon2_armed;
    assign _1604 = _1602 & _1603;
    assign _1672 = _1604 & _1671;
    assign _1674 = _1672 & _1673;
    assign _2594 = _1584 | _1674;
    assign _2595 = _2594 | _1676;
    assign _2596 = ~ _2595;
    assign _2597 = mon2_armed & _2596;
    assign _2599 = _2597 & _2598;
    assign _2600 = ~ _2599;
    assign _2587 = _1184[7:7];
    assign _2586 = _1184[6:6];
    assign _2585 = _1184[5:5];
    assign _2584 = _1184[4:4];
    assign _2583 = _1184[3:3];
    assign _2582 = _1184[2:2];
    assign _2581 = _1184[1:1];
    assign _2580 = _1184[0:0];
    always @* begin
        case (_2527)
        0: _2588 <= _2580;
        1: _2588 <= _2581;
        2: _2588 <= _2582;
        3: _2588 <= _2583;
        4: _2588 <= _2584;
        5: _2588 <= _2585;
        6: _2588 <= _2586;
        default: _2588 <= _2587;
        endcase
    end
    assign _2589 = ~ _2588;
    assign _2577 = _1171[7:7];
    assign _2576 = _1171[6:6];
    assign _2575 = _1171[5:5];
    assign _2574 = _1171[4:4];
    assign _2573 = _1171[3:3];
    assign _2572 = _1171[2:2];
    assign _2571 = _1171[1:1];
    assign _2570 = _1171[0:0];
    always @* begin
        case (_2527)
        0: _2578 <= _2570;
        1: _2578 <= _2571;
        2: _2578 <= _2572;
        3: _2578 <= _2573;
        4: _2578 <= _2574;
        5: _2578 <= _2575;
        6: _2578 <= _2576;
        default: _2578 <= _2577;
        endcase
    end
    assign _2579 = ~ _2578;
    assign _2590 = _2579 & _2589;
    assign _2568 = _1505[3:3];
    assign _2569 = ~ _2568;
    assign _2591 = _2569 | _2590;
    assign _2564 = _1516[10:10];
    assign _2562 = _1123[7:7];
    assign _2561 = _1123[6:6];
    assign _2560 = _1123[5:5];
    assign _2559 = _1123[4:4];
    assign _2558 = _1123[3:3];
    assign _2557 = _1123[2:2];
    assign _2556 = _1123[1:1];
    assign _2555 = _1123[0:0];
    assign _2554 = _1516[9:7];
    always @* begin
        case (_2554)
        0: _2563 <= _2555;
        1: _2563 <= _2556;
        2: _2563 <= _2557;
        3: _2563 <= _2558;
        4: _2563 <= _2559;
        5: _2563 <= _2560;
        6: _2563 <= _2561;
        default: _2563 <= _2562;
        endcase
    end
    assign _2565 = _2563 == _2564;
    assign _2552 = _1516[6:6];
    assign _2553 = ~ _2552;
    assign _2566 = _2553 | _2565;
    assign _2550 = _2536 ^ _2546;
    assign _2548 = ~ _2546;
    assign _2549 = _2536 & _2548;
    assign _2545 = _1120[7:7];
    assign _2544 = _1120[6:6];
    assign _2543 = _1120[5:5];
    assign _2542 = _1120[4:4];
    assign _2541 = _1120[3:3];
    assign _2540 = _1120[2:2];
    assign _2539 = _1120[1:1];
    assign _2538 = _1120[0:0];
    always @* begin
        case (_2527)
        0: _2546 <= _2538;
        1: _2546 <= _2539;
        2: _2546 <= _2540;
        3: _2546 <= _2541;
        4: _2546 <= _2542;
        5: _2546 <= _2543;
        6: _2546 <= _2544;
        default: _2546 <= _2545;
        endcase
    end
    assign _2535 = _1123[7:7];
    assign _2534 = _1123[6:6];
    assign _2533 = _1123[5:5];
    assign _2532 = _1123[4:4];
    assign _2531 = _1123[3:3];
    assign _2530 = _1123[2:2];
    assign _2529 = _1123[1:1];
    assign _2528 = _1123[0:0];
    assign _2527 = _1516[3:1];
    always @* begin
        case (_2527)
        0: _2536 <= _2528;
        1: _2536 <= _2529;
        2: _2536 <= _2530;
        3: _2536 <= _2531;
        4: _2536 <= _2532;
        5: _2536 <= _2533;
        6: _2536 <= _2534;
        default: _2536 <= _2535;
        endcase
    end
    assign _2537 = ~ _2536;
    assign _2547 = _2537 & _2546;
    assign _1514 = _197 == _1513;
    assign _1515 = spi_wr & _1514;
    always @(posedge _151) begin
        if (_164)
            _1516 <= _1512;
        else
            if (_1515)
                _1516 <= spi_wdata;
    end
    assign _2526 = _1516[5:4];
    always @* begin
        case (_2526)
        0: _2551 <= _2547;
        1: _2551 <= _2549;
        2: _2551 <= _2550;
        default: _2551 <= gnd;
        endcase
    end
    assign _2567 = _2551 & _2566;
    assign _2592 = _2567 & _2591;
    assign _2593 = _1506 & _2592;
    assign _2601 = _2593 & _2600;
    assign _2623 = _2601 ? vdd : _2597;
    assign _2624 = ctrl_bit1 ? gnd : _2623;
    assign _48 = _2624;
    always @(posedge _151) begin
        if (_164)
            mon2_armed <= _1508;
        else
            mon2_armed <= _48;
    end
    assign _1502 = _197 == _1501;
    assign _1503 = spi_wr & _1502;
    assign _1498 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1504 <= _1500;
        else
            if (_1503)
                _1504 <= _1498;
    end
    assign _1505 = { _1497, _1504 };
    assign _1506 = _1505[0:0];
    assign _1510 = _1506 & mon2_armed;
    assign _1584 = _1510 & _1583;
    assign _2626 = _1584 & _2625;
    assign _2629 = _2626 & _2628;
    assign _2631 = _2629 | _2630;
    assign _2632 = _2631 | _1676;
    assign _2636 = _2632 ? vdd : mon2_sticky;
    assign _2637 = ctrl_bit1 ? gnd : _2636;
    assign _49 = _2637;
    always @(posedge _151) begin
        if (_164)
            mon2_sticky <= _2634;
        else
            mon2_sticky <= _49;
    end
    assign _2904 = _1777 & _1791;
    assign _2901 = _1785[15:0];
    assign _2902 = mon3_count_cycles < _2901;
    assign _2899 = _1698[1:1];
    assign _1771 = _1184[7:7];
    assign _1770 = _1184[6:6];
    assign _1769 = _1184[5:5];
    assign _1768 = _1184[4:4];
    assign _1767 = _1184[3:3];
    assign _1766 = _1184[2:2];
    assign _1765 = _1184[1:1];
    assign _1764 = _1184[0:0];
    always @* begin
        case (_1711)
        0: _1772 <= _1764;
        1: _1772 <= _1765;
        2: _1772 <= _1766;
        3: _1772 <= _1767;
        4: _1772 <= _1768;
        5: _1772 <= _1769;
        6: _1772 <= _1770;
        default: _1772 <= _1771;
        endcase
    end
    assign _1773 = ~ _1772;
    assign _1761 = _1171[7:7];
    assign _1760 = _1171[6:6];
    assign _1759 = _1171[5:5];
    assign _1758 = _1171[4:4];
    assign _1757 = _1171[3:3];
    assign _1756 = _1171[2:2];
    assign _1755 = _1171[1:1];
    assign _1754 = _1171[0:0];
    always @* begin
        case (_1711)
        0: _1762 <= _1754;
        1: _1762 <= _1755;
        2: _1762 <= _1756;
        3: _1762 <= _1757;
        4: _1762 <= _1758;
        5: _1762 <= _1759;
        6: _1762 <= _1760;
        default: _1762 <= _1761;
        endcase
    end
    assign _1763 = ~ _1762;
    assign _1774 = _1763 & _1773;
    assign _1752 = _1698[4:4];
    assign _1753 = ~ _1752;
    assign _1775 = _1753 | _1774;
    assign _1748 = _1709[20:20];
    assign _1746 = _1123[7:7];
    assign _1745 = _1123[6:6];
    assign _1744 = _1123[5:5];
    assign _1743 = _1123[4:4];
    assign _1742 = _1123[3:3];
    assign _1741 = _1123[2:2];
    assign _1740 = _1123[1:1];
    assign _1739 = _1123[0:0];
    assign _1738 = _1709[19:17];
    always @* begin
        case (_1738)
        0: _1747 <= _1739;
        1: _1747 <= _1740;
        2: _1747 <= _1741;
        3: _1747 <= _1742;
        4: _1747 <= _1743;
        5: _1747 <= _1744;
        6: _1747 <= _1745;
        default: _1747 <= _1746;
        endcase
    end
    assign _1749 = _1747 == _1748;
    assign _1736 = _1709[16:16];
    assign _1737 = ~ _1736;
    assign _1750 = _1737 | _1749;
    assign _1734 = _1720 ^ _1730;
    assign _1732 = ~ _1730;
    assign _1733 = _1720 & _1732;
    assign _1729 = _1120[7:7];
    assign _1728 = _1120[6:6];
    assign _1727 = _1120[5:5];
    assign _1726 = _1120[4:4];
    assign _1725 = _1120[3:3];
    assign _1724 = _1120[2:2];
    assign _1723 = _1120[1:1];
    assign _1722 = _1120[0:0];
    always @* begin
        case (_1711)
        0: _1730 <= _1722;
        1: _1730 <= _1723;
        2: _1730 <= _1724;
        3: _1730 <= _1725;
        4: _1730 <= _1726;
        5: _1730 <= _1727;
        6: _1730 <= _1728;
        default: _1730 <= _1729;
        endcase
    end
    assign _1719 = _1123[7:7];
    assign _1718 = _1123[6:6];
    assign _1717 = _1123[5:5];
    assign _1716 = _1123[4:4];
    assign _1715 = _1123[3:3];
    assign _1714 = _1123[2:2];
    assign _1713 = _1123[1:1];
    assign _1712 = _1123[0:0];
    assign _1711 = _1709[13:11];
    always @* begin
        case (_1711)
        0: _1720 <= _1712;
        1: _1720 <= _1713;
        2: _1720 <= _1714;
        3: _1720 <= _1715;
        4: _1720 <= _1716;
        5: _1720 <= _1717;
        6: _1720 <= _1718;
        default: _1720 <= _1719;
        endcase
    end
    assign _1721 = ~ _1720;
    assign _1731 = _1721 & _1730;
    assign _1710 = _1709[15:14];
    always @* begin
        case (_1710)
        0: _1735 <= _1731;
        1: _1735 <= _1733;
        2: _1735 <= _1734;
        default: _1735 <= gnd;
        endcase
    end
    assign _1751 = _1735 & _1750;
    assign _1776 = _1751 & _1775;
    assign _2712 = _1709[0:0];
    assign _1868 = ~ _1867;
    assign _1793 = ~ _1777;
    assign _2732 = mon3_count_cycles + _2731;
    assign _2728 = mon3_count_cycles == _2727;
    assign _2729 = ~ _2728;
    assign _2724 = _2378 == _2723;
    assign _2720 = _2378[7:0];
    assign _2722 = _2720 == _2721;
    assign _2639 = _2378 + _2638;
    assign _50 = _2639;
    always @(posedge _151) begin
        if (_164)
            _2378 <= _2377;
        else
            _2378 <= _50;
    end
    assign _2717 = _2378[3:0];
    assign _2719 = _2717 == _2718;
    assign _2716 = _1698[7:6];
    always @* begin
        case (_2716)
        0: _2725 <= vdd;
        1: _2725 <= _2719;
        2: _2725 <= _2722;
        default: _2725 <= _2724;
        endcase
    end
    assign _2726 = _2711 & _2725;
    assign _2730 = _2726 & _2729;
    assign _2733 = _2730 ? _2732 : mon3_count_cycles;
    assign _2735 = _2715 ? _2734 : _2733;
    assign _2736 = ctrl_bit1 ? mon3_count_cycles : _2735;
    assign _51 = _2736;
    always @(posedge _151) begin
        if (_164)
            mon3_count_cycles <= _1788;
        else
            mon3_count_cycles <= _51;
    end
    assign _1783 = _197 == _1782;
    assign _1784 = spi_wr & _1783;
    always @(posedge _151) begin
        if (_164)
            _1785 <= _1781;
        else
            if (_1784)
                _1785 <= spi_wdata;
    end
    assign _1786 = _1785[31:16];
    assign _1790 = _1786 < mon3_count_cycles;
    assign _1779 = _1698[2:2];
    assign _1791 = _1779 & _1790;
    assign _1778 = _1699 & mon3_armed;
    assign _1792 = _1778 & _1791;
    assign _1794 = _1792 & _1793;
    assign _1869 = _1794 & _1868;
    assign _1866 = ~ _1777;
    assign _1859 = _1184[7:7];
    assign _1858 = _1184[6:6];
    assign _1857 = _1184[5:5];
    assign _1856 = _1184[4:4];
    assign _1855 = _1184[3:3];
    assign _1854 = _1184[2:2];
    assign _1853 = _1184[1:1];
    assign _1852 = _1184[0:0];
    always @* begin
        case (_1799)
        0: _1860 <= _1852;
        1: _1860 <= _1853;
        2: _1860 <= _1854;
        3: _1860 <= _1855;
        4: _1860 <= _1856;
        5: _1860 <= _1857;
        6: _1860 <= _1858;
        default: _1860 <= _1859;
        endcase
    end
    assign _1861 = ~ _1860;
    assign _1849 = _1171[7:7];
    assign _1848 = _1171[6:6];
    assign _1847 = _1171[5:5];
    assign _1846 = _1171[4:4];
    assign _1845 = _1171[3:3];
    assign _1844 = _1171[2:2];
    assign _1843 = _1171[1:1];
    assign _1842 = _1171[0:0];
    always @* begin
        case (_1799)
        0: _1850 <= _1842;
        1: _1850 <= _1843;
        2: _1850 <= _1844;
        3: _1850 <= _1845;
        4: _1850 <= _1846;
        5: _1850 <= _1847;
        6: _1850 <= _1848;
        default: _1850 <= _1849;
        endcase
    end
    assign _1851 = ~ _1850;
    assign _1862 = _1851 & _1861;
    assign _1840 = _1698[5:5];
    assign _1841 = ~ _1840;
    assign _1863 = _1841 | _1862;
    assign _1836 = _1709[31:31];
    assign _1834 = _1123[7:7];
    assign _1833 = _1123[6:6];
    assign _1832 = _1123[5:5];
    assign _1831 = _1123[4:4];
    assign _1830 = _1123[3:3];
    assign _1829 = _1123[2:2];
    assign _1828 = _1123[1:1];
    assign _1827 = _1123[0:0];
    assign _1826 = _1709[30:28];
    always @* begin
        case (_1826)
        0: _1835 <= _1827;
        1: _1835 <= _1828;
        2: _1835 <= _1829;
        3: _1835 <= _1830;
        4: _1835 <= _1831;
        5: _1835 <= _1832;
        6: _1835 <= _1833;
        default: _1835 <= _1834;
        endcase
    end
    assign _1837 = _1835 == _1836;
    assign _1824 = _1709[27:27];
    assign _1825 = ~ _1824;
    assign _1838 = _1825 | _1837;
    assign _1822 = _1808 ^ _1818;
    assign _1820 = ~ _1818;
    assign _1821 = _1808 & _1820;
    assign _1817 = _1120[7:7];
    assign _1816 = _1120[6:6];
    assign _1815 = _1120[5:5];
    assign _1814 = _1120[4:4];
    assign _1813 = _1120[3:3];
    assign _1812 = _1120[2:2];
    assign _1811 = _1120[1:1];
    assign _1810 = _1120[0:0];
    always @* begin
        case (_1799)
        0: _1818 <= _1810;
        1: _1818 <= _1811;
        2: _1818 <= _1812;
        3: _1818 <= _1813;
        4: _1818 <= _1814;
        5: _1818 <= _1815;
        6: _1818 <= _1816;
        default: _1818 <= _1817;
        endcase
    end
    assign _1807 = _1123[7:7];
    assign _1806 = _1123[6:6];
    assign _1805 = _1123[5:5];
    assign _1804 = _1123[4:4];
    assign _1803 = _1123[3:3];
    assign _1802 = _1123[2:2];
    assign _1801 = _1123[1:1];
    assign _1800 = _1123[0:0];
    assign _1799 = _1709[24:22];
    always @* begin
        case (_1799)
        0: _1808 <= _1800;
        1: _1808 <= _1801;
        2: _1808 <= _1802;
        3: _1808 <= _1803;
        4: _1808 <= _1804;
        5: _1808 <= _1805;
        6: _1808 <= _1806;
        default: _1808 <= _1807;
        endcase
    end
    assign _1809 = ~ _1808;
    assign _1819 = _1809 & _1818;
    assign _1798 = _1709[26:25];
    always @* begin
        case (_1798)
        0: _1823 <= _1819;
        1: _1823 <= _1821;
        2: _1823 <= _1822;
        default: _1823 <= gnd;
        endcase
    end
    assign _1839 = _1823 & _1838;
    assign _1864 = _1839 & _1863;
    assign _1796 = _1709[21:21];
    assign _1795 = _1699 & mon3_armed;
    assign _1797 = _1795 & _1796;
    assign _1865 = _1797 & _1864;
    assign _1867 = _1865 & _1866;
    assign _2708 = _1777 | _1867;
    assign _2709 = _2708 | _1869;
    assign _2710 = ~ _2709;
    assign _2711 = mon3_armed & _2710;
    assign _2713 = _2711 & _2712;
    assign _2714 = ~ _2713;
    assign _2701 = _1184[7:7];
    assign _2700 = _1184[6:6];
    assign _2699 = _1184[5:5];
    assign _2698 = _1184[4:4];
    assign _2697 = _1184[3:3];
    assign _2696 = _1184[2:2];
    assign _2695 = _1184[1:1];
    always @(posedge _151) begin
        if (_164)
            _1184 <= _1183;
        else
            _1184 <= _1171;
    end
    assign _2694 = _1184[0:0];
    always @* begin
        case (_2641)
        0: _2702 <= _2694;
        1: _2702 <= _2695;
        2: _2702 <= _2696;
        3: _2702 <= _2697;
        4: _2702 <= _2698;
        5: _2702 <= _2699;
        6: _2702 <= _2700;
        default: _2702 <= _2701;
        endcase
    end
    assign _2703 = ~ _2702;
    assign _2691 = _1171[7:7];
    assign _2690 = _1171[6:6];
    assign _2689 = _1171[5:5];
    assign _2688 = _1171[4:4];
    assign _2687 = _1171[3:3];
    assign _2686 = _1171[2:2];
    assign _2685 = _1171[1:1];
    assign _2750 = _344 == _2749;
    assign _348 = _344 == _347;
    assign _346 = _344 == _345;
    assign _349 = _346 | _348;
    assign _2751 = _349 | _2750;
    assign _342 = _340 == _341;
    assign _343 = _313 & _342;
    assign _2752 = _343 & _2751;
    assign _2753 = _2752 ? _349 : pin0_oe;
    assign _2746 = _333 == _2745;
    assign _337 = _333 == _336;
    assign _335 = _333 == _334;
    assign _338 = _335 | _337;
    assign _2747 = _338 | _2746;
    assign _331 = _329 == _330;
    assign _332 = _328 & _331;
    assign _2748 = _332 & _2747;
    assign _2754 = _2748 ? _338 : _2753;
    assign _2742 = _271 == _2741;
    assign _275 = _271 == _274;
    assign _273 = _271 == _272;
    assign _276 = _273 | _275;
    assign _2743 = _276 | _2742;
    assign _269 = _267 == _268;
    assign _270 = _240 & _269;
    assign _2744 = _270 & _2743;
    assign _2755 = _2744 ? _276 : _2754;
    assign _2738 = _260 == _2737;
    assign _264 = _260 == _263;
    assign _262 = _260 == _261;
    assign _265 = _262 | _264;
    assign _2739 = _265 | _2738;
    assign _258 = _256 == _257;
    assign _259 = _255 & _258;
    assign _2740 = _259 & _2739;
    assign _2756 = _2740 ? _265 : _2755;
    assign _52 = _2756;
    always @(posedge _151) begin
        if (_164)
            pin0_oe <= _186;
        else
            pin0_oe <= _52;
    end
    assign _2770 = _344 == _2769;
    assign _399 = _344 == _398;
    assign _397 = _344 == _396;
    assign _400 = _397 | _399;
    assign _2771 = _400 | _2770;
    assign _394 = _340 == _393;
    assign _395 = _313 & _394;
    assign _2772 = _395 & _2771;
    assign _2773 = _2772 ? _400 : pin1_oe;
    assign _2766 = _333 == _2765;
    assign _390 = _333 == _389;
    assign _388 = _333 == _387;
    assign _391 = _388 | _390;
    assign _2767 = _391 | _2766;
    assign _385 = _329 == _384;
    assign _386 = _328 & _385;
    assign _2768 = _386 & _2767;
    assign _2774 = _2768 ? _391 : _2773;
    assign _2762 = _271 == _2761;
    assign _381 = _271 == _380;
    assign _379 = _271 == _378;
    assign _382 = _379 | _381;
    assign _2763 = _382 | _2762;
    assign _376 = _267 == _375;
    assign _377 = _240 & _376;
    assign _2764 = _377 & _2763;
    assign _2775 = _2764 ? _382 : _2774;
    assign _2758 = _260 == _2757;
    assign _372 = _260 == _371;
    assign _370 = _260 == _369;
    assign _373 = _370 | _372;
    assign _2759 = _373 | _2758;
    assign _367 = _256 == _366;
    assign _368 = _255 & _367;
    assign _2760 = _368 & _2759;
    assign _2776 = _2760 ? _373 : _2775;
    assign _53 = _2776;
    always @(posedge _151) begin
        if (_164)
            pin1_oe <= _183;
        else
            pin1_oe <= _53;
    end
    assign _2790 = _344 == _2789;
    assign _450 = _344 == _449;
    assign _448 = _344 == _447;
    assign _451 = _448 | _450;
    assign _2791 = _451 | _2790;
    assign _445 = _340 == _444;
    assign _446 = _313 & _445;
    assign _2792 = _446 & _2791;
    assign _2793 = _2792 ? _451 : pin2_oe;
    assign _2786 = _333 == _2785;
    assign _441 = _333 == _440;
    assign _439 = _333 == _438;
    assign _442 = _439 | _441;
    assign _2787 = _442 | _2786;
    assign _436 = _329 == _435;
    assign _437 = _328 & _436;
    assign _2788 = _437 & _2787;
    assign _2794 = _2788 ? _442 : _2793;
    assign _2782 = _271 == _2781;
    assign _432 = _271 == _431;
    assign _430 = _271 == _429;
    assign _433 = _430 | _432;
    assign _2783 = _433 | _2782;
    assign _427 = _267 == _426;
    assign _428 = _240 & _427;
    assign _2784 = _428 & _2783;
    assign _2795 = _2784 ? _433 : _2794;
    assign _2778 = _260 == _2777;
    assign _423 = _260 == _422;
    assign _421 = _260 == _420;
    assign _424 = _421 | _423;
    assign _2779 = _424 | _2778;
    assign _418 = _256 == _417;
    assign _419 = _255 & _418;
    assign _2780 = _419 & _2779;
    assign _2796 = _2780 ? _424 : _2795;
    assign _54 = _2796;
    always @(posedge _151) begin
        if (_164)
            pin2_oe <= _180;
        else
            pin2_oe <= _54;
    end
    assign _2810 = _344 == _2809;
    assign _501 = _344 == _500;
    assign _499 = _344 == _498;
    assign _502 = _499 | _501;
    assign _2811 = _502 | _2810;
    assign _496 = _340 == _495;
    assign _497 = _313 & _496;
    assign _2812 = _497 & _2811;
    assign _2813 = _2812 ? _502 : pin3_oe;
    assign _2806 = _333 == _2805;
    assign _492 = _333 == _491;
    assign _490 = _333 == _489;
    assign _493 = _490 | _492;
    assign _2807 = _493 | _2806;
    assign _487 = _329 == _486;
    assign _488 = _328 & _487;
    assign _2808 = _488 & _2807;
    assign _2814 = _2808 ? _493 : _2813;
    assign _2802 = _271 == _2801;
    assign _483 = _271 == _482;
    assign _481 = _271 == _480;
    assign _484 = _481 | _483;
    assign _2803 = _484 | _2802;
    assign _478 = _267 == _477;
    assign _479 = _240 & _478;
    assign _2804 = _479 & _2803;
    assign _2815 = _2804 ? _484 : _2814;
    assign _2798 = _260 == _2797;
    assign _474 = _260 == _473;
    assign _472 = _260 == _471;
    assign _475 = _472 | _474;
    assign _2799 = _475 | _2798;
    assign _469 = _256 == _468;
    assign _470 = _255 & _469;
    assign _2800 = _470 & _2799;
    assign _2816 = _2800 ? _475 : _2815;
    assign _55 = _2816;
    always @(posedge _151) begin
        if (_164)
            pin3_oe <= _177;
        else
            pin3_oe <= _55;
    end
    assign _2830 = _344 == _2829;
    assign _552 = _344 == _551;
    assign _550 = _344 == _549;
    assign _553 = _550 | _552;
    assign _2831 = _553 | _2830;
    assign _547 = _340 == _546;
    assign _548 = _313 & _547;
    assign _2832 = _548 & _2831;
    assign _2833 = _2832 ? _553 : pin4_oe;
    assign _2826 = _333 == _2825;
    assign _543 = _333 == _542;
    assign _541 = _333 == _540;
    assign _544 = _541 | _543;
    assign _2827 = _544 | _2826;
    assign _538 = _329 == _537;
    assign _539 = _328 & _538;
    assign _2828 = _539 & _2827;
    assign _2834 = _2828 ? _544 : _2833;
    assign _2822 = _271 == _2821;
    assign _534 = _271 == _533;
    assign _532 = _271 == _531;
    assign _535 = _532 | _534;
    assign _2823 = _535 | _2822;
    assign _529 = _267 == _528;
    assign _530 = _240 & _529;
    assign _2824 = _530 & _2823;
    assign _2835 = _2824 ? _535 : _2834;
    assign _2818 = _260 == _2817;
    assign _525 = _260 == _524;
    assign _523 = _260 == _522;
    assign _526 = _523 | _525;
    assign _2819 = _526 | _2818;
    assign _520 = _256 == _519;
    assign _521 = _255 & _520;
    assign _2820 = _521 & _2819;
    assign _2836 = _2820 ? _526 : _2835;
    assign _56 = _2836;
    always @(posedge _151) begin
        if (_164)
            pin4_oe <= _174;
        else
            pin4_oe <= _56;
    end
    assign _2850 = _344 == _2849;
    assign _603 = _344 == _602;
    assign _601 = _344 == _600;
    assign _604 = _601 | _603;
    assign _2851 = _604 | _2850;
    assign _598 = _340 == _597;
    assign _599 = _313 & _598;
    assign _2852 = _599 & _2851;
    assign _2853 = _2852 ? _604 : pin5_oe;
    assign _2846 = _333 == _2845;
    assign _594 = _333 == _593;
    assign _592 = _333 == _591;
    assign _595 = _592 | _594;
    assign _2847 = _595 | _2846;
    assign _589 = _329 == _588;
    assign _590 = _328 & _589;
    assign _2848 = _590 & _2847;
    assign _2854 = _2848 ? _595 : _2853;
    assign _2842 = _271 == _2841;
    assign _585 = _271 == _584;
    assign _583 = _271 == _582;
    assign _586 = _583 | _585;
    assign _2843 = _586 | _2842;
    assign _580 = _267 == _579;
    assign _581 = _240 & _580;
    assign _2844 = _581 & _2843;
    assign _2855 = _2844 ? _586 : _2854;
    assign _2838 = _260 == _2837;
    assign _576 = _260 == _575;
    assign _574 = _260 == _573;
    assign _577 = _574 | _576;
    assign _2839 = _577 | _2838;
    assign _571 = _256 == _570;
    assign _572 = _255 & _571;
    assign _2840 = _572 & _2839;
    assign _2856 = _2840 ? _577 : _2855;
    assign _57 = _2856;
    always @(posedge _151) begin
        if (_164)
            pin5_oe <= _171;
        else
            pin5_oe <= _57;
    end
    assign _2870 = _344 == _2869;
    assign _654 = _344 == _653;
    assign _652 = _344 == _651;
    assign _655 = _652 | _654;
    assign _2871 = _655 | _2870;
    assign _649 = _340 == _648;
    assign _650 = _313 & _649;
    assign _2872 = _650 & _2871;
    assign _2873 = _2872 ? _655 : pin6_oe;
    assign _2866 = _333 == _2865;
    assign _645 = _333 == _644;
    assign _643 = _333 == _642;
    assign _646 = _643 | _645;
    assign _2867 = _646 | _2866;
    assign _640 = _329 == _639;
    assign _641 = _328 & _640;
    assign _2868 = _641 & _2867;
    assign _2874 = _2868 ? _646 : _2873;
    assign _2862 = _271 == _2861;
    assign _636 = _271 == _635;
    assign _634 = _271 == _633;
    assign _637 = _634 | _636;
    assign _2863 = _637 | _2862;
    assign _631 = _267 == _630;
    assign _632 = _240 & _631;
    assign _2864 = _632 & _2863;
    assign _2875 = _2864 ? _637 : _2874;
    assign _2858 = _260 == _2857;
    assign _627 = _260 == _626;
    assign _625 = _260 == _624;
    assign _628 = _625 | _627;
    assign _2859 = _628 | _2858;
    assign _622 = _256 == _621;
    assign _623 = _255 & _622;
    assign _2860 = _623 & _2859;
    assign _2876 = _2860 ? _628 : _2875;
    assign _58 = _2876;
    always @(posedge _151) begin
        if (_164)
            pin6_oe <= _168;
        else
            pin6_oe <= _58;
    end
    assign _2890 = _344 == _2889;
    assign _705 = _344 == _704;
    assign _703 = _344 == _702;
    assign _706 = _703 | _705;
    assign _2891 = _706 | _2890;
    assign _700 = _340 == _699;
    assign _701 = _313 & _700;
    assign _2892 = _701 & _2891;
    assign _2893 = _2892 ? _706 : pin7_oe;
    assign _2886 = _333 == _2885;
    assign _696 = _333 == _695;
    assign _694 = _333 == _693;
    assign _697 = _694 | _696;
    assign _2887 = _697 | _2886;
    assign _691 = _329 == _690;
    assign _692 = _328 & _691;
    assign _2888 = _692 & _2887;
    assign _2894 = _2888 ? _697 : _2893;
    assign _2882 = _271 == _2881;
    assign _687 = _271 == _686;
    assign _685 = _271 == _684;
    assign _688 = _685 | _687;
    assign _2883 = _688 | _2882;
    assign _682 = _267 == _681;
    assign _683 = _240 & _682;
    assign _2884 = _683 & _2883;
    assign _2895 = _2884 ? _688 : _2894;
    assign _2878 = _260 == _2877;
    assign _678 = _260 == _677;
    assign _676 = _260 == _675;
    assign _679 = _676 | _678;
    assign _2879 = _679 | _2878;
    assign _673 = _256 == _672;
    assign _674 = _255 & _673;
    assign _2880 = _674 & _2879;
    assign _2896 = _2880 ? _679 : _2895;
    assign _59 = _2896;
    always @(posedge _151) begin
        if (_164)
            pin7_oe <= _165;
        else
            pin7_oe <= _59;
    end
    assign _188 = { pin7_oe, pin6_oe, pin5_oe, pin4_oe, pin3_oe, pin2_oe, pin1_oe, pin0_oe };
    always @(posedge _151) begin
        if (_164)
            _1168 <= _1167;
        else
            _1168 <= _188;
    end
    always @(posedge _151) begin
        if (_164)
            _1171 <= _1170;
        else
            _1171 <= _1168;
    end
    assign _2684 = _1171[0:0];
    always @* begin
        case (_2641)
        0: _2692 <= _2684;
        1: _2692 <= _2685;
        2: _2692 <= _2686;
        3: _2692 <= _2687;
        4: _2692 <= _2688;
        5: _2692 <= _2689;
        6: _2692 <= _2690;
        default: _2692 <= _2691;
        endcase
    end
    assign _2693 = ~ _2692;
    assign _2704 = _2693 & _2703;
    assign _2682 = _1698[3:3];
    assign _2683 = ~ _2682;
    assign _2705 = _2683 | _2704;
    assign _2678 = _1709[10:10];
    assign _2676 = _1123[7:7];
    assign _2675 = _1123[6:6];
    assign _2674 = _1123[5:5];
    assign _2673 = _1123[4:4];
    assign _2672 = _1123[3:3];
    assign _2671 = _1123[2:2];
    assign _2670 = _1123[1:1];
    assign _2669 = _1123[0:0];
    assign _2668 = _1709[9:7];
    always @* begin
        case (_2668)
        0: _2677 <= _2669;
        1: _2677 <= _2670;
        2: _2677 <= _2671;
        3: _2677 <= _2672;
        4: _2677 <= _2673;
        5: _2677 <= _2674;
        6: _2677 <= _2675;
        default: _2677 <= _2676;
        endcase
    end
    assign _2679 = _2677 == _2678;
    assign _2666 = _1709[6:6];
    assign _2667 = ~ _2666;
    assign _2680 = _2667 | _2679;
    assign _2664 = _2650 ^ _2660;
    assign _2662 = ~ _2660;
    assign _2663 = _2650 & _2662;
    assign _2659 = _1120[7:7];
    assign _2658 = _1120[6:6];
    assign _2657 = _1120[5:5];
    assign _2656 = _1120[4:4];
    assign _2655 = _1120[3:3];
    assign _2654 = _1120[2:2];
    assign _2653 = _1120[1:1];
    assign _2652 = _1120[0:0];
    always @* begin
        case (_2641)
        0: _2660 <= _2652;
        1: _2660 <= _2653;
        2: _2660 <= _2654;
        3: _2660 <= _2655;
        4: _2660 <= _2656;
        5: _2660 <= _2657;
        6: _2660 <= _2658;
        default: _2660 <= _2659;
        endcase
    end
    assign _2649 = _1123[7:7];
    assign _2648 = _1123[6:6];
    assign _2647 = _1123[5:5];
    assign _2646 = _1123[4:4];
    assign _2645 = _1123[3:3];
    assign _2644 = _1123[2:2];
    assign _2643 = _1123[1:1];
    always @(posedge _151) begin
        _1117 <= _126;
    end
    always @(posedge _151) begin
        _1120 <= _1117;
    end
    always @(posedge _151) begin
        if (_164)
            _1123 <= _1122;
        else
            _1123 <= _1120;
    end
    assign _2642 = _1123[0:0];
    assign _2641 = _1709[3:1];
    always @* begin
        case (_2641)
        0: _2650 <= _2642;
        1: _2650 <= _2643;
        2: _2650 <= _2644;
        3: _2650 <= _2645;
        4: _2650 <= _2646;
        5: _2650 <= _2647;
        6: _2650 <= _2648;
        default: _2650 <= _2649;
        endcase
    end
    assign _2651 = ~ _2650;
    assign _2661 = _2651 & _2660;
    assign _1707 = _197 == _1706;
    assign _1708 = spi_wr & _1707;
    always @(posedge _151) begin
        if (_164)
            _1709 <= _1705;
        else
            if (_1708)
                _1709 <= spi_wdata;
    end
    assign _2640 = _1709[5:4];
    always @* begin
        case (_2640)
        0: _2665 <= _2661;
        1: _2665 <= _2663;
        2: _2665 <= _2664;
        default: _2665 <= gnd;
        endcase
    end
    assign _2681 = _2665 & _2680;
    assign _2706 = _2681 & _2705;
    assign _2707 = _1699 & _2706;
    assign _2715 = _2707 & _2714;
    assign _2897 = _2715 ? vdd : _2711;
    assign _2898 = ctrl_bit1 ? gnd : _2897;
    assign _60 = _2898;
    always @(posedge _151) begin
        if (_164)
            mon3_armed <= _1701;
        else
            mon3_armed <= _60;
    end
    assign _1695 = _197 == _1694;
    assign _1696 = spi_wr & _1695;
    assign _1691 = spi_wdata[7:0];
    always @(posedge _151) begin
        if (_164)
            _1697 <= _1693;
        else
            if (_1696)
                _1697 <= _1691;
    end
    assign _1698 = { _1690, _1697 };
    assign _1699 = _1698[0:0];
    assign _1703 = _1699 & mon3_armed;
    assign _1777 = _1703 & _1776;
    assign _2900 = _1777 & _2899;
    assign _2903 = _2900 & _2902;
    assign _2905 = _2903 | _2904;
    assign _2906 = _2905 | _1869;
    assign _2910 = _2906 ? vdd : mon3_sticky;
    assign _1088 = spi_wdata[1:1];
    assign _1089 = _200 & _1088;
    always @(posedge _151) begin
        if (_164)
            ctrl_bit1 <= _1091;
        else
            ctrl_bit1 <= _1089;
    end
    assign _2911 = ctrl_bit1 ? gnd : _2910;
    assign _61 = _2911;
    always @(posedge _151) begin
        if (_164)
            mon3_sticky <= _2908;
        else
            mon3_sticky <= _61;
    end
    assign _4606 = { mon3_sticky, mon2_sticky, mon1_sticky, mon0_sticky };
    assign _63 = ena;
    always @(posedge _151) begin
        _4602 <= _63;
    end
    always @(posedge _151) begin
        _4605 <= _4602;
    end
    assign _4451 = _256 == _329;
    assign _4447 = _333 == _4446;
    assign _4448 = ~ _4447;
    assign _4449 = _328 & _4448;
    assign _4443 = _260 == _4442;
    assign _4444 = ~ _4443;
    assign _4445 = _255 & _4444;
    assign _4450 = _4445 & _4449;
    assign _4452 = _4450 & _4451;
    assign _256 = _246[4:2];
    assign _4439 = _256 == _340;
    assign _4435 = _344 == _4434;
    assign _4436 = ~ _4435;
    assign _4437 = _313 & _4436;
    assign _260 = _246[1:0];
    assign _4431 = _260 == _4430;
    assign _4432 = ~ _4431;
    assign _4433 = _255 & _4432;
    assign _4438 = _4433 & _4437;
    assign _4440 = _4438 & _4439;
    assign _329 = _319[4:2];
    assign _4427 = _267 == _329;
    assign _333 = _319[1:0];
    assign _4423 = _333 == _4422;
    assign _4424 = ~ _4423;
    assign _4425 = _328 & _4424;
    assign _4419 = _271 == _4418;
    assign _4420 = ~ _4419;
    assign _4421 = _240 & _4420;
    assign _4426 = _4421 & _4425;
    assign _4428 = _4426 & _4427;
    assign _340 = _304[4:2];
    assign _267 = _228[4:2];
    assign _4416 = _267 == _340;
    assign _344 = _304[1:0];
    assign _4412 = _344 == _4411;
    assign _4413 = ~ _4412;
    assign _308 = _304[28:5];
    assign _309 = _308 - timebase;
    assign _311 = _309 == _310;
    always @* begin
        case (queue_b_read_ptr)
        0: _304 <= queue_b_entry0;
        1: _304 <= queue_b_entry1;
        2: _304 <= queue_b_entry2;
        default: _304 <= queue_b_entry3;
        endcase
    end
    assign _305 = _304[28:5];
    assign _306 = _305 - timebase;
    assign _307 = _306[23:23];
    assign _312 = _307 | _311;
    assign _323 = _319[28:5];
    assign _324 = _323 - timebase;
    assign _326 = _324 == _325;
    assign _2916 = queue_b_write_ptr == _2915;
    assign _2994 = _2916 ? _2993 : queue_b_entry3;
    assign _2995 = _997 ? _2994 : queue_b_entry3;
    assign _64 = _2995;
    always @(posedge _151) begin
        if (_285)
            queue_b_entry3 <= _302;
        else
            queue_b_entry3 <= _64;
    end
    assign _2997 = queue_b_write_ptr == _2996;
    assign _2998 = _2997 ? _2993 : queue_b_entry2;
    assign _2999 = _997 ? _2998 : queue_b_entry2;
    assign _65 = _2999;
    always @(posedge _151) begin
        if (_285)
            queue_b_entry2 <= _299;
        else
            queue_b_entry2 <= _65;
    end
    assign _3001 = queue_b_write_ptr == _3000;
    assign _3002 = _3001 ? _2993 : queue_b_entry1;
    assign _3003 = _997 ? _3002 : queue_b_entry1;
    assign _66 = _3003;
    always @(posedge _151) begin
        if (_285)
            queue_b_entry1 <= _296;
        else
            queue_b_entry1 <= _66;
    end
    assign _2989 = _2942 ? _2988 : _2987;
    assign _3102 = _2926 ? _2992 : seq_b_shadow_clk;
    assign _3103 = _3101 ? _3102 : seq_b_shadow_clk;
    assign _3104 = _994 ? _3103 : seq_b_shadow_clk;
    assign _3105 = _3092 ? _3104 : seq_b_shadow_clk;
    assign _3107 = ctrl_bit3 ? _3106 : _3105;
    assign _67 = _3107;
    always @(posedge _151) begin
        if (_164)
            seq_b_shadow_clk <= _2980;
        else
            seq_b_shadow_clk <= _67;
    end
    assign _3108 = _2926 ? seq_b_shadow_data : _2992;
    assign _3099 = _2917 == _3098;
    assign _3096 = _2917 == _3095;
    assign _3094 = _2917 == _3093;
    assign _3097 = _3094 | _3096;
    assign _3100 = _3097 | _3099;
    assign _3101 = ~ _3100;
    assign _3109 = _3101 ? _3108 : seq_b_shadow_data;
    assign _3110 = _994 ? _3109 : seq_b_shadow_data;
    assign _3111 = _3092 ? _3110 : seq_b_shadow_data;
    assign _3113 = ctrl_bit3 ? _3112 : _3111;
    assign _68 = _3113;
    always @(posedge _151) begin
        if (_164)
            seq_b_shadow_data <= _2977;
        else
            seq_b_shadow_data <= _68;
    end
    assign _2982 = _2926 ? seq_b_shadow_clk : seq_b_shadow_data;
    assign _2984 = _2982 == _2983;
    assign _2985 = _2984 ? _2974 : _2958;
    assign _2971 = seq_b_coder[3:3];
    assign _2974 = _2971 ? _2973 : _2972;
    assign _3122 = _3121[3:0];
    assign _3119 = _3117 == _3118;
    assign _3115 = _949 == _3114;
    assign _3116 = _946 & _3115;
    assign _3120 = _3116 & _3119;
    assign _3123 = _3120 ? _3122 : seq_b_coder;
    assign _3124 = _3092 ? _3123 : seq_b_coder;
    assign _3126 = ctrl_bit3 ? _3125 : _3124;
    assign _69 = _3126;
    always @(posedge _151) begin
        if (_164)
            seq_b_coder <= _2967;
        else
            seq_b_coder <= _69;
    end
    assign _2969 = seq_b_coder[2:2];
    assign _3137 = _3135 == _3136;
    assign _3138 = _3132 & _3137;
    assign _3142 = _3138 ? spi_wdata : _3141;
    assign _70 = _3142;
    always @(posedge _151) begin
        if (_164)
            _3141 <= _3140;
        else
            _3141 <= _70;
    end
    assign _3144 = _3135 == _3143;
    assign _3145 = _3132 & _3144;
    assign _3149 = _3145 ? spi_wdata : _3148;
    assign _71 = _3149;
    always @(posedge _151) begin
        if (_164)
            _3148 <= _3147;
        else
            _3148 <= _71;
    end
    assign _3151 = _3135 == _3150;
    assign _3152 = _3132 & _3151;
    assign _3156 = _3152 ? spi_wdata : _3155;
    assign _72 = _3156;
    always @(posedge _151) begin
        if (_164)
            _3155 <= _3154;
        else
            _3155 <= _72;
    end
    assign _3158 = _3135 + _3157;
    assign _3159 = _3132 ? _3158 : _3135;
    assign _73 = _3159;
    always @(posedge _151) begin
        if (_164)
            _3135 <= _3134;
        else
            _3135 <= _73;
    end
    assign _3161 = _3135 == _3160;
    assign _3162 = _3132 & _3161;
    assign _3166 = _3162 ? spi_wdata : _3165;
    assign _74 = _3166;
    always @(posedge _151) begin
        if (_164)
            _3165 <= _3164;
        else
            _3165 <= _74;
    end
    assign _3174 = _3172 + _3173;
    assign _3175 = _3169 ? _3174 : _3172;
    assign _75 = _3175;
    always @(posedge _151) begin
        if (_164)
            _3172 <= _3171;
        else
            _3172 <= _75;
    end
    always @* begin
        case (_3172)
        0: _3183 <= _3165;
        1: _3183 <= _3155;
        2: _3183 <= _3148;
        default: _3183 <= _3141;
        endcase
    end
    assign _3178 = seq_b_osr[30:0];
    assign _3180 = { _3178, _3179 };
    assign _3177 = _2917 == _3176;
    assign _3181 = _3177 ? _3180 : seq_b_osr;
    assign _3182 = _994 ? _3181 : seq_b_osr;
    assign _3184 = _3034 ? _3183 : _3182;
    assign _3185 = _3092 ? _3184 : seq_b_osr;
    assign _3187 = ctrl_bit3 ? _3186 : _3185;
    assign _76 = _3187;
    always @(posedge _151) begin
        if (_164)
            seq_b_osr <= _2963;
        else
            seq_b_osr <= _76;
    end
    assign _2965 = seq_b_osr[31:31];
    assign _2970 = _2965 ^ _2969;
    assign _2975 = _2970 ? _2974 : _2958;
    assign _2986 = _2947 ? _2985 : _2975;
    assign _2990 = _2945 ? _2989 : _2986;
    assign _2961 = _2953 ? _2960 : _2959;
    assign _2991 = _2951 ? _2990 : _2961;
    assign _2955 = _2917 == _2954;
    assign _2953 = _2917 == _2952;
    assign _2956 = _2953 | _2955;
    assign _2949 = _2917 == _2948;
    assign _2947 = _2917 == _2946;
    assign _2950 = _2947 | _2949;
    assign _2944 = _2917 == _2943;
    assign _2942 = _2917 == _2941;
    assign _2945 = _2942 | _2944;
    assign _2951 = _2945 | _2950;
    assign _2957 = _2951 | _2956;
    assign _2992 = _2957 ? _2991 : _2958;
    assign _2939 = _2919 ? _2938 : _2937;
    assign _2926 = seq_b_ir[5:5];
    assign _2936 = _2926 ? _2935 : _2934;
    assign _2923 = _2917 == _2922;
    assign _2921 = _2917 == _2920;
    assign _2924 = _2921 | _2923;
    assign _2917 = seq_b_ir[2:0];
    assign _2919 = _2917 == _2918;
    assign _2925 = _2919 | _2924;
    assign _2940 = _2925 ? _2939 : _2936;
    assign _1039 = _1032[17:0];
    assign _1041 = { _1039, _1040 };
    assign _1036 = _1032[19:0];
    assign _1038 = { _1036, _1037 };
    assign _1033 = _1032[21:0];
    assign _1035 = { _1033, _1034 };
    assign _1030 = { _1028, _1027 };
    assign _3192 = _3117 == _3191;
    assign _3189 = _949 == _3188;
    assign _3190 = _946 & _3189;
    assign _3193 = _3190 & _3192;
    assign _3194 = _3193 ? _3121 : seq_b_k3;
    assign _3195 = _3092 ? _3194 : seq_b_k3;
    assign _3204 = ctrl_bit3 ? _3203 : _3195;
    assign _77 = _3204;
    always @(posedge _151) begin
        if (_164)
            seq_b_k3 <= _1019;
        else
            seq_b_k3 <= _77;
    end
    assign _3209 = _3117 == _3208;
    assign _3206 = _949 == _3205;
    assign _3207 = _946 & _3206;
    assign _3210 = _3207 & _3209;
    assign _3211 = _3210 ? _3121 : seq_b_k2;
    assign _3212 = _3092 ? _3211 : seq_b_k2;
    assign _3214 = ctrl_bit3 ? _3213 : _3212;
    assign _78 = _3214;
    always @(posedge _151) begin
        if (_164)
            seq_b_k2 <= _1016;
        else
            seq_b_k2 <= _78;
    end
    assign _3219 = _3117 == _3218;
    assign _3216 = _949 == _3215;
    assign _3217 = _946 & _3216;
    assign _3220 = _3217 & _3219;
    assign _3221 = _3220 ? _3121 : seq_b_k1;
    assign _3222 = _3092 ? _3221 : seq_b_k1;
    assign _3224 = ctrl_bit3 ? _3223 : _3222;
    assign _79 = _3224;
    always @(posedge _151) begin
        if (_164)
            seq_b_k1 <= _1013;
        else
            seq_b_k1 <= _79;
    end
    assign _1010 = seq_b_ir[4:3];
    always @* begin
        case (_1010)
        0: _1021 <= _1011;
        1: _1021 <= seq_b_k1;
        2: _1021 <= seq_b_k2;
        default: _1021 <= seq_b_k3;
        endcase
    end
    assign _1022 = _1021[7:7];
    assign _1023 = { _1022, _1022 };
    assign _1024 = { _1023, _1021 };
    assign _1008 = seq_b_ir[11:6];
    assign _1009 = { _1007, _1008 };
    assign _1025 = _1009 + _1024;
    assign _1026 = _1025[9:9];
    assign _1027 = { _1026, _1026 };
    assign _1028 = { _1027, _1027 };
    assign _1029 = { _1028, _1028 };
    assign _1031 = { _1029, _1030 };
    assign _1032 = { _1031, _1025 };
    always @* begin
        case (seq_b_prescale)
        0: _1042 <= _1032;
        1: _1042 <= _1035;
        2: _1042 <= _1038;
        default: _1042 <= _1041;
        endcase
    end
    assign _1043 = seq_b_sched_s + _1042;
    assign _2993 = { _1043, _2940, _2992 };
    assign _3226 = queue_b_write_ptr + _3225;
    assign _3227 = _997 ? _3226 : queue_b_write_ptr;
    assign _80 = _3227;
    always @(posedge _151) begin
        if (_285)
            queue_b_write_ptr <= _2913;
        else
            queue_b_write_ptr <= _80;
    end
    assign _3229 = queue_b_write_ptr == _3228;
    assign _3230 = _3229 ? _2993 : queue_b_entry0;
    assign _3231 = _997 ? _3230 : queue_b_entry0;
    assign _81 = _3231;
    always @(posedge _151) begin
        if (_285)
            queue_b_entry0 <= _293;
        else
            queue_b_entry0 <= _81;
    end
    assign _285 = _164 | ctrl_bit3;
    assign _3237 = _3236[1:0];
    assign _3238 = queue_b_read_ptr + _3237;
    assign _82 = _3238;
    always @(posedge _151) begin
        if (_285)
            queue_b_read_ptr <= _290;
        else
            queue_b_read_ptr <= _82;
    end
    assign _318 = queue_b_read_ptr + _317;
    always @* begin
        case (_318)
        0: _319 <= queue_b_entry0;
        1: _319 <= queue_b_entry1;
        2: _319 <= queue_b_entry2;
        default: _319 <= queue_b_entry3;
        endcase
    end
    assign _320 = _319[28:5];
    assign _321 = _320 - timebase;
    assign _322 = _321[23:23];
    assign _327 = _322 | _326;
    assign _315 = _314 < queue_b_count;
    assign _316 = _313 & _315;
    assign _328 = _316 & _327;
    assign _3235 = { _3234, _328 };
    assign _3233 = { _3232, _313 };
    assign _3236 = _3233 + _3235;
    assign _993 = ~ seq_b_far;
    assign _996 = queue_b_count < _995;
    assign _83 = _996;
    assign _986 = _949 == _985;
    assign _987 = _946 & _986;
    assign _963 = seq_b_running & _962;
    assign _3662 = _963 ? gnd : seq_b_running;
    assign _942 = seq_b_ir & _941;
    assign _944 = _942 == _943;
    assign _937 = seq_b_ir[10:10];
    assign _939 = _937 == _938;
    assign _933 = seq_b_ir[11:11];
    assign _935 = _933 == _934;
    assign _930 = seq_b_ir[15:12];
    assign _932 = _930 == _931;
    assign _936 = _932 & _935;
    assign _940 = _936 & _939;
    assign _945 = _940 & _944;
    assign _924 = seq_b_ir[11:8];
    assign _926 = _924 == _925;
    assign _920 = seq_b_ir[11:8];
    assign _922 = _920 == _921;
    assign _916 = seq_b_ir[11:8];
    assign _918 = _916 == _917;
    assign _912 = seq_b_ir[11:8];
    assign _914 = _912 == _913;
    assign _908 = seq_b_ir[11:8];
    assign _910 = _908 == _909;
    assign _904 = seq_b_ir[11:8];
    assign _906 = _904 == _905;
    assign _900 = seq_b_ir[11:8];
    assign _902 = _900 == _901;
    assign _896 = seq_b_ir[11:8];
    assign _898 = _896 == _897;
    assign _893 = seq_b_ir[11:8];
    assign _895 = _893 == _894;
    assign _899 = _895 | _898;
    assign _903 = _899 | _902;
    assign _907 = _903 | _906;
    assign _911 = _907 | _910;
    assign _915 = _911 | _914;
    assign _919 = _915 | _918;
    assign _923 = _919 | _922;
    assign _927 = _923 | _926;
    assign _890 = seq_b_ir[15:12];
    assign _892 = _890 == _891;
    assign _928 = _892 & _927;
    assign _885 = seq_b_ir & _884;
    assign _887 = _885 == _886;
    assign _879 = seq_b_ir[11:8];
    assign _881 = _879 == _880;
    assign _875 = seq_b_ir[11:8];
    assign _877 = _875 == _876;
    assign _871 = seq_b_ir[11:8];
    assign _873 = _871 == _872;
    assign _867 = seq_b_ir[11:8];
    assign _869 = _867 == _868;
    assign _864 = seq_b_ir[11:8];
    assign _866 = _864 == _865;
    assign _870 = _866 | _869;
    assign _874 = _870 | _873;
    assign _878 = _874 | _877;
    assign _882 = _878 | _881;
    assign _861 = seq_b_ir[15:12];
    assign _863 = _861 == _862;
    assign _883 = _863 & _882;
    assign _888 = _883 & _887;
    assign _856 = seq_b_ir & _855;
    assign _858 = _856 == _857;
    assign _850 = seq_b_ir[7:6];
    assign _852 = _850 == _851;
    assign _846 = seq_b_ir[7:6];
    assign _848 = _846 == _847;
    assign _843 = seq_b_ir[7:6];
    assign _845 = _843 == _844;
    assign _849 = _845 | _848;
    assign _853 = _849 | _852;
    assign _838 = seq_b_ir[11:9];
    assign _840 = _838 == _839;
    assign _834 = seq_b_ir[11:9];
    assign _836 = _834 == _835;
    assign _830 = seq_b_ir[11:9];
    assign _832 = _830 == _831;
    assign _827 = seq_b_ir[11:9];
    assign _829 = _827 == _828;
    assign _833 = _829 | _832;
    assign _837 = _833 | _836;
    assign _841 = _837 | _840;
    assign _824 = seq_b_ir[15:12];
    assign _826 = _824 == _825;
    assign _842 = _826 & _841;
    assign _854 = _842 & _853;
    assign _859 = _854 & _858;
    assign _820 = seq_b_ir[15:12];
    assign _822 = _820 == _821;
    assign _814 = seq_b_ir[2:0];
    assign _816 = _814 == _815;
    assign _810 = seq_b_ir[2:0];
    assign _812 = _810 == _811;
    assign _806 = seq_b_ir[2:0];
    assign _808 = _806 == _807;
    assign _802 = seq_b_ir[2:0];
    assign _804 = _802 == _803;
    assign _798 = seq_b_ir[2:0];
    assign _800 = _798 == _799;
    assign _794 = seq_b_ir[2:0];
    assign _796 = _794 == _795;
    assign _790 = seq_b_ir[2:0];
    assign _792 = _790 == _791;
    assign _787 = seq_b_ir[2:0];
    assign _789 = _787 == _788;
    assign _793 = _789 | _792;
    assign _797 = _793 | _796;
    assign _801 = _797 | _800;
    assign _805 = _801 | _804;
    assign _809 = _805 | _808;
    assign _813 = _809 | _812;
    assign _817 = _813 | _816;
    assign _784 = seq_b_ir[15:12];
    assign _786 = _784 == _785;
    assign _818 = _786 & _817;
    assign _780 = seq_b_ir & _779;
    assign _782 = _780 == _781;
    assign _3292 = ctrl_bit3 ? _3291 : _3281;
    assign _3293 = _3292[4:0];
    always @* begin
        case (_3293)
        0: _3491 <= imem_32;
        1: _3491 <= imem_33;
        2: _3491 <= imem_34;
        3: _3491 <= imem_35;
        4: _3491 <= imem_36;
        5: _3491 <= imem_37;
        6: _3491 <= imem_38;
        7: _3491 <= imem_39;
        8: _3491 <= imem_40;
        9: _3491 <= imem_41;
        10: _3491 <= imem_42;
        11: _3491 <= imem_43;
        12: _3491 <= imem_44;
        13: _3491 <= imem_45;
        14: _3491 <= imem_46;
        15: _3491 <= imem_47;
        16: _3491 <= imem_48;
        17: _3491 <= imem_49;
        18: _3491 <= imem_50;
        19: _3491 <= imem_51;
        20: _3491 <= imem_52;
        21: _3491 <= imem_53;
        22: _3491 <= imem_54;
        23: _3491 <= imem_55;
        24: _3491 <= imem_56;
        25: _3491 <= imem_57;
        26: _3491 <= imem_58;
        27: _3491 <= imem_59;
        28: _3491 <= imem_60;
        29: _3491 <= imem_61;
        30: _3491 <= imem_62;
        default: _3491 <= imem_63;
        endcase
    end
    assign _84 = _3491;
    assign _3091 = ~ _948;
    assign _3289 = _3288[13:8];
    assign _3291 = _3289 | _3290;
    assign _3280 = seq_b_ir_pc + _3279;
    assign _3275 = pins_sync[7:7];
    assign _3274 = pins_sync[6:6];
    assign _3273 = pins_sync[5:5];
    assign _3272 = pins_sync[4:4];
    assign _3271 = pins_sync[3:3];
    assign _3270 = pins_sync[2:2];
    assign _3269 = pins_sync[1:1];
    assign _3268 = pins_sync[0:0];
    always @* begin
        case (_2938)
        0: _3276 <= _3268;
        1: _3276 <= _3269;
        2: _3276 <= _3270;
        3: _3276 <= _3271;
        4: _3276 <= _3272;
        5: _3276 <= _3273;
        6: _3276 <= _3274;
        default: _3276 <= _3275;
        endcase
    end
    assign _3265 = _953 == _3264;
    assign _3266 = _952 & _3265;
    assign _3267 = _3266 & seq_b_caught_up;
    assign _3277 = _3267 & _3276;
    assign _3492 = ~ _3057;
    assign _3493 = _3040 ? _3492 : seq_b_flag;
    assign _3494 = _3092 ? _3493 : seq_b_flag;
    assign _3495 = ctrl_bit3 ? gnd : _3494;
    assign _85 = _3495;
    always @(posedge _151) begin
        if (_164)
            seq_b_flag <= _3260;
        else
            seq_b_flag <= _85;
    end
    assign _3257 = _953 == _3256;
    assign _3258 = _952 & _3257;
    assign _3262 = _3258 & seq_b_flag;
    assign _3251 = seq_b_y == _3250;
    assign _3252 = ~ _3251;
    assign _3249 = _953 == _3248;
    assign _3253 = _3249 & _3252;
    assign _3244 = seq_b_x == _3243;
    assign _3245 = ~ _3244;
    assign _3242 = _953 == _3241;
    assign _3246 = _3242 & _3245;
    assign _3240 = _953 == _3239;
    assign _3247 = _3240 | _3246;
    assign _3254 = _3247 | _3253;
    assign _3255 = _952 & _3254;
    assign _3263 = _3255 | _3262;
    assign _3278 = _3263 | _3277;
    assign _3281 = _3278 ? _957 : _3280;
    assign _3496 = _3092 ? _3281 : seq_b_ir_pc;
    assign _3497 = ctrl_bit3 ? _3291 : _3496;
    assign _86 = _3497;
    always @(posedge _151) begin
        if (_164)
            seq_b_ir_pc <= _959;
        else
            seq_b_ir_pc <= _86;
    end
    assign _957 = seq_b_ir[5:0];
    assign _961 = _957 == seq_b_ir_pc;
    assign _955 = _953 == _954;
    assign _956 = _952 & _955;
    assign _962 = _956 & _961;
    assign _3089 = ~ _962;
    assign _3084 = ~ seq_b_caught_up;
    assign _3082 = _953 == _3081;
    assign _3083 = _952 & _3082;
    assign _3085 = _3083 & _3084;
    assign _3523 = seq_b_y[7:0];
    assign _3524 = { _3121, _3523 };
    assign _3521 = { _3520, _3121 };
    assign _3518 = seq_b_y - _3517;
    assign _3514 = seq_b_y == _3513;
    assign _3515 = ~ _3514;
    assign _3511 = _953 == _3510;
    assign _3512 = _952 & _3511;
    assign _3516 = _3512 & _3515;
    assign _3519 = _3516 ? _3518 : seq_b_y;
    assign _3508 = _3117 == _3507;
    assign _3505 = _949 == _3504;
    assign _3506 = _946 & _3505;
    assign _3509 = _3506 & _3508;
    assign _3522 = _3509 ? _3521 : _3519;
    assign _3502 = _3117 == _3501;
    assign _3499 = _949 == _3498;
    assign _3500 = _946 & _3499;
    assign _3503 = _3500 & _3502;
    assign _3525 = _3503 ? _3524 : _3522;
    assign _3526 = _3092 ? _3525 : seq_b_y;
    assign _3528 = ctrl_bit3 ? _3527 : _3526;
    assign _87 = _3528;
    always @(posedge _151) begin
        if (_164)
            seq_b_y <= _3070;
        else
            seq_b_y <= _87;
    end
    assign _3554 = seq_b_x[7:0];
    assign _3555 = { _3121, _3554 };
    assign _3552 = { _3551, _3121 };
    assign _3549 = seq_b_x - _3548;
    assign _3545 = seq_b_x == _3544;
    assign _3546 = ~ _3545;
    assign _953 = seq_b_ir[11:8];
    assign _3542 = _953 == _3541;
    assign _951 = _949 == _950;
    assign _952 = _946 & _951;
    assign _3543 = _952 & _3542;
    assign _3547 = _3543 & _3546;
    assign _3550 = _3547 ? _3549 : seq_b_x;
    assign _3539 = _3117 == _3538;
    assign _3536 = _949 == _3535;
    assign _3537 = _946 & _3536;
    assign _3540 = _3537 & _3539;
    assign _3553 = _3540 ? _3552 : _3550;
    assign _3533 = _3117 == _3532;
    assign _3530 = _949 == _3529;
    assign _3531 = _946 & _3530;
    assign _3534 = _3531 & _3533;
    assign _3556 = _3534 ? _3555 : _3553;
    assign _3557 = _3092 ? _3556 : seq_b_x;
    assign _3559 = ctrl_bit3 ? _3558 : _3557;
    assign _88 = _3559;
    always @(posedge _151) begin
        if (_164)
            seq_b_x <= _3067;
        else
            seq_b_x <= _88;
    end
    always @* begin
        case (_3058)
        0: _3073 <= _3065;
        1: _3073 <= seq_b_x;
        2: _3073 <= seq_b_y;
        default: _3073 <= _3072;
        endcase
    end
    assign _3566 = seq_b_wait_count + _3565;
    assign _3562 = ~ _3077;
    assign _3560 = seq_b_running & _3040;
    assign _3561 = _3560 & seq_b_caught_up;
    assign _3563 = _3561 & _3562;
    assign _3567 = _3563 ? _3566 : _3564;
    assign _3569 = ctrl_bit3 ? _3568 : _3567;
    assign _89 = _3569;
    always @(posedge _151) begin
        if (_164)
            seq_b_wait_count <= _3063;
        else
            seq_b_wait_count <= _89;
    end
    assign _3074 = seq_b_wait_count == _3073;
    assign _3058 = seq_b_ir[7:6];
    assign _3060 = _3058 == _3059;
    assign _3061 = ~ _3060;
    assign _3075 = _3061 & _3074;
    assign _3056 = seq_b_ir[8:8];
    assign _3054 = pins_sync[7:7];
    assign _3053 = pins_sync[6:6];
    assign _3052 = pins_sync[5:5];
    assign _3051 = pins_sync[4:4];
    assign _3050 = pins_sync[3:3];
    assign _3049 = pins_sync[2:2];
    assign _3048 = pins_sync[1:1];
    assign _3047 = pins_sync[0:0];
    assign _2937 = _2933[11:9];
    assign _2935 = _2933[5:3];
    assign _2934 = _2933[2:0];
    assign _2931 = _197 == _2930;
    assign _2932 = spi_wr & _2931;
    assign _2927 = spi_wdata[11:0];
    always @(posedge _151) begin
        if (_164)
            _2933 <= _2929;
        else
            if (_2932)
                _2933 <= _2927;
    end
    assign _2938 = _2933[8:6];
    assign _3044 = seq_b_ir[11:9];
    assign _3045 = _3044[1:0];
    always @* begin
        case (_3045)
        0: _3046 <= _2938;
        1: _3046 <= _2934;
        2: _3046 <= _2935;
        default: _3046 <= _2937;
        endcase
    end
    always @* begin
        case (_3046)
        0: _3055 <= _3047;
        1: _3055 <= _3048;
        2: _3055 <= _3049;
        3: _3055 <= _3050;
        4: _3055 <= _3051;
        5: _3055 <= _3052;
        6: _3055 <= _3053;
        default: _3055 <= _3054;
        endcase
    end
    assign _3057 = _3055 == _3056;
    assign _3076 = _3057 | _3075;
    assign _3622 = _3619 == _3621;
    assign _3618 = timebase + _3617;
    assign _3619 = _3616 - _3618;
    assign _3620 = _3619[23:23];
    assign _3623 = _3620 | _3622;
    assign _3601 = _3598 == _3600;
    assign _3597 = timebase + _3596;
    assign _3598 = _3595 - _3597;
    assign _3599 = _3598[23:23];
    assign _3602 = _3599 | _3601;
    assign _3624 = _3570 ? _3623 : _3602;
    assign _3625 = _3572 ? _3624 : vdd;
    assign _3580 = _3577 == _3579;
    assign _3576 = timebase + _3575;
    assign _3577 = seq_b_sched_s - _3576;
    assign _3578 = _3577[23:23];
    assign _3581 = _3578 | _3580;
    assign _3573 = _3092 & _3040;
    assign _3571 = _3092 & _3017;
    assign _3570 = _3092 & _994;
    assign _3572 = _3570 | _3571;
    assign _3574 = _3572 | _3573;
    assign _3626 = _3574 ? _3625 : _3581;
    assign _3627 = ctrl_bit3 ? gnd : _3626;
    assign _90 = _3627;
    always @(posedge _151) begin
        if (_164)
            seq_b_caught_up <= _3042;
        else
            seq_b_caught_up <= _90;
    end
    assign _3077 = seq_b_caught_up & _3076;
    assign _3078 = ~ _3077;
    assign _3079 = _3040 & _3078;
    assign _3168 = _3167 < _3032;
    assign _91 = _3034;
    assign _3169 = _91 & _3168;
    assign _3632 = { _3631, _3169 };
    assign _3131 = _3032 < _3130;
    assign _3128 = _197 == _3127;
    assign _3129 = spi_wr & _3128;
    assign _3132 = _3129 & _3131;
    assign _3629 = { _3628, _3132 };
    assign _3630 = _3032 + _3629;
    assign _3633 = _3630 - _3632;
    assign _92 = _3633;
    always @(posedge _151) begin
        if (_164)
            _3032 <= _3031;
        else
            _3032 <= _92;
    end
    assign _3033 = _3029 < _3032;
    assign _3028 = seq_b_running & _3027;
    assign _3034 = _3028 & _3033;
    assign _3035 = ~ _3034;
    assign _3024 = seq_b_ir[11:11];
    assign _3026 = _3024 == _3025;
    assign _3022 = _949 == _3021;
    assign _3023 = _946 & _3022;
    assign _3027 = _3023 & _3026;
    assign _3036 = _3027 & _3035;
    assign _3656 = _3652[21:21];
    assign _3655 = _3652[22:22];
    assign _3657 = _3655 | _3656;
    assign _3650 = timebase + _3649;
    assign _3591 = _3584[17:0];
    assign _3593 = { _3591, _3592 };
    assign _3588 = _3584[19:0];
    assign _3590 = { _3588, _3589 };
    assign _3585 = _3584[21:0];
    assign _3587 = { _3585, _3586 };
    assign _3583 = seq_b_ir[11:0];
    assign _3584 = { _3582, _3583 };
    always @* begin
        case (seq_b_prescale)
        0: _3594 <= _3584;
        1: _3594 <= _3587;
        2: _3594 <= _3590;
        default: _3594 <= _3593;
        endcase
    end
    assign _3595 = seq_b_sched_s + _3594;
    assign _3612 = _3605[17:0];
    assign _3614 = { _3612, _3613 };
    assign _3609 = _3605[19:0];
    assign _3611 = { _3609, _3610 };
    assign _3606 = _3605[21:0];
    assign _3608 = { _3606, _3607 };
    assign _3604 = seq_b_ir[11:6];
    assign _3605 = { _3603, _3604 };
    assign _3121 = seq_b_ir[7:0];
    assign _3640 = _3121[1:0];
    assign _3117 = seq_b_ir[11:8];
    assign _3638 = _3117 == _3637;
    assign _3635 = _949 == _3634;
    assign _3636 = _946 & _3635;
    assign _3639 = _3636 & _3638;
    assign _3641 = _3639 ? _3640 : seq_b_prescale;
    assign _3642 = _3092 ? _3641 : seq_b_prescale;
    assign _3644 = ctrl_bit3 ? _3643 : _3642;
    assign _93 = _3644;
    always @(posedge _151) begin
        if (_164)
            seq_b_prescale <= _1005;
        else
            seq_b_prescale <= _93;
    end
    always @* begin
        case (seq_b_prescale)
        0: _3615 <= _3605;
        1: _3615 <= _3608;
        2: _3615 <= _3611;
        default: _3615 <= _3614;
        endcase
    end
    assign _3616 = seq_b_sched_s + _3615;
    assign _3645 = _994 ? _3616 : seq_b_sched_s;
    assign _3646 = _3017 ? _3595 : _3645;
    assign _3039 = _949 == _3038;
    assign _3040 = _946 & _3039;
    assign _3647 = _3040 ? timebase : _3646;
    assign _3648 = _3092 ? _3647 : seq_b_sched_s;
    assign _3651 = ctrl_bit3 ? _3650 : _3648;
    assign _94 = _3651;
    always @(posedge _151) begin
        if (_164)
            seq_b_sched_s <= _1002;
        else
            seq_b_sched_s <= _94;
    end
    assign _3652 = seq_b_sched_s - timebase;
    assign _3653 = _3652[23:23];
    assign _3654 = ~ _3653;
    assign _3658 = _3654 & _3657;
    assign _3659 = ctrl_bit3 ? gnd : _3658;
    assign _95 = _3659;
    always @(posedge _151) begin
        if (_164)
            seq_b_far <= _991;
        else
            seq_b_far <= _95;
    end
    assign _3016 = ~ seq_b_far;
    assign _3013 = _949 == _3012;
    assign _3014 = _946 & _3013;
    assign _3015 = seq_b_running & _3014;
    assign _3017 = _3015 & _3016;
    assign _3018 = ~ _3017;
    assign _3010 = _949 == _3009;
    assign _3011 = _946 & _3010;
    assign _3019 = _3011 & _3018;
    assign _3007 = ~ _994;
    assign _949 = seq_b_ir[15:12];
    assign _3005 = _949 == _3004;
    assign _3006 = _946 & _3005;
    assign _3008 = _3006 & _3007;
    assign _3020 = _3008 | _3019;
    assign _3037 = _3020 | _3036;
    assign _3080 = _3037 | _3079;
    assign _3086 = _3080 | _3085;
    assign _3087 = ~ _3086;
    assign _3088 = seq_b_running & _3087;
    assign _3090 = _3088 & _3089;
    assign _3092 = _3090 & _3091;
    assign _3660 = _3092 ? _84 : seq_b_ir;
    assign _3661 = ctrl_bit3 ? _84 : _3660;
    assign _96 = _3661;
    always @(posedge _151) begin
        if (_164)
            seq_b_ir <= _774;
        else
            seq_b_ir <= _96;
    end
    assign _776 = seq_b_ir[15:12];
    assign _778 = _776 == _777;
    assign _783 = _778 & _782;
    assign _819 = _783 | _818;
    assign _823 = _819 | _822;
    assign _860 = _823 | _859;
    assign _889 = _860 | _888;
    assign _929 = _889 | _928;
    assign _946 = _929 | _945;
    assign _947 = ~ _946;
    assign _948 = seq_b_running & _947;
    assign _3663 = _948 ? gnd : _3662;
    assign _3664 = ctrl_bit3 ? vdd : _3663;
    assign _97 = _3664;
    always @(posedge _151) begin
        if (_164)
            seq_b_running <= _771;
        else
            seq_b_running <= _97;
    end
    assign _988 = seq_b_running & _987;
    assign _989 = _988 & _83;
    assign _994 = _989 & _993;
    assign _997 = _994 & _996;
    assign _3666 = { _3665, _997 };
    assign _3667 = queue_b_count + _3666;
    assign _3668 = _3667 - _3236;
    assign _98 = _3668;
    always @(posedge _151) begin
        if (_285)
            queue_b_count <= _286;
        else
            queue_b_count <= _98;
    end
    assign _288 = _278 < queue_b_count;
    assign _313 = _288 & _312;
    assign _4414 = _313 & _4413;
    assign _271 = _228[1:0];
    assign _4408 = _271 == _4407;
    assign _4409 = ~ _4408;
    assign _235 = _228[28:5];
    assign _236 = _235 - timebase;
    assign _238 = _236 == _237;
    always @* begin
        case (queue_a_read_ptr)
        0: _228 <= queue_a_entry0;
        1: _228 <= queue_a_entry1;
        2: _228 <= queue_a_entry2;
        default: _228 <= queue_a_entry3;
        endcase
    end
    assign _229 = _228[28:5];
    assign _233 = _229 - timebase;
    assign _234 = _233[23:23];
    assign _239 = _234 | _238;
    assign _250 = _246[28:5];
    assign _251 = _250 - timebase;
    assign _253 = _251 == _252;
    assign _3673 = queue_a_write_ptr == _3672;
    assign _3751 = _3673 ? _3750 : queue_a_entry3;
    assign _3752 = _2208 ? _3751 : queue_a_entry3;
    assign _99 = _3752;
    always @(posedge _151) begin
        if (_209)
            queue_a_entry3 <= _226;
        else
            queue_a_entry3 <= _99;
    end
    assign _3754 = queue_a_write_ptr == _3753;
    assign _3755 = _3754 ? _3750 : queue_a_entry2;
    assign _3756 = _2208 ? _3755 : queue_a_entry2;
    assign _100 = _3756;
    always @(posedge _151) begin
        if (_209)
            queue_a_entry2 <= _223;
        else
            queue_a_entry2 <= _100;
    end
    assign _3758 = queue_a_write_ptr == _3757;
    assign _3759 = _3758 ? _3750 : queue_a_entry1;
    assign _3760 = _2208 ? _3759 : queue_a_entry1;
    assign _101 = _3760;
    always @(posedge _151) begin
        if (_209)
            queue_a_entry1 <= _220;
        else
            queue_a_entry1 <= _101;
    end
    assign _3746 = _3699 ? _3745 : _3744;
    assign _3859 = _3683 ? _3749 : seq_a_shadow_clk;
    assign _3860 = _3858 ? _3859 : seq_a_shadow_clk;
    assign _3861 = _2205 ? _3860 : seq_a_shadow_clk;
    assign _3862 = _3849 ? _3861 : seq_a_shadow_clk;
    assign _3864 = ctrl_bit0 ? _3863 : _3862;
    assign _102 = _3864;
    always @(posedge _151) begin
        if (_164)
            seq_a_shadow_clk <= _3737;
        else
            seq_a_shadow_clk <= _102;
    end
    assign _3865 = _3683 ? seq_a_shadow_data : _3749;
    assign _3856 = _3674 == _3855;
    assign _3853 = _3674 == _3852;
    assign _3851 = _3674 == _3850;
    assign _3854 = _3851 | _3853;
    assign _3857 = _3854 | _3856;
    assign _3858 = ~ _3857;
    assign _3866 = _3858 ? _3865 : seq_a_shadow_data;
    assign _3867 = _2205 ? _3866 : seq_a_shadow_data;
    assign _3868 = _3849 ? _3867 : seq_a_shadow_data;
    assign _3870 = ctrl_bit0 ? _3869 : _3868;
    assign _103 = _3870;
    always @(posedge _151) begin
        if (_164)
            seq_a_shadow_data <= _3734;
        else
            seq_a_shadow_data <= _103;
    end
    assign _3739 = _3683 ? seq_a_shadow_clk : seq_a_shadow_data;
    assign _3741 = _3739 == _3740;
    assign _3742 = _3741 ? _3731 : _3715;
    assign _3728 = seq_a_coder[3:3];
    assign _3731 = _3728 ? _3730 : _3729;
    assign _3879 = _3878[3:0];
    assign _3876 = _3874 == _3875;
    assign _3872 = _2161 == _3871;
    assign _3873 = _2158 & _3872;
    assign _3877 = _3873 & _3876;
    assign _3880 = _3877 ? _3879 : seq_a_coder;
    assign _3881 = _3849 ? _3880 : seq_a_coder;
    assign _3883 = ctrl_bit0 ? _3882 : _3881;
    assign _104 = _3883;
    always @(posedge _151) begin
        if (_164)
            seq_a_coder <= _3724;
        else
            seq_a_coder <= _104;
    end
    assign _3726 = seq_a_coder[2:2];
    assign _3894 = _3892 == _3893;
    assign _3895 = _3889 & _3894;
    assign _3899 = _3895 ? spi_wdata : _3898;
    assign _105 = _3899;
    always @(posedge _151) begin
        if (_164)
            _3898 <= _3897;
        else
            _3898 <= _105;
    end
    assign _3901 = _3892 == _3900;
    assign _3902 = _3889 & _3901;
    assign _3906 = _3902 ? spi_wdata : _3905;
    assign _106 = _3906;
    always @(posedge _151) begin
        if (_164)
            _3905 <= _3904;
        else
            _3905 <= _106;
    end
    assign _3908 = _3892 == _3907;
    assign _3909 = _3889 & _3908;
    assign _3913 = _3909 ? spi_wdata : _3912;
    assign _107 = _3913;
    always @(posedge _151) begin
        if (_164)
            _3912 <= _3911;
        else
            _3912 <= _107;
    end
    assign _3915 = _3892 + _3914;
    assign _3916 = _3889 ? _3915 : _3892;
    assign _108 = _3916;
    always @(posedge _151) begin
        if (_164)
            _3892 <= _3891;
        else
            _3892 <= _108;
    end
    assign _3918 = _3892 == _3917;
    assign _3919 = _3889 & _3918;
    assign _3923 = _3919 ? spi_wdata : _3922;
    assign _109 = _3923;
    always @(posedge _151) begin
        if (_164)
            _3922 <= _3921;
        else
            _3922 <= _109;
    end
    assign _3931 = _3929 + _3930;
    assign _3932 = _3926 ? _3931 : _3929;
    assign _110 = _3932;
    always @(posedge _151) begin
        if (_164)
            _3929 <= _3928;
        else
            _3929 <= _110;
    end
    always @* begin
        case (_3929)
        0: _3940 <= _3922;
        1: _3940 <= _3912;
        2: _3940 <= _3905;
        default: _3940 <= _3898;
        endcase
    end
    assign _3935 = seq_a_osr[30:0];
    assign _3937 = { _3935, _3936 };
    assign _3934 = _3674 == _3933;
    assign _3938 = _3934 ? _3937 : seq_a_osr;
    assign _3939 = _2205 ? _3938 : seq_a_osr;
    assign _3941 = _3791 ? _3940 : _3939;
    assign _3942 = _3849 ? _3941 : seq_a_osr;
    assign _3944 = ctrl_bit0 ? _3943 : _3942;
    assign _111 = _3944;
    always @(posedge _151) begin
        if (_164)
            seq_a_osr <= _3720;
        else
            seq_a_osr <= _111;
    end
    assign _3722 = seq_a_osr[31:31];
    assign _3727 = _3722 ^ _3726;
    assign _3732 = _3727 ? _3731 : _3715;
    assign _3743 = _3704 ? _3742 : _3732;
    assign _3747 = _3702 ? _3746 : _3743;
    assign _3718 = _3710 ? _3717 : _3716;
    assign _3748 = _3708 ? _3747 : _3718;
    assign _3712 = _3674 == _3711;
    assign _3710 = _3674 == _3709;
    assign _3713 = _3710 | _3712;
    assign _3706 = _3674 == _3705;
    assign _3704 = _3674 == _3703;
    assign _3707 = _3704 | _3706;
    assign _3701 = _3674 == _3700;
    assign _3699 = _3674 == _3698;
    assign _3702 = _3699 | _3701;
    assign _3708 = _3702 | _3707;
    assign _3714 = _3708 | _3713;
    assign _3749 = _3714 ? _3748 : _3715;
    assign _3696 = _3676 ? _3695 : _3694;
    assign _3683 = seq_a_ir[5:5];
    assign _3693 = _3683 ? _3692 : _3691;
    assign _3680 = _3674 == _3679;
    assign _3678 = _3674 == _3677;
    assign _3681 = _3678 | _3680;
    assign _3674 = seq_a_ir[2:0];
    assign _3676 = _3674 == _3675;
    assign _3682 = _3676 | _3681;
    assign _3697 = _3682 ? _3696 : _3693;
    assign _2250 = _2243[17:0];
    assign _2252 = { _2250, _2251 };
    assign _2247 = _2243[19:0];
    assign _2249 = { _2247, _2248 };
    assign _2244 = _2243[21:0];
    assign _2246 = { _2244, _2245 };
    assign _2241 = { _2239, _2238 };
    assign _3203 = _3202[23:16];
    assign _3949 = _3874 == _3948;
    assign _3946 = _2161 == _3945;
    assign _3947 = _2158 & _3946;
    assign _3950 = _3947 & _3949;
    assign _3951 = _3950 ? _3878 : seq_a_k3;
    assign _3952 = _3849 ? _3951 : seq_a_k3;
    assign _3953 = ctrl_bit0 ? _3203 : _3952;
    assign _112 = _3953;
    always @(posedge _151) begin
        if (_164)
            seq_a_k3 <= _2230;
        else
            seq_a_k3 <= _112;
    end
    assign _3213 = _3202[15:8];
    assign _3958 = _3874 == _3957;
    assign _3955 = _2161 == _3954;
    assign _3956 = _2158 & _3955;
    assign _3959 = _3956 & _3958;
    assign _3960 = _3959 ? _3878 : seq_a_k2;
    assign _3961 = _3849 ? _3960 : seq_a_k2;
    assign _3962 = ctrl_bit0 ? _3213 : _3961;
    assign _113 = _3962;
    always @(posedge _151) begin
        if (_164)
            seq_a_k2 <= _2227;
        else
            seq_a_k2 <= _113;
    end
    assign _3223 = _3202[7:0];
    assign _3967 = _3874 == _3966;
    assign _3964 = _2161 == _3963;
    assign _3965 = _2158 & _3964;
    assign _3968 = _3965 & _3967;
    assign _3969 = _3968 ? _3878 : seq_a_k1;
    assign _3970 = _3849 ? _3969 : seq_a_k1;
    assign _3971 = ctrl_bit0 ? _3223 : _3970;
    assign _114 = _3971;
    always @(posedge _151) begin
        if (_164)
            seq_a_k1 <= _2224;
        else
            seq_a_k1 <= _114;
    end
    assign _2221 = seq_a_ir[4:3];
    always @* begin
        case (_2221)
        0: _2232 <= _2222;
        1: _2232 <= seq_a_k1;
        2: _2232 <= seq_a_k2;
        default: _2232 <= seq_a_k3;
        endcase
    end
    assign _2233 = _2232[7:7];
    assign _2234 = { _2233, _2233 };
    assign _2235 = { _2234, _2232 };
    assign _2219 = seq_a_ir[11:6];
    assign _2220 = { _2218, _2219 };
    assign _2236 = _2220 + _2235;
    assign _2237 = _2236[9:9];
    assign _2238 = { _2237, _2237 };
    assign _2239 = { _2238, _2238 };
    assign _2240 = { _2239, _2239 };
    assign _2242 = { _2240, _2241 };
    assign _2243 = { _2242, _2236 };
    always @* begin
        case (seq_a_prescale)
        0: _2253 <= _2243;
        1: _2253 <= _2246;
        2: _2253 <= _2249;
        default: _2253 <= _2252;
        endcase
    end
    assign _2254 = seq_a_sched_s + _2253;
    assign _3750 = { _2254, _3697, _3749 };
    assign _3973 = queue_a_write_ptr + _3972;
    assign _3974 = _2208 ? _3973 : queue_a_write_ptr;
    assign _115 = _3974;
    always @(posedge _151) begin
        if (_209)
            queue_a_write_ptr <= _3670;
        else
            queue_a_write_ptr <= _115;
    end
    assign _3976 = queue_a_write_ptr == _3975;
    assign _3977 = _3976 ? _3750 : queue_a_entry0;
    assign _3978 = _2208 ? _3977 : queue_a_entry0;
    assign _116 = _3978;
    always @(posedge _151) begin
        if (_209)
            queue_a_entry0 <= _217;
        else
            queue_a_entry0 <= _116;
    end
    assign _209 = _164 | ctrl_bit0;
    assign _3984 = _3983[1:0];
    assign _3985 = queue_a_read_ptr + _3984;
    assign _117 = _3985;
    always @(posedge _151) begin
        if (_209)
            queue_a_read_ptr <= _214;
        else
            queue_a_read_ptr <= _117;
    end
    assign _245 = queue_a_read_ptr + _244;
    always @* begin
        case (_245)
        0: _246 <= queue_a_entry0;
        1: _246 <= queue_a_entry1;
        2: _246 <= queue_a_entry2;
        default: _246 <= queue_a_entry3;
        endcase
    end
    assign _247 = _246[28:5];
    assign _248 = _247 - timebase;
    assign _249 = _248[23:23];
    assign _254 = _249 | _253;
    assign _242 = _241 < queue_a_count;
    assign _243 = _240 & _242;
    assign _255 = _243 & _254;
    assign _3982 = { _3981, _255 };
    assign _3980 = { _3979, _240 };
    assign _3983 = _3980 + _3982;
    assign _2204 = ~ seq_a_far;
    assign _2207 = queue_a_count < _2206;
    assign _118 = _2207;
    assign _2197 = _2161 == _2196;
    assign _2198 = _2158 & _2197;
    assign _2175 = seq_a_running & _2174;
    assign _4396 = _2175 ? gnd : seq_a_running;
    assign _2154 = seq_a_ir & _2153;
    assign _2156 = _2154 == _2155;
    assign _2149 = seq_a_ir[10:10];
    assign _2151 = _2149 == _2150;
    assign _2145 = seq_a_ir[11:11];
    assign _2147 = _2145 == _2146;
    assign _2142 = seq_a_ir[15:12];
    assign _2144 = _2142 == _2143;
    assign _2148 = _2144 & _2147;
    assign _2152 = _2148 & _2151;
    assign _2157 = _2152 & _2156;
    assign _2136 = seq_a_ir[11:8];
    assign _2138 = _2136 == _2137;
    assign _2132 = seq_a_ir[11:8];
    assign _2134 = _2132 == _2133;
    assign _2128 = seq_a_ir[11:8];
    assign _2130 = _2128 == _2129;
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
    assign _2105 = seq_a_ir[11:8];
    assign _2107 = _2105 == _2106;
    assign _2111 = _2107 | _2110;
    assign _2115 = _2111 | _2114;
    assign _2119 = _2115 | _2118;
    assign _2123 = _2119 | _2122;
    assign _2127 = _2123 | _2126;
    assign _2131 = _2127 | _2130;
    assign _2135 = _2131 | _2134;
    assign _2139 = _2135 | _2138;
    assign _2102 = seq_a_ir[15:12];
    assign _2104 = _2102 == _2103;
    assign _2140 = _2104 & _2139;
    assign _2097 = seq_a_ir & _2096;
    assign _2099 = _2097 == _2098;
    assign _2091 = seq_a_ir[11:8];
    assign _2093 = _2091 == _2092;
    assign _2087 = seq_a_ir[11:8];
    assign _2089 = _2087 == _2088;
    assign _2083 = seq_a_ir[11:8];
    assign _2085 = _2083 == _2084;
    assign _2079 = seq_a_ir[11:8];
    assign _2081 = _2079 == _2080;
    assign _2076 = seq_a_ir[11:8];
    assign _2078 = _2076 == _2077;
    assign _2082 = _2078 | _2081;
    assign _2086 = _2082 | _2085;
    assign _2090 = _2086 | _2089;
    assign _2094 = _2090 | _2093;
    assign _2073 = seq_a_ir[15:12];
    assign _2075 = _2073 == _2074;
    assign _2095 = _2075 & _2094;
    assign _2100 = _2095 & _2099;
    assign _2068 = seq_a_ir & _2067;
    assign _2070 = _2068 == _2069;
    assign _2062 = seq_a_ir[7:6];
    assign _2064 = _2062 == _2063;
    assign _2058 = seq_a_ir[7:6];
    assign _2060 = _2058 == _2059;
    assign _2055 = seq_a_ir[7:6];
    assign _2057 = _2055 == _2056;
    assign _2061 = _2057 | _2060;
    assign _2065 = _2061 | _2064;
    assign _2050 = seq_a_ir[11:9];
    assign _2052 = _2050 == _2051;
    assign _2046 = seq_a_ir[11:9];
    assign _2048 = _2046 == _2047;
    assign _2042 = seq_a_ir[11:9];
    assign _2044 = _2042 == _2043;
    assign _2039 = seq_a_ir[11:9];
    assign _2041 = _2039 == _2040;
    assign _2045 = _2041 | _2044;
    assign _2049 = _2045 | _2048;
    assign _2053 = _2049 | _2052;
    assign _2036 = seq_a_ir[15:12];
    assign _2038 = _2036 == _2037;
    assign _2054 = _2038 & _2053;
    assign _2066 = _2054 & _2065;
    assign _2071 = _2066 & _2070;
    assign _2032 = seq_a_ir[15:12];
    assign _2034 = _2032 == _2033;
    assign _2026 = seq_a_ir[2:0];
    assign _2028 = _2026 == _2027;
    assign _2022 = seq_a_ir[2:0];
    assign _2024 = _2022 == _2023;
    assign _2018 = seq_a_ir[2:0];
    assign _2020 = _2018 == _2019;
    assign _2014 = seq_a_ir[2:0];
    assign _2016 = _2014 == _2015;
    assign _2010 = seq_a_ir[2:0];
    assign _2012 = _2010 == _2011;
    assign _2006 = seq_a_ir[2:0];
    assign _2008 = _2006 == _2007;
    assign _2002 = seq_a_ir[2:0];
    assign _2004 = _2002 == _2003;
    assign _1999 = seq_a_ir[2:0];
    assign _2001 = _1999 == _2000;
    assign _2005 = _2001 | _2004;
    assign _2009 = _2005 | _2008;
    assign _2013 = _2009 | _2012;
    assign _2017 = _2013 | _2016;
    assign _2021 = _2017 | _2020;
    assign _2025 = _2021 | _2024;
    assign _2029 = _2025 | _2028;
    assign _1996 = seq_a_ir[15:12];
    assign _1998 = _1996 == _1997;
    assign _2030 = _1998 & _2029;
    assign _1992 = seq_a_ir & _1991;
    assign _1994 = _1992 == _1993;
    assign _3488 = _3300 == _3487;
    assign _3489 = _3299 & _3488;
    always @(posedge _151) begin
        if (_3489)
            imem_63 <= _3294;
    end
    assign _3482 = _3300 == _3481;
    assign _3483 = _3299 & _3482;
    always @(posedge _151) begin
        if (_3483)
            imem_62 <= _3294;
    end
    assign _3476 = _3300 == _3475;
    assign _3477 = _3299 & _3476;
    always @(posedge _151) begin
        if (_3477)
            imem_61 <= _3294;
    end
    assign _3470 = _3300 == _3469;
    assign _3471 = _3299 & _3470;
    always @(posedge _151) begin
        if (_3471)
            imem_60 <= _3294;
    end
    assign _3464 = _3300 == _3463;
    assign _3465 = _3299 & _3464;
    always @(posedge _151) begin
        if (_3465)
            imem_59 <= _3294;
    end
    assign _3458 = _3300 == _3457;
    assign _3459 = _3299 & _3458;
    always @(posedge _151) begin
        if (_3459)
            imem_58 <= _3294;
    end
    assign _3452 = _3300 == _3451;
    assign _3453 = _3299 & _3452;
    always @(posedge _151) begin
        if (_3453)
            imem_57 <= _3294;
    end
    assign _3446 = _3300 == _3445;
    assign _3447 = _3299 & _3446;
    always @(posedge _151) begin
        if (_3447)
            imem_56 <= _3294;
    end
    assign _3440 = _3300 == _3439;
    assign _3441 = _3299 & _3440;
    always @(posedge _151) begin
        if (_3441)
            imem_55 <= _3294;
    end
    assign _3434 = _3300 == _3433;
    assign _3435 = _3299 & _3434;
    always @(posedge _151) begin
        if (_3435)
            imem_54 <= _3294;
    end
    assign _3428 = _3300 == _3427;
    assign _3429 = _3299 & _3428;
    always @(posedge _151) begin
        if (_3429)
            imem_53 <= _3294;
    end
    assign _3422 = _3300 == _3421;
    assign _3423 = _3299 & _3422;
    always @(posedge _151) begin
        if (_3423)
            imem_52 <= _3294;
    end
    assign _3416 = _3300 == _3415;
    assign _3417 = _3299 & _3416;
    always @(posedge _151) begin
        if (_3417)
            imem_51 <= _3294;
    end
    assign _3410 = _3300 == _3409;
    assign _3411 = _3299 & _3410;
    always @(posedge _151) begin
        if (_3411)
            imem_50 <= _3294;
    end
    assign _3404 = _3300 == _3403;
    assign _3405 = _3299 & _3404;
    always @(posedge _151) begin
        if (_3405)
            imem_49 <= _3294;
    end
    assign _3398 = _3300 == _3397;
    assign _3399 = _3299 & _3398;
    always @(posedge _151) begin
        if (_3399)
            imem_48 <= _3294;
    end
    assign _3392 = _3300 == _3391;
    assign _3393 = _3299 & _3392;
    always @(posedge _151) begin
        if (_3393)
            imem_47 <= _3294;
    end
    assign _3386 = _3300 == _3385;
    assign _3387 = _3299 & _3386;
    always @(posedge _151) begin
        if (_3387)
            imem_46 <= _3294;
    end
    assign _3380 = _3300 == _3379;
    assign _3381 = _3299 & _3380;
    always @(posedge _151) begin
        if (_3381)
            imem_45 <= _3294;
    end
    assign _3374 = _3300 == _3373;
    assign _3375 = _3299 & _3374;
    always @(posedge _151) begin
        if (_3375)
            imem_44 <= _3294;
    end
    assign _3368 = _3300 == _3367;
    assign _3369 = _3299 & _3368;
    always @(posedge _151) begin
        if (_3369)
            imem_43 <= _3294;
    end
    assign _3362 = _3300 == _3361;
    assign _3363 = _3299 & _3362;
    always @(posedge _151) begin
        if (_3363)
            imem_42 <= _3294;
    end
    assign _3356 = _3300 == _3355;
    assign _3357 = _3299 & _3356;
    always @(posedge _151) begin
        if (_3357)
            imem_41 <= _3294;
    end
    assign _3350 = _3300 == _3349;
    assign _3351 = _3299 & _3350;
    always @(posedge _151) begin
        if (_3351)
            imem_40 <= _3294;
    end
    assign _3344 = _3300 == _3343;
    assign _3345 = _3299 & _3344;
    always @(posedge _151) begin
        if (_3345)
            imem_39 <= _3294;
    end
    assign _3338 = _3300 == _3337;
    assign _3339 = _3299 & _3338;
    always @(posedge _151) begin
        if (_3339)
            imem_38 <= _3294;
    end
    assign _3332 = _3300 == _3331;
    assign _3333 = _3299 & _3332;
    always @(posedge _151) begin
        if (_3333)
            imem_37 <= _3294;
    end
    assign _3326 = _3300 == _3325;
    assign _3327 = _3299 & _3326;
    always @(posedge _151) begin
        if (_3327)
            imem_36 <= _3294;
    end
    assign _3320 = _3300 == _3319;
    assign _3321 = _3299 & _3320;
    always @(posedge _151) begin
        if (_3321)
            imem_35 <= _3294;
    end
    assign _3314 = _3300 == _3313;
    assign _3315 = _3299 & _3314;
    always @(posedge _151) begin
        if (_3315)
            imem_34 <= _3294;
    end
    assign _3308 = _3300 == _3307;
    assign _3309 = _3299 & _3308;
    always @(posedge _151) begin
        if (_3309)
            imem_33 <= _3294;
    end
    assign _3302 = _3300 == _3301;
    assign _3303 = _3299 & _3302;
    always @(posedge _151) begin
        if (_3303)
            imem_32 <= _3294;
    end
    assign _4220 = _3300 == _4219;
    assign _4221 = _3299 & _4220;
    always @(posedge _151) begin
        if (_4221)
            imem_31 <= _3294;
    end
    assign _4214 = _3300 == _4213;
    assign _4215 = _3299 & _4214;
    always @(posedge _151) begin
        if (_4215)
            imem_30 <= _3294;
    end
    assign _4208 = _3300 == _4207;
    assign _4209 = _3299 & _4208;
    always @(posedge _151) begin
        if (_4209)
            imem_29 <= _3294;
    end
    assign _4202 = _3300 == _4201;
    assign _4203 = _3299 & _4202;
    always @(posedge _151) begin
        if (_4203)
            imem_28 <= _3294;
    end
    assign _4196 = _3300 == _4195;
    assign _4197 = _3299 & _4196;
    always @(posedge _151) begin
        if (_4197)
            imem_27 <= _3294;
    end
    assign _4190 = _3300 == _4189;
    assign _4191 = _3299 & _4190;
    always @(posedge _151) begin
        if (_4191)
            imem_26 <= _3294;
    end
    assign _4184 = _3300 == _4183;
    assign _4185 = _3299 & _4184;
    always @(posedge _151) begin
        if (_4185)
            imem_25 <= _3294;
    end
    assign _4178 = _3300 == _4177;
    assign _4179 = _3299 & _4178;
    always @(posedge _151) begin
        if (_4179)
            imem_24 <= _3294;
    end
    assign _4172 = _3300 == _4171;
    assign _4173 = _3299 & _4172;
    always @(posedge _151) begin
        if (_4173)
            imem_23 <= _3294;
    end
    assign _4166 = _3300 == _4165;
    assign _4167 = _3299 & _4166;
    always @(posedge _151) begin
        if (_4167)
            imem_22 <= _3294;
    end
    assign _4160 = _3300 == _4159;
    assign _4161 = _3299 & _4160;
    always @(posedge _151) begin
        if (_4161)
            imem_21 <= _3294;
    end
    assign _4154 = _3300 == _4153;
    assign _4155 = _3299 & _4154;
    always @(posedge _151) begin
        if (_4155)
            imem_20 <= _3294;
    end
    assign _4148 = _3300 == _4147;
    assign _4149 = _3299 & _4148;
    always @(posedge _151) begin
        if (_4149)
            imem_19 <= _3294;
    end
    assign _4142 = _3300 == _4141;
    assign _4143 = _3299 & _4142;
    always @(posedge _151) begin
        if (_4143)
            imem_18 <= _3294;
    end
    assign _4136 = _3300 == _4135;
    assign _4137 = _3299 & _4136;
    always @(posedge _151) begin
        if (_4137)
            imem_17 <= _3294;
    end
    assign _4130 = _3300 == _4129;
    assign _4131 = _3299 & _4130;
    always @(posedge _151) begin
        if (_4131)
            imem_16 <= _3294;
    end
    assign _4124 = _3300 == _4123;
    assign _4125 = _3299 & _4124;
    always @(posedge _151) begin
        if (_4125)
            imem_15 <= _3294;
    end
    assign _4118 = _3300 == _4117;
    assign _4119 = _3299 & _4118;
    always @(posedge _151) begin
        if (_4119)
            imem_14 <= _3294;
    end
    assign _4112 = _3300 == _4111;
    assign _4113 = _3299 & _4112;
    always @(posedge _151) begin
        if (_4113)
            imem_13 <= _3294;
    end
    assign _4106 = _3300 == _4105;
    assign _4107 = _3299 & _4106;
    always @(posedge _151) begin
        if (_4107)
            imem_12 <= _3294;
    end
    assign _4100 = _3300 == _4099;
    assign _4101 = _3299 & _4100;
    always @(posedge _151) begin
        if (_4101)
            imem_11 <= _3294;
    end
    assign _4094 = _3300 == _4093;
    assign _4095 = _3299 & _4094;
    always @(posedge _151) begin
        if (_4095)
            imem_10 <= _3294;
    end
    assign _4088 = _3300 == _4087;
    assign _4089 = _3299 & _4088;
    always @(posedge _151) begin
        if (_4089)
            imem_09 <= _3294;
    end
    assign _4082 = _3300 == _4081;
    assign _4083 = _3299 & _4082;
    always @(posedge _151) begin
        if (_4083)
            imem_08 <= _3294;
    end
    assign _4076 = _3300 == _4075;
    assign _4077 = _3299 & _4076;
    always @(posedge _151) begin
        if (_4077)
            imem_07 <= _3294;
    end
    assign _4070 = _3300 == _4069;
    assign _4071 = _3299 & _4070;
    always @(posedge _151) begin
        if (_4071)
            imem_06 <= _3294;
    end
    assign _4064 = _3300 == _4063;
    assign _4065 = _3299 & _4064;
    always @(posedge _151) begin
        if (_4065)
            imem_05 <= _3294;
    end
    assign _4058 = _3300 == _4057;
    assign _4059 = _3299 & _4058;
    always @(posedge _151) begin
        if (_4059)
            imem_04 <= _3294;
    end
    assign _4052 = _3300 == _4051;
    assign _4053 = _3299 & _4052;
    always @(posedge _151) begin
        if (_4053)
            imem_03 <= _3294;
    end
    assign _4046 = _3300 == _4045;
    assign _4047 = _3299 & _4046;
    always @(posedge _151) begin
        if (_4047)
            imem_02 <= _3294;
    end
    assign _4040 = _3300 == _4039;
    assign _4041 = _3299 & _4040;
    always @(posedge _151) begin
        if (_4041)
            imem_01 <= _3294;
    end
    assign _3300 = _197[5:0];
    assign _4034 = _3300 == _4033;
    assign _3298 = _197 < _3297;
    assign _3299 = spi_wr & _3298;
    assign _4035 = _3299 & _4034;
    assign _3294 = spi_wdata[15:0];
    always @(posedge _151) begin
        if (_4035)
            imem_00 <= _3294;
    end
    assign _4030 = ctrl_bit0 ? _4029 : _4028;
    always @* begin
        case (_4030)
        0: _4223 <= imem_00;
        1: _4223 <= imem_01;
        2: _4223 <= imem_02;
        3: _4223 <= imem_03;
        4: _4223 <= imem_04;
        5: _4223 <= imem_05;
        6: _4223 <= imem_06;
        7: _4223 <= imem_07;
        8: _4223 <= imem_08;
        9: _4223 <= imem_09;
        10: _4223 <= imem_10;
        11: _4223 <= imem_11;
        12: _4223 <= imem_12;
        13: _4223 <= imem_13;
        14: _4223 <= imem_14;
        15: _4223 <= imem_15;
        16: _4223 <= imem_16;
        17: _4223 <= imem_17;
        18: _4223 <= imem_18;
        19: _4223 <= imem_19;
        20: _4223 <= imem_20;
        21: _4223 <= imem_21;
        22: _4223 <= imem_22;
        23: _4223 <= imem_23;
        24: _4223 <= imem_24;
        25: _4223 <= imem_25;
        26: _4223 <= imem_26;
        27: _4223 <= imem_27;
        28: _4223 <= imem_28;
        29: _4223 <= imem_29;
        30: _4223 <= imem_30;
        31: _4223 <= imem_31;
        32: _4223 <= imem_32;
        33: _4223 <= imem_33;
        34: _4223 <= imem_34;
        35: _4223 <= imem_35;
        36: _4223 <= imem_36;
        37: _4223 <= imem_37;
        38: _4223 <= imem_38;
        39: _4223 <= imem_39;
        40: _4223 <= imem_40;
        41: _4223 <= imem_41;
        42: _4223 <= imem_42;
        43: _4223 <= imem_43;
        44: _4223 <= imem_44;
        45: _4223 <= imem_45;
        46: _4223 <= imem_46;
        47: _4223 <= imem_47;
        48: _4223 <= imem_48;
        49: _4223 <= imem_49;
        50: _4223 <= imem_50;
        51: _4223 <= imem_51;
        52: _4223 <= imem_52;
        53: _4223 <= imem_53;
        54: _4223 <= imem_54;
        55: _4223 <= imem_55;
        56: _4223 <= imem_56;
        57: _4223 <= imem_57;
        58: _4223 <= imem_58;
        59: _4223 <= imem_59;
        60: _4223 <= imem_60;
        61: _4223 <= imem_61;
        62: _4223 <= imem_62;
        default: _4223 <= imem_63;
        endcase
    end
    assign _119 = _4223;
    assign _3848 = ~ _2160;
    assign _3286 = _197 == _3285;
    assign _3287 = spi_wr & _3286;
    assign _3282 = spi_wdata[13:0];
    always @(posedge _151) begin
        if (_164)
            _3288 <= _3284;
        else
            if (_3287)
                _3288 <= _3282;
    end
    assign _4029 = _3288[5:0];
    assign _4027 = seq_a_ir_pc + _4026;
    assign _4022 = pins_sync[7:7];
    assign _4021 = pins_sync[6:6];
    assign _4020 = pins_sync[5:5];
    assign _4019 = pins_sync[4:4];
    assign _4018 = pins_sync[3:3];
    assign _4017 = pins_sync[2:2];
    assign _4016 = pins_sync[1:1];
    assign _4015 = pins_sync[0:0];
    always @* begin
        case (_3695)
        0: _4023 <= _4015;
        1: _4023 <= _4016;
        2: _4023 <= _4017;
        3: _4023 <= _4018;
        4: _4023 <= _4019;
        5: _4023 <= _4020;
        6: _4023 <= _4021;
        default: _4023 <= _4022;
        endcase
    end
    assign _4012 = _2165 == _4011;
    assign _4013 = _2164 & _4012;
    assign _4014 = _4013 & seq_a_caught_up;
    assign _4024 = _4014 & _4023;
    assign _4224 = ~ _3814;
    assign _4225 = _3797 ? _4224 : seq_a_flag;
    assign _4226 = _3849 ? _4225 : seq_a_flag;
    assign _4227 = ctrl_bit0 ? gnd : _4226;
    assign _120 = _4227;
    always @(posedge _151) begin
        if (_164)
            seq_a_flag <= _4007;
        else
            seq_a_flag <= _120;
    end
    assign _4004 = _2165 == _4003;
    assign _4005 = _2164 & _4004;
    assign _4009 = _4005 & seq_a_flag;
    assign _3998 = seq_a_y == _3997;
    assign _3999 = ~ _3998;
    assign _3996 = _2165 == _3995;
    assign _4000 = _3996 & _3999;
    assign _3991 = seq_a_x == _3990;
    assign _3992 = ~ _3991;
    assign _3989 = _2165 == _3988;
    assign _3993 = _3989 & _3992;
    assign _3987 = _2165 == _3986;
    assign _3994 = _3987 | _3993;
    assign _4001 = _3994 | _4000;
    assign _4002 = _2164 & _4001;
    assign _4010 = _4002 | _4009;
    assign _4025 = _4010 | _4024;
    assign _4028 = _4025 ? _2169 : _4027;
    assign _4228 = _3849 ? _4028 : seq_a_ir_pc;
    assign _4229 = ctrl_bit0 ? _4029 : _4228;
    assign _121 = _4229;
    always @(posedge _151) begin
        if (_164)
            seq_a_ir_pc <= _2171;
        else
            seq_a_ir_pc <= _121;
    end
    assign _2169 = seq_a_ir[5:0];
    assign _2173 = _2169 == seq_a_ir_pc;
    assign _2167 = _2165 == _2166;
    assign _2168 = _2164 & _2167;
    assign _2174 = _2168 & _2173;
    assign _3846 = ~ _2174;
    assign _3841 = ~ seq_a_caught_up;
    assign _3839 = _2165 == _3838;
    assign _3840 = _2164 & _3839;
    assign _3842 = _3840 & _3841;
    assign _4255 = seq_a_y[7:0];
    assign _4256 = { _3878, _4255 };
    assign _4253 = { _4252, _3878 };
    assign _4250 = seq_a_y - _4249;
    assign _4246 = seq_a_y == _4245;
    assign _4247 = ~ _4246;
    assign _4243 = _2165 == _4242;
    assign _4244 = _2164 & _4243;
    assign _4248 = _4244 & _4247;
    assign _4251 = _4248 ? _4250 : seq_a_y;
    assign _4240 = _3874 == _4239;
    assign _4237 = _2161 == _4236;
    assign _4238 = _2158 & _4237;
    assign _4241 = _4238 & _4240;
    assign _4254 = _4241 ? _4253 : _4251;
    assign _4234 = _3874 == _4233;
    assign _4231 = _2161 == _4230;
    assign _4232 = _2158 & _4231;
    assign _4235 = _4232 & _4234;
    assign _4257 = _4235 ? _4256 : _4254;
    assign _4258 = _3849 ? _4257 : seq_a_y;
    assign _4260 = ctrl_bit0 ? _4259 : _4258;
    assign _122 = _4260;
    always @(posedge _151) begin
        if (_164)
            seq_a_y <= _3827;
        else
            seq_a_y <= _122;
    end
    assign _4286 = seq_a_x[7:0];
    assign _4287 = { _3878, _4286 };
    assign _4284 = { _4283, _3878 };
    assign _4281 = seq_a_x - _4280;
    assign _4277 = seq_a_x == _4276;
    assign _4278 = ~ _4277;
    assign _2165 = seq_a_ir[11:8];
    assign _4274 = _2165 == _4273;
    assign _2163 = _2161 == _2162;
    assign _2164 = _2158 & _2163;
    assign _4275 = _2164 & _4274;
    assign _4279 = _4275 & _4278;
    assign _4282 = _4279 ? _4281 : seq_a_x;
    assign _4271 = _3874 == _4270;
    assign _4268 = _2161 == _4267;
    assign _4269 = _2158 & _4268;
    assign _4272 = _4269 & _4271;
    assign _4285 = _4272 ? _4284 : _4282;
    assign _4265 = _3874 == _4264;
    assign _4262 = _2161 == _4261;
    assign _4263 = _2158 & _4262;
    assign _4266 = _4263 & _4265;
    assign _4288 = _4266 ? _4287 : _4285;
    assign _4289 = _3849 ? _4288 : seq_a_x;
    assign _4291 = ctrl_bit0 ? _4290 : _4289;
    assign _123 = _4291;
    always @(posedge _151) begin
        if (_164)
            seq_a_x <= _3824;
        else
            seq_a_x <= _123;
    end
    always @* begin
        case (_3815)
        0: _3830 <= _3822;
        1: _3830 <= seq_a_x;
        2: _3830 <= seq_a_y;
        default: _3830 <= _3829;
        endcase
    end
    assign _4298 = seq_a_wait_count + _4297;
    assign _4294 = ~ _3834;
    assign _4292 = seq_a_running & _3797;
    assign _4293 = _4292 & seq_a_caught_up;
    assign _4295 = _4293 & _4294;
    assign _4299 = _4295 ? _4298 : _4296;
    assign _4301 = ctrl_bit0 ? _4300 : _4299;
    assign _124 = _4301;
    always @(posedge _151) begin
        if (_164)
            seq_a_wait_count <= _3820;
        else
            seq_a_wait_count <= _124;
    end
    assign _3831 = seq_a_wait_count == _3830;
    assign _3815 = seq_a_ir[7:6];
    assign _3817 = _3815 == _3816;
    assign _3818 = ~ _3817;
    assign _3832 = _3818 & _3831;
    assign _3813 = seq_a_ir[8:8];
    assign _3811 = pins_sync[7:7];
    assign _3810 = pins_sync[6:6];
    assign _3809 = pins_sync[5:5];
    assign _3808 = pins_sync[4:4];
    assign _3807 = pins_sync[3:3];
    assign _3806 = pins_sync[2:2];
    assign _3805 = pins_sync[1:1];
    assign _126 = uio_in;
    always @(posedge _151) begin
        pins_sync1 <= _126;
    end
    always @(posedge _151) begin
        pins_sync <= pins_sync1;
    end
    assign _3804 = pins_sync[0:0];
    assign _3694 = _3690[11:9];
    assign _3692 = _3690[5:3];
    assign _3691 = _3690[2:0];
    assign _3695 = _3690[8:6];
    assign _3801 = seq_a_ir[11:9];
    assign _3802 = _3801[1:0];
    always @* begin
        case (_3802)
        0: _3803 <= _3695;
        1: _3803 <= _3691;
        2: _3803 <= _3692;
        default: _3803 <= _3694;
        endcase
    end
    always @* begin
        case (_3803)
        0: _3812 <= _3804;
        1: _3812 <= _3805;
        2: _3812 <= _3806;
        3: _3812 <= _3807;
        4: _3812 <= _3808;
        5: _3812 <= _3809;
        6: _3812 <= _3810;
        default: _3812 <= _3811;
        endcase
    end
    assign _3814 = _3812 == _3813;
    assign _3833 = _3814 | _3832;
    assign _4354 = _4351 == _4353;
    assign _4350 = timebase + _4349;
    assign _4351 = _4348 - _4350;
    assign _4352 = _4351[23:23];
    assign _4355 = _4352 | _4354;
    assign _4333 = _4330 == _4332;
    assign _4329 = timebase + _4328;
    assign _4330 = _4327 - _4329;
    assign _4331 = _4330[23:23];
    assign _4334 = _4331 | _4333;
    assign _4356 = _4302 ? _4355 : _4334;
    assign _4357 = _4304 ? _4356 : vdd;
    assign _4312 = _4309 == _4311;
    assign _4308 = timebase + _4307;
    assign _4309 = seq_a_sched_s - _4308;
    assign _4310 = _4309[23:23];
    assign _4313 = _4310 | _4312;
    assign _4305 = _3849 & _3797;
    assign _4303 = _3849 & _3774;
    assign _4302 = _3849 & _2205;
    assign _4304 = _4302 | _4303;
    assign _4306 = _4304 | _4305;
    assign _4358 = _4306 ? _4357 : _4313;
    assign _4359 = ctrl_bit0 ? gnd : _4358;
    assign _127 = _4359;
    always @(posedge _151) begin
        if (_164)
            seq_a_caught_up <= _3799;
        else
            seq_a_caught_up <= _127;
    end
    assign _3834 = seq_a_caught_up & _3833;
    assign _3835 = ~ _3834;
    assign _3836 = _3797 & _3835;
    assign _3925 = _3924 < _3789;
    assign _128 = _3791;
    assign _3926 = _128 & _3925;
    assign _4364 = { _4363, _3926 };
    assign _3888 = _3789 < _3887;
    assign _3885 = _197 == _3884;
    assign _3886 = spi_wr & _3885;
    assign _3889 = _3886 & _3888;
    assign _4361 = { _4360, _3889 };
    assign _4362 = _3789 + _4361;
    assign _4365 = _4362 - _4364;
    assign _129 = _4365;
    always @(posedge _151) begin
        if (_164)
            _3789 <= _3788;
        else
            _3789 <= _129;
    end
    assign _3790 = _3786 < _3789;
    assign _3785 = seq_a_running & _3784;
    assign _3791 = _3785 & _3790;
    assign _3792 = ~ _3791;
    assign _3781 = seq_a_ir[11:11];
    assign _3783 = _3781 == _3782;
    assign _3779 = _2161 == _3778;
    assign _3780 = _2158 & _3779;
    assign _3784 = _3780 & _3783;
    assign _3793 = _3784 & _3792;
    assign _4390 = _4386[21:21];
    assign _4389 = _4386[22:22];
    assign _4391 = _4389 | _4390;
    assign _4384 = timebase + _4383;
    assign _4367 = timebase + _4366;
    assign _130 = _4367;
    always @(posedge _151) begin
        if (_164)
            timebase <= _231;
        else
            timebase <= _130;
    end
    assign _4323 = _4316[17:0];
    assign _4325 = { _4323, _4324 };
    assign _4320 = _4316[19:0];
    assign _4322 = { _4320, _4321 };
    assign _4317 = _4316[21:0];
    assign _4319 = { _4317, _4318 };
    assign _4315 = seq_a_ir[11:0];
    assign _4316 = { _4314, _4315 };
    always @* begin
        case (seq_a_prescale)
        0: _4326 <= _4316;
        1: _4326 <= _4319;
        2: _4326 <= _4322;
        default: _4326 <= _4325;
        endcase
    end
    assign _4327 = seq_a_sched_s + _4326;
    assign _4344 = _4337[17:0];
    assign _4346 = { _4344, _4345 };
    assign _4341 = _4337[19:0];
    assign _4343 = { _4341, _4342 };
    assign _4338 = _4337[21:0];
    assign _4340 = { _4338, _4339 };
    assign _4336 = seq_a_ir[11:6];
    assign _4337 = { _4335, _4336 };
    assign _3878 = seq_a_ir[7:0];
    assign _4374 = _3878[1:0];
    assign _3874 = seq_a_ir[11:8];
    assign _4372 = _3874 == _4371;
    assign _4369 = _2161 == _4368;
    assign _4370 = _2158 & _4369;
    assign _4373 = _4370 & _4372;
    assign _4375 = _4373 ? _4374 : seq_a_prescale;
    assign _4376 = _3849 ? _4375 : seq_a_prescale;
    assign _4378 = ctrl_bit0 ? _4377 : _4376;
    assign _131 = _4378;
    always @(posedge _151) begin
        if (_164)
            seq_a_prescale <= _2216;
        else
            seq_a_prescale <= _131;
    end
    always @* begin
        case (seq_a_prescale)
        0: _4347 <= _4337;
        1: _4347 <= _4340;
        2: _4347 <= _4343;
        default: _4347 <= _4346;
        endcase
    end
    assign _4348 = seq_a_sched_s + _4347;
    assign _4379 = _2205 ? _4348 : seq_a_sched_s;
    assign _4380 = _3774 ? _4327 : _4379;
    assign _3796 = _2161 == _3795;
    assign _3797 = _2158 & _3796;
    assign _4381 = _3797 ? timebase : _4380;
    assign _4382 = _3849 ? _4381 : seq_a_sched_s;
    assign _4385 = ctrl_bit0 ? _4384 : _4382;
    assign _132 = _4385;
    always @(posedge _151) begin
        if (_164)
            seq_a_sched_s <= _2213;
        else
            seq_a_sched_s <= _132;
    end
    assign _4386 = seq_a_sched_s - timebase;
    assign _4387 = _4386[23:23];
    assign _4388 = ~ _4387;
    assign _4392 = _4388 & _4391;
    assign _4393 = ctrl_bit0 ? gnd : _4392;
    assign _133 = _4393;
    always @(posedge _151) begin
        if (_164)
            seq_a_far <= _2202;
        else
            seq_a_far <= _133;
    end
    assign _3773 = ~ seq_a_far;
    assign _3770 = _2161 == _3769;
    assign _3771 = _2158 & _3770;
    assign _3772 = seq_a_running & _3771;
    assign _3774 = _3772 & _3773;
    assign _3775 = ~ _3774;
    assign _3767 = _2161 == _3766;
    assign _3768 = _2158 & _3767;
    assign _3776 = _3768 & _3775;
    assign _3764 = ~ _2205;
    assign _2161 = seq_a_ir[15:12];
    assign _3762 = _2161 == _3761;
    assign _3763 = _2158 & _3762;
    assign _3765 = _3763 & _3764;
    assign _3777 = _3765 | _3776;
    assign _3794 = _3777 | _3793;
    assign _3837 = _3794 | _3836;
    assign _3843 = _3837 | _3842;
    assign _3844 = ~ _3843;
    assign _3845 = seq_a_running & _3844;
    assign _3847 = _3845 & _3846;
    assign _3849 = _3847 & _3848;
    assign _4394 = _3849 ? _119 : seq_a_ir;
    assign _4395 = ctrl_bit0 ? _119 : _4394;
    assign _134 = _4395;
    always @(posedge _151) begin
        if (_164)
            seq_a_ir <= _1986;
        else
            seq_a_ir <= _134;
    end
    assign _1988 = seq_a_ir[15:12];
    assign _1990 = _1988 == _1989;
    assign _1995 = _1990 & _1994;
    assign _2031 = _1995 | _2030;
    assign _2035 = _2031 | _2034;
    assign _2072 = _2035 | _2071;
    assign _2101 = _2072 | _2100;
    assign _2141 = _2101 | _2140;
    assign _2158 = _2141 | _2157;
    assign _2159 = ~ _2158;
    assign _2160 = seq_a_running & _2159;
    assign _4397 = _2160 ? gnd : _4396;
    assign _4398 = ctrl_bit0 ? vdd : _4397;
    assign _135 = _4398;
    always @(posedge _151) begin
        if (_164)
            seq_a_running <= _1983;
        else
            seq_a_running <= _135;
    end
    assign _2199 = seq_a_running & _2198;
    assign _2200 = _2199 & _118;
    assign _2205 = _2200 & _2204;
    assign _2208 = _2205 & _2207;
    assign _4400 = { _4399, _2208 };
    assign _4401 = queue_a_count + _4400;
    assign _4402 = _4401 - _3983;
    assign _136 = _4402;
    always @(posedge _151) begin
        if (_209)
            queue_a_count <= _210;
        else
            queue_a_count <= _136;
    end
    assign _212 = _189 < queue_a_count;
    assign _240 = _212 & _239;
    assign _4410 = _240 & _4409;
    assign _4415 = _4410 & _4414;
    assign _4417 = _4415 & _4416;
    assign _4429 = _4417 | _4428;
    assign _4441 = _4429 | _4440;
    assign _4453 = _4441 | _4452;
    assign _4454 = _4406 | _4453;
    assign _280 = spi_wdata[3:3];
    assign _281 = _200 & _280;
    always @(posedge _151) begin
        if (_164)
            ctrl_bit3 <= _283;
        else
            ctrl_bit3 <= _281;
    end
    assign _204 = spi_wdata[0:0];
    assign _205 = _200 & _204;
    always @(posedge _151) begin
        if (_164)
            ctrl_bit0 <= _207;
        else
            ctrl_bit0 <= _205;
    end
    assign _4403 = ctrl_bit0 | ctrl_bit3;
    assign _4455 = _4403 ? gnd : _4454;
    assign _137 = _4455;
    always @(posedge _151) begin
        if (_164)
            _4406 <= _4405;
        else
            _4406 <= _137;
    end
    assign _4503 = spi_bitcnt == _4502;
    assign _4504 = ~ _4503;
    assign _4499 = spi_bitcnt == _4498;
    assign _4500 = ~ _4499;
    always @(posedge _151) begin
        if (_164)
            _4495 <= _4494;
        else
            _4495 <= _4482;
    end
    assign _4496 = ~ _4495;
    assign _4497 = _4482 & _4496;
    assign _4501 = _4497 & _4500;
    assign _4505 = _4501 & _4504;
    assign _4489 = spi_bitcnt < _4488;
    assign _4490 = ~ _4489;
    assign _4491 = _4484 & _4490;
    assign _4492 = _4463 | _4491;
    assign _4506 = _4492 | _4505;
    assign _4456 = spi_wdata[4:4];
    assign _199 = _197 == _198;
    assign _200 = spi_wr & _199;
    assign _4457 = _200 & _4456;
    always @(posedge _151) begin
        if (_164)
            ctrl_bit4 <= _4459;
        else
            ctrl_bit4 <= _4457;
    end
    assign _138 = ctrl_bit4;
    assign _4507 = _138 ? gnd : _4506;
    assign _139 = _4507;
    always @(posedge _151) begin
        if (_164)
            _4463 <= _4462;
        else
            _4463 <= _139;
    end
    assign _4609 = { gnd, _4463, _4406, _4605, _4606, _4607, _2289, _4608, _3789, seq_a_trapped, queue_a_count, _2271, _2262, _2184, seq_a_halted };
    assign _3200 = _197 == _3199;
    assign _3201 = spi_wr & _3200;
    assign _3196 = spi_wdata[23:0];
    always @(posedge _151) begin
        if (_164)
            _3202 <= _3198;
        else
            if (_3201)
                _3202 <= _3196;
    end
    assign _4598 = { _4597, _3202 };
    assign _3688 = _197 == _3687;
    assign _4512 = _4511 ? vdd : gnd;
    assign _4513 = _4484 ? _4512 : gnd;
    assign _4514 = _4482 ? gnd : _4513;
    assign _140 = _4514;
    always @(posedge _151) begin
        if (_164)
            spi_wr <= _192;
        else
            spi_wr <= _140;
    end
    assign _3689 = spi_wr & _3688;
    assign _4509 = spi_bitcnt == _4508;
    assign _4511 = _4509 & _4510;
    assign _4527 = _4511 ? _4526 : spi_wdata;
    assign _4528 = _4484 ? _4527 : spi_wdata;
    assign _4529 = _4482 ? spi_wdata : _4528;
    assign _141 = _4529;
    always @(posedge _151) begin
        if (_164)
            spi_wdata <= _202;
        else
            spi_wdata <= _141;
    end
    assign _3684 = spi_wdata[11:0];
    always @(posedge _151) begin
        if (_164)
            _3690 <= _3686;
        else
            if (_3689)
                _3690 <= _3684;
    end
    assign _4596 = { _4595, _3690 };
    assign _197 = spi_cmd[6:0];
    always @* begin
        case (_197)
        0: _4677 <= _4530;
        1: _4677 <= _4531;
        2: _4677 <= _4532;
        3: _4677 <= _4533;
        4: _4677 <= _4534;
        5: _4677 <= _4535;
        6: _4677 <= _4536;
        7: _4677 <= _4537;
        8: _4677 <= _4538;
        9: _4677 <= _4539;
        10: _4677 <= _4540;
        11: _4677 <= _4541;
        12: _4677 <= _4542;
        13: _4677 <= _4543;
        14: _4677 <= _4544;
        15: _4677 <= _4545;
        16: _4677 <= _4546;
        17: _4677 <= _4547;
        18: _4677 <= _4548;
        19: _4677 <= _4549;
        20: _4677 <= _4550;
        21: _4677 <= _4551;
        22: _4677 <= _4552;
        23: _4677 <= _4553;
        24: _4677 <= _4554;
        25: _4677 <= _4555;
        26: _4677 <= _4556;
        27: _4677 <= _4557;
        28: _4677 <= _4558;
        29: _4677 <= _4559;
        30: _4677 <= _4560;
        31: _4677 <= _4561;
        32: _4677 <= _4562;
        33: _4677 <= _4563;
        34: _4677 <= _4564;
        35: _4677 <= _4565;
        36: _4677 <= _4566;
        37: _4677 <= _4567;
        38: _4677 <= _4568;
        39: _4677 <= _4569;
        40: _4677 <= _4570;
        41: _4677 <= _4571;
        42: _4677 <= _4572;
        43: _4677 <= _4573;
        44: _4677 <= _4574;
        45: _4677 <= _4575;
        46: _4677 <= _4576;
        47: _4677 <= _4577;
        48: _4677 <= _4578;
        49: _4677 <= _4579;
        50: _4677 <= _4580;
        51: _4677 <= _4581;
        52: _4677 <= _4582;
        53: _4677 <= _4583;
        54: _4677 <= _4584;
        55: _4677 <= _4585;
        56: _4677 <= _4586;
        57: _4677 <= _4587;
        58: _4677 <= _4588;
        59: _4677 <= _4589;
        60: _4677 <= _4590;
        61: _4677 <= _4591;
        62: _4677 <= _4592;
        63: _4677 <= _4593;
        64: _4677 <= _4594;
        65: _4677 <= _4596;
        66: _4677 <= _4598;
        67: _4677 <= _4599;
        68: _4677 <= _4609;
        69: _4677 <= _1957;
        70: _4677 <= _4618;
        71: _4677 <= _4620;
        72: _4677 <= _1112;
        73: _4677 <= _1206;
        74: _4677 <= _1101;
        75: _4677 <= _1323;
        76: _4677 <= _1399;
        77: _4677 <= _1312;
        78: _4677 <= _1516;
        79: _4677 <= _1592;
        80: _4677 <= _1505;
        81: _4677 <= _1709;
        82: _4677 <= _1785;
        83: _4677 <= _1698;
        84: _4677 <= _4621;
        85: _4677 <= _4622;
        86: _4677 <= _4623;
        87: _4677 <= _4624;
        88: _4677 <= _4625;
        89: _4677 <= _4626;
        90: _4677 <= _4627;
        91: _4677 <= _4628;
        92: _4677 <= _4629;
        93: _4677 <= _4630;
        94: _4677 <= _4631;
        95: _4677 <= _4632;
        96: _4677 <= _4636;
        97: _4677 <= _4638;
        98: _4677 <= _4640;
        99: _4677 <= _4641;
        100: _4677 <= _4643;
        101: _4677 <= _4647;
        102: _4677 <= _4648;
        103: _4677 <= _739;
        104: _4677 <= _4652;
        105: _4677 <= _4654;
        106: _4677 <= _4655;
        107: _4677 <= _4656;
        108: _4677 <= _4657;
        109: _4677 <= _4658;
        110: _4677 <= _4659;
        111: _4677 <= _4660;
        112: _4677 <= _4661;
        113: _4677 <= _4662;
        114: _4677 <= _4663;
        115: _4677 <= _4664;
        116: _4677 <= _4665;
        117: _4677 <= _4666;
        118: _4677 <= _4667;
        119: _4677 <= _4668;
        120: _4677 <= _4669;
        121: _4677 <= _4670;
        122: _4677 <= _4671;
        123: _4677 <= _4672;
        124: _4677 <= _4673;
        125: _4677 <= _4674;
        126: _4677 <= _4675;
        default: _4677 <= _4676;
        endcase
    end
    assign _142 = _4677;
    assign _4696 = ~ _4510;
    assign _4680 = _4679 ? vdd : gnd;
    assign _4681 = _4484 ? _4680 : gnd;
    assign _4682 = _4482 ? gnd : _4681;
    assign _143 = _4682;
    always @(posedge _151) begin
        if (_164)
            spi_load <= _4694;
        else
            spi_load <= _143;
    end
    assign _4697 = spi_load & _4696;
    assign _4701 = _4697 ? _142 : spi_out;
    assign _4705 = _4692 ? _4704 : _4701;
    assign _4706 = _4482 ? spi_out : _4705;
    assign _144 = _4706;
    always @(posedge _151) begin
        if (_164)
            spi_out <= _4699;
        else
            spi_out <= _144;
    end
    assign _4725 = spi_out[31:31];
    assign _4519 = _153[2:2];
    always @(posedge _151) begin
        _4522 <= _4519;
    end
    always @(posedge _151) begin
        _4525 <= _4522;
    end
    assign _4707 = _4484 ? _4526 : spi_shift_in;
    assign _4708 = _4482 ? spi_shift_in : _4707;
    assign _145 = _4708;
    always @(posedge _151) begin
        if (_164)
            spi_shift_in <= _4516;
        else
            spi_shift_in <= _145;
    end
    assign _4518 = spi_shift_in[30:0];
    assign _4526 = { _4518, _4525 };
    assign _4709 = _4526[7:0];
    assign _4679 = spi_bitcnt == _4678;
    assign _4710 = _4679 ? _4709 : spi_cmd;
    assign _4711 = _4484 ? _4710 : spi_cmd;
    assign _4712 = _4482 ? spi_cmd : _4711;
    assign _146 = _4712;
    always @(posedge _151) begin
        if (_164)
            spi_cmd <= _195;
        else
            spi_cmd <= _146;
    end
    assign _4510 = spi_cmd[7:7];
    assign _4691 = ~ _4510;
    assign _4717 = spi_bitcnt + _4716;
    assign _4714 = spi_bitcnt == _4713;
    assign _4715 = ~ _4714;
    assign _4718 = _4715 ? _4717 : spi_bitcnt;
    assign _4483 = ~ _4482;
    assign _4474 = ~ _4473;
    assign _4475 = _4470 & _4474;
    assign _4484 = _4475 & _4483;
    assign _4719 = _4484 ? _4718 : spi_bitcnt;
    assign _4721 = _4482 ? _4720 : _4719;
    assign _147 = _4721;
    always @(posedge _151) begin
        if (_164)
            spi_bitcnt <= _4486;
        else
            spi_bitcnt <= _147;
    end
    assign _4688 = spi_bitcnt < _4687;
    assign _4689 = ~ _4688;
    assign _4685 = ~ _4482;
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
            _4473 <= _4472;
        else
            _4473 <= _4470;
    end
    assign _4464 = _153[0:0];
    always @(posedge _151) begin
        _4467 <= _4464;
    end
    always @(posedge _151) begin
        _4470 <= _4467;
    end
    assign _4683 = ~ _4470;
    assign _4684 = _4683 & _4473;
    assign _4686 = _4684 & _4685;
    assign _4690 = _4686 & _4689;
    assign _4692 = _4690 & _4691;
    assign _4726 = _4692 ? _4725 : spi_miso;
    assign _151 = clk;
    assign _153 = ui_in;
    assign _4476 = _153[1:1];
    always @(posedge _151) begin
        _4479 <= _4476;
    end
    always @(posedge _151) begin
        _4482 <= _4479;
    end
    assign _4727 = _4482 ? spi_miso : _4726;
    assign _154 = _4727;
    always @(posedge _151) begin
        if (_164)
            spi_miso <= _4723;
        else
            spi_miso <= _154;
    end
    assign _4738 = { spi_miso, _4737 };

    /* aliases */

    /* output assignments */
    assign uo_out = _4738;
    assign uio_out = _723;
    assign uio_oe = _188;

endmodule
