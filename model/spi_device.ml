(* An SPI device answering READ ID (0x9F) with three ID bytes, modelled cycle
   by cycle at its pins, with failure modes reported from real silicon by a
   former Maxim IC design lead:

   - [min_phase]: the device samples SCLK with its own internal clock; a high
     or low phase shorter than this many cycles is missed. The ordinary
     high-frequency limit.
   - [mode0_only]: the design assumes SCLK idles low. If SCLK is high when CS
     falls, the device never starts ("only mode 0 works; we deleted the other
     modes from the datasheet").
   - [idle_timeout]: a bus watchdog that resets the bit counter when SCLK has
     not moved for this many cycles while CS is low. Set too short, the part
     fails at LOW frequency ("would not work below half the master
     frequency").

   - [change_after_rise]: None for a standard slave, which changes MISO on
     SCLK falling edges. [Some n] models a slave built from master IP that
     changes MISO n cycles after each RISING edge instead. The spec is vague
     on whether that is allowed; it works with masters that sample on the
     rising edge and fails with masters that sample on the falling edge
     ("late sampling"), whatever the frequency. A real case: an FPGA SPI slave
     IP and an FTDI cable sampling on the falling edge in mode 0.

   Logic: MOSI is sampled on SCLK rising edges and MISO changes on falling
   edges, the edges SPI modes 0 and 3 share. Modes 1 and 2 use the opposite
   edges, so a mode 0/3 device misreads them. *)
open! Base

type params =
  { id : int (* 24-bit ID, sent MSB first *)
  ; min_phase : int
  ; mode0_only : bool
  ; idle_timeout : int option
  ; change_after_rise : int option
  }
[@@deriving sexp]

(* At 50 MHz: 60 ns minimum phase, modes 0 and 3, no watchdog. *)
let typical =
  { id = 0xC22016
  ; min_phase = 3
  ; mode0_only = false
  ; idle_timeout = None
  ; change_after_rise = None
  }
;;

type state =
  | Idle
  | Cmd
  | Resp
  | Ignore
[@@deriving sexp]

type t =
  { p : params
  ; mutable now : int
  ; mutable raw_prev : bool
  ; mutable stable_for : int
  ; mutable view : bool (* SCLK as the device's internal sampler sees it *)
  ; mutable cs_prev : bool
  ; mutable state : state
  ; mutable nbit : int
  ; mutable cmd : int
  ; mutable out : int
  ; mutable miso : bool option (* None: released *)
  ; mutable last_edge : int
  ; mutable pending : int option (* cycle at which the next MISO bit appears *)
  ; mutable log : string list
  }

let create p =
  { p
  ; now = 0
  ; raw_prev = false
  ; stable_for = 0
  ; view = false
  ; cs_prev = true
  ; state = Idle
  ; nbit = 0
  ; cmd = 0
  ; out = 0
  ; miso = None
  ; last_edge = 0
  ; pending = None
  ; log = []
  }
;;

let note d s = d.log <- Printf.sprintf "%7d %s" d.now s :: d.log

(* One clock cycle: bus levels in, MISO drive out (None = released). *)
let step d ~cs ~sclk ~mosi =
  let t = d.now in
  (* internal sampler: a new SCLK level counts once stable for min_phase *)
  if Bool.equal sclk d.raw_prev then d.stable_for <- d.stable_for + 1 else d.stable_for <- 1;
  d.raw_prev <- sclk;
  let prev_view = d.view in
  if d.stable_for >= d.p.min_phase then d.view <- sclk;
  let rise = d.view && not prev_view in
  let fall = (not d.view) && prev_view in
  (* chip select *)
  if (not cs) && d.cs_prev
  then
    if d.p.mode0_only && d.view
    then (
      d.state <- Ignore;
      note d "CS fell with SCLK high: not started (mode 0 only)")
    else (
      d.state <- Cmd;
      d.nbit <- 0;
      d.cmd <- 0;
      d.last_edge <- t);
  if cs && not d.cs_prev
  then (
    d.state <- Idle;
    d.miso <- None);
  d.cs_prev <- cs;
  if not cs
  then (
    if rise || fall then d.last_edge <- t;
    (match d.p.idle_timeout, d.state with
     | Some limit, (Cmd | Resp) when t - d.last_edge > limit ->
       note d "watchdog: SCLK idle too long, bit counter reset";
       d.state <- Cmd;
       d.nbit <- 0;
       d.cmd <- 0;
       d.miso <- None;
       d.last_edge <- t
     | _ -> ());
    match d.state with
    | Cmd when rise ->
      d.cmd <- ((d.cmd lsl 1) lor if mosi then 1 else 0) land 0xFF;
      d.nbit <- d.nbit + 1;
      if d.nbit = 8
      then
        if d.cmd = 0x9F
        then (
          d.state <- Resp;
          d.out <- d.p.id;
          Option.iter d.p.change_after_rise ~f:(fun n -> d.pending <- Some (t + n)))
        else (
          d.state <- Ignore;
          note d (Printf.sprintf "unknown command 0x%02x" d.cmd))
    | Resp when fall && Option.is_none d.p.change_after_rise ->
      d.miso <- Some (d.out land 0x800000 <> 0);
      d.out <- (d.out lsl 1) land 0xFFFFFF
    | Resp when rise ->
      Option.iter d.p.change_after_rise ~f:(fun n -> d.pending <- Some (t + n))
    | _ -> ());
    (* the after-rise slave shifts when its fixed delay expires *)
    (match d.pending with
     | Some at when t >= at && Poly.equal d.state Resp ->
       d.miso <- Some (d.out land 0x800000 <> 0);
       d.out <- (d.out lsl 1) land 0xFFFFFF;
       d.pending <- None
     | _ -> ());
  d.now <- t + 1;
  d.miso
;;
