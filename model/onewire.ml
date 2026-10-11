(* A 1-Wire device (like a DS18B20 sensor) answering reset and READ ROM, at
   standard speed, at its pins. Times in cycles at 50 MHz (50 per us).
   - A low pulse of at least [reset_min] is a reset: [presence_wait] after the
     line is released, the device pulls it low for [presence_len].
   - Write slots: at [sample_at] after each master falling edge, the device
     reads the line (high = 1). Commands are LSB first.
   - After READ ROM (0x33), each master falling edge starts a read slot: for a
     0 bit the device holds the line low for [hold0].
   The ROM is 64 bits, LSB first: family code, 48-bit serial, Dallas CRC-8.
   It is kept as eight bytes: an OCaml int has only 63 bits, which would
   silently drop the top bit of the CRC. *)
open! Base

type params =
  { rom : int list (* 8 bytes; byte 0 is the family code, byte 7 the CRC *)
  ; reset_min : int
  ; presence_wait : int
  ; presence_len : int
  ; sample_at : int
  ; hold0 : int
  }

let crc8 bytes =
  List.fold bytes ~init:0 ~f:(fun crc b ->
    let crc = ref crc and b = ref b in
    for _ = 1 to 8 do
      let mix = (!crc lxor !b) land 1 in
      crc := !crc lsr 1;
      if mix = 1 then crc := !crc lxor 0x8C;
      b := !b lsr 1
    done;
    !crc)
;;

(* family 0x28 (DS18B20), a serial number, and its CRC *)
let make_rom ~family ~serial =
  let bytes = family :: List.init 6 ~f:(fun i -> (serial lsr (8 * i)) land 0xFF) in
  bytes @ [ crc8 bytes ]
;;

let rom_bit rom i = (List.nth_exn rom (i / 8) lsr (i % 8)) land 1

let default =
  { rom = make_rom ~family:0x28 ~serial:0x00A1B2C3D4E5
  ; reset_min = 20_000 (* 400 us *)
  ; presence_wait = 1_500 (* 30 us *)
  ; presence_len = 6_000 (* 120 us *)
  ; sample_at = 1_500 (* 30 us *)
  ; hold0 = 1_500 (* 30 us *)
  }
;;

type mode =
  | Idle
  | Cmd of int * int (* bits so far, value *)
  | Rom of int (* next bit *)

type t =
  { p : params
  ; mutable now : int
  ; mutable prev : bool
  ; mutable fell_at : int
  ; mutable pull_until : int
  ; mutable pull_from : int
  ; mutable sample_pending : int option
  ; mutable mode : mode
  ; mutable command : int option
  }

let create p =
  { p
  ; now = 0
  ; prev = true
  ; fell_at = 0
  ; pull_until = -1
  ; pull_from = 0
  ; sample_pending = None
  ; mode = Idle
  ; command = None
  }
;;

let pulling d = d.now >= d.pull_from && d.now < d.pull_until

(* One cycle: the line level in, whether we pull it low next cycle out. *)
let step d ~line =
  let t = d.now in
  let ours = pulling d in
  (* every low period is timed from its own falling edge, whoever caused it,
     so the end of our own presence pulse is never mistaken for a reset *)
  if (not line) && d.prev then d.fell_at <- t;
  if (not line) && d.prev && not ours
  then (
    (* a master falling edge *)
    match d.mode with
    | Cmd _ -> d.sample_pending <- Some (t + d.p.sample_at)
    | Rom i when i < 64 ->
      if rom_bit d.p.rom i = 0
      then (
        d.pull_from <- t;
        d.pull_until <- t + d.p.hold0);
      d.mode <- Rom (i + 1)
    | _ -> ());
  if line && (not d.prev) && t - d.fell_at >= d.p.reset_min
  then (
    (* end of a reset pulse: answer with presence *)
    d.pull_from <- t + d.p.presence_wait;
    d.pull_until <- t + d.p.presence_wait + d.p.presence_len;
    d.mode <- Cmd (0, 0);
    d.sample_pending <- None);
  (match d.sample_pending, d.mode with
   | Some at, Cmd (n, v) when t >= at ->
     d.sample_pending <- None;
     let v = v lor ((if line then 1 else 0) lsl n) in
     if n + 1 = 8
     then (
       d.command <- Some v;
       d.mode <- (if v = 0x33 then Rom 0 else Idle))
     else d.mode <- Cmd (n + 1, v)
   | _ -> ());
  d.prev <- line;
  d.now <- t + 1;
  pulling d
;;
