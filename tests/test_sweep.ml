(* The measured datasheet, in simulation: the chip sweeps one skew knob at a
   time against an EEPROM it knows nothing about, and finds where the part
   stops working, using only what the chip itself observes (the sampled ACK
   bits). The checker turns each boundary into a spec-rule interval. The
   EEPROM model's parameters are the hidden truth the sweep must recover. *)
open! Base
open Stdio
open Hardcaml
module Isa = Fipe_isa.Isa
module C = Fipe_checker
module Spec = Fipe_spec.Protocol_spec
module L = Fipe_hw.Loopback
module E = Fipe_model.I2c_eeprom
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))
let program = C.Firmware.i2c_write_and_poll ~start_stop_cls:3 ~bytes:3 ()
let fifo = C.Firmware.[ byte 0xA0; byte 0x00; byte 0x5A; byte 0xA0 ]
let good = [ 0; 0; 0; 1 ] (* three ACKs, then a NACK proving the write started *)

type outcome =
  { samples : int list (* what the chip saw *)
  ; written : bool (* ground truth, which the chip cannot see *)
  ; flags : bool (* hardware ORDER or LATE *)
  ; log : string list
  }

let run ?(params = E.default) ~k1 ~k2 ~k3 () =
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let dev = E.create params in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  set i.core.cfg_data_pin 3 0;
  set i.core.cfg_clk_pin 3 1;
  set i.core.cfg_k1 8 k1;
  set i.core.cfg_k2 8 k2;
  set i.core.cfg_k3 8 k3;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref fifo in
  let samples = Queue.create () in
  let idle = ref 0 in
  let cycles = ref 0 in
  while !idle < 10 && !cycles < 100_000 do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    Int.incr cycles;
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.sample_valid)
    then Queue.enqueue samples (Bits.to_int !(o.core.sample_bit));
    let lv = Bits.to_int !(o.levels) in
    let pull = E.step dev ~scl:(lv land 2 <> 0) ~sda:(lv land 1 <> 0) in
    set i.ext_pull_low 8 (if pull then 1 else 0);
    if Bits.to_bool !(o.core.halted) && Bits.to_int !(o.core.queue_count) = 0 then Int.incr idle
  done;
  Cyclesim.cycle sim;
  { samples = Queue.to_list samples
  ; written = Option.equal Int.equal (Hashtbl.find dev.memory 0x00) (Some 0x5A)
  ; flags = Bits.to_bool !(o.core.late) || Bits.to_bool !(o.core.order_err)
  ; log = List.rev dev.log
  }
;;

let passes o = List.equal Int.equal o.samples good

let%expect_test "the assembler reproduces the hand-written firmware word for word" =
  let hand = C.Firmware.i2c_write ~start_stop_cls:3 ~bytes:3 () in
  let asm = Array.sub program ~pos:0 ~len:(Array.length hand - 1) in
  printf
    "first %d words identical: %b; total %d words\n"
    (Array.length asm)
    (Array.equal Isa.equal asm (Array.sub hand ~pos:0 ~len:(Array.length hand - 1)))
    (Array.length program);
  [%expect {| first 22 words identical: true; total 39 words |}]
;;

let%expect_test "baseline: a good write at K = 0, as the chip and the device see it" =
  let o = run ~k1:0 ~k2:0 ~k3:0 () in
  printf
    "chip saw %s (expect [0; 0; 0; 1]); ground truth written: %b; hw flags: %b\n"
    (Sexp.to_string [%sexp (o.samples : int list)])
    o.written
    o.flags;
  List.iter o.log ~f:print_endline;
  [%expect {|
    chip saw (0 0 0 1) (expect [0; 0; 0; 1]); ground truth written: true; hw flags: false
        304 START seen
      13628 STOP: write committed, 1 byte(s) at 0x00
      13868 START seen
      17847 address: busy writing, NACK
      18768 STOP: transaction incomplete |}]
;;

(* --- the sweep -------------------------------------------------------- *)

let events, trace =
  C.Exec.run_traced ~pins:C.Firmware.i2c_pins ~fifo program |> Or_error.ok_exn
;;

(* The checker, in concrete mode, says what a rule's tightest interval is at
   given skews: that converts a knob value into nanoseconds on the wire. *)
