(* SWD: the host program (examples/swd_dpidr.s) against an ARM SW-DP model in
   every acknowledge mode, on the cycle-accurate simulator and the RTL. *)
open! Base
open Stdio
open Hardcaml
module C = Fipe_checker
module Isa = Fipe_isa.Isa
module D = Fipe_model.Swd_dp
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let program =
  In_channel.read_all "../examples/swd_dpidr.s" |> Fipe_asm.Text.assemble |> Result.ok_or_failwith
;;

let request = 0xA5 (* read DPIDR *)
let fifo = [ C.Firmware.uart_word request ] (* LSB first: bit-reversed into 31..24 *)
let cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 1; in_pin = 0; aux_pin = 7 }

type run =
  { y : int
  ; samples : int list
  ; flags : bool list
  ; contention : int
  }
[@@deriving sexp, equal]

(* SWDIO on pin 0 (pulled up), SWCLK on pin 1 *)
let model ack =
  let dev = D.create ~ack () in
  let m = C.Isim.create ~cfg ~pins:0xFF ~fifo program in
  let drive = ref None and contention = ref 0 and c = ref 0 in
  while (not (C.Isim.done_ m)) && !c < 40_000 do
    Int.incr c;
    let host_oe = m.oe.(0) in
    if host_oe && Option.is_some !drive then Int.incr contention;
    let swdio = if host_oe then m.out.(0) else Option.value !drive ~default:true in
    let swclk = (not m.oe.(1)) || m.out.(1) in
    let levels = 0xFC lor Bool.to_int swdio lor (Bool.to_int swclk lsl 1) in
    C.Isim.step m ~pins_in:levels;
    drive := D.step dev ~swclk ~swdio
  done;
  ( { y = m.y
    ; samples = List.map (C.Isim.samples m) ~f:snd
    ; flags = [ m.late; m.order_err; m.window_err; m.trapped ]
    ; contention = !contention
    }
  , dev )
;;

let rtl ack =
  let dev = D.create ~ack () in
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
  set i.core.cfg_data_pin 3 0;
  set i.core.cfg_clk_pin 3 1;
  set i.core.cfg_in_pin 3 0;
  set i.core.cfg_aux_pin 3 7;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let f = ref fifo and samples = Queue.create () and quiet = ref 0 and contention = ref 0 in
  let drive = ref None in
  let b r = Bits.to_bool !r in
  while !quiet < 10 do
    (match !f with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    (* the port pulls SWDIO low when it drives a 0; a 1 is the pull-up *)
    set i.ext_pull_low 8 (if [%equal: bool option] !drive (Some false) then 1 else 0);
    Cyclesim.cycle sim;
    let lv = Bits.to_int !(o.levels) in
    if Bits.to_int !(o.core.pins_oe) land 1 = 1 && Option.is_some !drive then Int.incr contention;
    drive := D.step dev ~swclk:(lv land 2 <> 0) ~swdio:(lv land 1 <> 0);
    if b o.core.fifo_ready then f := List.tl_exn !f;
    if b o.core.sample_valid then Queue.enqueue samples (Bits.to_int !(o.core.sample_bit));
    if b o.core.halted && Bits.to_int !(o.core.queue_count) = 0 then Int.incr quiet
  done;
  { y = Bits.to_int !(o.core.dbg_y)
  ; samples = Queue.to_list samples
  ; flags = List.map [ o.core.late; o.core.order_err; o.core.window_err; o.core.trapped ] ~f:b
  ; contention = !contention
  }
;;

let%expect_test "SWD: line reset, DPIDR read, acknowledge decoded on-chip" =
  printf "program: %d words\n" (Array.length program);
  List.iter [ D.Ok; Wait; Fault; Absent ] ~f:(fun ack ->
    let m, dev = model ack in
    let r = rtl ack in
    let value = List.foldi m.samples ~init:0 ~f:(fun k acc bit -> acc lor (bit lsl k)) in
    printf
      "port %-6s -> Y %d (%s)%s; requests %d, malformed %d; contention %d; flags %b; RTL identical %b\n"
      (Sexp.to_string (D.sexp_of_ack ack))
      m.y
      (match m.y with
       | 1 -> "OK"
       | 2 -> "WAIT"
       | 4 -> "FAULT"
       | 7 -> "no answer"
       | _ -> "?")
      (if m.y = 1 then Printf.sprintf ", DPIDR 0x%08X (parity bit %d)" value (Int.popcount value land 1) else "")
      dev.requests
      dev.malformed
      m.contention
      (List.exists m.flags ~f:Fn.id)
      (equal_run m r));
  [%expect {|
    program: 57 words
    port Ok     -> Y 1 (OK), DPIDR 0x2BA01477 (parity bit 0); requests 1, malformed 0; contention 0; flags false; RTL identical true
    port Wait   -> Y 2 (WAIT); requests 1, malformed 0; contention 0; flags false; RTL identical true
    port Fault  -> Y 4 (FAULT); requests 1, malformed 0; contention 0; flags false; RTL identical true
    port Absent -> Y 7 (no answer); requests 1, malformed 0; contention 0; flags false; RTL identical true |}]
;;
