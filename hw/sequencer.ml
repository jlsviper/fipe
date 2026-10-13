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

   Reactive input is schedule-synchronous, so every pin read happens at a
   data-determined time:
   - WAIT stalls until T >= S (real time has caught up with the schedule),
     then watches its pin (input, data, clock or auxiliary, synchronized) until
     it equals [pol] or, if a timeout is selected, until X or Y cycles have
     passed. Then S = T (the schedule resynchronizes to the moment the
     condition held) and the flag records whether it timed out.
   - JMP Pin also stalls until T >= S, then branches if the input pin is high.
   - JMP Flag branches on the flag (no stall).

   Not yet implemented (decoded as NOP): MOV, PUSH, CRC, SYNC, CAP, and the
   JMP conditions Osr_empty, Isr_full, Cap_ready. *)
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
    ; entry : 'a [@bits 6] (* program address to start from *)
    ; t_now : 'a [@bits time_bits]
    ; fetch_data : 'a [@bits 16] (* program memory at [fetch_addr] *)
    ; q_ready : 'a
    ; fifo_valid : 'a
    ; fifo_data : 'a [@bits 32]
    ; cfg_data_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_clk_pin : 'a [@bits Event_queue.pin_bits]
    ; cfg_in_pin : 'a [@bits Event_queue.pin_bits] (* Sample reads this pin *)
    ; cfg_aux_pin : 'a [@bits Event_queue.pin_bits] (* Aux0/Aux1 drive this pin *)
    ; cfg_k1 : 'a [@bits 8]
    ; cfg_k2 : 'a [@bits 8]
    ; cfg_k3 : 'a [@bits 8]
    ; pins_sync : 'a [@bits 8] (* synchronized pin levels, from the core *)
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { s : 'a [@bits time_bits] (* debug readback *)
    ; x : 'a [@bits 16]
    ; y : 'a [@bits 16]
    ; flag : 'a
    ; pc : 'a [@bits 6] (* address of the executing instruction *)
    ; fetch_addr : 'a [@bits 6]
    ; enq_valid : 'a
    ; enq_due : 'a [@bits time_bits]
    ; enq_pin : 'a [@bits Event_queue.pin_bits]
    ; enq_value : 'a [@bits Event_queue.value_bits]
    ; fifo_ready : 'a
    ; running : 'a
    ; halted : 'a
    ; trapped : 'a (* halted on an illegal or reserved instruction *)
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

(* Exactly the 16-bit words that decode strictly (re-encoding gives the same
   word) to an instruction this revision implements: the opcode's fields hold
   valid values and every operand bit outside them is zero. Built from the
   ISA's own field layout and [Isa.implemented], and checked against
   [Isa.decode] on all 65,536 words (tests/test_isa.ml). *)
let executable w =
  let module F = Isa.Field in
  let fld (fl : F.f) = select w (fl.lo + fl.width - 1) fl.lo in
  let op_is o = fld F.op ==:. o in
  let only (fields : F.f list) =
    let used = List.fold fields ~init:0 ~f:(fun m fl -> m lor (((1 lsl fl.width) - 1) lsl fl.lo)) in
    w &: of_int ~width:16 (0xFFF land lnot used) ==:. 0
  in
  let any_of (fl : F.f) ok =
    List.init (1 lsl fl.width) ~f:Fn.id
    |> List.filter ~f:ok
    |> List.fold ~init:gnd ~f:(fun acc k -> acc |: (fld fl ==:. k))
  in
  let impl = Isa.implemented in
  reduce
    ~f:( |: )
    [ op_is Isa.Opcode.nop &: only []
    ; op_is Isa.Opcode.evt
      &: any_of F.evt_act (fun k -> Option.is_some (Isa.Act.of_int k))
      &: only [ F.evt_dt; F.evt_tgt; F.evt_cls; F.evt_act ]
    ; op_is Isa.Opcode.dly &: only [ F.dly_dt ]
    ; op_is Isa.Opcode.wait
      &: any_of F.wait_pin (fun k -> Option.is_some (Isa.Wait_pin.of_int k))
      &: any_of F.wait_tsel (fun k -> Option.is_some (Isa.Wait_timeout.of_int k))
      &: only [ F.wait_pin; F.wait_pol; F.wait_tsel ]
    ; op_is Isa.Opcode.jmp
      &: any_of F.jmp_cond (fun k ->
        match Isa.Cond.of_int k with
        | Some cond -> impl (Jmp { cond; addr = 0 })
        | None -> false)
      &: only [ F.jmp_cond; F.jmp_addr ]
    ; op_is Isa.Opcode.set
      &: any_of F.set_dst (fun k ->
        match Isa.Set_dst.of_int k with
        | Some dst -> impl (Set { dst; imm = 0 })
        | None -> false)
      &: only [ F.set_dst; F.set_imm ]
    ; op_is Isa.Opcode.pullpush
      &: any_of F.pp_push (fun k -> impl (if k = 1 then Push { block = true } else Pull { block = true }))
      &: any_of F.pp_block (fun k -> impl (Pull { block = k = 1 }))
      &: only [ F.pp_push; F.pp_block ]
    ]
;;

let create ?(name = "seq") (i : _ I.t) : _ O.t =
  let spec = Reg_spec.create ~clock:i.clock ~clear:i.clear () in
  let open Always in
  let reg w = Variable.reg spec ~width:w in
  let pc = reg 6 (* IR_PC *)
  and ir = reg 16
  and far = reg 1
  and cu = reg 1 (* registered "caught up": T >= S, computed a cycle ahead *)
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
  and halted = reg 1
  and trapped = reg 1 (* halted on an illegal or reserved word (at IR_PC) *)
  and flag = reg 1 (* last WAIT timed out *)
  and wcnt = reg 16 (* cycles spent watching in the current WAIT *) in
  (* readable names in the generated Verilog *)
  List.iter
    [ "ir_pc", pc; "ir", ir; "far", far; "caught_up", cu; "sched_s", s; "x", x; "y", y
    ; "osr", osr; "coder", coder; "prescale", prescale; "k1", k1; "k2", k2; "k3", k3
    ; "shadow_data", shadow_data; "shadow_clk", shadow_clk; "running", running
    ; "halted", halted; "trapped", trapped; "flag", flag; "wait_count", wcnt
    ]
    ~f:(fun (n, (v : Always.Variable.t)) -> ignore (Signal.( -- ) v.value (name ^ "_" ^ n) : Signal.t));
  let instr = ir.value in
  let f fld = field fld instr in
  let op = f Isa.Field.op in
  (* Only words this revision executes match an opcode: an illegal or reserved
     word matches nothing (no side effects) and traps below. *)
  let exec_ok = executable instr in
  let is code = exec_ok &: (op ==:. code) in
  (* prescale: shift left by 0, 2, 4 or 6 *)
  let scale v = mux prescale.value [ v; sll v 2; sll v 4; sll v 6 ] in
  let t24 v = uresize v time_bits in
  (* lead bound: registered flag, S - T >= 2^21 (see header) *)
  let lead_d = s.value -: i.t_now in
  let far_next =
    ~:(msb lead_d) &: (bit lead_d (time_bits - 2) |: bit lead_d (time_bits - 3))
  in
  let lead_ok _ = ~:(far.value) in
  (* real time has caught up with the schedule: T >= S *)
  (* Real time has caught up with the schedule (T >= S). Read from a register
     computed one cycle ahead (see [cu_next]), so the stall decision never waits
     on a 24-bit subtract and zero-detect: in the dual-sequencer layout, that
     chain into the instruction register's load was the slow-corner critical
     path. Value-for-value identical to comparing the current S and T. *)
  let caught_up = cu.value in
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
      ; { valid = act_is Aux1; value = of_int ~width:2 Value.drive1 }
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
  (* WAIT *)
  let is_wait = is Isa.Opcode.wait in
  let pin_of_sel sel =
    mux
      sel
      [ i.cfg_in_pin; i.cfg_data_pin; i.cfg_clk_pin; i.cfg_aux_pin ]
  in
  let level_of p = mux p (bits_lsb i.pins_sync) in
  (* four pin roles; an executing WAIT has a valid role (bit 2 is zero) *)
  let pin_match = level_of (pin_of_sel (select (f Isa.Field.wait_pin) 1 0)) ==: f Isa.Field.wait_pol in
  let tsel = f Isa.Field.wait_tsel in
  let limit = mux tsel [ ones 16; x.value; y.value; ones 16 ] in
  let timed_out = (tsel <>:. Isa.Wait_timeout.to_int Forever) &: (wcnt.value >=: limit) in
  let wait_done = caught_up &: (pin_match |: timed_out) in
  let watching = running.value &: is_wait &: caught_up &: ~:wait_done in
  let in_high = level_of i.cfg_in_pin in
  let taken =
    taken
    |: (is_jmp &: cond_is Flag &: flag.value)
    |: (is_jmp &: cond_is Pin &: caught_up &: in_high)
  in
  let next_addr = mux2 taken addr (pc.value +:. 1) in
  let fetch_addr = mux2 i.start i.entry next_addr in
  let blocking =
    (is Isa.Opcode.evt &: ~:evt_go)
    |: (is Isa.Opcode.dly &: ~:dly_go)
    |: (is_pull &: ~:pull_go)
    |: (is_wait &: ~:wait_done)
    |: (is_jmp &: cond_is Pin &: ~:caught_up)
  in
  let trap_now = running.value &: ~:exec_ok in
  let step = running.value &: ~:blocking &: ~:halt_now &: ~:trap_now in
  (* Next cycle's caught_up, from the next S against the next T (T + 1). The
     three comparisons depend only on registers; the cycle's choice of next S
     selects one bit at the end. Start makes S = T + 64 (never caught up); a
     completing WAIT makes S = T (always caught up next cycle). Reset clears
     cu, which only matters once start reloads it. *)
  let ahead s_next =
    let d = s_next -: (i.t_now +:. 1) in
    msb d |: (d ==:. 0)
  in
  let cu_next =
    priority_select_with_default
      ~default:(ahead s.value)
      [ { With_valid.valid = step &: evt_go; value = ahead s_evt }
      ; { valid = step &: dly_go; value = ahead s_dly }
      ; { valid = step &: is_wait; value = vdd }
      ]
  in
  (* SET *)
  let dst = f Isa.Field.set_dst in
  let imm = f Isa.Field.set_imm in
  let set_to d = is Isa.Opcode.set &: (dst ==:. Isa.Set_dst.to_int d) in
  compile
    [ if_
        i.start
        [ running <-- vdd
        ; halted <-- gnd
        ; trapped <-- gnd
        ; pc <-- i.entry
        ; ir <-- i.fetch_data
        ; far <-- gnd
        ; cu <-- gnd
        ; flag <-- gnd
        ; wcnt <--. 0
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
        ; cu <-- cu_next
        ; wcnt <-- mux2 watching (wcnt.value +:. 1) (zero 16)
        ; when_ (running.value &: halt_now) [ running <-- gnd; halted <-- vdd ]
        ; when_ trap_now [ running <-- gnd; halted <-- vdd; trapped <-- vdd ]
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
                    ~:(act_is Sample |: act_is Aux0 |: act_is Aux1)
                    [ if_ tgt_clk [ shadow_clk <-- value ] [ shadow_data <-- value ] ]
                ]
            ; when_ dly_go [ s <-- s_dly ]
            ; when_ is_wait [ s <-- i.t_now; flag <-- ~:pin_match ]
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
            ; when_ (set_to X_hi) [ x <-- imm @: select x.value 7 0 ]
            ; when_ (set_to Y_hi) [ y <-- imm @: select y.value 7 0 ]
            ]
        ]
    ];
  { s = s.value
  ; x = x.value
  ; y = y.value
  ; flag = flag.value
  ; pc = pc.value
  ; fetch_addr
  ; enq_valid = evt_go
  ; enq_due = due
  ; enq_pin =
      priority_select_with_default
        ~default:(mux2 tgt_clk i.cfg_clk_pin i.cfg_data_pin)
        [ { With_valid.valid = act_is Sample; value = i.cfg_in_pin }
        ; { valid = act_is Aux0 |: act_is Aux1; value = i.cfg_aux_pin }
        ]
  ; enq_value = value
  ; fifo_ready = pull_go
  ; running = running.value
  ; halted = halted.value
  ; trapped = trapped.value
  ; lead_stall =
      running.value
      &: ((is Isa.Opcode.evt &: ~:(lead_ok s_evt)) |: (is Isa.Opcode.dly &: ~:(lead_ok s_dly)))
  }
;;