let interval rule ~k =
  let ev = Array.of_list events in
  let fires =
    C.Ontime.simulate ~lead:64 ~k events trace
    |> List.map ~f:(fun (f : C.Ontime.fired) -> f.t, ev.(f.seq))
  in
  C.Check.concrete ~ns_per_cycle:20 Spec.I2c_standard_mode.spec fires
  |> List.find_exn ~f:(fun c -> String.equal c.rule rule)
  |> fun (c : C.Check.concrete) -> Option.value_exn c.min_sep
;;

type knob =
  { rule : string
  ; kvec : int -> int * int * int (* knob value -> (K1, K2, K3) *)
  ; vmax : int (* largest value before the hardware ORDER bound *)
  ; truth : string (* the hidden device parameter, for the reader *)
  }

let knobs =
  [ { rule = "t_HD_STA"
    ; kvec = (fun v -> 0, 0, v)
    ; vmax = 55
    ; truth = "hd_sta_min 60 cyc, minus the 15 cyc SCL filter = 45 cyc at the pins"
    }
  ; { rule = "t_SU_STO"; kvec = (fun v -> 0, 0, -v); vmax = 55; truth = "su_sto_min 50 cyc" }
  ; { rule = "t_HD_DAT"
    ; kvec = (fun v -> 0, -v, 0)
    ; vmax = 10
    ; truth = "scl_fall_delay 15 cyc (the 300 ns filter)"
    }
  ; { rule = "t_SU_DAT"; kvec = (fun v -> 0, v, 0); vmax = 52; truth = "su_dat_min 5 cyc" }
  ]
;;

let%expect_test "measured datasheet: sweep each knob until the device fails" =
  let runs = ref 0 in
  let silent = ref [] in
  let at kn v =
    Int.incr runs;
    let k1, k2, k3 = kn.kvec v in
    let o = run ~k1 ~k2 ~k3 () in
    if o.flags then raise_s [%message "hardware flag inside sweep range" kn.rule (v : int)];
    if passes o && not o.written then silent := (kn.rule, v) :: !silent;
    passes o
  in
  printf "%-9s %8s %24s %9s  %s\n" "rule" "spec" "device needs (measured)" "margin" "truth";
  List.iter knobs ~f:(fun kn ->
    let kf v =
      let k1, k2, k3 = kn.kvec v in
      function 1 -> k1 | 2 -> k2 | 3 -> k3 | _ -> 0
    in
    let spec_ns =
      (List.find_exn Spec.I2c_standard_mode.spec.rules ~f:(fun r -> String.equal r.name kn.rule))
        .min_ns
      |> Option.value ~default:0
    in
    if not (at kn 0)
    then printf "%-9s fails at K = 0\n" kn.rule
    else if at kn kn.vmax
    then
      printf
        "%-9s %5d ns  works down to %d ns (sweep limit)  %s\n"
        kn.rule
        spec_ns
        (interval kn.rule ~k:(kf kn.vmax) * 20)
        kn.truth
    else (
      (* binary search: lo passes, hi fails *)
      let rec search lo hi =
        if hi - lo <= 1
        then lo, hi
        else (
          let mid = (lo + hi) / 2 in
          if at kn mid then search mid hi else search lo mid)
      in
      let lo, hi = search 0 kn.vmax in
      let pass_ns = interval kn.rule ~k:(kf lo) * 20 in
      let fail_ns = interval kn.rule ~k:(kf hi) * 20 in
      printf
        "%-9s %5d ns  > %4d ns and <= %4d ns  %+6d ns  %s\n"
        kn.rule
        spec_ns
        fail_ns
        pass_ns
        (spec_ns - pass_ns)
        kn.truth));
  printf "%d simulated transactions\n" !runs;
  List.iter (List.rev !silent) ~f:(fun (r, v) ->
    printf "warning: %s at %d passed on the chip but the write did not happen\n" r v);
  [%expect {|
    rule          spec  device needs (measured)    margin  truth
    t_HD_STA   4000 ns  >  880 ns and <=  960 ns   +3040 ns  hd_sta_min 60 cyc, minus the 15 cyc SCL filter = 45 cyc at the pins
    t_SU_STO   4000 ns  >  960 ns and <= 1040 ns   +2960 ns  su_sto_min 50 cyc
    t_HD_DAT      0 ns  >  240 ns and <=  320 ns    -320 ns  scl_fall_delay 15 cyc (the 300 ns filter)
    t_SU_DAT    250 ns  >   80 ns and <=  160 ns     +90 ns  su_dat_min 5 cyc
    29 simulated transactions |}]
;;
