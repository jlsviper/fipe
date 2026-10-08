(* One sequencer, including the enqueue stage (spec v0.3, Timing model).

   Every field position, opcode and enum value below comes from [Fipe_isa.Isa],
   the same module the assembler, checker and reference model use.

   One instruction per cycle unless stalled. At enqueue the sequencer fixes
   everything about an event (spec v0.2 "commit at enqueue"):
     S'  = S + dt * p                    (p = prescale: 1, 4, 16 or 64)
     due = S' + K_cls * p                (K captured now, never added to S)
     value = drive 0, drive 1, release, or sample, with Toggle and Shift_out
             resolved against the committed level and the coder mode.
   The queue only ever sees {due, pin, value}.

   Stalls: EVT waits while the queue is full; PULL waits for host data; EVT and
   DLY wait while S' would be 2^22 or more ahead of T (the lead bound that keeps
   every event inside the wrap-safe window).

   Start: S = T + [start_lead], so a program's first events are not late.
   Halt: a JMP to itself.

   Fetch is registered (closes timing at the slow corner): the instruction
   executing is held in IR, and the next one is fetched into IR during the
   same cycle, from IR_PC + 1 or, for a taken jump, straight from the jump
   target. Start fetches instruction 0. So every instruction still executes
   in exactly the cycle it did with a combinational fetch: one per cycle,
   taken jumps included. The 64-way program-memory multiplexer now feeds only
   IR, never the execute logic.

   Lead bound: a registered flag, set when S - T >= 2^21. It is one cycle
   stale and S grows by less than 2^18 per cycle, so S - T stays below 2^22,
   inside the wrap-safe window, without an add-then-subtract on the critical
   path.

   Not yet implemented (decoded as NOP): WAIT, MOV, PUSH, CRC, SYNC, CAP, and
   JMP conditions other than Always, X--, Y--. *)
open! Base
open Hardcaml
open Signal
module Isa = Fipe_isa.Isa

let time_bits = Event_queue.time_bits
let start_lead = 64

