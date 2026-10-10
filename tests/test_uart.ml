(* UART: transmit and receive (with WAIT), checked against the RTL, then a
   baud-tolerance measured datasheet of UART devices. *)
open! Base
open Stdio
open Hardcaml
module C = Fipe_checker
module U = Fipe_model.Uart_device
module UB = Fipe_bench.Uart_bus
module Isa = Fipe_isa.Isa
module L = Fipe_hw.Loopback
module Lsim = Cyclesim.With_interface (L.I) (L.O)

let set r w v = r := Bits.of_int ~width:w (v land ((1 lsl w) - 1))
let nominal_bit = 434 (* 115200 baud at 50 MHz *)

(* The same exchange on the RTL loopback; the device drives RX (pin 1) by
   pulling it low. Returns the samples (cycle-relative) and whether it halted. *)
let rtl ~params ~tx_bit ~rx_bit ~cycles bytes =
  let program = C.Firmware.uart_echo ~tx_bit ~rx_bit ~bytes:(List.length bytes) in
  let sim = Lsim.create L.create in
  let i : _ L.I.t = Cyclesim.inputs sim in
  let o : _ L.O.t = Cyclesim.outputs ~clock_edge:Before sim in
  let dev = U.create params in
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
  set i.core.cfg_clk_pin 3 2;
  set i.core.cfg_in_pin 3 1;
  set i.core.cfg_aux_pin 3 3;
  i.core.start := Bits.vdd;
  Cyclesim.cycle sim;
  i.core.start := Bits.gnd;
  let fifo = ref (List.map bytes ~f:C.Firmware.uart_word) in
  let samples = Queue.create () in
  for c = 1 to cycles do
    (match !fifo with
     | w :: _ ->
       i.core.fifo_valid := Bits.vdd;
       set i.core.fifo_data 32 w
     | [] -> i.core.fifo_valid := Bits.gnd);
    Cyclesim.cycle sim;
    if Bits.to_bool !(o.core.fifo_ready) then fifo := List.tl_exn !fifo;
    if Bits.to_bool !(o.core.sample_valid)
    then Queue.enqueue samples (c, Bits.to_int !(o.core.sample_bit));
    let lv = Bits.to_int !(o.levels) in
    let out = U.step dev ~rx_line:(lv land 1 = 1) in
    set i.ext_pull_low 8 (if out then 0 else 2)
  done;
  Cyclesim.cycle sim;
  Queue.to_list samples, Bits.to_bool !(o.core.halted)
;;

(* The bench over the same fixed horizon, for a like-for-like comparison. *)
let bench ~params ~tx_bit ~rx_bit ~cycles bytes =
  let program = C.Firmware.uart_echo ~tx_bit ~rx_bit ~bytes:(List.length bytes) in
  let m =
    C.Isim.create ~cfg:UB.cfg ~pins:0xFF ~fifo:(List.map bytes ~f:C.Firmware.uart_word) program
  in
  let dev = U.create params in
  let dev_out = ref true in
  for _ = 1 to cycles do
    let levels =
      0xFF land lnot 3 lor (if C.Isim.own_level m 0 then 1 else 0) lor if !dev_out then 2 else 0
    in
    C.Isim.step m ~pins_in:levels;
    dev_out := U.step dev ~rx_line:(levels land 1 = 1)
  done;
  C.Isim.samples m, m.halted
;;

let fast2 = { (U.nominal ~bit:(434. /. 1.02)) with reply_delay = 200 }

