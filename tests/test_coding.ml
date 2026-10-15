(* The coding stage at work: a USB low-speed DATA0 packet sent by both
   sequencers as a differential pair (NRZI, bit stuffing and CRC16 in the
   chip), judged by an independent USB receiver model, on the cycle-accurate
   simulator and the RTL. *)
open! Base
open Stdio
open Hardcaml
module C = Fipe_checker
module Isa = Fipe_isa.Isa
module U = Fipe_model.Usb_ls_rx
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let source = In_channel.read_all "../examples/usb_ls_data.s"

let assemble src =
  let p, labels = Fipe_asm.Text.assemble_with_labels src |> Result.ok_or_failwith in
  p, List.Assoc.find_exn labels ~equal:String.equal "dm"
;;

let with_corrupt_crc =
  String.substr_replace_all source ~pattern:"        crc   load_osr" ~with_:"        crc   arm_corrupt\n        crc   load_osr"
;;

let lsb_first b =
  List.fold (List.init 8 ~f:Fn.id) ~init:0 ~f:(fun acc i -> if (b lsr i) land 1 = 1 then acc lor (1 lsl (7 - i)) else acc)
  lsl 24
;;

let crc16_cfg = 0x8005FC00
let fifo payload = crc16_cfg :: List.map ([ 0x80; 0xC3 ] @ payload) ~f:lsb_first
let cfg_a = { C.Isim.default_config with data_pin = 0; clk_pin = 2; in_pin = 2; aux_pin = 3 }
let cfg_b = { C.Isim.default_config with data_pin = 1; clk_pin = 4; in_pin = 4; aux_pin = 5 }

let on_model (program, entry_b) payload =
  let rx = U.create () in
  let m = C.Isim.create ~cfg:cfg_a ~pins:0xFF ~b:(cfg_b, entry_b, fifo payload) ~fifo:(fifo payload) program in
  let c = ref 0 in
  while (not (C.Isim.done_ m)) && !c < 20_000 do
    Int.incr c;
    let lv k = (not m.oe.(k)) || m.out.(k) in
    C.Isim.step m ~pins_in:0xFF;
    U.step rx ~dp:(lv 0) ~dm:(lv 1)
  done;
  for _ = 1 to 200 do
    U.step rx ~dp:false ~dm:true
  done;
  rx, [ m.late; m.order_err; m.conflict; m.trapped; (C.Isim.b_exn m).late; (C.Isim.b_exn m).trapped ]
;;

let on_rtl (program, entry_b) payload =
  let rx = U.create () in
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let set r w v = r := Bits.of_int ~width:w v in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  List.iter
    [ i.core.cfg_data_pin, 0; i.core.cfg_clk_pin, 2; i.core.cfg_in_pin, 2; i.core.cfg_aux_pin, 3
    ; i.core.cfg_b_data_pin, 1; i.core.cfg_b_clk_pin, 4; i.core.cfg_b_in_pin, 4; i.core.cfg_b_aux_pin, 5
    ]
    ~f:(fun (r, v) -> set r 3 v);
  set i.core.entry_b 6 entry_b;
  i.core.start := Bits.vdd;
  i.core.start_b := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  i.core.start_b := Bits.gnd;
  let fa = ref (fifo payload) and fb = ref (fifo payload) and quiet = ref 0 in
  let b r = Bits.to_bool !r in
  let feed valid data q =
    match !q with
    | w :: _ ->
      valid := Bits.vdd;
      set data 32 w
    | [] -> valid := Bits.gnd
  in
  while !quiet < 10 do
    feed i.core.fifo_valid i.core.fifo_data fa;
    feed i.core.fifo_b_valid i.core.fifo_b_data fb;
    Cyclesim.cycle sim;
    let lv = Bits.to_int !(o.levels) in
    U.step rx ~dp:(lv land 1 <> 0) ~dm:(lv land 2 <> 0);
    if b o.core.fifo_ready then fa := List.tl_exn !fa;
    if b o.core.fifo_b_ready then fb := List.tl_exn !fb;
    if b o.core.halted && b o.core.halted_b && Bits.to_int !(o.core.queue_count) = 0
       && Bits.to_int !(o.core.queue_count_b) = 0
    then Int.incr quiet
  done;
  for _ = 1 to 200 do
    U.step rx ~dp:false ~dm:true
  done;
  rx, List.map [ o.core.late; o.core.order_err; o.core.conflict; o.core.trapped; o.core.late_b; o.core.trapped_b ] ~f:b
