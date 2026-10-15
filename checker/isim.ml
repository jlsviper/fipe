(* A cycle-accurate model of the chip (one sequencer, its event queue, the pin
   drivers and the input synchronizer), stepped one clock cycle at a time with
   the bus levels as input. Unlike the executor, it handles reactive programs
   (WAIT, JMP Pin, JMP Flag), whose timing depends on when a device answers,
   so it can run in lockstep with device models.

   Written from the ISA definition and the architecture spec, independently
   of the Hardcaml; tests require it to match the RTL cycle for cycle before
   it is used for anything.

   Time: cycle 0 is the start cycle; the first instruction executes in cycle 1.
   In each cycle, matching the RTL:
   - the queue fires up to two head entries that are due, from its state at
     the start of the cycle; samples read the synchronized pins, which are the
     bus levels of two cycles earlier;
   - the sequencer executes (or stalls on) one instruction, from its state at
     the start of the cycle;
   - fired outputs reach the pins in the next cycle; enqueued events can fire
     from the next cycle. *)
open! Base
module Isa = Fipe_isa.Isa

let time_bits = 24
let tmask = (1 lsl time_bits) - 1
let half = 1 lsl (time_bits - 1)

let sdiff a b =
  let d = (a - b) land tmask in
  if d >= half then d - (1 lsl time_bits) else d
;;

type config =
  { data_pin : int
  ; clk_pin : int
  ; in_pin : int
  ; aux_pin : int
  ; k1 : int (* signed 8-bit *)
  ; k2 : int
  ; k3 : int
  }

let default_config = { data_pin = 0; clk_pin = 1; in_pin = 0; aux_pin = 7; k1 = 0; k2 = 0; k3 = 0 }
let start_lead = 64
let depth = 4

(* driven values, as in the RTL *)
let drive0 = 0
let drive1 = 1
let release = 2
let sample = 3

type entry =
  { due : int
  ; pin : int
  ; value : int
  }

type fire =
  { t : int
  ; pin : int
  ; value : int
  ; late : bool
  }
[@@deriving sexp, equal]

type t =
  { program : Isa.t array
  ; cfg : config
  ; mutable now : int
  ; mutable fifo : int list
  ; (* sequencer *)
    mutable pc : int
  ; mutable s : int
  ; mutable x : int
  ; mutable y : int
  ; mutable osr : int
  ; mutable coder : int
  ; mutable stuff_run : int
  ; mutable stuff_last : bool
  ; mutable crc : int
  ; mutable crc_poly : int
  ; mutable crc_wm1 : int
  ; mutable crc_inv : bool
  ; mutable crc_feed : bool
  ; mutable crc_corrupt : bool
  ; mutable prescale : int
  ; mutable k : int array (* index 1..3 *)
  ; mutable shadow_data : int
  ; mutable shadow_clk : int
  ; mutable running : bool
  ; mutable halted : bool
  ; mutable trapped : bool (* halted on a reserved instruction, as the chip *)
  ; mutable flag : bool
  ; mutable wcnt : int
  ; mutable far : bool
  ; (* queue *)
    queue : entry Queue.t
  ; mutable last_due : int option
  ; (* pins and synchronizer *)
    out : bool array
  ; oe : bool array
  ; mutable sync1 : int
  ; mutable sync2 : int
  ; (* sticky flags and observations *)
    mutable late : bool
  ; mutable order_err : bool
  ; mutable window_err : bool
  ; fires : fire Queue.t
  ; samples : (int * int) Queue.t (* cycle, bit *)
  ; mutable b : t option (* sequencer B, sharing time, memory and pins *)
  ; upper_half : bool (* B: fetches only words 32..63, as the hardware does *)
  ; mutable conflict : bool (* A and B changed one pin in one cycle *)
  }

let sext8 v =
  let v = v land 0xFF in
  if v >= 0x80 then v - 0x100 else v
;;

(* The start cycle (cycle 0): registers as the RTL leaves them at its end.
   [pins] is the bus level before start, which the synchronizer holds. *)
let rec create ?(cfg = default_config) ?(pins = 0xFF) ?(entry = 0) ?b ~fifo program =
  let m = create_lane ~upper_half:false ~cfg ~pins ~entry ~fifo program in
  (* B shares the skew registers (one SKEW register on the chip) *)
  m.b
  <- Option.map b ~f:(fun ((bcfg : config), bentry, bfifo) ->
       create_lane
         ~upper_half:true
         ~cfg:{ bcfg with k1 = cfg.k1; k2 = cfg.k2; k3 = cfg.k3 }
         ~pins
         ~entry:(bentry lor 32)
         ~fifo:bfifo
         program);
  m

