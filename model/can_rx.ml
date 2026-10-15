(* A CAN 2.0A receiver at the bus, independent of FIPE. It hard-synchronizes
   on start of frame, resynchronizes on every recessive-to-dominant edge,
   samples 75% into each bit, removes bit stuffing (after five equal bits the
   next must be their complement; anything else is a stuff error), parses a
   standard data frame, recomputes CRC-15 (polynomial 0x4599, over start of
   frame to the end of data) and, if it matches, drives the ACK slot dominant
   as a real node would. Delimiters and end of frame must be recessive (form
   errors otherwise). Bus level: true = recessive. *)
open! Base

type frame =
  { id : int
  ; rtr : bool
  ; dlc : int
  ; data : int list
  ; crc_ok : bool
  ; stuffed : int
  ; stuff_errors : int
  ; form_errors : int
  ; acked : bool (* this node drove the ACK *)
  }
[@@deriving sexp]

type region =
  | Idle
  | Stuffed (* start of frame to the end of the CRC *)
  | Tail of int (* bits after the CRC: delimiter, ACK, delimiter, end of frame *)

type t =
  { bit : int
  ; mutable region : region
  ; mutable phase : int
  ; mutable prev : bool
  ; mutable bits : int list (* destuffed, oldest first *)
  ; mutable run : int
  ; mutable last : int
  ; mutable stuff_next : bool (* the next bit is a stuff bit *)
  ; mutable stuffed : int
  ; mutable stuff_errors : int
  ; mutable form_errors : int
  ; mutable crc_ok : bool
  ; mutable ack_from : int option
  ; mutable acked : bool
  ; mutable now : int
  ; mutable frames : frame list
  }

let create ?(bit = 100) () =
  { bit
  ; region = Idle
  ; phase = 0
  ; prev = true
  ; bits = []
  ; run = 0
  ; last = -1
  ; stuff_next = false
  ; stuffed = 0
  ; stuff_errors = 0
  ; form_errors = 0
  ; crc_ok = false
  ; ack_from = None
  ; acked = false
  ; now = 0
  ; frames = []
  }
;;

let crc15 bits =
  List.fold bits ~init:0 ~f:(fun crc b ->
    let top = (crc lsr 14) land 1 in
    ((crc lsl 1) lxor if top lxor b = 1 then 0x4599 else 0) land 0x7FFF)
;;

let field bits lo len = List.fold (List.sub bits ~pos:lo ~len) ~init:0 ~f:(fun a b -> (a lsl 1) lor b)

let frame_bits d =
  (* header 19 bits, then 8 x min(dlc, 8) data bits, then 15 CRC bits *)
  if List.length d.bits < 19 then None else Some (19 + (8 * min 8 (field d.bits 15 4)) + 15)
;;

let finish d =
  let b = d.bits in
  let dlc = field b 15 4 in
  let n = min 8 dlc in
  d.frames
  <- d.frames
     @ [ { id = field b 1 11
         ; rtr = field b 12 1 = 1
         ; dlc
         ; data = List.init n ~f:(fun k -> field b (19 + (8 * k)) 8)
         ; crc_ok = d.crc_ok
         ; stuffed = d.stuffed
         ; stuff_errors = d.stuff_errors
         ; form_errors = d.form_errors
         ; acked = d.acked
         }
       ];
  d.region <- Idle;
  d.bits <- [];
  d.run <- 0;
  d.last <- -1;
  d.stuff_next <- false;
  d.stuffed <- 0;
  d.stuff_errors <- 0;
  d.form_errors <- 0;
  d.acked <- false;
  d.ack_from <- None
;;

let sample d level =
  let v = Bool.to_int level in
  match d.region with
  | Idle -> ()
  | Stuffed ->
    if d.stuff_next
    then (
      if v = d.last then d.stuff_errors <- d.stuff_errors + 1 else d.stuffed <- d.stuffed + 1;
      d.stuff_next <- false;
      d.last <- v;
      d.run <- 1;
      (* the stuffed region ends with the CRC: a stuff bit owed after its last
         bit has just been consumed *)
      match frame_bits d with
      | Some total when List.length d.bits = total -> d.region <- Tail 0
      | _ -> ())
    else (
      d.bits <- d.bits @ [ v ];
      d.run <- (if v = d.last then d.run + 1 else 1);
      d.last <- v;
      if d.run = 5 then d.stuff_next <- true;
      match frame_bits d with
      | Some total when List.length d.bits = total ->
        let data_end = total - 15 in
        d.crc_ok <- crc15 (List.take d.bits data_end) = field d.bits data_end 15;
        if not d.stuff_next then d.region <- Tail 0
      | _ -> ())
  | Tail k ->
    (* 0 CRC delimiter, 1 ACK slot, 2 ACK delimiter, 3..9 end of frame *)
    if k <> 1 && not level then d.form_errors <- d.form_errors + 1;
    if k = 0 && d.crc_ok
    then (
      (* drive the ACK slot, which starts a quarter bit from now *)
      d.ack_from <- Some (d.now + (d.bit / 4));
      d.acked <- true);
    if k = 9 then finish d else d.region <- Tail (k + 1)
;;

(* One cycle; returns whether this node drives the bus dominant. *)
let step d ~bus =
  (match d.region with
   | Idle when d.prev && not bus ->
     (* start of frame: hard synchronization *)
     d.region <- Stuffed;
     d.phase <- 0
   | Stuffed when d.prev && not bus -> d.phase <- 0 (* resynchronize *)
   | _ -> ());
  d.prev <- bus;
  (match d.region with
   | Idle -> ()
   | _ ->
     if d.phase = d.bit * 3 / 4 then sample d bus;
     d.phase <- (if d.phase + 1 >= d.bit then 0 else d.phase + 1));
  d.now <- d.now + 1;
  match d.ack_from with
  | Some t0 when d.now >= t0 && d.now < t0 + d.bit -> true
  | _ -> false
;;
