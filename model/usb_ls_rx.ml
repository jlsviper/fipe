(* A USB low-speed (1.5 Mbit/s) receiver at the D+ and D- pins, independent
   of FIPE: it recovers the bit clock itself (resynchronizing on every line
   transition, sampling mid-bit at the true 33.33 cycles per bit at 50 MHz),
   decodes NRZI, removes bit stuffing (a stuff violation is counted), and
   checks each packet's SYNC, PID complement, CRC (by residual: 0x800D for
   CRC16, 0b01100 for CRC5) and end of packet (SE0, then J).
   Low speed: J = D+ low and D- high; K = D+ high and D- low; SE0 = both low. *)
open! Base

type line =
  | J
  | K
  | Se0
  | Se1
[@@deriving sexp, equal]

type packet =
  { pid : int
  ; payload : int list (* bytes after the PID, CRC removed *)
  ; sync_ok : bool
  ; pid_ok : bool
  ; crc_ok : bool
  ; stuff_errors : int
  ; stuffed : int (* stuff bits removed *)
  ; eop_ok : bool
  }
[@@deriving sexp]

let bit_cycles = 50e6 /. 1.5e6

type t =
  { mutable prev : line
  ; mutable phase : float (* cycles since the last resynchronization *)
  ; mutable next_sample : float
  ; mutable in_packet : bool
  ; mutable last_state : line (* for NRZI *)
  ; mutable ones : int
  ; mutable bits : int list (* destuffed, newest first *)
  ; mutable stuff_errors : int
  ; mutable stuffed : int
  ; mutable se0_samples : int
  ; mutable se1 : int
  ; mutable packets : packet list
  }

let create () =
  { prev = J
  ; phase = 0.
  ; next_sample = 0.
  ; in_packet = false
  ; last_state = J
  ; ones = 0
  ; bits = []
  ; stuff_errors = 0
  ; stuffed = 0
  ; se0_samples = 0
  ; se1 = 0
  ; packets = []
  }
;;

let line_of ~dp ~dm =
  match dp, dm with
  | false, true -> J
  | true, false -> K
  | false, false -> Se0
  | true, true -> Se1
;;

let lfsr bits ~poly ~width =
  List.fold bits ~init:((1 lsl width) - 1) ~f:(fun crc b ->
    let top = (crc lsr (width - 1)) land 1 in
    ((crc lsl 1) lxor if top lxor b = 1 then poly else 0) land ((1 lsl width) - 1))
;;

let byte_of bits = List.foldi bits ~init:0 ~f:(fun i acc b -> acc lor (b lsl i)) (* LSB first *)

let finish d ~eop_ok =
  let bits = List.rev d.bits in
  let sync = List.take bits 8 and rest = List.drop bits 8 in
  let pid_bits = List.take rest 8 and body = List.drop rest 8 in
  let pid = byte_of pid_bits in
  let pid_ok = List.length pid_bits = 8 && pid land 0xF = lnot (pid lsr 4) land 0xF in
  let is_data = List.mem [ 0xC3; 0x4B ] pid ~equal:Int.equal in
  let crc_ok =
    if is_data
    then List.length body >= 16 && lfsr body ~poly:0x8005 ~width:16 = 0x800D
    else List.length body = 16 && lfsr body ~poly:0x05 ~width:5 = 0b01100
  in
  let payload_bits = if is_data then List.take body (max 0 (List.length body - 16)) else List.take body 11 in
  let payload =
    List.chunks_of payload_bits ~length:8 |> List.filter ~f:(fun c -> List.length c = 8) |> List.map ~f:byte_of
  in
  d.packets
  <- d.packets
     @ [ { pid
         ; payload
         ; sync_ok = [%equal: int list] sync [ 0; 0; 0; 0; 0; 0; 0; 1 ]
         ; pid_ok
         ; crc_ok
         ; stuff_errors = d.stuff_errors
         ; stuffed = d.stuffed
         ; eop_ok
         }
       ];
  d.in_packet <- false;
  d.bits <- [];
  d.ones <- 0;
  d.stuff_errors <- 0;
  d.stuffed <- 0;
  d.se0_samples <- 0
;;

let sample d st =
  match st with
  | Se1 -> d.se1 <- d.se1 + 1
  | Se0 -> d.se0_samples <- d.se0_samples + 1
  | J | K ->
    if d.se0_samples > 0
    then (
      (* SE0 then J: end of packet. Six 1s just before it means a stuff bit
         was owed and never sent. *)
      if d.ones = 6 then d.stuff_errors <- d.stuff_errors + 1;
      finish d ~eop_ok:([%equal: line] st J && d.se0_samples >= 1 && d.se0_samples <= 3))
    else (
      let bit = if [%equal: line] st d.last_state then 1 else 0 in
      d.last_state <- st;
      if d.ones = 6
      then (
        (* a stuffed bit: must be 0, and is dropped *)
        if bit = 1 then d.stuff_errors <- d.stuff_errors + 1 else d.stuffed <- d.stuffed + 1;
        d.ones <- 0)
      else (
        d.bits <- bit :: d.bits;
        d.ones <- (if bit = 1 then d.ones + 1 else 0)))
;;

(* One 50 MHz cycle with the bus levels. *)
let step d ~dp ~dm =
  let st = line_of ~dp ~dm in
  if not ([%equal: line] st d.prev)
  then (
    (* resynchronize: sample in the middle of the coming bit *)
    if (not d.in_packet) && [%equal: line] d.prev J && [%equal: line] st K
    then (
      d.in_packet <- true;
      d.last_state <- J);
    d.phase <- 0.;
    d.next_sample <- bit_cycles /. 2.);
  d.prev <- st;
  if d.in_packet && Float.( >= ) d.phase d.next_sample
  then (
    sample d st;
    d.next_sample <- d.next_sample +. bit_cycles);
  d.phase <- d.phase +. 1.
;;
