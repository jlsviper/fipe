(* An ARM Serial Wire Debug port (ADIv5 SW-DP) at its pins: enough to answer a
   read of its ID register, DPIDR, with any acknowledge.

   The port ignores everything until a line reset: at least 50 SWCLK rising
   edges with SWDIO high, then a rising edge with SWDIO low. It samples SWDIO
   on rising edges. A request is 8 bits, LSB first: start (1), APnDP, RnW, A2,
   A3, parity (even, over the four), stop (0), park (1); a malformed request is
   ignored. Then one turnaround clock, and the port drives its 3-bit
   acknowledge (OK 1 0 0, WAIT 0 1 0, FAULT 0 0 1, in wire order), changing
   SWDIO [t_out] cycles after each rising edge. An OK read of DPIDR follows
   with 32 data bits LSB first and an even parity bit; then the port releases
   SWDIO for the turnaround back to the host. *)
open! Base

type ack =
  | Ok
  | Wait
  | Fault
  | Absent (* never drives: nothing on the bus *)
[@@deriving sexp, equal]

type t =
  { ack : ack
  ; dpidr : int
  ; t_out : int
  ; mutable now : int
  ; mutable prev_clk : bool
  ; mutable high_run : int (* rising edges with SWDIO high, for line reset *)
  ; mutable reset : bool (* a line reset has been seen *)
  ; mutable req : int list (* request bits so far, oldest first *)
  ; mutable plan : bool option list (* per coming rising edge: drive bit, or release *)
  ; mutable pending : (int * bool option) option (* output change: at cycle, to *)
  ; mutable drive : bool option
  ; mutable requests : int (* valid requests answered *)
  ; mutable malformed : int
  }

let create ?(ack = Ok) ?(dpidr = 0x2BA01477) ?(t_out = 5) () =
  { ack
  ; dpidr
  ; t_out
  ; now = 0
  ; prev_clk = false
  ; high_run = 0
  ; reset = false
  ; req = []
  ; plan = []
  ; pending = None
  ; drive = None
  ; requests = 0
  ; malformed = 0
  }
;;

let parity v = Int.popcount v land 1

let on_rise d ~io =
  (* line reset: 50 or more highs, then a low *)
  if io
  then d.high_run <- d.high_run + 1
  else (
    if d.high_run >= 50
    then (
      d.reset <- true;
      d.req <- [];
      d.plan <- []);
    d.high_run <- 0);
  match d.plan with
  | next :: rest ->
    (* in a response: the coming bit (or release) after this edge *)
    d.plan <- rest;
    d.pending <- Some (d.now + d.t_out, next)
  | [] ->
    if d.reset && (io || not (List.is_empty d.req))
    then (
      d.req <- d.req @ [ Bool.to_int io ];
      if List.length d.req = 8
      then (
        let b = Array.of_list d.req in
        d.req <- [];
        let body = b.(1) lor (b.(2) lsl 1) lor (b.(3) lsl 2) lor (b.(4) lsl 3) in
        let ok = b.(0) = 1 && b.(6) = 0 && b.(7) = 1 && b.(5) = parity body in
        if not ok
        then d.malformed <- d.malformed + 1
        else (
          d.requests <- d.requests + 1;
          let read_dpidr = b.(1) = 0 && b.(2) = 1 && b.(3) = 0 && b.(4) = 0 in
          let bits3 = function
            | Ok -> [ true; false; false ]
            | Wait -> [ false; true; false ]
            | Fault | Absent -> [ false; false; true ]
          in
          let data =
            if equal_ack d.ack Ok && read_dpidr
            then List.init 32 ~f:(fun k -> (d.dpidr lsr k) land 1 = 1) @ [ parity d.dpidr = 1 ]
            else []
          in
          (* edge after park: turnaround (no drive); then ACK, data; release *)
          d.plan <-
            (if equal_ack d.ack Absent
             then []
             else None :: List.map (bits3 d.ack @ data) ~f:Option.some @ [ None ]))))
;;

(* One cycle: the bus levels during it; returns what the port drives on SWDIO
   (None: released). *)
let step d ~swclk ~swdio =
  if swclk && not d.prev_clk then on_rise d ~io:swdio;
  d.prev_clk <- swclk;
  (match d.pending with
   | Some (at, v) when d.now >= at ->
     d.drive <- v;
     d.pending <- None
   | _ -> ());
  d.now <- d.now + 1;
  d.drive
;;