let%expect_test "UART bench matches the RTL, including a device that goes silent" =
  let bytes = [ 0x55; 0xA3 ] in
  let points =
    [ "nominal", U.nominal ~bit:434., 434
    ; "device 2% fast", fast2, 434
    ; "near the low edge", U.nominal ~bit:434., 415
    ; "beyond the edge (device misreads)", U.nominal ~bit:434., 395
    ]
  in
  List.iter points ~f:(fun (name, params, tx_bit) ->
    let cycles = 25_000 in
    let r = rtl ~params ~tx_bit ~rx_bit:nominal_bit ~cycles bytes in
    let b = bench ~params ~tx_bit ~rx_bit:nominal_bit ~cycles bytes in
    printf
      "%-40s %s (%d samples, halted %b)\n"
      name
      (if [%equal: (int * int) list * bool] r b then "identical" else "DIFFERS")
      (List.length (fst r))
      (snd r));
  [%expect {|
    nominal                                  identical (18 samples, halted true)
    device 2% fast                           identical (18 samples, halted true)
    near the low edge                        identical (18 samples, halted true)
    beyond the edge (device misreads)        identical (18 samples, halted true) |}]
;;

let%expect_test "UART echo at 115200 baud" =
  let bytes = [ 0x55; 0xA3; 0x0F; 0xFF; 0x00 ] in
  let o = UB.run ~params:(U.nominal ~bit:434.) ~tx_bit:434 ~rx_bit:434 bytes in
  printf
    "sent %s, device received %s, chip decoded %s, stop bits ok %b\n"
    (Sexp.to_string [%sexp (List.map bytes ~f:(Printf.sprintf "%02X") : string list)])
    (Sexp.to_string [%sexp (List.map o.device_got ~f:(Printf.sprintf "%02X") : string list)])
    (Sexp.to_string [%sexp (List.map o.echoed ~f:(Printf.sprintf "%02X") : string list)])
    o.framing_ok;
  [%expect {| sent (55 A3 0F FF 00), device received (55 A3 0F FF 00), chip decoded (55 A3 0F FF 00), stop bits ok true |}]
;;

