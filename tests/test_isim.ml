(* The cycle-accurate simulator must match the RTL exactly, including reactive
   programs (WAIT, JMP Pin, JMP Flag) whose timing depends on the inputs. *)
open! Base
open Stdio
open Hardcaml
module Core = Fipe_hw.Core
module Isa = Fipe_isa.Isa
module C = Fipe_checker
module Sim = Cyclesim.With_interface (Core.I) (Core.O)

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))

type obs =
  { fires : (int * int * int) list (* cycle, pin, value *)
  ; samples : (int * int) list (* cycle, bit *)
  ; halted : bool
  ; late : bool
  ; order_err : bool
  ; window_err : bool
  }
[@@deriving sexp, equal]

(* RTL: [stim c] is the bus during cycle c (cycle 0 = start; earlier cycles
   hold stim 0). *)
let rtl ~(cfg : C.Isim.config) ~stim ~fifo ~cycles program =
  let sim = Sim.create Core.create in
  let i : _ Core.I.t = Cyclesim.inputs sim in
  let o : _ Core.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  set i.pins_in 8 (stim 0);
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.imem_we := Bits.vdd;
    set i.imem_addr 6 a;
    set i.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.imem_we := Bits.gnd;
  set i.cfg_data_pin 3 cfg.data_pin;
  set i.cfg_clk_pin 3 cfg.clk_pin;
  set i.cfg_in_pin 3 cfg.in_pin;
  set i.cfg_aux_pin 3 cfg.aux_pin;
  set i.cfg_k1 8 cfg.k1;
  set i.cfg_k2 8 cfg.k2;
  set i.cfg_k3 8 cfg.k3;
  Cyclesim.cycle sim;
  Cyclesim.cycle sim;
  i.start := Bits.vdd;
  Cyclesim.cycle sim;
  let t0 = Bits.to_int !(o.t_now) in
  i.start := Bits.gnd;
  let fifo = ref fifo in
  let fires = Queue.create () and samples = Queue.create () in
  let b r = Bits.to_bool !r and n r = Bits.to_int !r in
  for c = 1 to cycles do
    set i.pins_in 8 (stim c);
    (match !fifo with
     | w :: _ ->
       i.fifo_valid := Bits.vdd;
       set i.fifo_data 32 w
     | [] -> i.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    let t = n o.t_now - t0 in
    if b o.fifo_ready then fifo := List.tl_exn !fifo;
    if b o.fire0_valid then Queue.enqueue fires (t, n o.fire0_pin, n o.fire0_value);
    if b o.fire1_valid then Queue.enqueue fires (t, n o.fire1_pin, n o.fire1_value);
    if b o.sample_valid then Queue.enqueue samples (t, n o.sample_bit)
  done;
  Cyclesim.cycle sim;
  { fires = Queue.to_list fires
  ; samples = Queue.to_list samples
  ; halted = b o.halted
  ; late = b o.late
  ; order_err = b o.order_err
  ; window_err = b o.window_err
  }
;;

let model ~cfg ~stim ~fifo ~cycles program =
  let m = C.Isim.create ~cfg ~pins:(stim 0) ~fifo program in
  for c = 1 to cycles do
    C.Isim.step m ~pins_in:(stim c)
  done;
  { fires = List.map (C.Isim.fires m) ~f:(fun f -> f.t, f.pin, f.value)
  ; samples = C.Isim.samples m
  ; halted = m.halted
  ; late = m.late
  ; order_err = m.order_err
  ; window_err = m.window_err
  }
;;

(* Random programs including the reactive instructions. *)
let gen rand =
  let ri n = Random.State.int rand n in
  let len = 4 + ri 30 in
  let acts = Isa.Act.[| Drive0; Drive1; Release; Toggle; Shift_out; Sample; Aux0; Aux1 |] in
  let pins = Isa.Wait_pin.[| In; Data; Clk; Aux |] in
  let tos = Isa.Wait_timeout.[| Forever; X_cycles; Y_cycles |] in
  Array.init (len + 1) ~f:(fun a ->
    if a = len
    then Isa.Jmp { cond = Always; addr = a }
    else (
      let r = ri 100 in
      if r < 35
      then Isa.Evt { dt = ri 40; clk_pin = ri 2 = 1; cls = ri 4; act = acts.(ri 8) }
      else if r < 42
      then Dly { dt = ri 150 }
      else if r < 50
      then Set { dst = (if ri 2 = 0 then X else Y); imm = ri 60 }
      else if r < 52
      then Set { dst = (if ri 2 = 0 then X_hi else Y_hi); imm = ri 2 }
      else if r < 57
      then Set { dst = Coder_mode; imm = [| 0; 4; 8; 12 |].(ri 4) }
      else if r < 60
      then Set { dst = Prescale; imm = ri 2 }
      else if r < 65
      then Pull { block = true }
      else if r < 78
      then Wait { pin = pins.(ri 4); pol = ri 2 = 1; timeout = tos.(ri 3) }
      else if r < 92 && a > 0
      then
        Jmp
          { cond = [| Isa.Cond.X_dec_nz; Y_dec_nz; Flag; Pin; Always |].(ri 5)
          ; addr = (if ri 3 = 0 then a + 1 + ri (len - a) else ri a)
          }
      else Nop))
;;

(* Bus stimulus: each pin toggles at random, about every 40 cycles. *)
let stimulus rand ~cycles =
  let v = Array.create ~len:(cycles + 1) 0 in
  let cur = ref (Random.State.int rand 256) in
  for c = 0 to cycles do
    for p = 0 to 7 do
      if Random.State.int rand 40 = 0 then cur := !cur lxor (1 lsl p)
    done;
    v.(c) <- !cur
  done;
  fun c -> v.(Int.max 0 (Int.min cycles c))
;;

let%expect_test "simulator matches the RTL on random reactive programs" =
  let rand = Random.State.make [| 11 |] in
  let cycles = 2_500 in
  let n = 250 in
  let same = ref 0 and reactive = ref 0 and waits_done = ref 0 and halted = ref 0 in
  for _ = 1 to n do
    let program = gen rand in
    let stim = stimulus rand ~cycles in
    let fifo = List.init 64 ~f:(fun _ -> Random.State.bits rand land 0xFFFF_FFFF) in
    let data_pin = Random.State.int rand 8 in
    let clk_pin = (data_pin + 1 + Random.State.int rand 7) % 8 in
    let others = List.filter (List.range 0 8) ~f:(fun p -> p <> data_pin && p <> clk_pin) in
    let cfg =
      { C.Isim.data_pin
      ; clk_pin
      ; in_pin = Random.State.int rand 8
      ; aux_pin = List.nth_exn others (Random.State.int rand (List.length others))
      ; k1 = Random.State.int rand 13 - 6
      ; k2 = Random.State.int rand 13 - 6
      ; k3 = Random.State.int rand 13 - 6
      }
    in
    let r = rtl ~cfg ~stim ~fifo ~cycles program in
    let m = model ~cfg ~stim ~fifo ~cycles program in
    if Array.exists program ~f:(function Isa.Wait _ | Jmp { cond = Pin | Flag; _ } -> true | _ -> false)
    then Int.incr reactive;
    if Array.exists program ~f:(function Isa.Wait _ -> true | _ -> false) && r.halted
    then Int.incr waits_done;
    if r.halted then Int.incr halted;
    if equal_obs r m
    then Int.incr same
    else if !same + 3 > n
    then ()
    else print_s [%message "DIFFERS" (program : Isa.t array) (r : obs) (m : obs)]
  done;
  printf
    "%d of %d programs identical over %d cycles (fires, samples, flags, halt)\n\
     %d contain WAIT or JMP Pin/Flag; %d halted, %d of them after passing WAITs\n"
    !same
    n
    cycles
    !reactive
    !halted
    !waits_done;
  [%expect {|
    250 of 250 programs identical over 2500 cycles (fires, samples, flags, halt)
    233 contain WAIT or JMP Pin/Flag; 164 halted, 144 of them after passing WAITs |}]
;;

(* For programs without reactive instructions, the simulator and the
   executor + on-time model are two independent derivations of the same
   behavior; they must agree on every fire. *)
let%expect_test "simulator agrees with the executor and on-time model" =
  let rand = Random.State.make [| 5 |] in
  let agree = ref 0 and checked = ref 0 in
  for _ = 1 to 200 do
    let program =
      Array.map (gen rand) ~f:(function
        | Isa.Wait _ -> Isa.Nop
        | Jmp { cond = Pin | Flag; addr } -> Jmp { cond = X_dec_nz; addr }
        | i -> i)
    in
    let fifo = List.init 64 ~f:(fun _ -> Random.State.bits rand land 0xFFFF_FFFF) in
    let pins = { C.Exec.data_pin = "D"; clk_pin = "C"; in_pin = "I"; aux_pin = "A" } in
    match C.Exec.run_traced ~max_steps:5_000 ~pins ~fifo program with
    | Error _ -> ()
    | Ok (events, trace) ->
      Int.incr checked;
      let cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 2; aux_pin = 3 } in
      let ev = Array.of_list events in
      let pin_of = function "D" -> 0 | "C" -> 1 | "I" -> 2 | _ -> 3 in
      let code : C.Exec.value -> int = function
        | Drive0 -> 0
        | Drive1 -> 1
        | Release -> 2
        | Sample -> 3
      in
      let predicted =
        C.Ontime.simulate ~lead:64 ~k:(fun _ -> 0) events trace
        |> List.map ~f:(fun (f : C.Ontime.fired) -> f.t, pin_of ev.(f.seq).pin, code ev.(f.seq).value)
      in
      let last = List.fold predicted ~init:0 ~f:(fun a (t, _, _) -> Int.max a t) in
      let m = model ~cfg ~stim:(fun _ -> 0xFF) ~fifo ~cycles:(last + 50) program in
      if List.equal [%equal: int * int * int] predicted m.fires then Int.incr agree
  done;
  printf "%d of %d terminating programs: every fire identical\n" !agree !checked;
  [%expect {| 128 of 128 terminating programs: every fire identical |}]
