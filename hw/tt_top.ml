(* Tiny Tapeout top: tt_um_jlsviper_fipe.

   Pins (spec, Capture unit and host interface):
     ui_in[0] CFG_SCK   ui_in[1] CFG_CS_n   ui_in[2] CFG_MOSI   ui_in[7:3] IN0..IN4
     uo_out[7] CFG_MISO   uo_out[6] TRIG_OUT (monitor violation pulse)
     uo_out[5:0] status: halted, late, order, monitor violation (sticky),
                 sample valid, sample bit
     uio[7:0]  P0..P7, bidirectional protocol pins (open-drain via output enable)

   Register map (7-bit address; W = write, R = read):
     0x00-0x3F W  program memory word (data bits 15..0)
     0x40      W  CTRL: bit 0 start, bit 1 clear monitors, bit 2 clear sample log
     0x41      RW PINS: data pin [2:0], clock pin [5:3]
     0x42      RW SKEW: K1 [7:0], K2 [15:8], K3 [23:16] (signed)
     0x43      W  push one word into the 4-deep host data FIFO
     0x44      R  STATUS: [0] halted [1] late [2] order [3] window
                  [6:4] queue count [10:8] FIFO count [21:16] samples logged
                  [27:24] monitor violations (sticky) [28] ena [31:29] unused
     0x45      R  SAMPLES: last 32 sampled bits, newest in bit 0
     0x46      R  INPUTS: IN0..IN4 levels [4:0]
     0x48+3s   RW monitor slot s, word A: [0] keep_first [10:1] start trigger
                  [20:11] stop trigger [21] abort enable [31:22] abort trigger
                  (trigger: [2:0] pin [4:3] edge [5] qualifier enable
                   [8:6] qualifier pin [9] qualifier level)
     0x49+3s   RW monitor slot s, word B: min cycles [15:0], max cycles [31:16]
     0x4A+3s   RW monitor slot s, word C: [0] enable [1] min enable [2] max enable
     0x58+s    R  monitor slot s: min seen [15:0], max seen [31:16]
     0x5C      R  monitor counts: slot s in bits [8s+7:8s]
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

module Reg = struct
  let ctrl = 0x40
  let pins = 0x41
  let skew = 0x42
  let fifo = 0x43
  let status = 0x44
  let samples = 0x45
  let inputs = 0x46
  let mon_cfg = 0x48 (* + 3s + word *)
  let mon_seen = 0x58 (* + s *)
  let mon_counts = 0x5C
  let id = 0x7F
end

let create (i : _ I.t) : _ O.t =
  let clear = ~:(i.rst_n) in
  let spec = Reg_spec.create ~clock:i.clk ~clear () in
  let rdata = wire 32 in
  let spi =
    Host_spi.create
      { clock = i.clk
      ; clear
      ; sck = bit i.ui_in 0
      ; cs_n = bit i.ui_in 1
      ; mosi = bit i.ui_in 2
      ; rdata
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
  let pins = rw_reg Reg.pins 6 in
  let skew = rw_reg Reg.skew 24 in
  (* host data FIFO, 4 x 32 *)
  let fifo_pop = wire 1 in
  let fifo_push = wr Reg.fifo in
  let open Always in
  let fcount = Variable.reg spec ~width:3 in
  let frp = Variable.reg spec ~width:2 in
  let fwp = Variable.reg spec ~width:2 in
  let fmem = Array.init 4 ~f:(fun _ -> Variable.reg spec ~width:32) in
  let push_ok = fifo_push &: (fcount.value <:. 4) in
  let pop_ok = fifo_pop &: (fcount.value >:. 0) in
  compile
    ([ when_ push_ok [ fwp <-- fwp.value +:. 1 ]
     ; when_ pop_ok [ frp <-- frp.value +:. 1 ]
     ; fcount <-- fcount.value +: uresize push_ok 3 -: uresize pop_ok 3
     ]
     @ List.init 4 ~f:(fun k -> when_ (push_ok &: (fwp.value ==:. k)) [ fmem.(k) <-- wd ]));
  let fifo_head = mux frp.value (Array.to_list fmem |> List.map ~f:(fun v -> v.value)) in
  (* the core *)
  let core =
    Core.create
      { clock = i.clk
      ; clear
      ; start
      ; imem_we = spi.wr_strobe &: (spi.addr <:. 64)
      ; imem_addr = select spi.addr 5 0
      ; imem_data = select wd 15 0
      ; fifo_valid = fcount.value >:. 0
      ; fifo_data = fifo_head
      ; cfg_data_pin = select pins 2 0
      ; cfg_clk_pin = select pins 5 3
      ; cfg_k1 = select skew 7 0
      ; cfg_k2 = select skew 15 8
      ; cfg_k3 = select skew 23 16
      ; pins_in = i.uio_in
      }
  in
  fifo_pop <== core.fifo_ready;
  (* sample log *)
  let samples =
    reg_fb spec ~width:32 ~f:(fun q ->
      mux2 (sample_clear |: start) (zero 32)
        (mux2 core.sample_valid (lsbs q @: core.sample_bit) q))
  in
  let sample_count =
    reg_fb spec ~width:6 ~f:(fun q ->
      mux2 (sample_clear |: start) (zero 6)
        (mux2 (core.sample_valid &: (q <>:. 63)) (q +:. 1) q))
  in
  (* monitors, configured through registers *)
  let n = Monitors.n_slots in
  let cfg s w = rw_reg (Reg.mon_cfg + (3 * s) + w) 32 in
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
      ; gnd
      ; fcount.value
      ; zero 5
      ; sample_count
      ; zero 2
      ; viol_sticky
      ; i.ena
      ; zero 3
      ]
  in
  let reads =
    [ Reg.pins, uresize pins 32
    ; Reg.skew, uresize skew 32
    ; Reg.status, status
    ; Reg.samples, samples
    ; Reg.inputs, uresize (select i.ui_in 7 3) 32
    ; Reg.mon_counts, concat_lsb mon.count
    ; Reg.id, of_int ~width:32 id
    ]
    @ List.concat
        (List.mapi words ~f:(fun s (a, b, c) ->
           [ Reg.mon_cfg + (3 * s), a; Reg.mon_cfg + (3 * s) + 1, b; Reg.mon_cfg + (3 * s) + 2, c ]))
    @ List.init n ~f:(fun s ->
      Reg.mon_seen + s, List.nth_exn mon.max_seen s @: List.nth_exn mon.min_seen s)
  in
  rdata
  <== mux
        spi.addr
        (List.init 128 ~f:(fun a ->
           List.Assoc.find reads a ~equal:Int.equal |> Option.value ~default:(zero 32)));
  { uo_out =
      concat_lsb
        [ core.halted
        ; core.late
        ; core.order_err
        ; viol_sticky <>:. 0
        ; core.sample_valid
        ; core.sample_bit
        ; any_viol
        ; spi.miso
        ]
  ; uio_out = core.pins_out
  ; uio_oe = core.pins_oe
  }
;;

let circuit () =
  let module C = Circuit.With_interface (I) (O) in
  C.create_exn ~name create
;;
