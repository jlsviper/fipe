// Formal proof of the event queue's timing contract, for all time (temporal
// induction with Yosys's SAT solver).
//
// The harness runs an ideal reference queue (the "shadow") beside the real one
// and asserts, every cycle:
//   - the real queue holds exactly the shadow's events, in the same order:
//     nothing lost, duplicated or reordered;
//   - an event fires if and only if it is at the head (or second, behind a
//     firing head) and its due time has arrived: never early, never held back;
//   - the late flag is set exactly when an event fires after its due time;
//   - ready and order_err match their definitions.
// Consequence (the timing contract): every event fires exactly once, in order,
// never before its due time, and either exactly at its due time or flagged LATE.
//
// Assumptions: the timebase advances by one per cycle (it is the chip's
// free-running counter) and every enqueued due time is within 2^22 cycles of
// the timebase (the sequencer guarantees this, and window_err checks it).

module queue_contract (
    input clock,
    input clear,
    input enq_valid,
    input [23:0] enq_due,
    input [2:0] enq_pin,
    input [1:0] enq_value
);
  reg [23:0] t;
  always @(posedge clock) t <= t + 24'd1;

  wire [23:0] dl = enq_due - t;
  always @* assume (!enq_valid || ((dl[23] == dl[22]) && (dl != 24'hC00000)));

  wire enq_ready, fire0_valid, fire0_late, fire1_valid, fire1_late, order_err, window_err;
  wire [2:0] fire0_pin, fire1_pin, count;
  wire [1:0] fire0_value, fire1_value, obs_rp, obs_wp;
  wire [28:0] obs_e0, obs_e1, obs_e2, obs_e3;
  wire [23:0] obs_last_due;
  wire obs_last_valid;

  fipe_event_queue_formal dut (
      .clock(clock), .clear(clear), .t_now(t),
      .enq_valid(enq_valid), .enq_due(enq_due), .enq_pin(enq_pin), .enq_value(enq_value),
      .enq_ready(enq_ready),
      .fire0_valid(fire0_valid), .fire0_pin(fire0_pin), .fire0_value(fire0_value), .fire0_late(fire0_late),
      .fire1_valid(fire1_valid), .fire1_pin(fire1_pin), .fire1_value(fire1_value), .fire1_late(fire1_late),
      .order_err(order_err), .window_err(window_err), .count(count),
      .obs_e0(obs_e0), .obs_e1(obs_e1), .obs_e2(obs_e2), .obs_e3(obs_e3),
      .obs_rp(obs_rp), .obs_wp(obs_wp), .obs_last_due(obs_last_due), .obs_last_valid(obs_last_valid));

  // ---- the ideal queue: entries in order from the head --------------------
  reg [28:0] s0, s1, s2, s3;
  reg [2:0] sc;
  reg [23:0] slast;
  reg slv;

  wire signed [23:0] d0 = s0[28:5] - t;
  wire signed [23:0] d1 = s1[28:5] - t;
  wire f0 = (sc >= 3'd1) && (d0 <= 0);
  wire f1 = f0 && (sc >= 3'd2) && (d1 <= 0);
  wire [1:0] n = {1'b0, f0} + {1'b0, f1};
  wire acc = enq_valid && (sc < 3'd4);
  wire [28:0] pk = {enq_due, enq_pin, enq_value};
  wire signed [23:0] dord = enq_due - slast;

  // real entry at logical position k, counted from the read pointer
  function [28:0] at(input [1:0] k);
    case (obs_rp + k)
      2'd0: at = obs_e0;
      2'd1: at = obs_e1;
      2'd2: at = obs_e2;
      default: at = obs_e3;
    endcase
  endfunction

  always @* begin
    // state correspondence
    assert (sc <= 3'd4);
    assert (count == sc);
    assert (obs_wp == obs_rp + sc[1:0]);
    if (sc >= 3'd1) assert (at(2'd0) == s0);
    if (sc >= 3'd2) assert (at(2'd1) == s1);
    if (sc >= 3'd3) assert (at(2'd2) == s2);
    if (sc >= 3'd4) assert (at(2'd3) == s3);
    assert (obs_last_valid == slv);
    if (slv) assert (obs_last_due == slast);
    // the contract
    assert (enq_ready == (sc < 3'd4));
    assert (fire0_valid == f0);
    assert (fire1_valid == f1);
    if (f0) assert (fire0_pin == s0[4:2] && fire0_value == s0[1:0]);
    if (f1) assert (fire1_pin == s1[4:2] && fire1_value == s1[1:0]);
    assert (fire0_late == (f0 && (d0 < 0)));
    assert (fire1_late == (f1 && (d1 < 0)));
    assert (order_err == (acc && slv && (dord < 0)));
    assert (!window_err);
  end

  // ---- ideal queue update: pop what fired, then append what was accepted ---
  wire [28:0] p0 = (n == 2'd0) ? s0 : (n == 2'd1) ? s1 : s2;
  wire [28:0] p1 = (n == 2'd0) ? s1 : (n == 2'd1) ? s2 : s3;
  wire [28:0] p2 = (n == 2'd0) ? s2 : (n == 2'd1) ? s3 : 29'd0;
  wire [28:0] p3 = (n == 2'd0) ? s3 : 29'd0;
  wire [2:0] tail = sc - {1'b0, n};

  always @(posedge clock) begin
    if (clear) begin
      sc <= 3'd0;
      slv <= 1'b0;
      slast <= 24'd0;
      s0 <= 29'd0; s1 <= 29'd0; s2 <= 29'd0; s3 <= 29'd0;
    end else begin
      s0 <= (acc && tail == 3'd0) ? pk : p0;
      s1 <= (acc && tail == 3'd1) ? pk : p1;
      s2 <= (acc && tail == 3'd2) ? pk : p2;
      s3 <= (acc && tail == 3'd3) ? pk : p3;
      sc <= sc + {2'b0, acc} - {1'b0, n};
      if (acc) begin
        slast <= enq_due;
        slv <= 1'b1;
      end
    end
  end
endmodule
