// Formal proof, for all time and for every program, host interaction and
// input waveform: a FIPE output pin changes only because an event that targets
// it fired in the previous cycle (drive 0 or 1 sets the level and enables the
// driver, release disables the driver, a sample changes nothing), or because
// the core was cleared. Nothing else in the core (the sequencer, the program
// memory, the host interface) can move a pin.
//
// Together with the event queue's contract (queue_contract.sv: every event
// fires once, in order, never early, and exactly on time unless flagged
// LATE), this is FIPE's timing contract at the pins.

module core_pins (
    input clock, input clear, input start,
    input fifo_valid, input [31:0] fifo_data,
    input [7:0] cfg_k1, input [7:0] cfg_k2, input [7:0] cfg_k3,
    input [5:0] imem_addr, input imem_we, input [15:0] imem_data,
    input [7:0] pins_in,
    input [2:0] cfg_data_pin, input [2:0] cfg_clk_pin, input [2:0] cfg_in_pin, input [2:0] cfg_aux_pin
);
  wire [23:0] t_now, dbg_s;
  wire [7:0] pins_out, pins_oe;
  wire fifo_ready, halted, fire0_valid, fire1_valid, sample_valid, sample_bit;
  wire late, order_err, window_err, dbg_running, dbg_flag;
  wire [2:0] queue_count, fire0_pin, fire1_pin;
  wire [1:0] fire0_value, fire1_value;
  wire [5:0] dbg_pc;
  wire [15:0] dbg_x, dbg_y;

  fipe_core dut (.*);

  // what the outputs were one cycle ago
  reg valid;
  reg pclear;
  reg [7:0] pout, poe;
  reg f0v, f1v;
  reg [2:0] f0p, f1p;
  reg [1:0] f0val, f1val;
  always @(posedge clock) begin
    valid <= 1'b1;
    pclear <= clear;
    pout <= pins_out;
    poe <= pins_oe;
    f0v <= fire0_valid; f0p <= fire0_pin; f0val <= fire0_value;
    f1v <= fire1_valid; f1p <= fire1_pin; f1val <= fire1_value;
  end

  // the only legal pin update: apply fire0, then fire1
  function [15:0] apply(input [15:0] st, input v, input [2:0] p, input [1:0] val);
    reg [7:0] o, e;
    begin
      o = st[7:0];
      e = st[15:8];
      if (v && (val == 2'd0 || val == 2'd1)) begin
        o[p] = (val == 2'd1);
        e[p] = 1'b1;
      end else if (v && val == 2'd2) begin
        e[p] = 1'b0;
      end
      apply = {e, o};
    end
  endfunction

  wire [15:0] expect = apply(apply({poe, pout}, f0v, f0p, f0val), f1v, f1p, f1val);

  always @* begin
    if (valid && pclear) assert (pins_out == 8'd0 && pins_oe == 8'd0);
    if (valid && !pclear) assert ({pins_oe, pins_out} == expect);
  end
endmodule
