module fipe_monitors (
    min_cyc3,
    min_en3,
    sp_qlvl3,
    sp_qpin3,
    sp_qen3,
    sp_pin3,
    sp_edge3,
    keep_first3,
    max_cyc3,
    max_en3,
    ab_qlvl3,
    ab_qpin3,
    ab_qen3,
    ab_pin3,
    ab_edge3,
    ab_en3,
    st_qlvl3,
    st_qpin3,
    st_qen3,
    st_pin3,
    st_edge3,
    en3,
    min_cyc2,
    min_en2,
    sp_qlvl2,
    sp_qpin2,
    sp_qen2,
    sp_pin2,
    sp_edge2,
    keep_first2,
    max_cyc2,
    max_en2,
    ab_qlvl2,
    ab_qpin2,
    ab_qen2,
    ab_pin2,
    ab_edge2,
    ab_en2,
    st_qlvl2,
    st_qpin2,
    st_qen2,
    st_pin2,
    st_edge2,
    en2,
    min_cyc1,
    min_en1,
    sp_qlvl1,
    sp_qpin1,
    sp_qen1,
    sp_pin1,
    sp_edge1,
    keep_first1,
    max_cyc1,
    max_en1,
    ab_qlvl1,
    ab_qpin1,
    ab_qen1,
    ab_pin1,
    ab_edge1,
    ab_en1,
    st_qlvl1,
    st_qpin1,
    st_qen1,
    st_pin1,
    st_edge1,
    en1,
    min_cyc0,
    min_en0,
    sp_qlvl0,
    sp_qpin0,
    sp_qen0,
    sp_pin0,
    sp_edge0,
    keep_first0,
    max_cyc0,
    max_en0,
    ab_qlvl0,
    ab_qpin0,
    ab_qen0,
    ab_pin0,
    ab_edge0,
    ab_en0,
    st_qlvl0,
    st_qpin0,
    st_qen0,
    clear,
    clock,
    pins,
    st_pin0,
    st_edge0,
    mon_clear,
    en0,
    viol0,
    viol1,
    viol2,
    viol3,
    viol_sticky0,
    viol_sticky1,
    viol_sticky2,
    viol_sticky3,
    armed0,
    armed1,
    armed2,
    armed3,
    min_seen0,
    min_seen1,
    min_seen2,
    min_seen3,
    max_seen0,
    max_seen1,
    max_seen2,
    max_seen3,
    count0,
    count1,
    count2,
    count3
);

    input [15:0] min_cyc3;
    input min_en3;
    input sp_qlvl3;
    input [2:0] sp_qpin3;
    input sp_qen3;
    input [2:0] sp_pin3;
    input [1:0] sp_edge3;
    input keep_first3;
    input [15:0] max_cyc3;
    input max_en3;
    input ab_qlvl3;
    input [2:0] ab_qpin3;
    input ab_qen3;
    input [2:0] ab_pin3;
    input [1:0] ab_edge3;
    input ab_en3;
    input st_qlvl3;
    input [2:0] st_qpin3;
    input st_qen3;
    input [2:0] st_pin3;
    input [1:0] st_edge3;
    input en3;
    input [15:0] min_cyc2;
    input min_en2;
    input sp_qlvl2;
    input [2:0] sp_qpin2;
    input sp_qen2;
    input [2:0] sp_pin2;
    input [1:0] sp_edge2;
    input keep_first2;
    input [15:0] max_cyc2;
    input max_en2;
    input ab_qlvl2;
    input [2:0] ab_qpin2;
    input ab_qen2;
    input [2:0] ab_pin2;
    input [1:0] ab_edge2;
    input ab_en2;
    input st_qlvl2;
    input [2:0] st_qpin2;
    input st_qen2;
    input [2:0] st_pin2;
    input [1:0] st_edge2;
    input en2;
    input [15:0] min_cyc1;
    input min_en1;
    input sp_qlvl1;
    input [2:0] sp_qpin1;
    input sp_qen1;
    input [2:0] sp_pin1;
    input [1:0] sp_edge1;
    input keep_first1;
    input [15:0] max_cyc1;
    input max_en1;
    input ab_qlvl1;
    input [2:0] ab_qpin1;
    input ab_qen1;
    input [2:0] ab_pin1;
    input [1:0] ab_edge1;
    input ab_en1;
    input st_qlvl1;
    input [2:0] st_qpin1;
    input st_qen1;
    input [2:0] st_pin1;
    input [1:0] st_edge1;
    input en1;
    input [15:0] min_cyc0;
    input min_en0;
    input sp_qlvl0;
    input [2:0] sp_qpin0;
    input sp_qen0;
    input [2:0] sp_pin0;
    input [1:0] sp_edge0;
    input keep_first0;
    input [15:0] max_cyc0;
    input max_en0;
    input ab_qlvl0;
    input [2:0] ab_qpin0;
    input ab_qen0;
    input [2:0] ab_pin0;
    input [1:0] ab_edge0;
    input ab_en0;
    input st_qlvl0;
    input [2:0] st_qpin0;
    input st_qen0;
    input clear;
    input clock;
    input [7:0] pins;
    input [2:0] st_pin0;
    input [1:0] st_edge0;
    input mon_clear;
    input en0;
    output viol0;
    output viol1;
    output viol2;
    output viol3;
    output viol_sticky0;
    output viol_sticky1;
    output viol_sticky2;
    output viol_sticky3;
    output armed0;
    output armed1;
    output armed2;
    output armed3;
    output [15:0] min_seen0;
    output [15:0] min_seen1;
    output [15:0] min_seen2;
    output [15:0] min_seen3;
    output [15:0] max_seen0;
    output [15:0] max_seen1;
    output [15:0] max_seen2;
    output [15:0] max_seen3;
    output [7:0] count0;
    output [7:0] count1;
    output [7:0] count2;
    output [7:0] count3;

    /* signal declarations */
    wire [7:0] _341 = 8'b00000000;
    wire [7:0] _340 = 8'b00000000;
    wire [7:0] _350 = 8'b00000000;
    wire [7:0] _346 = 8'b00000001;
    wire [7:0] _347;
    wire [7:0] _343 = 8'b11111111;
    wire _344;
    wire _345;
    wire [7:0] _348;
    wire [7:0] _349;
    wire [7:0] _351;
    wire [7:0] _1;
    reg [7:0] _342;
    wire [7:0] _449 = 8'b00000000;
    wire [7:0] _448 = 8'b00000000;
    wire [7:0] _458 = 8'b00000000;
    wire [7:0] _454 = 8'b00000001;
    wire [7:0] _455;
    wire [7:0] _451 = 8'b11111111;
    wire _452;
    wire _453;
    wire [7:0] _456;
    wire [7:0] _457;
    wire [7:0] _459;
    wire [7:0] _3;
    reg [7:0] _450;
    wire [7:0] _557 = 8'b00000000;
    wire [7:0] _556 = 8'b00000000;
    wire [7:0] _566 = 8'b00000000;
    wire [7:0] _562 = 8'b00000001;
    wire [7:0] _563;
    wire [7:0] _559 = 8'b11111111;
    wire _560;
    wire _561;
    wire [7:0] _564;
    wire [7:0] _565;
    wire [7:0] _567;
    wire [7:0] _5;
    reg [7:0] _558;
    wire [7:0] _665 = 8'b00000000;
    wire [7:0] _664 = 8'b00000000;
    wire [7:0] _674 = 8'b00000000;
    wire [7:0] _670 = 8'b00000001;
    wire [7:0] _671;
    wire [7:0] _667 = 8'b11111111;
    wire _668;
    wire _669;
    wire [7:0] _672;
    wire [7:0] _673;
    wire [7:0] _675;
    wire [7:0] _7;
    reg [7:0] _666;
    wire [15:0] _677 = 16'b0000000000000000;
    wire [15:0] _676 = 16'b0000000000000000;
    wire [15:0] _682 = 16'b0000000000000000;
    wire _679;
    wire [15:0] _680;
    wire [15:0] _681;
    wire [15:0] _683;
    wire [15:0] _9;
    reg [15:0] _678;
    wire [15:0] _685 = 16'b0000000000000000;
    wire [15:0] _684 = 16'b0000000000000000;
    wire [15:0] _690 = 16'b0000000000000000;
    wire _687;
    wire [15:0] _688;
    wire [15:0] _689;
    wire [15:0] _691;
    wire [15:0] _11;
    reg [15:0] _686;
    wire [15:0] _693 = 16'b0000000000000000;
    wire [15:0] _692 = 16'b0000000000000000;
    wire [15:0] _698 = 16'b0000000000000000;
    wire _695;
    wire [15:0] _696;
    wire [15:0] _697;
    wire [15:0] _699;
    wire [15:0] _13;
    reg [15:0] _694;
    wire [15:0] _701 = 16'b0000000000000000;
    wire [15:0] _700 = 16'b0000000000000000;
    wire [15:0] _706 = 16'b0000000000000000;
    wire _703;
    wire [15:0] _704;
    wire [15:0] _705;
    wire [15:0] _707;
    wire [15:0] _15;
    reg [15:0] _702;
    wire [15:0] _709 = 16'b0000000000000000;
    wire [15:0] _708 = 16'b0000000000000000;
    wire [15:0] _714 = 16'b1111111111111111;
    wire _711;
    wire [15:0] _712;
    wire _339;
    wire [15:0] _713;
    wire [15:0] _715;
    wire [15:0] _17;
    reg [15:0] _710;
    wire [15:0] _717 = 16'b0000000000000000;
    wire [15:0] _716 = 16'b0000000000000000;
    wire [15:0] _722 = 16'b1111111111111111;
    wire _719;
    wire [15:0] _720;
    wire _447;
    wire [15:0] _721;
    wire [15:0] _723;
    wire [15:0] _19;
    reg [15:0] _718;
    wire [15:0] _725 = 16'b0000000000000000;
    wire [15:0] _724 = 16'b0000000000000000;
    wire [15:0] _730 = 16'b1111111111111111;
    wire _727;
    wire [15:0] _728;
    wire _555;
    wire [15:0] _729;
    wire [15:0] _731;
    wire [15:0] _21;
    reg [15:0] _726;
    wire [15:0] _733 = 16'b0000000000000000;
    wire [15:0] _732 = 16'b0000000000000000;
    wire [15:0] _738 = 16'b1111111111111111;
    wire _735;
    wire [15:0] _736;
    wire _663;
    wire [15:0] _737;
    wire [15:0] _739;
    wire [15:0] _23;
    reg [15:0] _734;
    wire _747 = 1'b0;
    wire _746 = 1'b0;
    wire _749;
    wire _750;
    wire _29;
    reg _748;
    wire _758 = 1'b0;
    wire _757 = 1'b0;
    wire _760;
    wire _761;
    wire _31;
    reg _759;
    wire _769 = 1'b0;
    wire _768 = 1'b0;
    wire _771;
    wire _772;
    wire _33;
    reg _770;
    wire _780 = 1'b0;
    wire _779 = 1'b0;
    wire _782;
    wire _783;
    wire _35;
    reg _781;
    wire _743;
    wire [15:0] _38;
    wire _741;
    wire _40;
    wire _42;
    wire _280;
    wire _279;
    wire _278;
    wire _277;
    wire _276;
    wire _275;
    wire _274;
    wire _273;
    wire [2:0] _44;
    reg _281;
    wire _282;
    wire _46;
    wire _272;
    wire _283;
    wire _269;
    wire _267;
    wire _268;
    wire _264;
    wire _263;
    wire _262;
    wire _261;
    wire _260;
    wire _259;
    wire _258;
    wire _257;
    reg _265;
    wire _254;
    wire _253;
    wire _252;
    wire _251;
    wire _250;
    wire _249;
    wire _248;
    wire _247;
    wire [2:0] _48;
    reg _255;
    wire _256;
    wire _266;
    wire [1:0] _50;
    reg _271;
    wire _284;
    wire _234 = 1'b0;
    wire _233 = 1'b0;
    wire _52;
    wire _337;
    wire _293;
    wire [15:0] _288 = 16'b0000000000000000;
    wire [15:0] _287 = 16'b0000000000000000;
    wire [15:0] _836 = 16'b0000000000000001;
    wire [15:0] _833 = 16'b0000000000000001;
    wire [15:0] _834;
    wire [15:0] _829 = 16'b1111111111111111;
    wire _830;
    wire _831;
    wire _832;
    wire [15:0] _835;
    wire [15:0] _837;
    wire [15:0] _838;
    wire [15:0] _53;
    reg [15:0] _289;
    wire [15:0] _55;
    wire _290;
    wire _57;
    wire _291;
    wire _286;
    wire _292;
    wire _294;
    wire _338;
    wire _335;
    wire _59;
    wire _329;
    wire _328;
    wire _327;
    wire _326;
    wire _325;
    wire _324;
    wire _323;
    wire _322;
    wire [2:0] _61;
    reg _330;
    wire _331;
    wire _63;
    wire _321;
    wire _332;
    wire _319;
    wire _317;
    wire _318;
    wire _314;
    wire _313;
    wire _312;
    wire _311;
    wire _310;
    wire _309;
    wire _308;
    wire _307;
    reg _315;
    wire _304;
    wire _303;
    wire _302;
    wire _301;
    wire _300;
    wire _299;
    wire _298;
    wire _297;
    wire [2:0] _65;
    reg _305;
    wire _306;
    wire _316;
    wire [1:0] _67;
    reg _320;
    wire _333;
    wire _69;
    wire _295;
    wire _296;
    wire _334;
    wire _336;
    wire _822;
    wire _823;
    wire _824;
    wire _825;
    wire _826;
    wire _827;
    wire _71;
    wire _816;
    wire _815;
    wire _814;
    wire _813;
    wire _812;
    wire _811;
    wire _810;
    wire _809;
    wire [2:0] _73;
    reg _817;
    wire _818;
    wire _75;
    wire _808;
    wire _819;
    wire _806;
    wire _804;
    wire _805;
    wire _801;
    wire _800;
    wire _799;
    wire _798;
    wire _797;
    wire _796;
    wire _795;
    wire _794;
    reg _802;
    wire _791;
    wire _790;
    wire _789;
    wire _788;
    wire _787;
    wire _786;
    wire _785;
    wire _784;
    wire [2:0] _77;
    reg _792;
    wire _793;
    wire _803;
    wire [1:0] _79;
    reg _807;
    wire _820;
    wire _821;
    wire _828;
    wire _839;
    wire _840;
    wire _80;
    reg _236;
    wire _82;
    wire _237;
    wire _285;
    wire _740;
    wire _742;
    wire _744;
    wire _745;
    wire _754;
    wire [15:0] _85;
    wire _752;
    wire _87;
    wire _89;
    wire _388;
    wire _387;
    wire _386;
    wire _385;
    wire _384;
    wire _383;
    wire _382;
    wire _381;
    wire [2:0] _91;
    reg _389;
    wire _390;
    wire _93;
    wire _380;
    wire _391;
    wire _378;
    wire _376;
    wire _377;
    wire _373;
    wire _372;
    wire _371;
    wire _370;
    wire _369;
    wire _368;
    wire _367;
    wire _366;
    reg _374;
    wire _363;
    wire _362;
    wire _361;
    wire _360;
    wire _359;
    wire _358;
    wire _357;
    wire _356;
    wire [2:0] _95;
    reg _364;
    wire _365;
    wire _375;
    wire [1:0] _97;
    reg _379;
    wire _392;
    wire _353 = 1'b0;
    wire _352 = 1'b0;
    wire _99;
    wire _445;
    wire _401;
    wire [15:0] _396 = 16'b0000000000000000;
    wire [15:0] _395 = 16'b0000000000000000;
    wire [15:0] _893 = 16'b0000000000000001;
    wire [15:0] _890 = 16'b0000000000000001;
    wire [15:0] _891;
    wire [15:0] _886 = 16'b1111111111111111;
    wire _887;
    wire _888;
    wire _889;
    wire [15:0] _892;
    wire [15:0] _894;
    wire [15:0] _895;
    wire [15:0] _100;
    reg [15:0] _397;
    wire [15:0] _102;
    wire _398;
    wire _104;
    wire _399;
    wire _394;
    wire _400;
    wire _402;
    wire _446;
    wire _443;
    wire _106;
    wire _437;
    wire _436;
    wire _435;
    wire _434;
    wire _433;
    wire _432;
    wire _431;
    wire _430;
    wire [2:0] _108;
    reg _438;
    wire _439;
    wire _110;
    wire _429;
    wire _440;
    wire _427;
    wire _425;
    wire _426;
    wire _422;
    wire _421;
    wire _420;
    wire _419;
    wire _418;
    wire _417;
    wire _416;
    wire _415;
    reg _423;
    wire _412;
    wire _411;
    wire _410;
    wire _409;
    wire _408;
    wire _407;
    wire _406;
    wire _405;
    wire [2:0] _112;
    reg _413;
    wire _414;
    wire _424;
    wire [1:0] _114;
    reg _428;
    wire _441;
    wire _116;
    wire _403;
    wire _404;
    wire _442;
    wire _444;
    wire _879;
    wire _880;
    wire _881;
    wire _882;
    wire _883;
    wire _884;
    wire _118;
    wire _873;
    wire _872;
    wire _871;
    wire _870;
    wire _869;
    wire _868;
    wire _867;
    wire _866;
    wire [2:0] _120;
    reg _874;
    wire _875;
    wire _122;
    wire _865;
    wire _876;
    wire _863;
    wire _861;
    wire _862;
    wire _858;
    wire _857;
    wire _856;
    wire _855;
    wire _854;
    wire _853;
    wire _852;
    wire _851;
    reg _859;
    wire _848;
    wire _847;
    wire _846;
    wire _845;
    wire _844;
    wire _843;
    wire _842;
    wire _841;
    wire [2:0] _124;
    reg _849;
    wire _850;
    wire _860;
    wire [1:0] _126;
    reg _864;
    wire _877;
    wire _878;
    wire _885;
    wire _896;
    wire _897;
    wire _127;
    reg _354;
    wire _129;
    wire _355;
    wire _393;
    wire _751;
    wire _753;
    wire _755;
    wire _756;
    wire _765;
    wire [15:0] _132;
    wire _763;
    wire _134;
    wire _136;
    wire _496;
    wire _495;
    wire _494;
    wire _493;
    wire _492;
    wire _491;
    wire _490;
    wire _489;
    wire [2:0] _138;
    reg _497;
    wire _498;
    wire _140;
    wire _488;
    wire _499;
    wire _486;
    wire _484;
    wire _485;
    wire _481;
    wire _480;
    wire _479;
    wire _478;
    wire _477;
    wire _476;
    wire _475;
    wire _474;
    reg _482;
    wire _471;
    wire _470;
    wire _469;
    wire _468;
    wire _467;
    wire _466;
    wire _465;
    wire _464;
    wire [2:0] _142;
    reg _472;
    wire _473;
    wire _483;
    wire [1:0] _144;
    reg _487;
    wire _500;
    wire _461 = 1'b0;
    wire _460 = 1'b0;
    wire _146;
    wire _553;
    wire _509;
    wire [15:0] _504 = 16'b0000000000000000;
    wire [15:0] _503 = 16'b0000000000000000;
    wire [15:0] _950 = 16'b0000000000000001;
    wire [15:0] _947 = 16'b0000000000000001;
    wire [15:0] _948;
    wire [15:0] _943 = 16'b1111111111111111;
    wire _944;
    wire _945;
    wire _946;
    wire [15:0] _949;
    wire [15:0] _951;
    wire [15:0] _952;
    wire [15:0] _147;
    reg [15:0] _505;
    wire [15:0] _149;
    wire _506;
    wire _151;
    wire _507;
    wire _502;
    wire _508;
    wire _510;
    wire _554;
    wire _551;
    wire _153;
    wire _545;
    wire _544;
    wire _543;
    wire _542;
    wire _541;
    wire _540;
    wire _539;
    wire _538;
    wire [2:0] _155;
    reg _546;
    wire _547;
    wire _157;
    wire _537;
    wire _548;
    wire _535;
    wire _533;
    wire _534;
    wire _530;
    wire _529;
    wire _528;
    wire _527;
    wire _526;
    wire _525;
    wire _524;
    wire _523;
    reg _531;
    wire _520;
    wire _519;
    wire _518;
    wire _517;
    wire _516;
    wire _515;
    wire _514;
    wire _513;
    wire [2:0] _159;
    reg _521;
    wire _522;
    wire _532;
    wire [1:0] _161;
    reg _536;
    wire _549;
    wire _163;
    wire _511;
    wire _512;
    wire _550;
    wire _552;
    wire _936;
    wire _937;
    wire _938;
    wire _939;
    wire _940;
    wire _941;
    wire _165;
    wire _930;
    wire _929;
    wire _928;
    wire _927;
    wire _926;
    wire _925;
    wire _924;
    wire _923;
    wire [2:0] _167;
    reg _931;
    wire _932;
    wire _169;
    wire _922;
    wire _933;
    wire _920;
    wire _918;
    wire _919;
    wire _915;
    wire _914;
    wire _913;
    wire _912;
    wire _911;
    wire _910;
    wire _909;
    wire _908;
    reg _916;
    wire _905;
    wire _904;
    wire _903;
    wire _902;
    wire _901;
    wire _900;
    wire _899;
    wire _898;
    wire [2:0] _171;
    reg _906;
    wire _907;
    wire _917;
    wire [1:0] _173;
    reg _921;
    wire _934;
    wire _935;
    wire _942;
    wire _953;
    wire _954;
    wire _174;
    reg _462;
    wire _176;
    wire _463;
    wire _501;
    wire _762;
    wire _764;
    wire _766;
    wire _767;
    wire _776;
    wire [15:0] _179;
    wire _774;
    wire _181;
    wire _183;
    wire _604;
    wire _603;
    wire _602;
    wire _601;
    wire _600;
    wire _599;
    wire _598;
    wire _597;
    wire [2:0] _185;
    reg _605;
    wire _606;
    wire _187;
    wire _596;
    wire _607;
    wire _594;
    wire _592;
    wire _593;
    wire _589;
    wire _588;
    wire _587;
    wire _586;
    wire _585;
    wire _584;
    wire _583;
    wire _582;
    reg _590;
    wire _579;
    wire _578;
    wire _577;
    wire _576;
    wire _575;
    wire _574;
    wire _573;
    wire _572;
    wire [2:0] _189;
    reg _580;
    wire _581;
    wire _591;
    wire [1:0] _191;
    reg _595;
    wire _608;
    wire _569 = 1'b0;
    wire _568 = 1'b0;
    wire _193;
    wire _661;
    wire _617;
    wire [15:0] _612 = 16'b0000000000000000;
    wire [15:0] _611 = 16'b0000000000000000;
    wire [15:0] _1007 = 16'b0000000000000001;
    wire [15:0] _1004 = 16'b0000000000000001;
    wire [15:0] _1005;
    wire [15:0] _1000 = 16'b1111111111111111;
    wire _1001;
    wire _1002;
    wire _1003;
    wire [15:0] _1006;
    wire [15:0] _1008;
    wire [15:0] _1009;
    wire [15:0] _194;
    reg [15:0] _613;
    wire [15:0] _196;
    wire _614;
    wire _198;
    wire _615;
    wire _610;
    wire _616;
    wire _618;
    wire _662;
    wire _659;
    wire _200;
    wire _653;
    wire _652;
    wire _651;
    wire _650;
    wire _649;
    wire _648;
    wire _647;
    wire _646;
    wire [2:0] _202;
    reg _654;
    wire _655;
    wire _204;
    wire _645;
    wire _656;
    wire _643;
    wire _641;
    wire _642;
    wire _638;
    wire _637;
    wire _636;
    wire _635;
    wire _634;
    wire _633;
    wire _632;
    wire _631;
    reg _639;
    wire _628;
    wire _627;
    wire _626;
    wire _625;
    wire _624;
    wire _623;
    wire _622;
    wire _621;
    wire [2:0] _206;
    reg _629;
    wire _630;
    wire _640;
    wire [1:0] _208;
    reg _644;
    wire _657;
    wire _210;
    wire _619;
    wire _620;
    wire _658;
    wire _660;
    wire _993;
    wire _994;
    wire _995;
    wire _996;
    wire _997;
    wire _998;
    wire _212;
    wire _987;
    wire _986;
    wire _985;
    wire _984;
    wire _983;
    wire _982;
    wire _981;
    wire _980;
    wire [2:0] _214;
    reg _988;
    wire _989;
    wire _216;
    wire _979;
    wire _990;
    wire gnd = 1'b0;
    wire _977;
    wire _975;
    wire _976;
    wire _972;
    wire _971;
    wire _970;
    wire _969;
    wire _968;
    wire _967;
    wire _966;
    wire _965;
    reg _973;
    wire _962;
    wire _961;
    wire _960;
    wire _959;
    wire _958;
    wire _957;
    wire _956;
    wire [7:0] _245 = 8'b00000000;
    wire [7:0] _244 = 8'b00000000;
    wire [7:0] _242 = 8'b00000000;
    wire [7:0] _241 = 8'b00000000;
    wire vdd = 1'b1;
    wire [7:0] _239 = 8'b00000000;
    wire _218;
    wire [7:0] _238 = 8'b00000000;
    wire _220;
    wire [7:0] _222;
    reg [7:0] _240;
    reg [7:0] _243;
    reg [7:0] _246;
    wire _955;
    wire [2:0] _224;
    reg _963;
    wire _964;
    wire _974;
    wire [1:0] _226;
    reg _978;
    wire _991;
    wire _992;
    wire _999;
    wire _1010;
    wire _228;
    wire _1011;
    wire _229;
    reg _570;
    wire _231;
    wire _571;
    wire _609;
    wire _773;
    wire _775;
    wire _777;
    wire _778;

    /* logic */
    assign _347 = _342 + _346;
    assign _344 = _342 == _343;
    assign _345 = ~ _344;
    assign _348 = _345 ? _347 : _342;
    assign _349 = _339 ? _348 : _342;
    assign _351 = _228 ? _350 : _349;
    assign _1 = _351;
    always @(posedge _220) begin
        if (_218)
            _342 <= _341;
        else
            _342 <= _1;
    end
    assign _455 = _450 + _454;
    assign _452 = _450 == _451;
    assign _453 = ~ _452;
    assign _456 = _453 ? _455 : _450;
    assign _457 = _447 ? _456 : _450;
    assign _459 = _228 ? _458 : _457;
    assign _3 = _459;
    always @(posedge _220) begin
        if (_218)
            _450 <= _449;
        else
            _450 <= _3;
    end
    assign _563 = _558 + _562;
    assign _560 = _558 == _559;
    assign _561 = ~ _560;
    assign _564 = _561 ? _563 : _558;
    assign _565 = _555 ? _564 : _558;
    assign _567 = _228 ? _566 : _565;
    assign _5 = _567;
    always @(posedge _220) begin
        if (_218)
            _558 <= _557;
        else
            _558 <= _5;
    end
    assign _671 = _666 + _670;
    assign _668 = _666 == _667;
    assign _669 = ~ _668;
    assign _672 = _669 ? _671 : _666;
    assign _673 = _663 ? _672 : _666;
    assign _675 = _228 ? _674 : _673;
    assign _7 = _675;
    always @(posedge _220) begin
        if (_218)
            _666 <= _665;
        else
            _666 <= _7;
    end
    assign _679 = _678 < _289;
    assign _680 = _679 ? _289 : _678;
    assign _681 = _339 ? _680 : _678;
    assign _683 = _228 ? _682 : _681;
    assign _9 = _683;
    always @(posedge _220) begin
        if (_218)
            _678 <= _677;
        else
            _678 <= _9;
    end
    assign _687 = _686 < _397;
    assign _688 = _687 ? _397 : _686;
    assign _689 = _447 ? _688 : _686;
    assign _691 = _228 ? _690 : _689;
    assign _11 = _691;
    always @(posedge _220) begin
        if (_218)
            _686 <= _685;
        else
            _686 <= _11;
    end
    assign _695 = _694 < _505;
    assign _696 = _695 ? _505 : _694;
    assign _697 = _555 ? _696 : _694;
    assign _699 = _228 ? _698 : _697;
    assign _13 = _699;
    always @(posedge _220) begin
        if (_218)
            _694 <= _693;
        else
            _694 <= _13;
    end
    assign _703 = _702 < _613;
    assign _704 = _703 ? _613 : _702;
    assign _705 = _663 ? _704 : _702;
    assign _707 = _228 ? _706 : _705;
    assign _15 = _707;
    always @(posedge _220) begin
        if (_218)
            _702 <= _701;
        else
            _702 <= _15;
    end
    assign _711 = _289 < _710;
    assign _712 = _711 ? _289 : _710;
    assign _339 = _285 | _338;
    assign _713 = _339 ? _712 : _710;
    assign _715 = _228 ? _714 : _713;
    assign _17 = _715;
    always @(posedge _220) begin
        if (_218)
            _710 <= _709;
        else
            _710 <= _17;
    end
    assign _719 = _397 < _718;
    assign _720 = _719 ? _397 : _718;
    assign _447 = _393 | _446;
    assign _721 = _447 ? _720 : _718;
    assign _723 = _228 ? _722 : _721;
    assign _19 = _723;
    always @(posedge _220) begin
        if (_218)
            _718 <= _717;
        else
            _718 <= _19;
    end
    assign _727 = _505 < _726;
    assign _728 = _727 ? _505 : _726;
    assign _555 = _501 | _554;
    assign _729 = _555 ? _728 : _726;
    assign _731 = _228 ? _730 : _729;
    assign _21 = _731;
    always @(posedge _220) begin
        if (_218)
            _726 <= _725;
        else
            _726 <= _21;
    end
    assign _735 = _613 < _734;
    assign _736 = _735 ? _613 : _734;
    assign _663 = _609 | _662;
    assign _737 = _663 ? _736 : _734;
    assign _739 = _228 ? _738 : _737;
    assign _23 = _739;
    always @(posedge _220) begin
        if (_218)
            _734 <= _733;
        else
            _734 <= _23;
    end
    assign _749 = _745 ? vdd : _748;
    assign _750 = _228 ? gnd : _749;
    assign _29 = _750;
    always @(posedge _220) begin
        if (_218)
            _748 <= _747;
        else
            _748 <= _29;
    end
    assign _760 = _756 ? vdd : _759;
    assign _761 = _228 ? gnd : _760;
    assign _31 = _761;
    always @(posedge _220) begin
        if (_218)
            _759 <= _758;
        else
            _759 <= _31;
    end
    assign _771 = _767 ? vdd : _770;
    assign _772 = _228 ? gnd : _771;
    assign _33 = _772;
    always @(posedge _220) begin
        if (_218)
            _770 <= _769;
        else
            _770 <= _33;
    end
    assign _782 = _778 ? vdd : _781;
    assign _783 = _228 ? gnd : _782;
    assign _35 = _783;
    always @(posedge _220) begin
        if (_218)
            _781 <= _780;
        else
            _781 <= _35;
    end
    assign _743 = _285 & _291;
    assign _38 = min_cyc3;
    assign _741 = _289 < _38;
    assign _40 = min_en3;
    assign _42 = sp_qlvl3;
    assign _280 = _246[7:7];
    assign _279 = _246[6:6];
    assign _278 = _246[5:5];
    assign _277 = _246[4:4];
    assign _276 = _246[3:3];
    assign _275 = _246[2:2];
    assign _274 = _246[1:1];
    assign _273 = _246[0:0];
    assign _44 = sp_qpin3;
    always @* begin
        case (_44)
        0: _281 <= _273;
        1: _281 <= _274;
        2: _281 <= _275;
        3: _281 <= _276;
        4: _281 <= _277;
        5: _281 <= _278;
        6: _281 <= _279;
        default: _281 <= _280;
        endcase
    end
    assign _282 = _281 == _42;
    assign _46 = sp_qen3;
    assign _272 = ~ _46;
    assign _283 = _272 | _282;
    assign _269 = _255 ^ _265;
    assign _267 = ~ _265;
    assign _268 = _255 & _267;
    assign _264 = _243[7:7];
    assign _263 = _243[6:6];
    assign _262 = _243[5:5];
    assign _261 = _243[4:4];
    assign _260 = _243[3:3];
    assign _259 = _243[2:2];
    assign _258 = _243[1:1];
    assign _257 = _243[0:0];
    always @* begin
        case (_48)
        0: _265 <= _257;
        1: _265 <= _258;
        2: _265 <= _259;
        3: _265 <= _260;
        4: _265 <= _261;
        5: _265 <= _262;
        6: _265 <= _263;
        default: _265 <= _264;
        endcase
    end
    assign _254 = _246[7:7];
    assign _253 = _246[6:6];
    assign _252 = _246[5:5];
    assign _251 = _246[4:4];
    assign _250 = _246[3:3];
    assign _249 = _246[2:2];
    assign _248 = _246[1:1];
    assign _247 = _246[0:0];
    assign _48 = sp_pin3;
    always @* begin
        case (_48)
        0: _255 <= _247;
        1: _255 <= _248;
        2: _255 <= _249;
        3: _255 <= _250;
        4: _255 <= _251;
        5: _255 <= _252;
        6: _255 <= _253;
        default: _255 <= _254;
        endcase
    end
    assign _256 = ~ _255;
    assign _266 = _256 & _265;
    assign _50 = sp_edge3;
    always @* begin
        case (_50)
        0: _271 <= _266;
        1: _271 <= _268;
        2: _271 <= _269;
        default: _271 <= gnd;
        endcase
    end
    assign _284 = _271 & _283;
    assign _52 = keep_first3;
    assign _337 = ~ _336;
    assign _293 = ~ _285;
    assign _834 = _289 + _833;
    assign _830 = _289 == _829;
    assign _831 = ~ _830;
    assign _832 = _825 & _831;
    assign _835 = _832 ? _834 : _289;
    assign _837 = _828 ? _836 : _835;
    assign _838 = _228 ? _289 : _837;
    assign _53 = _838;
    always @(posedge _220) begin
        if (_218)
            _289 <= _288;
        else
            _289 <= _53;
    end
    assign _55 = max_cyc3;
    assign _290 = _55 < _289;
    assign _57 = max_en3;
    assign _291 = _57 & _290;
    assign _286 = _82 & _236;
    assign _292 = _286 & _291;
    assign _294 = _292 & _293;
    assign _338 = _294 & _337;
    assign _335 = ~ _285;
    assign _59 = ab_qlvl3;
    assign _329 = _246[7:7];
    assign _328 = _246[6:6];
    assign _327 = _246[5:5];
    assign _326 = _246[4:4];
    assign _325 = _246[3:3];
    assign _324 = _246[2:2];
    assign _323 = _246[1:1];
    assign _322 = _246[0:0];
    assign _61 = ab_qpin3;
    always @* begin
        case (_61)
        0: _330 <= _322;
        1: _330 <= _323;
        2: _330 <= _324;
        3: _330 <= _325;
        4: _330 <= _326;
        5: _330 <= _327;
        6: _330 <= _328;
        default: _330 <= _329;
        endcase
    end
    assign _331 = _330 == _59;
    assign _63 = ab_qen3;
    assign _321 = ~ _63;
    assign _332 = _321 | _331;
    assign _319 = _305 ^ _315;
    assign _317 = ~ _315;
    assign _318 = _305 & _317;
    assign _314 = _243[7:7];
    assign _313 = _243[6:6];
    assign _312 = _243[5:5];
    assign _311 = _243[4:4];
    assign _310 = _243[3:3];
    assign _309 = _243[2:2];
    assign _308 = _243[1:1];
    assign _307 = _243[0:0];
    always @* begin
        case (_65)
        0: _315 <= _307;
        1: _315 <= _308;
        2: _315 <= _309;
        3: _315 <= _310;
        4: _315 <= _311;
        5: _315 <= _312;
        6: _315 <= _313;
        default: _315 <= _314;
        endcase
    end
    assign _304 = _246[7:7];
    assign _303 = _246[6:6];
    assign _302 = _246[5:5];
    assign _301 = _246[4:4];
    assign _300 = _246[3:3];
    assign _299 = _246[2:2];
    assign _298 = _246[1:1];
    assign _297 = _246[0:0];
    assign _65 = ab_pin3;
    always @* begin
        case (_65)
        0: _305 <= _297;
        1: _305 <= _298;
        2: _305 <= _299;
        3: _305 <= _300;
        4: _305 <= _301;
        5: _305 <= _302;
        6: _305 <= _303;
        default: _305 <= _304;
        endcase
    end
    assign _306 = ~ _305;
    assign _316 = _306 & _315;
    assign _67 = ab_edge3;
    always @* begin
        case (_67)
        0: _320 <= _316;
        1: _320 <= _318;
        2: _320 <= _319;
        default: _320 <= gnd;
        endcase
    end
    assign _333 = _320 & _332;
    assign _69 = ab_en3;
    assign _295 = _82 & _236;
    assign _296 = _295 & _69;
    assign _334 = _296 & _333;
    assign _336 = _334 & _335;
    assign _822 = _285 | _336;
    assign _823 = _822 | _338;
    assign _824 = ~ _823;
    assign _825 = _236 & _824;
    assign _826 = _825 & _52;
    assign _827 = ~ _826;
    assign _71 = st_qlvl3;
    assign _816 = _246[7:7];
    assign _815 = _246[6:6];
    assign _814 = _246[5:5];
    assign _813 = _246[4:4];
    assign _812 = _246[3:3];
    assign _811 = _246[2:2];
    assign _810 = _246[1:1];
    assign _809 = _246[0:0];
    assign _73 = st_qpin3;
    always @* begin
        case (_73)
        0: _817 <= _809;
        1: _817 <= _810;
        2: _817 <= _811;
        3: _817 <= _812;
        4: _817 <= _813;
        5: _817 <= _814;
        6: _817 <= _815;
        default: _817 <= _816;
        endcase
    end
    assign _818 = _817 == _71;
    assign _75 = st_qen3;
    assign _808 = ~ _75;
    assign _819 = _808 | _818;
    assign _806 = _792 ^ _802;
    assign _804 = ~ _802;
    assign _805 = _792 & _804;
    assign _801 = _243[7:7];
    assign _800 = _243[6:6];
    assign _799 = _243[5:5];
    assign _798 = _243[4:4];
    assign _797 = _243[3:3];
    assign _796 = _243[2:2];
    assign _795 = _243[1:1];
    assign _794 = _243[0:0];
    always @* begin
        case (_77)
        0: _802 <= _794;
        1: _802 <= _795;
        2: _802 <= _796;
        3: _802 <= _797;
        4: _802 <= _798;
        5: _802 <= _799;
        6: _802 <= _800;
        default: _802 <= _801;
        endcase
    end
    assign _791 = _246[7:7];
    assign _790 = _246[6:6];
    assign _789 = _246[5:5];
    assign _788 = _246[4:4];
    assign _787 = _246[3:3];
    assign _786 = _246[2:2];
    assign _785 = _246[1:1];
    assign _784 = _246[0:0];
    assign _77 = st_pin3;
    always @* begin
        case (_77)
        0: _792 <= _784;
        1: _792 <= _785;
        2: _792 <= _786;
        3: _792 <= _787;
        4: _792 <= _788;
        5: _792 <= _789;
        6: _792 <= _790;
        default: _792 <= _791;
        endcase
    end
    assign _793 = ~ _792;
    assign _803 = _793 & _802;
    assign _79 = st_edge3;
    always @* begin
        case (_79)
        0: _807 <= _803;
        1: _807 <= _805;
        2: _807 <= _806;
        default: _807 <= gnd;
        endcase
    end
    assign _820 = _807 & _819;
    assign _821 = _82 & _820;
    assign _828 = _821 & _827;
    assign _839 = _828 ? vdd : _825;
    assign _840 = _228 ? gnd : _839;
    assign _80 = _840;
    always @(posedge _220) begin
        if (_218)
            _236 <= _234;
        else
            _236 <= _80;
    end
    assign _82 = en3;
    assign _237 = _82 & _236;
    assign _285 = _237 & _284;
    assign _740 = _285 & _40;
    assign _742 = _740 & _741;
    assign _744 = _742 | _743;
    assign _745 = _744 | _338;
    assign _754 = _393 & _399;
    assign _85 = min_cyc2;
    assign _752 = _397 < _85;
    assign _87 = min_en2;
    assign _89 = sp_qlvl2;
    assign _388 = _246[7:7];
    assign _387 = _246[6:6];
    assign _386 = _246[5:5];
    assign _385 = _246[4:4];
    assign _384 = _246[3:3];
    assign _383 = _246[2:2];
    assign _382 = _246[1:1];
    assign _381 = _246[0:0];
    assign _91 = sp_qpin2;
    always @* begin
        case (_91)
        0: _389 <= _381;
        1: _389 <= _382;
        2: _389 <= _383;
        3: _389 <= _384;
        4: _389 <= _385;
        5: _389 <= _386;
        6: _389 <= _387;
        default: _389 <= _388;
        endcase
    end
    assign _390 = _389 == _89;
    assign _93 = sp_qen2;
    assign _380 = ~ _93;
    assign _391 = _380 | _390;
    assign _378 = _364 ^ _374;
    assign _376 = ~ _374;
    assign _377 = _364 & _376;
    assign _373 = _243[7:7];
    assign _372 = _243[6:6];
    assign _371 = _243[5:5];
    assign _370 = _243[4:4];
    assign _369 = _243[3:3];
    assign _368 = _243[2:2];
    assign _367 = _243[1:1];
    assign _366 = _243[0:0];
    always @* begin
        case (_95)
        0: _374 <= _366;
        1: _374 <= _367;
        2: _374 <= _368;
        3: _374 <= _369;
        4: _374 <= _370;
        5: _374 <= _371;
        6: _374 <= _372;
        default: _374 <= _373;
        endcase
    end
    assign _363 = _246[7:7];
    assign _362 = _246[6:6];
    assign _361 = _246[5:5];
    assign _360 = _246[4:4];
    assign _359 = _246[3:3];
    assign _358 = _246[2:2];
    assign _357 = _246[1:1];
    assign _356 = _246[0:0];
    assign _95 = sp_pin2;
    always @* begin
        case (_95)
        0: _364 <= _356;
        1: _364 <= _357;
        2: _364 <= _358;
        3: _364 <= _359;
        4: _364 <= _360;
        5: _364 <= _361;
        6: _364 <= _362;
        default: _364 <= _363;
        endcase
    end
    assign _365 = ~ _364;
    assign _375 = _365 & _374;
    assign _97 = sp_edge2;
    always @* begin
        case (_97)
        0: _379 <= _375;
        1: _379 <= _377;
        2: _379 <= _378;
        default: _379 <= gnd;
        endcase
    end
    assign _392 = _379 & _391;
    assign _99 = keep_first2;
    assign _445 = ~ _444;
    assign _401 = ~ _393;
    assign _891 = _397 + _890;
    assign _887 = _397 == _886;
    assign _888 = ~ _887;
    assign _889 = _882 & _888;
    assign _892 = _889 ? _891 : _397;
    assign _894 = _885 ? _893 : _892;
    assign _895 = _228 ? _397 : _894;
    assign _100 = _895;
    always @(posedge _220) begin
        if (_218)
            _397 <= _396;
        else
            _397 <= _100;
    end
    assign _102 = max_cyc2;
    assign _398 = _102 < _397;
    assign _104 = max_en2;
    assign _399 = _104 & _398;
    assign _394 = _129 & _354;
    assign _400 = _394 & _399;
    assign _402 = _400 & _401;
    assign _446 = _402 & _445;
    assign _443 = ~ _393;
    assign _106 = ab_qlvl2;
    assign _437 = _246[7:7];
    assign _436 = _246[6:6];
    assign _435 = _246[5:5];
    assign _434 = _246[4:4];
    assign _433 = _246[3:3];
    assign _432 = _246[2:2];
    assign _431 = _246[1:1];
    assign _430 = _246[0:0];
    assign _108 = ab_qpin2;
    always @* begin
        case (_108)
        0: _438 <= _430;
        1: _438 <= _431;
        2: _438 <= _432;
        3: _438 <= _433;
        4: _438 <= _434;
        5: _438 <= _435;
        6: _438 <= _436;
        default: _438 <= _437;
        endcase
    end
    assign _439 = _438 == _106;
    assign _110 = ab_qen2;
    assign _429 = ~ _110;
    assign _440 = _429 | _439;
    assign _427 = _413 ^ _423;
    assign _425 = ~ _423;
    assign _426 = _413 & _425;
    assign _422 = _243[7:7];
    assign _421 = _243[6:6];
    assign _420 = _243[5:5];
    assign _419 = _243[4:4];
    assign _418 = _243[3:3];
    assign _417 = _243[2:2];
    assign _416 = _243[1:1];
    assign _415 = _243[0:0];
    always @* begin
        case (_112)
        0: _423 <= _415;
        1: _423 <= _416;
        2: _423 <= _417;
        3: _423 <= _418;
        4: _423 <= _419;
        5: _423 <= _420;
        6: _423 <= _421;
        default: _423 <= _422;
        endcase
    end
    assign _412 = _246[7:7];
    assign _411 = _246[6:6];
    assign _410 = _246[5:5];
    assign _409 = _246[4:4];
    assign _408 = _246[3:3];
    assign _407 = _246[2:2];
    assign _406 = _246[1:1];
    assign _405 = _246[0:0];
    assign _112 = ab_pin2;
    always @* begin
        case (_112)
        0: _413 <= _405;
        1: _413 <= _406;
        2: _413 <= _407;
        3: _413 <= _408;
        4: _413 <= _409;
        5: _413 <= _410;
        6: _413 <= _411;
        default: _413 <= _412;
        endcase
    end
    assign _414 = ~ _413;
    assign _424 = _414 & _423;
    assign _114 = ab_edge2;
    always @* begin
        case (_114)
        0: _428 <= _424;
        1: _428 <= _426;
        2: _428 <= _427;
        default: _428 <= gnd;
        endcase
    end
    assign _441 = _428 & _440;
    assign _116 = ab_en2;
    assign _403 = _129 & _354;
    assign _404 = _403 & _116;
    assign _442 = _404 & _441;
    assign _444 = _442 & _443;
    assign _879 = _393 | _444;
    assign _880 = _879 | _446;
    assign _881 = ~ _880;
    assign _882 = _354 & _881;
    assign _883 = _882 & _99;
    assign _884 = ~ _883;
    assign _118 = st_qlvl2;
    assign _873 = _246[7:7];
    assign _872 = _246[6:6];
    assign _871 = _246[5:5];
    assign _870 = _246[4:4];
    assign _869 = _246[3:3];
    assign _868 = _246[2:2];
    assign _867 = _246[1:1];
    assign _866 = _246[0:0];
    assign _120 = st_qpin2;
    always @* begin
        case (_120)
        0: _874 <= _866;
        1: _874 <= _867;
        2: _874 <= _868;
        3: _874 <= _869;
        4: _874 <= _870;
        5: _874 <= _871;
        6: _874 <= _872;
        default: _874 <= _873;
        endcase
    end
    assign _875 = _874 == _118;
    assign _122 = st_qen2;
    assign _865 = ~ _122;
    assign _876 = _865 | _875;
    assign _863 = _849 ^ _859;
    assign _861 = ~ _859;
    assign _862 = _849 & _861;
    assign _858 = _243[7:7];
    assign _857 = _243[6:6];
    assign _856 = _243[5:5];
    assign _855 = _243[4:4];
    assign _854 = _243[3:3];
    assign _853 = _243[2:2];
    assign _852 = _243[1:1];
    assign _851 = _243[0:0];
    always @* begin
        case (_124)
        0: _859 <= _851;
        1: _859 <= _852;
        2: _859 <= _853;
        3: _859 <= _854;
        4: _859 <= _855;
        5: _859 <= _856;
        6: _859 <= _857;
        default: _859 <= _858;
        endcase
    end
    assign _848 = _246[7:7];
    assign _847 = _246[6:6];
    assign _846 = _246[5:5];
    assign _845 = _246[4:4];
    assign _844 = _246[3:3];
    assign _843 = _246[2:2];
    assign _842 = _246[1:1];
    assign _841 = _246[0:0];
    assign _124 = st_pin2;
    always @* begin
        case (_124)
        0: _849 <= _841;
        1: _849 <= _842;
        2: _849 <= _843;
        3: _849 <= _844;
        4: _849 <= _845;
        5: _849 <= _846;
        6: _849 <= _847;
        default: _849 <= _848;
        endcase
    end
    assign _850 = ~ _849;
    assign _860 = _850 & _859;
    assign _126 = st_edge2;
    always @* begin
        case (_126)
        0: _864 <= _860;
        1: _864 <= _862;
        2: _864 <= _863;
        default: _864 <= gnd;
        endcase
    end
    assign _877 = _864 & _876;
    assign _878 = _129 & _877;
    assign _885 = _878 & _884;
    assign _896 = _885 ? vdd : _882;
    assign _897 = _228 ? gnd : _896;
    assign _127 = _897;
    always @(posedge _220) begin
        if (_218)
            _354 <= _353;
        else
            _354 <= _127;
    end
    assign _129 = en2;
    assign _355 = _129 & _354;
    assign _393 = _355 & _392;
    assign _751 = _393 & _87;
    assign _753 = _751 & _752;
    assign _755 = _753 | _754;
    assign _756 = _755 | _446;
    assign _765 = _501 & _507;
    assign _132 = min_cyc1;
    assign _763 = _505 < _132;
    assign _134 = min_en1;
    assign _136 = sp_qlvl1;
    assign _496 = _246[7:7];
    assign _495 = _246[6:6];
    assign _494 = _246[5:5];
    assign _493 = _246[4:4];
    assign _492 = _246[3:3];
    assign _491 = _246[2:2];
    assign _490 = _246[1:1];
    assign _489 = _246[0:0];
    assign _138 = sp_qpin1;
    always @* begin
        case (_138)
        0: _497 <= _489;
        1: _497 <= _490;
        2: _497 <= _491;
        3: _497 <= _492;
        4: _497 <= _493;
        5: _497 <= _494;
        6: _497 <= _495;
        default: _497 <= _496;
        endcase
    end
    assign _498 = _497 == _136;
    assign _140 = sp_qen1;
    assign _488 = ~ _140;
    assign _499 = _488 | _498;
    assign _486 = _472 ^ _482;
    assign _484 = ~ _482;
    assign _485 = _472 & _484;
    assign _481 = _243[7:7];
    assign _480 = _243[6:6];
    assign _479 = _243[5:5];
    assign _478 = _243[4:4];
    assign _477 = _243[3:3];
    assign _476 = _243[2:2];
    assign _475 = _243[1:1];
    assign _474 = _243[0:0];
    always @* begin
        case (_142)
        0: _482 <= _474;
        1: _482 <= _475;
        2: _482 <= _476;
        3: _482 <= _477;
        4: _482 <= _478;
        5: _482 <= _479;
        6: _482 <= _480;
        default: _482 <= _481;
        endcase
    end
    assign _471 = _246[7:7];
    assign _470 = _246[6:6];
    assign _469 = _246[5:5];
    assign _468 = _246[4:4];
    assign _467 = _246[3:3];
    assign _466 = _246[2:2];
    assign _465 = _246[1:1];
    assign _464 = _246[0:0];
    assign _142 = sp_pin1;
    always @* begin
        case (_142)
        0: _472 <= _464;
        1: _472 <= _465;
        2: _472 <= _466;
        3: _472 <= _467;
        4: _472 <= _468;
        5: _472 <= _469;
        6: _472 <= _470;
        default: _472 <= _471;
        endcase
    end
    assign _473 = ~ _472;
    assign _483 = _473 & _482;
    assign _144 = sp_edge1;
    always @* begin
        case (_144)
        0: _487 <= _483;
        1: _487 <= _485;
        2: _487 <= _486;
        default: _487 <= gnd;
        endcase
    end
    assign _500 = _487 & _499;
    assign _146 = keep_first1;
    assign _553 = ~ _552;
    assign _509 = ~ _501;
    assign _948 = _505 + _947;
    assign _944 = _505 == _943;
    assign _945 = ~ _944;
    assign _946 = _939 & _945;
    assign _949 = _946 ? _948 : _505;
    assign _951 = _942 ? _950 : _949;
    assign _952 = _228 ? _505 : _951;
    assign _147 = _952;
    always @(posedge _220) begin
        if (_218)
            _505 <= _504;
        else
            _505 <= _147;
    end
    assign _149 = max_cyc1;
    assign _506 = _149 < _505;
    assign _151 = max_en1;
    assign _507 = _151 & _506;
    assign _502 = _176 & _462;
    assign _508 = _502 & _507;
    assign _510 = _508 & _509;
    assign _554 = _510 & _553;
    assign _551 = ~ _501;
    assign _153 = ab_qlvl1;
    assign _545 = _246[7:7];
    assign _544 = _246[6:6];
    assign _543 = _246[5:5];
    assign _542 = _246[4:4];
    assign _541 = _246[3:3];
    assign _540 = _246[2:2];
    assign _539 = _246[1:1];
    assign _538 = _246[0:0];
    assign _155 = ab_qpin1;
    always @* begin
        case (_155)
        0: _546 <= _538;
        1: _546 <= _539;
        2: _546 <= _540;
        3: _546 <= _541;
        4: _546 <= _542;
        5: _546 <= _543;
        6: _546 <= _544;
        default: _546 <= _545;
        endcase
    end
    assign _547 = _546 == _153;
    assign _157 = ab_qen1;
    assign _537 = ~ _157;
    assign _548 = _537 | _547;
    assign _535 = _521 ^ _531;
    assign _533 = ~ _531;
    assign _534 = _521 & _533;
    assign _530 = _243[7:7];
    assign _529 = _243[6:6];
    assign _528 = _243[5:5];
    assign _527 = _243[4:4];
    assign _526 = _243[3:3];
    assign _525 = _243[2:2];
    assign _524 = _243[1:1];
    assign _523 = _243[0:0];
    always @* begin
        case (_159)
        0: _531 <= _523;
        1: _531 <= _524;
        2: _531 <= _525;
        3: _531 <= _526;
        4: _531 <= _527;
        5: _531 <= _528;
        6: _531 <= _529;
        default: _531 <= _530;
        endcase
    end
    assign _520 = _246[7:7];
    assign _519 = _246[6:6];
    assign _518 = _246[5:5];
    assign _517 = _246[4:4];
    assign _516 = _246[3:3];
    assign _515 = _246[2:2];
    assign _514 = _246[1:1];
    assign _513 = _246[0:0];
    assign _159 = ab_pin1;
    always @* begin
        case (_159)
        0: _521 <= _513;
        1: _521 <= _514;
        2: _521 <= _515;
        3: _521 <= _516;
        4: _521 <= _517;
        5: _521 <= _518;
        6: _521 <= _519;
        default: _521 <= _520;
        endcase
    end
    assign _522 = ~ _521;
    assign _532 = _522 & _531;
    assign _161 = ab_edge1;
    always @* begin
        case (_161)
        0: _536 <= _532;
        1: _536 <= _534;
        2: _536 <= _535;
        default: _536 <= gnd;
        endcase
    end
    assign _549 = _536 & _548;
    assign _163 = ab_en1;
    assign _511 = _176 & _462;
    assign _512 = _511 & _163;
    assign _550 = _512 & _549;
    assign _552 = _550 & _551;
    assign _936 = _501 | _552;
    assign _937 = _936 | _554;
    assign _938 = ~ _937;
    assign _939 = _462 & _938;
    assign _940 = _939 & _146;
    assign _941 = ~ _940;
    assign _165 = st_qlvl1;
    assign _930 = _246[7:7];
    assign _929 = _246[6:6];
    assign _928 = _246[5:5];
    assign _927 = _246[4:4];
    assign _926 = _246[3:3];
    assign _925 = _246[2:2];
    assign _924 = _246[1:1];
    assign _923 = _246[0:0];
    assign _167 = st_qpin1;
    always @* begin
        case (_167)
        0: _931 <= _923;
        1: _931 <= _924;
        2: _931 <= _925;
        3: _931 <= _926;
        4: _931 <= _927;
        5: _931 <= _928;
        6: _931 <= _929;
        default: _931 <= _930;
        endcase
    end
    assign _932 = _931 == _165;
    assign _169 = st_qen1;
    assign _922 = ~ _169;
    assign _933 = _922 | _932;
    assign _920 = _906 ^ _916;
    assign _918 = ~ _916;
    assign _919 = _906 & _918;
    assign _915 = _243[7:7];
    assign _914 = _243[6:6];
    assign _913 = _243[5:5];
    assign _912 = _243[4:4];
    assign _911 = _243[3:3];
    assign _910 = _243[2:2];
    assign _909 = _243[1:1];
    assign _908 = _243[0:0];
    always @* begin
        case (_171)
        0: _916 <= _908;
        1: _916 <= _909;
        2: _916 <= _910;
        3: _916 <= _911;
        4: _916 <= _912;
        5: _916 <= _913;
        6: _916 <= _914;
        default: _916 <= _915;
        endcase
    end
    assign _905 = _246[7:7];
    assign _904 = _246[6:6];
    assign _903 = _246[5:5];
    assign _902 = _246[4:4];
    assign _901 = _246[3:3];
    assign _900 = _246[2:2];
    assign _899 = _246[1:1];
    assign _898 = _246[0:0];
    assign _171 = st_pin1;
    always @* begin
        case (_171)
        0: _906 <= _898;
        1: _906 <= _899;
        2: _906 <= _900;
        3: _906 <= _901;
        4: _906 <= _902;
        5: _906 <= _903;
        6: _906 <= _904;
        default: _906 <= _905;
        endcase
    end
    assign _907 = ~ _906;
    assign _917 = _907 & _916;
    assign _173 = st_edge1;
    always @* begin
        case (_173)
        0: _921 <= _917;
        1: _921 <= _919;
        2: _921 <= _920;
        default: _921 <= gnd;
        endcase
    end
    assign _934 = _921 & _933;
    assign _935 = _176 & _934;
    assign _942 = _935 & _941;
    assign _953 = _942 ? vdd : _939;
    assign _954 = _228 ? gnd : _953;
    assign _174 = _954;
    always @(posedge _220) begin
        if (_218)
            _462 <= _461;
        else
            _462 <= _174;
    end
    assign _176 = en1;
    assign _463 = _176 & _462;
    assign _501 = _463 & _500;
    assign _762 = _501 & _134;
    assign _764 = _762 & _763;
    assign _766 = _764 | _765;
    assign _767 = _766 | _554;
    assign _776 = _609 & _615;
    assign _179 = min_cyc0;
    assign _774 = _613 < _179;
    assign _181 = min_en0;
    assign _183 = sp_qlvl0;
    assign _604 = _246[7:7];
    assign _603 = _246[6:6];
    assign _602 = _246[5:5];
    assign _601 = _246[4:4];
    assign _600 = _246[3:3];
    assign _599 = _246[2:2];
    assign _598 = _246[1:1];
    assign _597 = _246[0:0];
    assign _185 = sp_qpin0;
    always @* begin
        case (_185)
        0: _605 <= _597;
        1: _605 <= _598;
        2: _605 <= _599;
        3: _605 <= _600;
        4: _605 <= _601;
        5: _605 <= _602;
        6: _605 <= _603;
        default: _605 <= _604;
        endcase
    end
    assign _606 = _605 == _183;
    assign _187 = sp_qen0;
    assign _596 = ~ _187;
    assign _607 = _596 | _606;
    assign _594 = _580 ^ _590;
    assign _592 = ~ _590;
    assign _593 = _580 & _592;
    assign _589 = _243[7:7];
    assign _588 = _243[6:6];
    assign _587 = _243[5:5];
    assign _586 = _243[4:4];
    assign _585 = _243[3:3];
    assign _584 = _243[2:2];
    assign _583 = _243[1:1];
    assign _582 = _243[0:0];
    always @* begin
        case (_189)
        0: _590 <= _582;
        1: _590 <= _583;
        2: _590 <= _584;
        3: _590 <= _585;
        4: _590 <= _586;
        5: _590 <= _587;
        6: _590 <= _588;
        default: _590 <= _589;
        endcase
    end
    assign _579 = _246[7:7];
    assign _578 = _246[6:6];
    assign _577 = _246[5:5];
    assign _576 = _246[4:4];
    assign _575 = _246[3:3];
    assign _574 = _246[2:2];
    assign _573 = _246[1:1];
    assign _572 = _246[0:0];
    assign _189 = sp_pin0;
    always @* begin
        case (_189)
        0: _580 <= _572;
        1: _580 <= _573;
        2: _580 <= _574;
        3: _580 <= _575;
        4: _580 <= _576;
        5: _580 <= _577;
        6: _580 <= _578;
        default: _580 <= _579;
        endcase
    end
    assign _581 = ~ _580;
    assign _591 = _581 & _590;
    assign _191 = sp_edge0;
    always @* begin
        case (_191)
        0: _595 <= _591;
        1: _595 <= _593;
        2: _595 <= _594;
        default: _595 <= gnd;
        endcase
    end
    assign _608 = _595 & _607;
    assign _193 = keep_first0;
    assign _661 = ~ _660;
    assign _617 = ~ _609;
    assign _1005 = _613 + _1004;
    assign _1001 = _613 == _1000;
    assign _1002 = ~ _1001;
    assign _1003 = _996 & _1002;
    assign _1006 = _1003 ? _1005 : _613;
    assign _1008 = _999 ? _1007 : _1006;
    assign _1009 = _228 ? _613 : _1008;
    assign _194 = _1009;
    always @(posedge _220) begin
        if (_218)
            _613 <= _612;
        else
            _613 <= _194;
    end
    assign _196 = max_cyc0;
    assign _614 = _196 < _613;
    assign _198 = max_en0;
    assign _615 = _198 & _614;
    assign _610 = _231 & _570;
    assign _616 = _610 & _615;
    assign _618 = _616 & _617;
    assign _662 = _618 & _661;
    assign _659 = ~ _609;
    assign _200 = ab_qlvl0;
    assign _653 = _246[7:7];
    assign _652 = _246[6:6];
    assign _651 = _246[5:5];
    assign _650 = _246[4:4];
    assign _649 = _246[3:3];
    assign _648 = _246[2:2];
    assign _647 = _246[1:1];
    assign _646 = _246[0:0];
    assign _202 = ab_qpin0;
    always @* begin
        case (_202)
        0: _654 <= _646;
        1: _654 <= _647;
        2: _654 <= _648;
        3: _654 <= _649;
        4: _654 <= _650;
        5: _654 <= _651;
        6: _654 <= _652;
        default: _654 <= _653;
        endcase
    end
    assign _655 = _654 == _200;
    assign _204 = ab_qen0;
    assign _645 = ~ _204;
    assign _656 = _645 | _655;
    assign _643 = _629 ^ _639;
    assign _641 = ~ _639;
    assign _642 = _629 & _641;
    assign _638 = _243[7:7];
    assign _637 = _243[6:6];
    assign _636 = _243[5:5];
    assign _635 = _243[4:4];
    assign _634 = _243[3:3];
    assign _633 = _243[2:2];
    assign _632 = _243[1:1];
    assign _631 = _243[0:0];
    always @* begin
        case (_206)
        0: _639 <= _631;
        1: _639 <= _632;
        2: _639 <= _633;
        3: _639 <= _634;
        4: _639 <= _635;
        5: _639 <= _636;
        6: _639 <= _637;
        default: _639 <= _638;
        endcase
    end
    assign _628 = _246[7:7];
    assign _627 = _246[6:6];
    assign _626 = _246[5:5];
    assign _625 = _246[4:4];
    assign _624 = _246[3:3];
    assign _623 = _246[2:2];
    assign _622 = _246[1:1];
    assign _621 = _246[0:0];
    assign _206 = ab_pin0;
    always @* begin
        case (_206)
        0: _629 <= _621;
        1: _629 <= _622;
        2: _629 <= _623;
        3: _629 <= _624;
        4: _629 <= _625;
        5: _629 <= _626;
        6: _629 <= _627;
        default: _629 <= _628;
        endcase
    end
    assign _630 = ~ _629;
    assign _640 = _630 & _639;
    assign _208 = ab_edge0;
    always @* begin
        case (_208)
        0: _644 <= _640;
        1: _644 <= _642;
        2: _644 <= _643;
        default: _644 <= gnd;
        endcase
    end
    assign _657 = _644 & _656;
    assign _210 = ab_en0;
    assign _619 = _231 & _570;
    assign _620 = _619 & _210;
    assign _658 = _620 & _657;
    assign _660 = _658 & _659;
    assign _993 = _609 | _660;
    assign _994 = _993 | _662;
    assign _995 = ~ _994;
    assign _996 = _570 & _995;
    assign _997 = _996 & _193;
    assign _998 = ~ _997;
    assign _212 = st_qlvl0;
    assign _987 = _246[7:7];
    assign _986 = _246[6:6];
    assign _985 = _246[5:5];
    assign _984 = _246[4:4];
    assign _983 = _246[3:3];
    assign _982 = _246[2:2];
    assign _981 = _246[1:1];
    assign _980 = _246[0:0];
    assign _214 = st_qpin0;
    always @* begin
        case (_214)
        0: _988 <= _980;
        1: _988 <= _981;
        2: _988 <= _982;
        3: _988 <= _983;
        4: _988 <= _984;
        5: _988 <= _985;
        6: _988 <= _986;
        default: _988 <= _987;
        endcase
    end
    assign _989 = _988 == _212;
    assign _216 = st_qen0;
    assign _979 = ~ _216;
    assign _990 = _979 | _989;
    assign _977 = _963 ^ _973;
    assign _975 = ~ _973;
    assign _976 = _963 & _975;
    assign _972 = _243[7:7];
    assign _971 = _243[6:6];
    assign _970 = _243[5:5];
    assign _969 = _243[4:4];
    assign _968 = _243[3:3];
    assign _967 = _243[2:2];
    assign _966 = _243[1:1];
    assign _965 = _243[0:0];
    always @* begin
        case (_224)
        0: _973 <= _965;
        1: _973 <= _966;
        2: _973 <= _967;
        3: _973 <= _968;
        4: _973 <= _969;
        5: _973 <= _970;
        6: _973 <= _971;
        default: _973 <= _972;
        endcase
    end
    assign _962 = _246[7:7];
    assign _961 = _246[6:6];
    assign _960 = _246[5:5];
    assign _959 = _246[4:4];
    assign _958 = _246[3:3];
    assign _957 = _246[2:2];
    assign _956 = _246[1:1];
    assign _218 = clear;
    assign _220 = clock;
    assign _222 = pins;
    always @(posedge _220) begin
        if (_218)
            _240 <= _239;
        else
            _240 <= _222;
    end
    always @(posedge _220) begin
        if (_218)
            _243 <= _242;
        else
            _243 <= _240;
    end
    always @(posedge _220) begin
        if (_218)
            _246 <= _245;
        else
            _246 <= _243;
    end
    assign _955 = _246[0:0];
    assign _224 = st_pin0;
    always @* begin
        case (_224)
        0: _963 <= _955;
        1: _963 <= _956;
        2: _963 <= _957;
        3: _963 <= _958;
        4: _963 <= _959;
        5: _963 <= _960;
        6: _963 <= _961;
        default: _963 <= _962;
        endcase
    end
    assign _964 = ~ _963;
    assign _974 = _964 & _973;
    assign _226 = st_edge0;
    always @* begin
        case (_226)
        0: _978 <= _974;
        1: _978 <= _976;
        2: _978 <= _977;
        default: _978 <= gnd;
        endcase
    end
    assign _991 = _978 & _990;
    assign _992 = _231 & _991;
    assign _999 = _992 & _998;
    assign _1010 = _999 ? vdd : _996;
    assign _228 = mon_clear;
    assign _1011 = _228 ? gnd : _1010;
    assign _229 = _1011;
    always @(posedge _220) begin
        if (_218)
            _570 <= _569;
        else
            _570 <= _229;
    end
    assign _231 = en0;
    assign _571 = _231 & _570;
    assign _609 = _571 & _608;
    assign _773 = _609 & _181;
    assign _775 = _773 & _774;
    assign _777 = _775 | _776;
    assign _778 = _777 | _662;

    /* aliases */

    /* output assignments */
    assign viol0 = _778;
    assign viol1 = _767;
    assign viol2 = _756;
    assign viol3 = _745;
    assign viol_sticky0 = _781;
    assign viol_sticky1 = _770;
    assign viol_sticky2 = _759;
    assign viol_sticky3 = _748;
    assign armed0 = _570;
    assign armed1 = _462;
    assign armed2 = _354;
    assign armed3 = _236;
    assign min_seen0 = _734;
    assign min_seen1 = _726;
    assign min_seen2 = _718;
    assign min_seen3 = _710;
    assign max_seen0 = _702;
    assign max_seen1 = _694;
    assign max_seen2 = _686;
    assign max_seen3 = _678;
    assign count0 = _666;
    assign count1 = _558;
    assign count2 = _450;
    assign count3 = _342;

endmodule