module I = struct
  type 'a t =
    { clock : 'a
    ; clear : 'a
    ; start : 'a
    ; t_now : 'a [@bits time_bits]
    ; fetch_data : 'a [@bits 16] (* program memory at [fetch_addr] *)
    ; q_ready : 'a
    ; fifo_valid : 'a
    ; fifo_data : 'a [@bits 32]
    ; cfg_data_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_clk_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_k1 : 'a [@bits 8]
    ; cfg_k2 : 'a [@bits 8]
    ; cfg_k3 : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { pc : 'a [@bits 6] (* address of the executing instruction *)
    ; fetch_addr : 'a [@bits 6]
    ; enq_valid : 'a
    ; enq_due : 'a [@bits time_bits]
    ; enq_pin : 'a [@bits Event_queue.pin_bits]
    ; enq_value : 'a [@bits Event_queue.value_bits]
    ; fifo_ready : 'a
    ; running : 'a
    ; halted : 'a
    ; lead_stall : 'a
    }
  [@@deriving sexp_of, hardcaml]
end

module Value = struct
  let drive0 = 0
  let drive1 = 1
  let release = 2
  let sample = 3
end

let field (f : Isa.Field.f) instr = select instr (f.lo + f.width - 1) f.lo

let create (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let open Always in
  let reg w = Variable.reg spec ~width:w in
  let pc = reg 6 (* IR_PC *)
  and ir = reg 16
  and far = reg 1
  and s = reg time_bits
  and x = reg 16
  and y = reg 16
  and osr = reg 32
  and coder = reg 4
  and prescale = reg 2
  and k1 = reg 8
  and k2 = reg 8
  and k3 = reg 8
  and shadow_data = reg 2 (* last committed value on the data pin *)
  and shadow_clk = reg 2
  and running = reg 1
  and halted = reg 1 in
  let instr = ir.value in
  let f fld = field fld instr in
  let op = f Isa.Field.op in
  let is code = op ==:. code in
  (* prescale: shift left by 0, 2, 4 or 6 *)
  let scale v = mux prescale.value [ v; sll v 2; sll v 4; sll v 6 ] in
  let t24 v = uresize v time_bits in
  (* lead bound: registered flag, S - T >= 2^21 (see header) *)
  let lead_d = s.value -: i.t_now in
  let far_next =
    ~:(msb lead_d) &: (bit lead_d (time_bits - 2) |: bit lead_d (time_bits - 3))
  in
  let lead_ok _ = ~:(far.value) in
  (* EVT *)
  let s_evt = s.value +: scale (t24 (f Isa.Field.evt_dt)) in
  let cls = f Isa.Field.evt_cls in
  let k = mux cls [ zero 8; k1.value; k2.value; k3.value ] in
  let dt_plus_k =
    uresize (f Isa.Field.evt_dt) 10 +: sresize k 10 (* signed, scale is linear *)
  in
  let due = s.value +: scale (sresize dt_plus_k time_bits) in
  let tgt_clk = f Isa.Field.evt_tgt in
  let act = f Isa.Field.evt_act in
  let open_drain = bit coder.value 3 in
  let invert = bit coder.value 2 in
  let high = mux2 open_drain (of_int ~width:2 Value.release) (of_int ~width:2 Value.drive1) in
  let lo = of_int ~width:2 Value.drive0 in
  let shadow = mux2 tgt_clk shadow_clk.value shadow_data.value in
  let act_is a = act ==:. Isa.Act.to_int a in
  let value =
    priority_select_with_default
      ~default:lo
      [ { With_valid.valid = act_is Drive1; value = of_int ~width:2 Value.drive1 }
      ; { valid = act_is Release; value = of_int ~width:2 Value.release }
      ; { valid = act_is Toggle; value = mux2 (shadow ==:. Value.drive0) high lo }
      ; { valid = act_is Shift_out; value = mux2 (msb osr.value ^: invert) high lo }
      ; { valid = act_is Sample; value = of_int ~width:2 Value.sample }
      ]
  in
  let evt_go = running.value &: is Isa.Opcode.evt &: i.q_ready &: lead_ok s_evt in
  (* DLY *)
  let s_dly = s.value +: scale (t24 (f Isa.Field.dly_dt)) in
  let dly_go = running.value &: is Isa.Opcode.dly &: lead_ok s_dly in
  (* PULL (PUSH is not implemented yet and falls through as NOP) *)
  let is_pull = is Isa.Opcode.pullpush &: (f Isa.Field.pp_push ==:. 0) in
  let pull_go = running.value &: is_pull &: i.fifo_valid in
  (* JMP *)
  let cond = f Isa.Field.jmp_cond in
  let addr = f Isa.Field.jmp_addr in
  let cond_is c = cond ==:. Isa.Cond.to_int c in
  let is_jmp = is Isa.Opcode.jmp in
  let halt_now = is_jmp &: cond_is Always &: (addr ==: pc.value) in
  let taken =
    is_jmp
    &: (cond_is Always
        |: (cond_is X_dec_nz &: (x.value <>:. 0))
        |: (cond_is Y_dec_nz &: (y.value <>:. 0)))
  in
  let next_addr = mux2 taken addr (pc.value +:. 1) in
  let fetch_addr = mux2 i.start (zero 6) next_addr in
  let blocking =
    (is Isa.Opcode.evt &: ~:evt_go) |: (is Isa.Opcode.dly &: ~:dly_go) |: (is_pull &: ~:pull_go)
  in
  let step = running.value &: ~:blocking &: ~:halt_now in
  (* SET *)
  let dst = f Isa.Field.set_dst in
  let imm = f Isa.Field.set_imm in
  let set_to d = is Isa.Opcode.set &: (dst ==:. Isa.Set_dst.to_int d) in
  compile
    [ if_
        i.start
        [ running <-- vdd
        ; halted <-- gnd
        ; pc <--. 0
        ; ir <-- i.fetch_data
        ; far <-- gnd
        ; s <-- i.t_now +:. start_lead
        ; x <--. 0
        ; y <--. 0
        ; osr <--. 0
        ; coder <--. 0
        ; prescale <--. 0
        ; k1 <-- i.cfg_k1
        ; k2 <-- i.cfg_k2
        ; k3 <-- i.cfg_k3
        ; shadow_data <--. Value.release
        ; shadow_clk <--. Value.release
        ]
        [ far <-- far_next
        ; when_ (running.value &: halt_now) [ running <-- gnd; halted <-- vdd ]
        ; when_
            step
            [ pc <-- next_addr
            ; ir <-- i.fetch_data
            ; when_ evt_go
                [ s <-- s_evt
                ; when_
                    (act_is Shift_out)
                    [ osr <-- sll osr.value 1 ]
                ; when_
                    ~:(act_is Sample)
                    [ if_ tgt_clk [ shadow_clk <-- value ] [ shadow_data <-- value ] ]
                ]
            ; when_ dly_go [ s <-- s_dly ]
            ; when_ pull_go [ osr <-- i.fifo_data ]
            ; when_ (is_jmp &: cond_is X_dec_nz &: (x.value <>:. 0)) [ x <-- x.value -:. 1 ]
            ; when_ (is_jmp &: cond_is Y_dec_nz &: (y.value <>:. 0)) [ y <-- y.value -:. 1 ]
            ; when_ (set_to X) [ x <-- uresize imm 16 ]
            ; when_ (set_to Y) [ y <-- uresize imm 16 ]
            ; when_ (set_to K1) [ k1 <-- imm ]
            ; when_ (set_to K2) [ k2 <-- imm ]
            ; when_ (set_to K3) [ k3 <-- imm ]
            ; when_ (set_to Coder_mode) [ coder <-- select imm 3 0 ]
            ; when_ (set_to Prescale) [ prescale <-- select imm 1 0 ]
            ]
        ]
    ];
  { pc = pc.value
  ; fetch_addr
  ; enq_valid = evt_go
  ; enq_due = due
  ; enq_pin = mux2 tgt_clk i.cfg_clk_pin i.cfg_data_pin
  ; enq_value = value
  ; fifo_ready = pull_go
  ; running = running.value
  ; halted = halted.value
  ; lead_stall =
      running.value
      &: ((is Isa.Opcode.evt &: ~:(lead_ok s_evt)) |: (is Isa.Opcode.dly &: ~:(lead_ok s_dly)))
  }
;;
