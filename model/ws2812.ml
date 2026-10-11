(* A chain of WS2812 LEDs on one data line, decoding the line the way the
   parts do: each high pulse is a bit, 1 if it lasts longer than [threshold]
   cycles; a low period longer than [reset] cycles latches the colours. The
   first LED keeps the first 24 bits and forwards the rest, so LED i gets
   bits 24i .. 24i+23. Also records every high-pulse width and bit period,
   so tests can check them against the datasheet. *)
open! Base

type params =
  { leds : int
  ; threshold : int (* cycles: about 625 ns, between the 0 and 1 widths *)
  ; reset : int (* cycles of low that latch: 280 us *)
  }

let default ~leds = { leds; threshold = 31; reset = 14_000 }

type t =
  { p : params
  ; mutable now : int
  ; mutable prev : bool
  ; mutable rise_at : int
  ; mutable fall_at : int (* last falling edge, or start of time *)
  ; mutable bits : int list (* newest first, since the last latch *)
  ; mutable latched : int list (* colours, LED 0 first *)
  ; mutable widths : int list (* high-pulse widths, cycles *)
  ; mutable periods : int list (* rise to rise, cycles *)
  }

let create p =
  { p
  ; now = 0
  ; prev = false
  ; rise_at = -1
  ; fall_at = 0
  ; bits = []
  ; latched = []
  ; widths = []
  ; periods = []
  }
;;

let latch d =
  let bits = List.rev d.bits in
  d.latched
  <- List.init d.p.leds ~f:(fun i ->
       List.sub bits ~pos:(24 * i) ~len:24 |> List.fold ~init:0 ~f:(fun a b -> (a lsl 1) lor b));
  d.bits <- []
;;

let step d ~din =
  let t = d.now in
  if din && not d.prev
  then (
    if d.rise_at >= 0 && not (List.is_empty d.bits) then d.periods <- (t - d.rise_at) :: d.periods;
    d.rise_at <- t);
  if (not din) && d.prev
  then (
    let w = t - d.rise_at in
    d.widths <- w :: d.widths;
    d.bits <- (if w > d.p.threshold then 1 else 0) :: d.bits;
    d.fall_at <- t);
  (* a long low period resets the chain: latch a complete frame, and in any
     case discard partial bits, as the parts do *)
  if (not din) && t - d.fall_at = d.p.reset
  then
    if List.length d.bits >= 24 * d.p.leds
    then latch d
    else (
      d.bits <- [];
      d.widths <- [];
      d.periods <- []);
  d.prev <- din;
  d.now <- t + 1
;;