and create_lane ~upper_half ~cfg ~pins ~entry ~fifo program =
  { program
  ; cfg
  ; now = 1
  ; fifo
  ; pc = entry
  ; s = start_lead
  ; x = 0
  ; y = 0
  ; osr = 0
  ; coder = 0
  ; stuff_run = 0
  ; stuff_last = false
  ; crc = 0
  ; crc_poly = 0
  ; crc_wm1 = 0
  ; crc_inv = false
  ; crc_feed = false
  ; crc_corrupt = false
  ; prescale = 0
  ; k = [| 0; sext8 cfg.k1; sext8 cfg.k2; sext8 cfg.k3 |]
  ; shadow_data = release
  ; shadow_clk = release
  ; running = true
  ; halted = false
  ; trapped = false
  ; flag = false
  ; wcnt = 0
  ; far = false
  ; queue = Queue.create ()
  ; last_due = None
  ; out = Array.create ~len:8 false
  ; oe = Array.create ~len:8 false
  ; sync1 = pins land 0xFF
  ; sync2 = pins land 0xFF
  ; late = false
  ; order_err = false
  ; window_err = false
  ; fires = Queue.create ()
  ; samples = Queue.create ()
  ; b = None
  ; upper_half
  ; conflict = false
  }
;;

let scale m v = v lsl (2 * m.prescale)

(* The level the chip itself puts on pin p: released pins read high (pull-up). *)
let own_level m p = (not m.oe.(p)) || m.out.(p)

(* One clock cycle. [pins_in] is the bus as it is during this cycle. *)
(* One lane (a sequencer and its queue) for one cycle: fires from the queue's
   state at the start of the cycle, then the sequencer, then the queue accepts
   any new entry. Returns what fired, in order; pins are updated by [step]. *)
(* The CRC unit: a serial LFSR of width wm1 + 1 over data bits, as the chip *)
let crc_mask wm1 = (1 lsl (wm1 + 1)) - 1

let crc_next m bit =
  let top = (m.crc lsr m.crc_wm1) land 1 = 1 in
  ((m.crc lsl 1) lxor if Bool.( <> ) top bit then m.crc_poly else 0) land crc_mask m.crc_wm1
;;