;;

(* ---- two sequencers -------------------------------------------------------- *)

(* A random program occupying addresses [base, base + len], halting at the end;
   jumps stay inside the region. *)
let gen_region rand ~base ~len =
  let ri n = Random.State.int rand n in
  let acts = Isa.Act.[| Drive0; Drive1; Release; Toggle; Shift_out; Sample; Aux0; Aux1 |] in
  let pins = Isa.Wait_pin.[| In; Data; Clk; Aux |] in
  let tos = Isa.Wait_timeout.[| Forever; X_cycles; Y_cycles |] in
  Array.init (len + 1) ~f:(fun k ->
    let a = base + k in
    if k = len
    then Isa.Jmp { cond = Always; addr = a }
    else (
      let r = ri 100 in
      if r < 40
      then Isa.Evt { dt = ri 30; clk_pin = ri 2 = 1; cls = ri 4; act = acts.(ri 8) }
      else if r < 47
      then Dly { dt = ri 100 }
      else if r < 57
      then Set { dst = (if ri 2 = 0 then X else Y); imm = ri 40 }
      else if r < 61
      then Set { dst = Coder_mode; imm = [| 0; 4; 8; 12 |].(ri 4) }
      else if r < 66
      then Pull { block = true }
      else if r < 76
      then Wait { pin = pins.(ri 4); pol = ri 2 = 1; timeout = tos.(ri 3) }
      else if r < 90 && k > 0
      then
        Jmp
          { cond = [| Isa.Cond.X_dec_nz; Y_dec_nz; Flag; Pin; Always |].(ri 5)
          ; addr = (if ri 3 = 0 then a + 1 + ri (len - k) else base + ri k)
          }
      else Nop))