;;

let show name (rx : U.t) flags =
  List.iter rx.packets ~f:(fun p ->
    printf
      "%-26s PID 0x%02X  payload %s  SYNC %b  PID %b  CRC %b  stuffed %d  stuff errors %d  EOP %b\n"
      name
      p.pid
      (String.concat ~sep:" " (List.map p.payload ~f:(Printf.sprintf "%02X")))
      p.sync_ok
      p.pid_ok
      p.crc_ok
      p.stuffed
      p.stuff_errors
      p.eop_ok);
  if List.is_empty rx.packets then printf "%-26s no packet\n" name;
  printf "%-26s invalid SE1 states %d; flags %b\n" "" rx.se1 (List.exists flags ~f:Fn.id)
;;

let same (a : U.t) (b : U.t) = Sexp.equal ([%sexp_of: U.packet list] a.packets) ([%sexp_of: U.packet list] b.packets)

(* wire bits of SYNC, PID, payload and CRC16, to find a payload that owes a
   stuff bit after its last bit *)
(* The packet's wire bits (SYNC, PID, payload, CRC16), stuffed by an
   independent reference: returns how many stuff bits USB requires, and
   whether one is owed after the very last bit. *)
let stuffing payload =
  let bits_of b = List.init 8 ~f:(fun i -> (b lsr i) land 1) in
  let data = List.concat_map payload ~f:bits_of in
  let crc = U.lfsr data ~poly:0x8005 ~width:16 lxor 0xFFFF in
  let wire = List.concat_map [ 0x80; 0xC3 ] ~f:bits_of @ data @ List.init 16 ~f:(fun i -> (crc lsr (15 - i)) land 1) in
  let run = ref 0 and count = ref 0 and owed_at_end = ref false in
  List.iter wire ~f:(fun b ->
    owed_at_end := false;
    if b = 1
    then (
      Int.incr run;
      if !run = 6
      then (
        Int.incr count;
        owed_at_end := true;
        run := 0))
    else run := 0);
  !count, !owed_at_end
;;

