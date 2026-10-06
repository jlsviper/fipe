module fipe_event_queue (
    t_now,
    enq_value,
    enq_pin,
    enq_due,
    clear,
    clock,
    enq_valid,
    enq_ready,
    fire0_valid,
    fire0_pin,
    fire0_value,
    fire0_late,
    fire1_valid,
    fire1_pin,
    fire1_value,
    fire1_late,
    order_err,
    window_err,
    count
);

    input [23:0] t_now;
    input [1:0] enq_value;
    input [2:0] enq_pin;
    input [23:0] enq_due;
    input clear;
    input clock;
    input enq_valid;
    output enq_ready;
    output fire0_valid;
    output [2:0] fire0_pin;
    output [1:0] fire0_value;
    output fire0_late;
    output fire1_valid;
    output [2:0] fire1_pin;
    output [1:0] fire1_value;
    output fire1_late;
    output order_err;
    output window_err;
    output [2:0] count;

    /* signal declarations */
    wire [23:0] _47 = 24'b110000000000000000000000;
    wire _48;
    wire _45;
    wire [23:0] _43;
    wire _44;
    wire _46;
    wire _49;
    wire _50;
    wire [23:0] _52 = 24'b000000000000000000000000;
    wire [23:0] _51 = 24'b000000000000000000000000;
    wire [23:0] _54;
    wire [23:0] _3;
    reg [23:0] _53;
    wire [23:0] _60;
    wire _61;
    wire _56 = 1'b0;
    wire _55 = 1'b0;
    wire _58;
    wire _4;
    reg _57;
    wire _59;
    wire _62;
    wire [23:0] _105;
    wire [23:0] _106;
    wire _107;
    wire _108;
    wire [1:0] _109;
    wire [2:0] _110;
    wire [23:0] _111;
    wire [23:0] _112;
    wire _113;
    wire _114;
    wire [1:0] _115;
    wire [2:0] _116;
    wire [2:0] _40 = 3'b100;
    wire [2:0] _37 = 3'b000;
    wire [2:0] _36 = 3'b000;
    wire [23:0] _101 = 24'b000000000000000000000000;
    wire [23:0] _99;
    wire [23:0] _100;
    wire _102;
    wire [1:0] _93 = 2'b01;
    wire [1:0] _94;
    reg [28:0] _95;
    wire [23:0] _96;
    wire [23:0] _97;
    wire _98;
    wire _103;
    wire [2:0] _90 = 3'b001;
    wire _91;
    wire _92;
    wire _104;
    wire [1:0] _142 = 2'b00;
    wire [2:0] _143;
    wire [23:0] _86 = 24'b000000000000000000000000;
    wire [23:0] _84;
    wire [23:0] _85;
    wire _87;
    wire [23:0] _15;
    wire [28:0] _78 = 29'b00000000000000000000000000000;
    wire [28:0] _77 = 29'b00000000000000000000000000000;
    wire [1:0] _120 = 2'b11;
    wire _121;
    wire [28:0] _123;
    wire [28:0] _124;
    wire [28:0] _16;
    reg [28:0] _79;
    wire [28:0] _75 = 29'b00000000000000000000000000000;
    wire [28:0] _74 = 29'b00000000000000000000000000000;
    wire [1:0] _125 = 2'b10;
    wire _126;
    wire [28:0] _127;
    wire [28:0] _128;
    wire [28:0] _17;
    reg [28:0] _76;
    wire [28:0] _72 = 29'b00000000000000000000000000000;
    wire [28:0] _71 = 29'b00000000000000000000000000000;
    wire [1:0] _129 = 2'b01;
    wire _130;
    wire [28:0] _131;
    wire [28:0] _132;
    wire [28:0] _18;
    reg [28:0] _73;
    wire [28:0] _69 = 29'b00000000000000000000000000000;
    wire [28:0] _68 = 29'b00000000000000000000000000000;
    wire [1:0] _20;
    wire [2:0] _22;
    wire [23:0] _24;
    wire [28:0] _122;
    wire [1:0] _136 = 2'b00;
    wire [1:0] _118 = 2'b00;
    wire [1:0] _117 = 2'b00;
    wire [1:0] _133 = 2'b01;
    wire [1:0] _134;
    wire [1:0] _135;
    wire [1:0] _25;
    reg [1:0] _119;
    wire _137;
    wire [28:0] _138;
    wire [28:0] _139;
    wire [28:0] _26;
    reg [28:0] _70;
    wire vdd = 1'b1;
    wire [1:0] _66 = 2'b00;
    wire _28;
    wire [1:0] _65 = 2'b00;
    wire _30;
    wire [1:0] _145;
    wire [1:0] _146;
    wire [1:0] _31;
    reg [1:0] _67;
    reg [28:0] _80;
    wire [23:0] _81;
    wire [23:0] _82;
    wire _83;
    wire _88;
    wire [2:0] _63 = 3'b000;
    wire _64;
    wire _89;
    wire [1:0] _140 = 2'b00;
    wire [2:0] _141;
    wire [2:0] _144;
    wire _33;
    wire _42;
    wire [1:0] _147 = 2'b00;
    wire [2:0] _148;
    wire [2:0] _149;
    wire [2:0] _150;
    wire [2:0] _34;
    reg [2:0] _39;
    wire _41;

    /* logic */
    assign _48 = _43 == _47;
    assign _45 = _43[22:22];
    assign _43 = _24 - _15;
    assign _44 = _43[23:23];
    assign _46 = _44 ^ _45;
    assign _49 = _46 | _48;
    assign _50 = _42 & _49;
    assign _54 = _42 ? _24 : _53;
    assign _3 = _54;
    always @(posedge _30) begin
        if (_28)
            _53 <= _52;
        else
            _53 <= _3;
    end
    assign _60 = _24 - _53;
    assign _61 = _60[23:23];
    assign _58 = _42 ? vdd : _57;
    assign _4 = _58;
    always @(posedge _30) begin
        if (_28)
            _57 <= _56;
        else
            _57 <= _4;
    end
    assign _59 = _42 & _57;
    assign _62 = _59 & _61;
    assign _105 = _95[28:5];
    assign _106 = _105 - _15;
    assign _107 = _106[23:23];
    assign _108 = _104 & _107;
    assign _109 = _95[1:0];
    assign _110 = _95[4:2];
    assign _111 = _80[28:5];
    assign _112 = _111 - _15;
    assign _113 = _112[23:23];
    assign _114 = _89 & _113;
    assign _115 = _80[1:0];
    assign _116 = _80[4:2];
    assign _99 = _95[28:5];
    assign _100 = _99 - _15;
    assign _102 = _100 == _101;
    assign _94 = _67 + _93;
    always @* begin
        case (_94)
        0: _95 <= _70;
        1: _95 <= _73;
        2: _95 <= _76;
        default: _95 <= _79;
        endcase
    end
    assign _96 = _95[28:5];
    assign _97 = _96 - _15;
    assign _98 = _97[23:23];
    assign _103 = _98 | _102;
    assign _91 = _90 < _39;
    assign _92 = _89 & _91;
    assign _104 = _92 & _103;
    assign _143 = { _142, _104 };
    assign _84 = _80[28:5];
    assign _85 = _84 - _15;
    assign _87 = _85 == _86;
    assign _15 = t_now;
    assign _121 = _119 == _120;
    assign _123 = _121 ? _122 : _79;
    assign _124 = _42 ? _123 : _79;
    assign _16 = _124;
    always @(posedge _30) begin
        if (_28)
            _79 <= _78;
        else
            _79 <= _16;
    end
    assign _126 = _119 == _125;
    assign _127 = _126 ? _122 : _76;
    assign _128 = _42 ? _127 : _76;
    assign _17 = _128;
    always @(posedge _30) begin
        if (_28)
            _76 <= _75;
        else
            _76 <= _17;
    end
    assign _130 = _119 == _129;
    assign _131 = _130 ? _122 : _73;
    assign _132 = _42 ? _131 : _73;
    assign _18 = _132;
    always @(posedge _30) begin
        if (_28)
            _73 <= _72;
        else
            _73 <= _18;
    end
    assign _20 = enq_value;
    assign _22 = enq_pin;
    assign _24 = enq_due;
    assign _122 = { _24, _22, _20 };
    assign _134 = _119 + _133;
    assign _135 = _42 ? _134 : _119;
    assign _25 = _135;
    always @(posedge _30) begin
        if (_28)
            _119 <= _118;
        else
            _119 <= _25;
    end
    assign _137 = _119 == _136;
    assign _138 = _137 ? _122 : _70;
    assign _139 = _42 ? _138 : _70;
    assign _26 = _139;
    always @(posedge _30) begin
        if (_28)
            _70 <= _69;
        else
            _70 <= _26;
    end
    assign _28 = clear;
    assign _30 = clock;
    assign _145 = _144[1:0];
    assign _146 = _67 + _145;
    assign _31 = _146;
    always @(posedge _30) begin
        if (_28)
            _67 <= _66;
        else
            _67 <= _31;
    end
    always @* begin
        case (_67)
        0: _80 <= _70;
        1: _80 <= _73;
        2: _80 <= _76;
        default: _80 <= _79;
        endcase
    end
    assign _81 = _80[28:5];
    assign _82 = _81 - _15;
    assign _83 = _82[23:23];
    assign _88 = _83 | _87;
    assign _64 = _63 < _39;
    assign _89 = _64 & _88;
    assign _141 = { _140, _89 };
    assign _144 = _141 + _143;
    assign _33 = enq_valid;
    assign _42 = _33 & _41;
    assign _148 = { _147, _42 };
    assign _149 = _39 + _148;
    assign _150 = _149 - _144;
    assign _34 = _150;
    always @(posedge _30) begin
        if (_28)
            _39 <= _37;
        else
            _39 <= _34;
    end
    assign _41 = _39 < _40;

    /* aliases */

    /* output assignments */
    assign enq_ready = _41;
    assign fire0_valid = _89;
    assign fire0_pin = _116;
    assign fire0_value = _115;
    assign fire0_late = _114;
    assign fire1_valid = _104;
    assign fire1_pin = _110;
    assign fire1_value = _109;
    assign fire1_late = _108;
    assign order_err = _62;
    assign window_err = _50;
    assign count = _39;

endmodule