let lane_step m ~c ~synced =
  let pin_high p = (synced lsr p) land 1 = 1 in
  (* --- queue fires (state at start of cycle) --- *)
  let count_start = Queue.length m.queue in
  let fired = ref [] in
  let rec fire n =
    if n < 2
    then (
      match Queue.peek m.queue with
      | Some e when sdiff e.due c <= 0 ->
        ignore (Queue.dequeue_exn m.queue : entry);
        let late = sdiff e.due c < 0 in
        if late then m.late <- true;
        let f = { t = c; pin = e.pin; value = e.value; late } in
        Queue.enqueue m.fires f;
        fired := f :: !fired;
        fire (n + 1)
      | _ -> ())
  in
  fire 0;
  (* the sample log takes one bit per cycle: the first sample fired *)
  (match List.find (List.rev !fired) ~f:(fun f -> f.value = sample) with
   | Some f -> Queue.enqueue m.samples (c, if pin_high f.pin then 1 else 0)
   | None -> ());
  (* --- sequencer (state at start of cycle) --- *)
  let lead_d = sdiff m.s c in
  let caught_up = lead_d <= 0 in
  let far_next =
    let d = (m.s - c) land tmask in
    d land half = 0 && (d land (1 lsl 22) <> 0 || d land (1 lsl 21) <> 0)
  in
  let enq = ref None in
  let watching = ref false in
  if m.running
  then (
    (* unwritten program memory reads as zero, which is NOP *)
    let addr = if m.upper_half then 32 + (m.pc land 31) else m.pc in
    let ins = if addr < Array.length m.program then m.program.(addr) else Isa.Nop in
    let pin_of_sel : Isa.Wait_pin.t -> int = function
      | In -> m.cfg.in_pin
      | Data -> m.cfg.data_pin
      | Clk -> m.cfg.clk_pin
      | Aux -> m.cfg.aux_pin
    in
    let advance ?(taken = None) () =
      m.pc <- (match taken with Some a -> a | None -> m.pc + 1) land 63
    in
    match ins with
    | ins when not (Isa.implemented ins) ->
      (* reserved: the chip halts with TRAP set, before any side effect *)
      m.running <- false;
      m.halted <- true;
      m.trapped <- true
    | Evt { dt; clk_pin; cls; act } ->
      if count_start < depth && not m.far
      then (
        let open_drain = m.coder land 8 <> 0 and invert = m.coder land 4 <> 0 in
        let high = if open_drain then release else drive1 in
        let shadow = if clk_pin then m.shadow_clk else m.shadow_data in
        (* bit stuffing (as the chip): a due stuff bit is sent by this same
           Shift_out, which then executes again for the real bit *)
        let stuffing = m.coder land 16 <> 0 and can_style = m.coder land 32 <> 0 in
        let stuff_due =
          stuffing && (if can_style then m.stuff_run = 5 else m.stuff_run = 6)
        in
        let data_bit = m.osr land (1 lsl 31) <> 0 in
        (* a due stuff bit goes out before the next data-pin event of any kind *)
        let data_pin_event =
          (not clk_pin)
          &&
          match act with
          | Shift_out | Drive0 | Drive1 | Release | Toggle -> true
          | Sample | Aux0 | Aux1 -> false
        in
        let stuff_now = stuff_due && data_pin_event in
        let stuff_bit = can_style && not m.stuff_last in
        let tx_bit = if stuff_now then stuff_bit else data_bit in
        let coded b =
          let level =
            if m.coder land 1 <> 0
            then if b then shadow <> drive0 else shadow = drive0
            else Bool.( <> ) b invert
          in
          if level then high else drive0
        in
        let value =
          match act with
          | Drive0 | Aux0 -> drive0
          | Drive1 | Aux1 -> drive1
          | Release -> release
          | Toggle -> if shadow = drive0 then high else drive0
          | Shift_out -> coded data_bit
          | Sample -> sample
        in
        let value = if stuff_now then coded stuff_bit else value in
        let pin =
          match act with
          | Sample -> m.cfg.in_pin
          | Aux0 | Aux1 -> m.cfg.aux_pin
          | _ -> if clk_pin then m.cfg.clk_pin else m.cfg.data_pin
        in
        let s_evt = (m.s + scale m dt) land tmask in
        let due = (m.s + scale m (dt + m.k.(cls))) land tmask in
        enq := Some { due; pin; value };
        m.s <- s_evt;
        let is_shift =
          match act with
          | Shift_out -> true
          | _ -> false
        in
        if stuffing && (stuff_now || is_shift)
        then (
          m.stuff_run
          <- (if can_style
              then if Bool.equal tx_bit m.stuff_last then (m.stuff_run + 1) land 7 else 1
              else if tx_bit
              then (m.stuff_run + 1) land 7
              else 0);
          m.stuff_last <- tx_bit);
        if is_shift && not stuff_now
        then (
          m.osr <- (m.osr lsl 1) land 0xFFFF_FFFF;
          if m.crc_feed then m.crc <- crc_next m data_bit);
        (match act with
         | Sample | Aux0 | Aux1 -> ()
         | _ -> if clk_pin then m.shadow_clk <- value else m.shadow_data <- value);
        if not stuff_now then advance ())
    | Dly { dt } ->
      if not m.far
      then (
        m.s <- (m.s + scale m dt) land tmask;
        advance ())
    | Pull _ ->
      (match m.fifo with
       | w :: rest ->
         m.osr <- w land 0xFFFF_FFFF;
         m.fifo <- rest;
         advance ()
       | [] -> ())
    | Wait { pin; pol; timeout } ->
      let pin_match = Bool.equal (pin_high (pin_of_sel pin)) pol in
      let limit =
        match timeout with
        | Forever -> None
        | X_cycles -> Some m.x
        | Y_cycles -> Some m.y
      in
      let timed_out = Option.exists limit ~f:(fun l -> m.wcnt >= l) in
      if caught_up && (pin_match || timed_out)
      then (
        m.s <- c;
        m.flag <- not pin_match;
        advance ())
      else if caught_up
      then watching := true
    | Jmp { cond = Always; addr } when addr = m.pc ->
      m.running <- false;
      m.halted <- true
    | Jmp { cond; addr } ->
      (match cond with
       | Pin when not caught_up -> ()
       | _ ->
         let taken =
           match cond with
           | Always -> true
           | X_dec_nz ->
             if m.x <> 0
             then (
               m.x <- m.x - 1;
               true)
             else false
           | Y_dec_nz ->
             if m.y <> 0
             then (
               m.y <- m.y - 1;
               true)
             else false
           | Flag -> m.flag
           | Pin -> pin_high m.cfg.in_pin
           | Osr_empty | Isr_full | Cap_ready -> false
         in
         advance ~taken:(if taken then Some addr else None) ())
    | Set { dst; imm } ->
      (match dst with
       | X -> m.x <- imm
       | Y -> m.y <- imm
       | K1 -> m.k.(1) <- sext8 imm
       | K2 -> m.k.(2) <- sext8 imm
       | K3 -> m.k.(3) <- sext8 imm
       | Coder_mode ->
         m.coder <- imm land 0x3F;
         m.stuff_run <- 0;
         m.stuff_last <- false
       | Prescale -> m.prescale <- imm land 3
       | X_hi -> m.x <- ((imm land 0xFF) lsl 8) lor (m.x land 0xFF)
       | Y_hi -> m.y <- ((imm land 0xFF) lsl 8) lor (m.y land 0xFF)
       | Pin_dir -> ());
      advance ()
    | Crc cmd ->
      (match cmd with
       | Reset ->
         m.crc_poly <- (m.osr lsr 16) land 0xFFFF;
         m.crc_wm1 <- (m.osr lsr 12) land 15;
         m.crc_inv <- m.osr land (1 lsl 10) <> 0;
         m.crc <- (if m.osr land (1 lsl 11) <> 0 then crc_mask m.crc_wm1 else 0);
         m.crc_feed <- false;
         m.crc_corrupt <- false
       | Feed_tx -> m.crc_feed <- true
       | Arm_corrupt -> m.crc_corrupt <- true
       | Load_osr ->
         let mask = crc_mask m.crc_wm1 in
         let out =
           (m.crc lxor (if m.crc_inv then mask else 0) lxor if m.crc_corrupt then 1 else 0) land mask
         in
         m.osr <- (out lsl (15 - m.crc_wm1)) lsl 16;
         m.crc_feed <- false;
         m.crc_corrupt <- false
       | Feed_rx -> ());
      advance ()
    | Nop | Mov _ | Push _ | Sync _ | Cap _ -> advance ());
  m.wcnt <- (if !watching then (m.wcnt + 1) land 0xFFFF else 0);
  m.far <- far_next;
  (* --- queue update: accept the new entry (checks as in the RTL) --- *)
  Option.iter !enq ~f:(fun e ->
    (match m.last_due with
     | Some l when sdiff e.due l < 0 -> m.order_err <- true
     | _ -> ());
    let d = sdiff e.due c in
    if d >= 1 lsl 22 || d <= -(1 lsl 22) then m.window_err <- true;
    m.last_due <- Some e.due;
    Queue.enqueue m.queue e);
  List.rev !fired
