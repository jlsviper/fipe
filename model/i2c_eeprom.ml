(* An I2C EEPROM, modelled cycle by cycle at the bus, with the failure
   mechanisms real parts have. It is the device the measured-datasheet sweep
   characterizes, so its parameters are the hidden "truth" the sweep must
   recover from the pins alone.

   Mechanisms (all in clock cycles):
   - [scl_fall_delay]: an input filter; the device sees SCL fall this late. If
     SDA moves inside that window, the device sees SDA move while SCL is high:
     a START or STOP that was never sent. This is the 300 ns internal hold real
     parts provide, and why t_HD_DAT matters.
   - [su_dat_min]: if SDA changed less than this before SCL rises, the device
     latches the old bit.
   - [hd_sta_min]: a START only counts if SCL (as seen) falls at least this long
     after it.
   - [su_sto_min]: a STOP only counts if SDA rises at least this long after SCL
     rose.
   - [t_vd_ack], [t_hd_ack]: when the ACK is asserted after the 8th SCL fall and
     released after the 9th.
   - [t_wr]: after a recognized STOP ends a write, the part is busy this long
     and NACKs its address (so "ACK polling" proves the write started).

   Protocol: write only. START, address byte (addr << 1), memory address byte,
   data bytes, STOP. A write commits only on a recognized STOP at a byte
   boundary. *)
open! Base

type params =
  { addr : int
  ; scl_fall_delay : int
  ; su_dat_min : int
  ; hd_sta_min : int
  ; su_sto_min : int
  ; t_vd_ack : int
  ; t_hd_ack : int
  ; t_wr : int
  }
[@@deriving sexp]

(* At 50 MHz: 300 ns filter, 100 ns setup, 1.2 us START hold, 1.0 us STOP
   setup, 800 ns ACK valid, 200 ns ACK hold, 400 us write cycle. *)
let default =
  { addr = 0x50
  ; scl_fall_delay = 15
  ; su_dat_min = 5
  ; hd_sta_min = 60
  ; su_sto_min = 50
  ; t_vd_ack = 40
  ; t_hd_ack = 10
  ; t_wr = 20_000
  }
;;

type state =
  | Idle
  | Start_seen of int (* time of START *)
  | Recv
  | Ack_wait of int (* assert ACK at *)
  | Ack_hold
  | Ack_release of int (* release at *)
  | Ignore (* not addressed, or START not recognized: wait for next START *)
[@@deriving sexp]

type t =
  { p : params
  ; mutable now : int
  ; mutable scl_v : bool (* SCL as the device sees it *)
  ; mutable scl_v_prev : bool
  ; mutable fall_pending : int option
  ; mutable sda_prev : bool
  ; mutable sda_old : bool
  ; mutable sda_change_t : int
  ; mutable last_scl_rise : int
  ; mutable state : state
  ; mutable nbit : int
  ; mutable shift : int
  ; mutable bytes : int list (* this transaction, newest first *)
  ; mutable pull : bool
  ; mutable busy_until : int
  ; memory : (int, int) Hashtbl.t
  ; mutable log : string list (* newest first *)
  }

let create p =
  { p
  ; now = 0
  ; scl_v = true
  ; scl_v_prev = true
  ; fall_pending = None
  ; sda_prev = true
  ; sda_old = true
  ; sda_change_t = -1_000_000
  ; last_scl_rise = -1_000_000
  ; state = Idle
  ; nbit = 0
  ; shift = 0
  ; bytes = []
  ; pull = false
  ; busy_until = -1
  ; memory = Hashtbl.create (module Int)
  ; log = []
  }
;;

let note d s = d.log <- Printf.sprintf "%7d %s" d.now s :: d.log