;;

type dual_obs =
  { a : obs
  ; b : obs
  ; conflict : bool
  ; pin_trace : (int * int) list (* pins_out, pins_oe, every cycle *)
  }
[@@deriving sexp, equal]

let rtl_dual ~(cfg : C.Isim.config) ~(cfg_b : C.Isim.config) ~entry_b ~stim ~fifo ~fifo_b ~cycles program =
  let sim = Sim.create Core.create in
  let i : _ Core.I.t = Cyclesim.inputs sim in
  let o : _ Core.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  set i.pins_in 8 (stim 0);
  i.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.imem_we := Bits.vdd;
    set i.imem_addr 6 a;
    set i.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.imem_we := Bits.gnd;
  set i.cfg_data_pin 3 cfg.data_pin;
  set i.cfg_clk_pin 3 cfg.clk_pin;
  set i.cfg_in_pin 3 cfg.in_pin;
  set i.cfg_aux_pin 3 cfg.aux_pin;
  set i.cfg_b_data_pin 3 cfg_b.data_pin;
  set i.cfg_b_clk_pin 3 cfg_b.clk_pin;
  set i.cfg_b_in_pin 3 cfg_b.in_pin;
  set i.cfg_b_aux_pin 3 cfg_b.aux_pin;
  set i.cfg_k1 8 cfg.k1;
  set i.cfg_k2 8 cfg.k2;
  set i.cfg_k3 8 cfg.k3;
  set i.entry_a 6 0;
  set i.entry_b 6 entry_b;
  Cyclesim.cycle sim;
  Cyclesim.cycle sim;
  i.start := Bits.vdd;
  i.start_b := Bits.vdd;
  Cyclesim.cycle sim;
  let t0 = Bits.to_int !(o.t_now) in
  i.start := Bits.gnd;
  i.start_b := Bits.gnd;
  let fa = ref fifo and fb = ref fifo_b in
  let fires = Queue.create () and samples = Queue.create () in
  let fires_b = Queue.create () and samples_b = Queue.create () in
  let trace = Queue.create () in
  let b r = Bits.to_bool !r and n r = Bits.to_int !r in
  let feed valid data q =
    match !q with
    | w :: _ ->
      valid := Bits.vdd;
      set data 32 w
    | [] -> valid := Bits.gnd
  in
  for c = 1 to cycles do
    set i.pins_in 8 (stim c);
    feed i.fifo_valid i.fifo_data fa;
    feed i.fifo_b_valid i.fifo_b_data fb;
    Cyclesim.cycle sim;
    let t = n o.t_now - t0 in
    Queue.enqueue trace (n o.pins_out, n o.pins_oe);
    if b o.fifo_ready then fa := List.tl_exn !fa;
    if b o.fifo_b_ready then fb := List.tl_exn !fb;
    if b o.fire0_valid then Queue.enqueue fires (t, n o.fire0_pin, n o.fire0_value);
    if b o.fire1_valid then Queue.enqueue fires (t, n o.fire1_pin, n o.fire1_value);
    if b o.sample_valid then Queue.enqueue samples (t, n o.sample_bit);
    if b o.fire0_b_valid then Queue.enqueue fires_b (t, n o.fire0_b_pin, n o.fire0_b_value);
    if b o.fire1_b_valid then Queue.enqueue fires_b (t, n o.fire1_b_pin, n o.fire1_b_value);
    if b o.sample_valid_b then Queue.enqueue samples_b (t, n o.sample_bit_b)
  done;
  Cyclesim.cycle sim;
  { a =
      { fires = Queue.to_list fires
      ; samples = Queue.to_list samples
      ; halted = b o.halted
      ; late = b o.late
      ; order_err = b o.order_err
      ; window_err = b o.window_err
      }
  ; b =
      { fires = Queue.to_list fires_b
      ; samples = Queue.to_list samples_b
      ; halted = b o.halted_b
      ; late = b o.late_b
      ; order_err = b o.order_err_b
      ; window_err = b o.window_err_b
      }
  ; conflict = b o.conflict
  ; pin_trace = Queue.to_list trace
  }