(* The measured datasheet: sweep our transmit bit period down and up from
   nominal until the device stops echoing correctly. A UART samples its stop
   bit at Q = (9 + sample point) device bits after the start edge; it fails
   when that instant leaves our stop bit, so the window edges are Q/10 and Q/9.
   Two independent estimates of Q (10 x low edge, 9 x high edge) must agree,
   and Q / 9.5 estimates the device's real bit period if it samples mid-bit. *)
let%expect_test "baud tolerance: measured datasheet of four UART devices" =
  let bytes = [ 0x55; 0xA3 ] in
  let devices =
    [ "exact clock", U.nominal ~bit:434.
    ; "clock 2% fast", fast2
    ; "clock 3% slow", U.nominal ~bit:(434. *. 1.03)
    ; "early sampling (35%)", { (U.nominal ~bit:434.) with sample_point = 0.35 }
    ]
  in
  let passes params tx_bit = UB.passes (UB.run ~params ~tx_bit ~rx_bit:nominal_bit bytes) bytes in
  let edge params ~lo ~hi =
    (* lo passes, hi fails (either direction) *)
    let rec go lo hi = if abs (hi - lo) <= 1 then lo else (let m = (lo + hi) / 2 in if passes params m then go m hi else go lo m) in
    go lo hi
  in
  let kbaud bit = 50_000. /. Float.of_int bit in
  printf "%-22s %17s %17s %8s %8s %13s %13s\n" "device" "slowest ok" "fastest ok" "10xlow" "9xhigh" "clock est." "clock true";
  List.iter devices ~f:(fun (name, params) ->
    let slow = edge params ~lo:nominal_bit ~hi:520 in
    let fast = edge params ~lo:nominal_bit ~hi:360 in
    let q_lo = 10 * fast and q_hi = 9 * slow in
    let q = Float.of_int (q_lo + q_hi) /. 2. in
    let est_bit = q /. 9.5 in
    let pct b = 100. *. ((434. /. b) -. 1.) in
    printf
      "%-22s %7.1f kbaud    %7.1f kbaud    %6d   %6d   %+8.2f %%     %+8.2f %%\n"
      name
      (kbaud slow)
      (kbaud fast)
      q_lo
      q_hi
      (pct est_bit)
      (pct params.bit));
  printf
    "\nslowest/fastest ok: our baud rate range the device still receives correctly\n\
     10xlow, 9xhigh: two estimates of when the device samples its stop bit (cycles after start)\n\
     clock est.: device clock error inferred assuming mid-bit sampling\n";
  [%expect {|
    device                        slowest ok        fastest ok   10xlow   9xhigh    clock est.    clock true
    exact clock              108.7 kbaud      121.4 kbaud      4120     4140      -0.17 %        +0.00 %
    clock 2% fast            111.1 kbaud      123.8 kbaud      4040     4050      +1.93 %        +2.00 %
    clock 3% slow            105.5 kbaud      117.9 kbaud      4240     4266      -3.06 %        -2.91 %
    early sampling (35%)     110.4 kbaud      123.5 kbaud      4050     4077      +1.46 %        +0.00 %

    slowest/fastest ok: our baud rate range the device still receives correctly
    10xlow, 9xhigh: two estimates of when the device samples its stop bit (cycles after start)
    clock est.: device clock error inferred assuming mid-bit sampling |}]
;;

(* Separating clock error from sample point. Our own receiver samples at a
   known point, mid-bit, so sweeping OUR receive bit period against the
   device's replies measures the device's real transmit bit period B: our
   samples fit its bits while 9 B / 9.5 <= rx < 9 B / 8.5. With B known, the
   stop-bit sampling instant Q from the transmit sweep gives the device's
   sample point directly: Q / B - 9. *)
let%expect_test "device bit period and sample point, from two sweeps" =
  let bytes = [ 0x55; 0xA3 ] in
  let devices =
    [ "exact clock", U.nominal ~bit:434.
    ; "clock 2% fast", fast2
    ; "clock 3% slow", U.nominal ~bit:(434. *. 1.03)
    ; "early sampling (35%)", { (U.nominal ~bit:434.) with sample_point = 0.35 }
    ]
  in
  let ok params ~tx_bit ~rx_bit = UB.passes (UB.run ~params ~tx_bit ~rx_bit bytes) bytes in
  let edge pass ~lo ~hi =
    let rec go lo hi = if abs (hi - lo) <= 1 then lo else (let m = (lo + hi) / 2 in if pass m then go m hi else go lo m) in
    go lo hi
  in
  printf "%-22s %12s %12s %14s %14s
" "device" "bit, true" "bit, meas." "sample, true" "sample, meas.";
  List.iter devices ~f:(fun (name, params) ->
    (* transmit sweep: when the device samples its stop bit *)
    let tx_ok b = ok params ~tx_bit:b ~rx_bit:nominal_bit in
    let q =
      Float.of_int ((10 * edge tx_ok ~lo:nominal_bit ~hi:360) + (9 * edge tx_ok ~lo:nominal_bit ~hi:520)) /. 2.
    in
    (* receive sweep: the device's own bit period *)
    let rx_ok b = ok params ~tx_bit:nominal_bit ~rx_bit:b in
    let rx_lo = edge rx_ok ~lo:nominal_bit ~hi:360 and rx_hi = edge rx_ok ~lo:nominal_bit ~hi:520 in
    let b =
      ((9.5 *. Float.of_int rx_lo /. 9.) +. (8.5 *. Float.of_int rx_hi /. 9.)) /. 2.
    in
    printf
      "%-22s %8.1f cyc %8.1f cyc %11.0f %% %11.0f %%
"
      name
      params.bit
      b
      (100. *. params.sample_point)
      (100. *. ((q /. b) -. 9.)));
  [%expect {|
    device                    bit, true   bit, meas.   sample, true  sample, meas.
    exact clock               434.0 cyc    434.2 cyc          50 %          51 %
    clock 2% fast             425.5 cyc    425.7 cyc          50 %          50 %
    clock 3% slow             447.0 cyc    447.1 cyc          50 %          51 %
    early sampling (35%)      434.0 cyc    434.2 cyc          35 %          36 % |}]
;;