;;

let changes_pin (f : fire) = f.value <> sample

(* One clock cycle. [pins_in] is the bus as it is during this cycle. *)
let step m ~pins_in =
  let c = m.now in
  let synced = m.sync2 in
  let fired_a = lane_step m ~c ~synced in
  let fired_b = Option.value_map m.b ~default:[] ~f:(fun b -> lane_step b ~c ~synced) in
  if List.exists fired_a ~f:(fun fa ->
       changes_pin fa && List.exists fired_b ~f:(fun fb -> changes_pin fb && fb.pin = fa.pin))
  then m.conflict <- true;
  (* pin drivers: fires take effect next cycle; B's first, then A's, so A wins *)
  List.iter (fired_b @ fired_a) ~f:(fun f ->
    if f.value = drive0 || f.value = drive1
    then (
      m.out.(f.pin) <- f.value = drive1;
      m.oe.(f.pin) <- true)
    else if f.value = release
    then m.oe.(f.pin) <- false);
  (* input synchronizer *)
  m.sync2 <- m.sync1;
  m.sync1 <- pins_in land 0xFF;
  m.now <- c + 1;
  Option.iter m.b ~f:(fun b -> b.now <- c + 1)
;;

let lane_done m = m.halted && Queue.is_empty m.queue
let done_ m = lane_done m && Option.for_all m.b ~f:lane_done
let fires m = Queue.to_list m.fires
let samples m = Queue.to_list m.samples

let b_exn m = Option.value_exn ~message:"no sequencer B" m.b
let fires_b m = fires (b_exn m)
let samples_b m = samples (b_exn m)
