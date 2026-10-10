(* A UART echo device, modelled at its pins with its own baud clock, the way
   a microcontroller UART behaves:
   - its bit period [bit] (in our clock cycles, a float) can be off from
     nominal, as a real oscillator is;
   - it polls the line 16 times per bit; a low poll starts a frame, confirmed
     if the line is still low half a bit later;
   - it samples data bit i at [(i + sample_point) * bit] after the detected
     start (i = 1..8, LSB first) and the stop bit at [(9 + sample_point) * bit];
   - a byte with a valid (high) stop bit is echoed after [reply_delay] cycles,
     transmitted at its own bit period; a framing error is dropped silently.
   The tolerance of a real UART to the sender's baud rate comes from exactly
   these mechanisms, so sweeping our baud rate measures them. *)
open! Base

type params =
  { bit : float
  ; sample_point : float
  ; reply_delay : int
  }
[@@deriving sexp]

let nominal ~bit = { bit; sample_point = 0.5; reply_delay = 200 }

type rx =
  | Idle
  | Confirming of float (* start detected at *)
  | Receiving of float * int * int (* start, next bit index 1..9, data *)

type t =
  { p : params
  ; mutable now : int
  ; mutable next_poll : float
  ; mutable rx : rx
  ; mutable tx_queue : (float * bool) list (* scheduled line levels: time, level *)
  ; mutable line : bool (* our output, the chip's RX *)
  ; mutable received : int list (* newest first *)
  ; mutable framing_errors : int
  }

let create p =
  { p
  ; now = 0
  ; next_poll = 0.
  ; rx = Idle
  ; tx_queue = []
  ; line = true
  ; received = []
  ; framing_errors = 0
  }
;;

let schedule_echo d ~at byte =
  let b = d.p.bit in
  let levels =
    (at, false)
    :: List.init 8 ~f:(fun i -> at +. (Float.of_int (i + 1) *. b), (byte lsr i) land 1 = 1)
    @ [ at +. (9. *. b), true ]
  in
  d.tx_queue <- d.tx_queue @ levels
;;

(* One clock cycle: [rx_line] is the line we receive on (the chip's TX).
   Returns the level we drive on the chip's RX. *)
let step d ~rx_line =
  let t = Float.of_int d.now in
  (* receiver: polled 16 times per bit, and sampled at scheduled points *)
  (match d.rx with
   | Idle ->
     if Float.( >= ) t d.next_poll
     then (
       let poll = d.next_poll in
       d.next_poll <- poll +. (d.p.bit /. 16.);
       if not rx_line then d.rx <- Confirming poll)
   | Confirming start ->
     if Float.( >= ) t (start +. (d.p.bit /. 2.))
     then d.rx <- (if rx_line then Idle else Receiving (start, 1, 0))
   | Receiving (start, i, data) ->
     if Float.( >= ) t (start +. ((Float.of_int i +. d.p.sample_point) *. d.p.bit))
     then
       if i <= 8
       then d.rx <- Receiving (start, i + 1, data lor ((if rx_line then 1 else 0) lsl (i - 1)))
       else (
         if rx_line
         then (
           d.received <- data :: d.received;
           schedule_echo d ~at:(t +. Float.of_int d.p.reply_delay) data)
         else d.framing_errors <- d.framing_errors + 1;
         d.rx <- Idle;
         d.next_poll <- t));
  (* transmitter *)
  let rec drain () =
    match d.tx_queue with
    | (at, lvl) :: rest when Float.( <= ) at t ->
      d.line <- lvl;
      d.tx_queue <- rest;
      drain ()
    | _ -> ()
  in
  drain ();
  d.now <- d.now + 1;
  d.line
;;
