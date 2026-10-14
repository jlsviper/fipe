(* Controller and target on one chip: sequencer A is an I2C controller on pins
   0 and 1, sequencer B an I2C target on pins 2 and 3, and the pairs are joined
   outside the chip (wired-AND with pull-ups), as on the bench. *)
open! Core
open Hardcaml
module C = Fipe_checker
module Isa = Fipe_isa.Isa
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let program, entry_b =
  let src = In_channel.read_all "../examples/i2c_controller_target.s" in
  let p, labels = Fipe_asm.Text.assemble_with_labels src |> Result.ok_or_failwith in
  p, List.Assoc.find_exn labels ~equal:String.equal "target"
;;

let ack_dly_addr =
  (* the DLY before the target's ACK *)
  Array.findi program ~f:(fun a i ->
    a >= entry_b
    &&
    match i with
    | Isa.Dly _ -> true
    | _ -> false)
  |> Option.value_exn
  |> fst
;;

let with_ack_delay t =
  let p = Array.copy program in
  p.(ack_dly_addr) <- Isa.Dly { dt = t };
  p
;;

let bytes = [ 0xA0; 0x00; 0x5A ]
let fifo = List.map bytes ~f:(fun b -> b lsl 24)
let cfg_a = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 0; aux_pin = 7 }
let cfg_b = { C.Isim.default_config with data_pin = 2; clk_pin = 3; in_pin = 2; aux_pin = 6 }

(* The external wiring: SDA = pins 0 and 2, SCL = pins 1 and 3, each a
   wired-AND with a pull-up; the other pins idle high. *)
let bus ~pulls_low =
  let sda = not (pulls_low 0 || pulls_low 2) and scl = not (pulls_low 1 || pulls_low 3) in
  0xF0 lor (if sda then 0b0101 else 0) lor if scl then 0b1010 else 0
;;

type result =
  { a_samples : int list
  ; b_samples : int list
  ; flags : bool list
  ; halted : bool * bool
  }
[@@deriving sexp, equal]

let run_model p =
  let m = C.Isim.create ~cfg:cfg_a ~pins:0xFF ~b:(cfg_b, entry_b, []) ~fifo p in
  let c = ref 0 in
  while (not (C.Isim.done_ m)) && !c < 60_000 do
    Int.incr c;
    let levels = bus ~pulls_low:(fun k -> m.oe.(k) && not m.out.(k)) in
    C.Isim.step m ~pins_in:levels
  done;
  let mb = C.Isim.b_exn m in
  { a_samples = List.map (C.Isim.samples m) ~f:snd
  ; b_samples = List.map (C.Isim.samples mb) ~f:snd
  ; flags = [ m.late; m.order_err; mb.late; mb.order_err; m.conflict; m.trapped; mb.trapped ]
  ; halted = C.Isim.done_ m, C.Isim.done_ m
  }
;;

