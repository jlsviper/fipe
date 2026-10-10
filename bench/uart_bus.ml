(* The chip running UART firmware against the UART device model, cycle by
   cycle, on the RTL-proven simulator. TX is pin 0 (the chip drives it), RX is
   pin 1 (the device drives it). *)
open! Base
module C = Fipe_checker
module U = Fipe_model.Uart_device

let cfg = { C.Isim.default_config with data_pin = 0; clk_pin = 2; in_pin = 1; aux_pin = 3 }

type outcome =
  { echoed : int list (* bytes the chip decoded from the replies *)
  ; framing_ok : bool (* every reply had a high stop bit *)
  ; device_got : int list (* ground truth: what the device received *)
  ; finished : bool
  }

(* Decode the sample log: per byte, 8 data bits LSB first, then the stop bit. *)
let decode samples =
  let bits = List.map samples ~f:snd in
  List.chunks_of bits ~length:9
  |> List.filter ~f:(fun l -> List.length l = 9)
  |> List.map ~f:(fun l ->
    let data = List.foldi (List.take l 8) ~init:0 ~f:(fun i a b -> a lor (b lsl i)) in
    data, List.nth_exn l 8 = 1)
;;

let run ?max_cycles ~params ~tx_bit ~rx_bit bytes =
  (* a dropped byte never gets a reply, so cap at a generous exchange length *)
  let max_cycles =
    Option.value
      max_cycles
      ~default:(List.length bytes * ((25 * (tx_bit + rx_bit)) + params.U.reply_delay + 2_000))
  in
  let program = C.Firmware.uart_echo ~tx_bit ~rx_bit ~bytes:(List.length bytes) in
  let fifo = List.map bytes ~f:C.Firmware.uart_word in
  let m = C.Isim.create ~cfg ~pins:0xFF ~fifo program in
  let dev = U.create params in
  let dev_out = ref true in
  let c = ref 0 in
  while (not (C.Isim.done_ m)) && !c < max_cycles do
    Int.incr c;
    let levels =
      0xFF land lnot 3
      lor (if C.Isim.own_level m 0 then 1 else 0)
      lor if !dev_out then 2 else 0
    in
    C.Isim.step m ~pins_in:levels;
    dev_out := U.step dev ~rx_line:(levels land 1 = 1)
  done;
  let d = decode (C.Isim.samples m) in
  { echoed = List.map d ~f:fst
  ; framing_ok = List.for_all d ~f:snd
  ; device_got = List.rev dev.received
  ; finished = C.Isim.done_ m
  }
;;

let passes o bytes = o.finished && o.framing_ok && List.equal Int.equal o.echoed bytes
