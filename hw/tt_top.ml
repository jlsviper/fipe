(* Tiny Tapeout top: tt_um_jlsviper_fipe.

   Pins (spec, Capture unit and host interface):
     ui_in[0] CFG_SCK   ui_in[1] CFG_CS_n   ui_in[2] CFG_MOSI   ui_in[7:3] IN0..IN4
     uo_out[7] CFG_MISO   uo_out[6] TRIG_OUT (monitor violation pulse)
     uo_out[5:0] status: halted, late, order, monitor violation (sticky),
                 sample valid, sample bit
     uo_out[6:0] are registered: one cycle behind the internal signals.
     uio[7:0]  P0..P7, bidirectional protocol pins (open-drain via output enable)

   Register map (7-bit address; W = write, R = read):
     0x00-0x3F W  program memory word (data bits 15..0)
     0x40      W  CTRL: bit 0 start A, bit 1 clear monitors, bit 2 clear sample
                  logs, bit 3 start B (bits 0 and 3 together: same cycle),
                  bit 4 clear FRAME
     0x41      RW PINS: data pin [2:0], clock pin [5:3], input pin [8:6],
                  auxiliary pin [11:9]
     0x42      RW SKEW: K1 [7:0], K2 [15:8], K3 [23:16] (signed)
     0x43      W  push one word into the 4-deep host data FIFO
     0x44      R  STATUS: [0] halted [1] late [2] order [3] window
                  [6:4] queue count [10:8] FIFO count [21:16] samples logged
                  [7] TRAP (halted on an illegal or reserved instruction; the
                  debug PC shows where) [27:24] monitor violations (sticky)
                  [28] ena [29] CONFLICT [30] FRAME [31] unused
     0x45      R  SAMPLES: last 32 sampled bits, newest in bit 0
     0x46      R  INPUTS: IN0..IN4 levels [4:0]
     0x47      RW ENTRY: sequencer A start address [5:0], B [13:8]
     0x48+3s   RW monitor slot s, word A: [0] keep_first [10:1] start trigger
                  [20:11] stop trigger [21] abort enable [31:22] abort trigger
                  (trigger: [2:0] pin [4:3] edge [5] qualifier enable
                   [8:6] qualifier pin [9] qualifier level)
     0x49+3s   RW monitor slot s, word B: min cycles [15:0], max cycles [31:16]
     0x4A+3s   RW monitor slot s, word C: [0] enable [1] min enable [2] max enable
                  [3] start, [4] stop, [5] abort: device edges only
                  [7:6] prescale: tick every 1, 16, 256, 4096 cycles
     0x58+s    R  monitor slot s: min seen [15:0], max seen [31:16]
     0x5C      R  monitor counts: slot s in bits [8s+7:8s]
     0x60      R  DEBUG: [5:0] program counter [6] running [7] halted [8] flag
                  [14:12] queue count
     0x61      R  DEBUG: schedule time S [23:0]
     0x62      R  DEBUG: timebase T [23:0]
     0x63      R  DEBUG: X [15:0], Y [31:16]
     0x64      RW PINS_B: sequencer B's pin roles, as PINS
     0x65      R  STATUS_B: B's halted, late, order, window, queue, FIFO and
                  sample counts, in STATUS's layout; [29] conflict
     0x66      W  push one word into B's 4-deep host data FIFO
     0x67      R  SAMPLES_B: B's last 32 sampled bits, newest in bit 0
     0x68      R  DEBUG_B: B's program counter, running, halted, flag, queue
     0x69      R  DEBUG_B: B's schedule time S
     0x6A      R  DEBUG_B: B's X [15:0], Y [31:16]
   STATUS [29] (and STATUS_B [29]): CONFLICT, A and B changed the same pin
   in one cycle (A wins); sticky until either sequencer starts.
   STATUS [30]: FRAME, a host SPI frame was not exactly 40 clocks (overrun, or
   deselected early); sticky until CTRL bit 4.
     0x7F      R  ID: 0x46495045, ASCII "FIPE" *)
open! Base
open Hardcaml
open Signal

let name = "tt_um_jlsviper_fipe"
let id = 0x46495045