;;

let model_dual ~cfg ~cfg_b ~entry_b ~stim ~fifo ~fifo_b ~cycles program =
  let m = C.Isim.create ~cfg ~pins:(stim 0) ~b:(cfg_b, entry_b, fifo_b) ~fifo program in
  let trace = Queue.create () in
  let bits arr = Array.foldi arr ~init:0 ~f:(fun p acc v -> if v then acc lor (1 lsl p) else acc) in
  for c = 1 to cycles do
    Queue.enqueue trace (bits m.out, bits m.oe);
    C.Isim.step m ~pins_in:(stim c)
  done;
  let mb = C.Isim.b_exn m in
  let lane (x : C.Isim.t) =
    { fires = List.map (C.Isim.fires x) ~f:(fun f -> f.t, f.pin, f.value)
    ; samples = C.Isim.samples x
    ; halted = x.halted
    ; late = x.late
    ; order_err = x.order_err
    ; window_err = x.window_err
    }
  in
  { a = lane m; b = lane mb; conflict = m.conflict; pin_trace = Queue.to_list trace }
;;

let%expect_test "two sequencers: simulator matches the RTL on random program pairs" =
  let rand = Random.State.make [| 22 |] in
  let cycles = 2_000 and n = 150 in
  let same = ref 0 and conflicts = ref 0 and both_halted = ref 0 in
  let random_cfg () =
    let ri k = Random.State.int rand k in
    let data_pin = ri 8 in
    { C.Isim.data_pin
    ; clk_pin = (data_pin + 1 + ri 7) % 8
    ; in_pin = ri 8
    ; aux_pin = ri 8
    ; k1 = ri 13 - 6
    ; k2 = ri 13 - 6
    ; k3 = ri 13 - 6
    }
  in
  for _ = 1 to n do
    let la = 4 + Random.State.int rand 24 and lb = 4 + Random.State.int rand 24 in
    let entry_b = la + 1 in
    let program = Array.append (gen_region rand ~base:0 ~len:la) (gen_region rand ~base:entry_b ~len:lb) in
    let stim = stimulus rand ~cycles in
    let words () = List.init 32 ~f:(fun _ -> Random.State.bits rand land 0xFFFF_FFFF) in
    let fifo = words () and fifo_b = words () in
    let cfg = random_cfg () and cfg_b = random_cfg () in
    let r = rtl_dual ~cfg ~cfg_b ~entry_b ~stim ~fifo ~fifo_b ~cycles program in
    let m = model_dual ~cfg ~cfg_b ~entry_b ~stim ~fifo ~fifo_b ~cycles program in
    if r.conflict then Int.incr conflicts;
    if r.a.halted && r.b.halted then Int.incr both_halted;
    if equal_dual_obs r m
    then Int.incr same
    else if !same + 3 > n
    then ()
    else
      print_s
        [%message
          "DIFFERS"
            (r.a : obs)
            (m.a : obs)
            (r.b : obs)
            (m.b : obs)
            (r.conflict : bool)
            (m.conflict : bool)]
  done;
  printf
    "%d of %d program pairs identical over %d cycles (both lanes' fires, samples, flags, halts, CONFLICT, and every pin every cycle)\n\
     %d pairs set CONFLICT; %d pairs had both sequencers halt\n"
    !same
    n
    cycles
    !conflicts
    !both_halted;
  [%expect {|
    150 of 150 program pairs identical over 2000 cycles (both lanes' fires, samples, flags, halts, CONFLICT, and every pin every cycle)
    3 pairs set CONFLICT; 81 pairs had both sequencers halt |}]
;;