let%expect_test "USB low speed: a DATA0 packet, coded by the chip, judged by an independent receiver" =
  let prog = assemble source in
  let payload = [ 0x46; 0x49; 0x50; 0x45; 0xFF ] in
  printf "stuff bits USB requires: %d\n" (fst (stuffing payload));
  let rm, fm = on_model prog payload and rr, fr = on_rtl prog payload in
  show "simulator" rm fm;
  show "RTL" rr fr;
  printf "RTL and simulator agree: %b\n\n" (same rm rr && [%equal: bool list] fm fr);
  (* a payload whose CRC leaves a stuff bit owed after the packet's last bit *)
  let rand = Random.State.make [| 7 |] in
  let rec find n =
    let p = List.init 5 ~f:(fun _ -> Random.State.int rand 256) in
    if snd (stuffing p) || n > 20000 then p else find (n + 1)
  in
  let tail = find 0 in
  let need, at_end = stuffing tail in
  printf "stuff bits USB requires: %d, one of them after the last CRC bit: %b\n" need at_end;
  let rr, fr = on_rtl prog tail and rm, _ = on_model prog tail in
  show "RTL, tail stuff" rr fr;
  printf "RTL and simulator agree: %b\n\n" (same rm rr);
  (* deliberate fault: arm_corrupt flips the CRC's last bit *)
  let bad = assemble with_corrupt_crc in
  let rr, fr = on_rtl bad payload and rm, _ = on_model bad payload in
  show "RTL, CRC corrupted" rr fr;
  printf "RTL and simulator agree: %b\n" (same rm rr);
  [%expect {|
    stuff bits USB requires: 1
    simulator                  PID 0xC3  payload 46 49 50 45 FF  SYNC true  PID true  CRC true  stuffed 1  stuff errors 0  EOP true
                               invalid SE1 states 0; flags false
    RTL                        PID 0xC3  payload 46 49 50 45 FF  SYNC true  PID true  CRC true  stuffed 1  stuff errors 0  EOP true
                               invalid SE1 states 0; flags false
    RTL and simulator agree: true

    stuff bits USB requires: 1, one of them after the last CRC bit: true
    RTL, tail stuff            PID 0xC3  payload F7 64 53 3D 88  SYNC true  PID true  CRC true  stuffed 1  stuff errors 0  EOP true
                               invalid SE1 states 0; flags false
    RTL and simulator agree: true

    RTL, CRC corrupted         PID 0xC3  payload 46 49 50 45 FF  SYNC true  PID true  CRC false  stuffed 1  stuff errors 0  EOP true
                               invalid SE1 states 0; flags false
    RTL and simulator agree: true |}]
;;

(* ---- CAN ----------------------------------------------------------------------- *)

module Can = Fipe_model.Can_rx

let can_source = In_channel.read_all "../examples/can_frame.s"
let can_cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 0; aux_pin = 2 }
let crc15_cfg = 0x4599E000

let can_fifo ~id data =
  (crc15_cfg :: (((id lsl 7) lor List.length data) lsl 13) :: List.map data ~f:(fun b -> b lsl 24))
;;

(* An independent reference: the frame's bits from start of frame to the end
   of the CRC, stuffed by the CAN rule; the number of stuff bits required, and
   whether one is owed after the last CRC bit. *)
let can_stuffing ~id data =
  let bits_of v n = List.init n ~f:(fun i -> (v lsr (n - 1 - i)) land 1) in
  let pre = bits_of ((id lsl 7) lor List.length data) 19 @ List.concat_map data ~f:(fun b -> bits_of b 8) in
  let wire = pre @ bits_of (Can.crc15 pre) 15 in
  let run = ref 0 and last = ref (-1) and count = ref 0 and owed = ref false in
  List.iter wire ~f:(fun b ->
    owed := false;
    run := if b = !last then !run + 1 else 1;
    last := b;
    if !run = 5
    then (
      (* a stuff bit (the complement) follows, and starts a new run *)
      Int.incr count;
      owed := true;
      last := 1 - b;
      run := 1));
  !count, !owed
;;

let can_on_model program fifo =
  let rx = Can.create () in
  let m = C.Isim.create ~cfg:can_cfg ~pins:0xFF ~fifo program in
  let ack = ref false and c = ref 0 in
  while (not (C.Isim.done_ m)) && !c < 60_000 do
    Int.incr c;
    let bus = (not (m.oe.(0) && not m.out.(0))) && not !ack in
    C.Isim.step m ~pins_in:(0xFE lor Bool.to_int bus);
    ack := Can.step rx ~bus
  done;
  (* the bus idles recessive while the receiver reads the end of frame *)
  for _ = 1 to 1_500 do
    ignore (Can.step rx ~bus:true : bool)
  done;
  rx, List.map (C.Isim.samples m) ~f:snd, [ m.late; m.order_err; m.trapped ]
;;

let can_on_rtl program fifo =
  let rx = Can.create () in
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let set r w v = r := Bits.of_int ~width:w v in
  i.core.clear := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.clear := Bits.gnd;
  Array.iteri program ~f:(fun a ins ->
    i.core.imem_we := Bits.vdd;
    set i.core.imem_addr 6 a;
    set i.core.imem_data 16 (Isa.encode ins);
    Cyclesim.cycle sim);
  i.core.imem_we := Bits.gnd;
  List.iter [ i.core.cfg_data_pin, 0; i.core.cfg_clk_pin, 1; i.core.cfg_in_pin, 0; i.core.cfg_aux_pin, 2 ] ~f:(fun (r, v) -> set r 3 v);
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let f = ref fifo and samples = Queue.create () and quiet = ref 0 and ack = ref false in
  let b r = Bits.to_bool !r in
  while !quiet < 10 do
    (match !f with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    set i.ext_pull_low 8 (Bool.to_int !ack);
    Cyclesim.cycle sim;
    let bus = Bits.to_int !(o.levels) land 1 = 1 in
    ack := Can.step rx ~bus;
    if b o.core.fifo_ready then f := List.tl_exn !f;
    if b o.core.sample_valid then Queue.enqueue samples (Bits.to_int !(o.core.sample_bit));
    if b o.core.halted && Bits.to_int !(o.core.queue_count) = 0 then Int.incr quiet
  done;
  for _ = 1 to 1_500 do
    ignore (Can.step rx ~bus:true : bool)
  done;
  rx, Queue.to_list samples, List.map [ o.core.late; o.core.order_err; o.core.trapped ] ~f:b
;;

let show_can name ((rx : Can.t), ack_seen, flags) =
  List.iter rx.frames ~f:(fun f ->
    printf
      "%-22s id 0x%03X dlc %d data %s  CRC %b  stuffed %d  stuff errors %d  form errors %d  receiver ACKed %b\n"
      name
      f.id
      f.dlc
      (String.concat ~sep:" " (List.map f.data ~f:(Printf.sprintf "%02X")))
      f.crc_ok
      f.stuffed
      f.stuff_errors
      f.form_errors
      f.acked);
  if List.is_empty rx.frames then printf "%-22s no frame\n" name;
  printf
    "%-22s FIPE sampled the ACK slot: %s; flags %b\n"
    ""
    (match ack_seen with
     | [ 0 ] -> "dominant (acknowledged)"
     | [ 1 ] -> "recessive (not acknowledged)"
     | l -> String.concat ~sep:" " (List.map l ~f:Int.to_string))
    (List.exists flags ~f:Fn.id)
;;

let can_same (a, sa, fa) (b, sb, fb) =
  Sexp.equal ([%sexp_of: Can.frame list] a.Can.frames) ([%sexp_of: Can.frame list] b.Can.frames)
  && [%equal: int list] sa sb
  && [%equal: bool list] fa fb
;;

let%expect_test "CAN: a data frame, stuffed and CRC'd by the chip, acknowledged by an independent receiver" =
  let program = Fipe_asm.Text.assemble can_source |> Result.ok_or_failwith in
  let run name ?(program = program) ~id data =
    let need, at_end = can_stuffing ~id data in
    printf "stuff bits CAN requires: %d%s\n" need (if at_end then ", one after the last CRC bit" else "");
    let m = can_on_model program (can_fifo ~id data) and r = can_on_rtl program (can_fifo ~id data) in
    show_can name r;
    printf "%-22s RTL and simulator agree: %b\n\n" "" (can_same m r)
  in
  run "RTL" ~id:0x123 [ 0xFF; 0x00 ];
  (* a frame that owes a stuff bit after its last CRC bit *)
  let rand = Random.State.make [| 9 |] in
  let rec find n =
    let id = Random.State.int rand 0x800 and d = [ Random.State.int rand 256; Random.State.int rand 256 ] in
    if snd (can_stuffing ~id d) || n > 50_000 then id, d else find (n + 1)
  in
  let id, d = find 0 in
  run "RTL, tail stuff" ~id d;
  (* deliberate fault: the receiver must not acknowledge a bad CRC *)
  let bad =
    String.substr_replace_all can_source ~pattern:"        crc   load_osr" ~with_:"        crc   arm_corrupt\n        crc   load_osr"
    |> Fipe_asm.Text.assemble
    |> Result.ok_or_failwith
  in
  run "RTL, CRC corrupted" ~program:bad ~id:0x123 [ 0xFF; 0x00 ];
  [%expect {|
    stuff bits CAN requires: 4
    RTL                    id 0x123 dlc 2 data FF 00  CRC true  stuffed 4  stuff errors 0  form errors 0  receiver ACKed true
                           FIPE sampled the ACK slot: dominant (acknowledged); flags false
                           RTL and simulator agree: true

    stuff bits CAN requires: 2, one after the last CRC bit
    RTL, tail stuff        id 0x739 dlc 2 data 59 86  CRC true  stuffed 2  stuff errors 0  form errors 0  receiver ACKed true
                           FIPE sampled the ACK slot: dominant (acknowledged); flags false
                           RTL and simulator agree: true

    stuff bits CAN requires: 4
    RTL, CRC corrupted     id 0x123 dlc 2 data FF 00  CRC false  stuffed 4  stuff errors 0  form errors 0  receiver ACKed false
                           FIPE sampled the ACK slot: recessive (not acknowledged); flags false
                           RTL and simulator agree: true |}]
;;
