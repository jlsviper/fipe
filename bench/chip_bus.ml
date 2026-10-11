(* Any program on the RTL-proven cycle simulator, against any device model, on
   a bus with pull-ups: a pin reads low if the chip drives it low or the
   device pulls it low. Same timing rules as the RTL loopback: the device sees
   the bus in cycle c, and its pulls apply from cycle c + 1. *)
open! Base
module C = Fipe_checker

type device = levels:int -> int (* bus levels this cycle -> pins to pull low next cycle *)

type result =
  { sim : C.Isim.t
  ; cycles : int
  }

let own_levels m = List.fold (List.range 0 8) ~init:0 ~f:(fun a p -> if C.Isim.own_level m p then a lor (1 lsl p) else a)

let run ?(max_cycles = 2_000_000) ?(tail = 0) ~cfg ~fifo ~(device : device) program =
  let m = C.Isim.create ~cfg ~pins:0xFF ~fifo program in
  let pull = ref 0 and c = ref 0 and after = ref 0 in
  while !after <= tail && !c < max_cycles do
    Int.incr c;
    let levels = own_levels m land lnot !pull land 0xFF in
    C.Isim.step m ~pins_in:levels;
    pull := device ~levels;
    if C.Isim.done_ m then Int.incr after
  done;
  { sim = m; cycles = !c }
;;

let sample_bits r = List.map (C.Isim.samples r.sim) ~f:snd