module I = struct
  type 'a t =
    { clk : 'a
    ; rst_n : 'a
    ; ena : 'a
    ; ui_in : 'a [@bits 8]
    ; uio_in : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { uo_out : 'a [@bits 8]
    ; uio_out : 'a [@bits 8]
    ; uio_oe : 'a [@bits 8]
    }
  [@@deriving sexp_of, hardcaml]
end

(* Addresses, looked up by name in the one register map (hw/regmap.ml) *)
module Reg = struct
  let a = Regmap.addr
  let ctrl = a "CTRL"
  let pins = a "PINS"
  let skew = a "SKEW"
  let fifo = a "FIFO"
  let status = a "STATUS"
  let samples = a "SAMPLES"
  let inputs = a "INPUTS"
  let entry = a "ENTRY"
  let mon_cfg = a "MON0_A" (* + 3s + word *)
  let mon_seen = a "MON0_SEEN" (* + s *)
  let mon_counts = a "MON_COUNTS"
  let dbg_state = a "DEBUG"
  let dbg_s = a "DEBUG_S"
  let dbg_t = a "DEBUG_T"
  let dbg_xy = a "DEBUG_XY"
  let pins_b = a "PINS_B"
  let status_b = a "STATUS_B"
  let fifo_b = a "FIFO_B"
  let samples_b = a "SAMPLES_B"
  let dbg_b_state = a "DEBUG_B"
  let dbg_b_s = a "DEBUG_B_S"
  let dbg_b_xy = a "DEBUG_B_XY"
  let id = a "ID"
end

let create (i : _ I.t) : _ O.t =
  (* rst_n comes from a pin, asynchronous to clk, but the whole design uses
     synchronous clears. Two un-reset flip-flops synchronize it, so reset
     asserts and releases on a clock edge and every flip-flop sees the same
     cycle. Assertion and release are delayed by two cycles. *)
  let sync_spec = Reg_spec.create ~clock:i.clk () in
  let rst_n_sync = reg sync_spec (reg sync_spec i.rst_n) in
  let clear = ~:rst_n_sync in
  let spec = Reg_spec.create ~clock:i.clk ~clear () in
  (* IN0..IN4 and ena are asynchronous too: synchronize before any logic *)
  let sync2 x = reg sync_spec (reg sync_spec x) in
  let in_sync = sync2 (select i.ui_in 7 3) in
  let ena_sync = sync2 i.ena in
  let rdata = wire 32 in
  let frame_err_clear = wire 1 in
  let spi =
    Host_spi.create
      { clock = i.clk
      ; clear
      ; sck = bit i.ui_in 0
      ; cs_n = bit i.ui_in 1
      ; mosi = bit i.ui_in 2
      ; rdata
      ; frame_err_clear
      }
  in
  let wr a = spi.wr_strobe &: (spi.addr ==:. a) in
  let wd = spi.wdata in
  let rw_reg a w = reg spec ~enable:(wr a) (select wd (w - 1) 0) in
  (* control strobes *)
  let ctrl = wr Reg.ctrl in
  let start = ctrl &: bit wd 0 in
  let mon_clear = ctrl &: bit wd 1 in
  let sample_clear = ctrl &: bit wd 2 in
  let start_b = ctrl &: bit wd 3 in
  frame_err_clear <== (ctrl &: bit wd 4);
  let pins = rw_reg Reg.pins 12 in
  let pins_b = rw_reg Reg.pins_b 12 in
  let entry = rw_reg Reg.entry 14 in
  let skew = rw_reg Reg.skew 24 in
  (* host data FIFOs, 4 x 32, one per sequencer *)
  let open Always in
  let make_fifo ~push =
    let pop = wire 1 in
    let fcount = Variable.reg spec ~width:3 in
    let frp = Variable.reg spec ~width:2 in
    let fwp = Variable.reg spec ~width:2 in
    let fmem = Array.init 4 ~f:(fun _ -> Variable.reg spec ~width:32) in
    let push_ok = push &: (fcount.value <:. 4) in
    let pop_ok = pop &: (fcount.value >:. 0) in
    compile
      ([ when_ push_ok [ fwp <-- fwp.value +:. 1 ]
       ; when_ pop_ok [ frp <-- frp.value +:. 1 ]
       ; fcount <-- fcount.value +: uresize push_ok 3 -: uresize pop_ok 3
       ]
       @ List.init 4 ~f:(fun k -> when_ (push_ok &: (fwp.value ==:. k)) [ fmem.(k) <-- wd ]));
    fcount.value, mux frp.value (Array.to_list fmem |> List.map ~f:(fun v -> v.value)), pop
  in
  let fcount, fifo_head, fifo_pop = make_fifo ~push:(wr Reg.fifo) in
  let fcount_b, fifo_head_b, fifo_pop_b = make_fifo ~push:(wr Reg.fifo_b) in
  (* the core *)
  let core =
    Core.create
      { clock = i.clk
      ; clear
      ; start
      ; start_b
      ; entry_a = select entry 5 0
      ; entry_b = select entry 13 8
      ; imem_we = spi.wr_strobe &: (spi.addr <:. 64)
      ; imem_addr = select spi.addr 5 0
      ; imem_data = select wd 15 0
      ; fifo_valid = fcount >:. 0
      ; fifo_data = fifo_head
      ; fifo_b_valid = fcount_b >:. 0
      ; fifo_b_data = fifo_head_b
      ; cfg_data_pin = select pins 2 0
      ; cfg_clk_pin = select pins 5 3
      ; cfg_in_pin = select pins 8 6
      ; cfg_aux_pin = select pins 11 9
      ; cfg_b_data_pin = select pins_b 2 0
      ; cfg_b_clk_pin = select pins_b 5 3
      ; cfg_b_in_pin = select pins_b 8 6
      ; cfg_b_aux_pin = select pins_b 11 9
      ; cfg_k1 = select skew 7 0
      ; cfg_k2 = select skew 15 8
      ; cfg_k3 = select skew 23 16
      ; pins_in = i.uio_in
      }
  in
  fifo_pop <== core.fifo_ready;
  fifo_pop_b <== core.fifo_b_ready;
  (* sample logs, one per sequencer *)
  let make_log ~clear_now ~valid ~bit_in =
    let samples =
      reg_fb spec ~width:32 ~f:(fun q ->
        mux2 clear_now (zero 32) (mux2 valid (lsbs q @: bit_in) q))
    in
    let count =
      reg_fb spec ~width:6 ~f:(fun q ->
        mux2 clear_now (zero 6) (mux2 (valid &: (q <>:. 63)) (q +:. 1) q))
    in
    samples, count
  in
  let samples, sample_count =
    make_log ~clear_now:(sample_clear |: start) ~valid:core.sample_valid ~bit_in:core.sample_bit
  in
  let samples_b, sample_count_b =
    make_log
      ~clear_now:(sample_clear |: start_b)
      ~valid:core.sample_valid_b
      ~bit_in:core.sample_bit_b
  in
  (* monitors, configured through registers *)
  let n = Monitors.n_slots in
  (* words A and B use all 32 bits; word C stores only its 8 defined bits *)
  let cfg s w = uresize (rw_reg (Reg.mon_cfg + (3 * s) + w) (if w = 2 then 8 else 32)) 32 in
  let words = List.init n ~f:(fun s -> cfg s 0, cfg s 1, cfg s 2) in
  let fa f = List.map words ~f:(fun (a, _, _) -> f a) in
  let fb f = List.map words ~f:(fun (_, b, _) -> f b) in
  let fc f = List.map words ~f:(fun (_, _, c) -> f c) in
  let trig base =
    ( fa (fun a -> select a (base + 2) base)
    , fa (fun a -> select a (base + 4) (base + 3))
    , fa (fun a -> bit a (base + 5))
    , fa (fun a -> select a (base + 8) (base + 6))
    , fa (fun a -> bit a (base + 9)) )
  in
  let st_pin, st_edge, st_qen, st_qpin, st_qlvl = trig 1 in
  let sp_pin, sp_edge, sp_qen, sp_qpin, sp_qlvl = trig 11 in
  let ab_pin, ab_edge, ab_qen, ab_qpin, ab_qlvl = trig 22 in
  let mon =
    Monitors.create
      { clock = i.clk
      ; clear
      ; pins = i.uio_in
      ; pins_oe = core.pins_oe
      ; mon_clear
      ; en = fc (fun c -> bit c 0)
      ; keep_first = fa (fun a -> bit a 0)
      ; st_pin
      ; st_edge
      ; st_qen
      ; st_qpin
      ; st_qlvl
      ; sp_pin
      ; sp_edge
      ; sp_qen
      ; sp_qpin
      ; sp_qlvl
      ; ab_en = fa (fun a -> bit a 21)
      ; ab_pin
      ; ab_edge
      ; ab_qen
      ; ab_qpin
      ; ab_qlvl
      ; min_en = fc (fun c -> bit c 1)
      ; min_cyc = fb (fun b -> select b 15 0)
      ; max_en = fc (fun c -> bit c 2)
      ; max_cyc = fb (fun b -> select b 31 16)
      ; st_dev = fc (fun c -> bit c 3)
      ; sp_dev = fc (fun c -> bit c 4)
      ; ab_dev = fc (fun c -> bit c 5)
      ; prescale = fc (fun c -> select c 7 6)
      }
  in
  let viol_sticky = concat_lsb mon.viol_sticky in
  let any_viol = reduce ~f:( |: ) mon.viol in
  (* read mux *)
  let status =
    concat_lsb
      [ core.halted
      ; core.late
      ; core.order_err
      ; core.window_err
      ; core.queue_count
      ; core.trapped
      ; fcount
      ; zero 5
      ; sample_count
      ; zero 2
      ; viol_sticky
      ; ena_sync
      ; core.conflict
      ; spi.frame_err
      ; gnd
      ]
  in
  let status_b =
    concat_lsb
      [ core.halted_b
      ; core.late_b
      ; core.order_err_b
      ; core.window_err_b
      ; core.queue_count_b
      ; core.trapped_b
      ; fcount_b
      ; zero 5
      ; sample_count_b
      ; zero 2
      ; zero 4
      ; gnd
      ; core.conflict
      ; zero 2
      ]
  in
  let reads =
    [ Reg.pins, uresize pins 32
    ; Reg.skew, uresize skew 32
    ; Reg.status, status
    ; Reg.samples, samples
    ; Reg.inputs, uresize in_sync 32
    ; Reg.mon_counts, concat_lsb mon.count
    ; Reg.id, of_int ~width:32 id
    ; ( Reg.dbg_state
      , uresize
          (concat_lsb
             [ core.dbg_pc
             ; core.dbg_running
             ; core.halted
             ; core.dbg_flag
             ; zero 3
             ; core.queue_count
             ])
          32 )
    ; Reg.dbg_s, uresize core.dbg_s 32
    ; Reg.dbg_t, uresize core.t_now 32
    ; Reg.dbg_xy, core.dbg_y @: core.dbg_x
    ; Reg.entry, uresize entry 32
    ; Reg.pins_b, uresize pins_b 32
    ; Reg.status_b, status_b
    ; Reg.samples_b, samples_b
    ; ( Reg.dbg_b_state
      , uresize
          (concat_lsb
             [ core.dbg_b_pc
             ; core.dbg_b_running
             ; core.halted_b
             ; core.dbg_b_flag
             ; zero 3
             ; core.queue_count_b
             ])
          32 )
    ; Reg.dbg_b_s, uresize core.dbg_b_s 32
    ; Reg.dbg_b_xy, core.dbg_b_y @: core.dbg_b_x
    ]
    @ List.concat
        (List.mapi words ~f:(fun s (a, b, c) ->
           [ Reg.mon_cfg + (3 * s), a; Reg.mon_cfg + (3 * s) + 1, b; Reg.mon_cfg + (3 * s) + 2, c ]))
    @ List.init n ~f:(fun s ->
      Reg.mon_seen + s, List.nth_exn mon.max_seen s @: List.nth_exn mon.min_seen s)
  in
  (* the register map is the one source: what can be read here must be exactly
     what hw/regmap.ml says is readable *)
  (let here = List.map reads ~f:fst |> List.sort ~compare:Int.compare in
   let map = List.sort Regmap.readable ~compare:Int.compare in
   if not ([%equal: int list] here map)
   then raise_s [%message "read-back disagrees with hw/regmap.ml" (here : int list) (map : int list)]);
  rdata
  <== mux
        spi.addr
        (List.init 128 ~f:(fun a ->
           List.Assoc.find reads a ~equal:Int.equal |> Option.value ~default:(zero 32)));
  (* Status pins are registered: they show the same signals one cycle later,
     and the fire logic no longer has to reach a pin within the output-delay
     budget (it was the worst slow-corner path). MISO is already registered. *)
  let status_pins =
    reg
      spec
      (concat_lsb
         [ core.halted
         ; core.late
         ; core.order_err
         ; viol_sticky <>:. 0
         ; core.sample_valid
         ; core.sample_bit
         ; any_viol
         ])
  in
  { uo_out = concat_lsb [ status_pins; spi.miso ]
  ; uio_out = core.pins_out
  ; uio_oe = core.pins_oe
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name create
;;