let commit d =
  match List.rev d.bytes with
  | _addr :: mem :: data when not (List.is_empty data) ->
    List.iteri data ~f:(fun i v -> Hashtbl.set d.memory ~key:((mem + i) land 0xFF) ~data:v);
    d.busy_until <- d.now + d.p.t_wr;
    note d (Printf.sprintf "STOP: write committed, %d byte(s) at 0x%02x" (List.length data) mem)
  | _ -> note d "STOP: nothing to commit"
;;

(* One clock cycle. Takes the bus levels, returns whether the device pulls SDA
   low during the next cycle. *)
let step d ~scl ~sda =
  let t = d.now in
  (* input filter on SCL: rises seen at once, falls [scl_fall_delay] late *)
  if scl
  then (
    d.scl_v <- true;
    d.fall_pending <- None)
  else (
    (match d.fall_pending with
     | None when d.scl_v -> d.fall_pending <- Some t
     | _ -> ());
    match d.fall_pending with
    | Some tf when t - tf >= d.p.scl_fall_delay ->
      d.scl_v <- false;
      d.fall_pending <- None
    | _ -> ());
  let scl_rise = d.scl_v && not d.scl_v_prev in
  let scl_fall = (not d.scl_v) && d.scl_v_prev in
  let scl_high = d.scl_v && d.scl_v_prev in
  let sda_rise = sda && not d.sda_prev in
  let sda_fall = (not sda) && d.sda_prev in
  if Bool.( <> ) sda d.sda_prev
  then (
    d.sda_old <- d.sda_prev;
    d.sda_change_t <- t);
  if scl_rise then d.last_scl_rise <- t;
  (* START and STOP: SDA moving while SCL is high (as seen) *)
  if sda_fall && scl_high && not d.pull
  then (
    d.state <- Start_seen t;
    d.nbit <- 0;
    d.shift <- 0;
    d.bytes <- [];
    note d "START seen")
  else if sda_rise && scl_high && not d.pull
  then
    if t - d.last_scl_rise >= d.p.su_sto_min
    then (
      (* a STOP's own SCL rise looks like the first bit of a next byte; a real
         part discards that partial bit, so the boundary is nbit 0 or 1 *)
      (match d.state with
       | Recv when d.nbit <= 1 -> commit d
       | _ -> note d "STOP: transaction incomplete");
      d.state <- Idle)
    else note d "STOP not recognized (setup too short)";
  (* bits, sampled on SCL rise with the setup requirement *)
  if scl_rise
  then (
    match d.state with
    | Recv ->
      let bit = if t - d.sda_change_t >= d.p.su_dat_min then sda else d.sda_old in
      d.shift <- (d.shift lsl 1) lor if bit then 1 else 0;
      d.nbit <- d.nbit + 1
    | _ -> ());
  if scl_fall
  then (
    match d.state with
    | Start_seen ts ->
      if t - ts >= d.p.hd_sta_min
      then d.state <- Recv
      else (
        d.state <- Ignore;
        note d "START not recognized (hold too short)")
    | Recv when d.nbit = 8 ->
      let byte = d.shift land 0xFF in
      d.bytes <- byte :: d.bytes;
      d.nbit <- 0;
      d.shift <- 0;
      if List.length d.bytes = 1 && byte <> d.p.addr lsl 1
      then (
        d.state <- Ignore;
        note d (Printf.sprintf "address 0x%02x: not mine, NACK" byte))
      else if List.length d.bytes = 1 && t < d.busy_until
      then (
        d.state <- Ignore;
        note d "address: busy writing, NACK")
      else d.state <- Ack_wait (t + d.p.t_vd_ack)
    | Ack_hold -> d.state <- Ack_release (t + d.p.t_hd_ack)
    | _ -> ());
  (* drive the ACK *)
  (match d.state with
   | Ack_wait at when t >= at ->
     d.pull <- true;
     d.state <- Ack_hold
   | Ack_release at when t >= at ->
     d.pull <- false;
     d.state <- Recv
   | _ -> ());
  d.scl_v_prev <- d.scl_v;
  d.sda_prev <- sda;
  d.now <- t + 1;
  d.pull
;;