let run_rtl p =
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let set r w v = r := Bits.of_int ~width:w v in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri p ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  List.iter
    [ i.core.cfg_data_pin, 0; i.core.cfg_clk_pin, 1; i.core.cfg_in_pin, 0; i.core.cfg_aux_pin, 7
    ; i.core.cfg_b_data_pin, 2; i.core.cfg_b_clk_pin, 3; i.core.cfg_b_in_pin, 2; i.core.cfg_b_aux_pin, 6
    ]
    ~f:(fun (r, v) -> set r 3 v);
  set i.core.entry_b 6 entry_b;
  i.core.start := Bits.vdd;
  i.core.start_b := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  i.core.start_b := Bits.gnd;
  let f = ref fifo and sa = Queue.create () and sb = Queue.create () and quiet = ref 0 in
  let b r = Bits.to_bool !r in
  while !quiet < 10 do
    (match !f with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    (* the external jumpers: each pin of a pair is pulled low by the other *)
    let oe = Bits.to_int !(o.core.pins_oe) and out = Bits.to_int !(o.core.pins_out) in
    let pulls k = (oe lsr k) land 1 = 1 && (out lsr k) land 1 = 0 in
    set i.ext_pull_low 8 (Bool.to_int (pulls 2) lor (Bool.to_int (pulls 3) lsl 1) lor (Bool.to_int (pulls 0) lsl 2) lor (Bool.to_int (pulls 1) lsl 3));
    Cyclesim.cycle sim;
    if b o.core.fifo_ready then f := List.tl_exn !f;
    if b o.core.sample_valid then Queue.enqueue sa (Bits.to_int !(o.core.sample_bit));
    if b o.core.sample_valid_b then Queue.enqueue sb (Bits.to_int !(o.core.sample_bit_b));
    let idle = b o.core.halted && b o.core.halted_b && Bits.to_int !(o.core.queue_count) = 0 && Bits.to_int !(o.core.queue_count_b) = 0 in
    if idle then Int.incr quiet else quiet := 0
  done;
  { a_samples = Queue.to_list sa
  ; b_samples = Queue.to_list sb
  ; flags = List.map [ o.core.late; o.core.order_err; o.core.late_b; o.core.order_err_b; o.core.conflict; o.core.trapped; o.core.trapped_b ] ~f:b
  ; halted = b o.core.halted, b o.core.halted_b
  }
;;

let bytes_of bits =
  List.chunks_of bits ~length:8 |> List.map ~f:(List.fold ~init:0 ~f:(fun acc b -> (acc lsl 1) lor b))
;;

let%expect_test "controller and target on one chip, over an external wired-AND bus" =
  let m = run_model program and r = run_rtl program in
  let ctl_words = Array.findi program ~f:(fun a i -> a > 0 && (match i with Isa.Jmp { cond = Always; addr } -> addr = a | _ -> false)) |> Option.value_exn |> fst |> ( + ) 1 in
  printf "program: controller %d words at 0, target %d words at %d\n" ctl_words (Array.length program - entry_b) entry_b;
  printf
    "controller sent  %s\ntarget received  %s\ncontroller ACKs  %s (0 = ACK)\n"
    (String.concat ~sep:" " (List.map bytes ~f:(Printf.sprintf "%02X")))
    (String.concat ~sep:" " (List.map (bytes_of r.b_samples) ~f:(Printf.sprintf "%02X")))
    (String.concat ~sep:" " (List.map r.a_samples ~f:Int.to_string));
  let names = [ "A late"; "A order"; "B late"; "B order"; "conflict"; "A trap"; "B trap" ] in
  let raised = List.filter_map (List.zip_exn names r.flags) ~f:(fun (n, f) -> Option.some_if f n) in
  printf
    "flags raised: %s; both halted: %b\n"
    (if List.is_empty raised then "none" else String.concat ~sep:", " raised)
    (fst r.halted && snd r.halted);
  printf "RTL and cycle-accurate simulator identical: %b\n" ([%equal: int list * int list] (m.a_samples, m.b_samples) (r.a_samples, r.b_samples) && [%equal: bool list] m.flags r.flags);
  [%expect {|
    program: controller 23 words at 0, target 16 words at 32
    controller sent  A0 00 5A
    target received  A0 00 5A
    controller ACKs  0 0 0 (0 = ACK)
    flags raised: none; both halted: true
    RTL and cycle-accurate simulator identical: true |}]
;;

let%expect_test "a target too slow to acknowledge: finding the controller's sampling point" =
  (* the same target program with a longer and longer acknowledge delay; the
     controller's ACK flips to NACK where the delay crosses its sampling point *)
  let flips = ref None and prev = ref 0 in
  List.iter [ 20; 100; 200; 300; 340; 350; 360; 370; 380; 400 ] ~f:(fun t ->
    let r = run_rtl (with_ack_delay t) in
    let acks = String.concat ~sep:" " (List.map r.a_samples ~f:Int.to_string) in
    let target = bytes_of r.b_samples in
    printf "ACK delay %3d cycles: controller ACKs %s; target still received %s\n" t acks
      (String.concat ~sep:" " (List.map target ~f:(Printf.sprintf "%02X")));
    if Option.is_none !flips && List.exists r.a_samples ~f:(fun x -> x = 1) then flips := Some (!prev, t);
    prev := t);
  (match !flips with
   | Some (lo, hi) ->
     (* binary search between lo and hi for the exact boundary *)
     let lo = ref lo and hi = ref hi in
     while !hi - !lo > 1 do
       let mid = (!lo + !hi) / 2 in
       let r = run_rtl (with_ack_delay mid) in
       if List.exists r.a_samples ~f:(fun x -> x = 1) then hi := mid else lo := mid
     done;
     printf "boundary: ACKs seen up to %d cycles of delay, NACK from %d\n" !lo !hi
   | None -> printf "no NACK in the sweep\n");
  [%expect {|
    ACK delay  20 cycles: controller ACKs 0 0 0; target still received A0 00 5A
    ACK delay 100 cycles: controller ACKs 0 0 0; target still received A0 00 5A
    ACK delay 200 cycles: controller ACKs 0 0 0; target still received A0 00 5A
    ACK delay 300 cycles: controller ACKs 0 0 0; target still received A0 00 5A
    ACK delay 340 cycles: controller ACKs 0 0 0; target still received A0 00 5A
    ACK delay 350 cycles: controller ACKs 1 1 1; target still received A0 00 5A
    ACK delay 360 cycles: controller ACKs 1 1 1; target still received A0 00 5A
    ACK delay 370 cycles: controller ACKs 1 1 1; target still received A0 00 5A
    ACK delay 380 cycles: controller ACKs 1 1 1; target still received A0 00 5A
    ACK delay 400 cycles: controller ACKs 1 1 1; target still received A0 00 5A
    boundary: ACKs seen up to 348 cycles of delay, NACK from 349 |}]
;;
