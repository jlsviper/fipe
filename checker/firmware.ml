(* Firmware written against the ISA. Kept as OCaml values so the checker, the
   reference model and the RTL tests all run the same program. *)
open! Base
module Isa = Fipe_isa.Isa

(* I2C master write, standard mode, at 50 MHz with prescale x4 (80 ns per dt
   unit). SCL edges use skew class 1 and SDA edges class 2, so K1 and K2 can be
   swept independently. Idle setup and the ACK sample use class 0 (never
   skewed). Each host FIFO word holds one byte in bits 31..24.
   A JMP to itself halts.

   [start_stop_cls] moves the START and STOP edges of SDA to their own class.
   The sweep uses 3, so that each knob direction shortens exactly one rule:
   K3 up t_HD_STA, K3 down t_SU_STO, K2 down t_HD_DAT, K2 up t_SU_DAT. *)
let i2c_write ?(start_stop_cls = 2) ~bytes () : Isa.t array =
  let open Isa in
  let scl ?(cls = 1) dt act = Evt { dt; clk_pin = true; cls; act } in
  let sda ?(cls = 2) dt act = Evt { dt; clk_pin = false; cls; act } in
  [| (*  0 *) Set { dst = Coder_mode; imm = Coder_mode.open_drain }
   ; (*  1 *) Set { dst = Prescale; imm = 1 } (* x4: 80 ns per dt unit *)
   ; (*  2 *) Set { dst = Y; imm = bytes - 1 }
   ; (*  3 *) scl ~cls:0 0 Release (* idle setup is never skewed *)
   ; (*  4 *) sda ~cls:0 0 Release
   ; (*  5 *) Dly { dt = 60 } (* bus free, t_BUF *)
   ; (*  6 *) sda ~cls:start_stop_cls 0 Drive0 (* START: SDA falls while SCL is high *)
   ; (*  7 *) scl 55 Drive0 (* t_HD_STA = 4.4 us *)
   ; (*  8  byte: *) Pull { block = true }
   ; (*  9 *) Set { dst = X; imm = 7 }
   ; (* 10  bit: *) sda 10 Shift_out (* t_HD_DAT = 0.8 us *)
   ; (* 11 *) scl 52 Release (* t_SU_DAT = 4.16 us; t_LOW = 4.96 us *)
   ; (* 12 *) scl 55 Drive0 (* t_HIGH = 4.4 us *)
   ; (* 13 *) Jmp { cond = X_dec_nz; addr = 10 }
   ; (* 14  ack: *) sda 10 Release
   ; (* 15 *) scl 52 Release
   ; (* 16 *) sda ~cls:0 27 Sample (* sample ACK mid-high *)
   ; (* 17 *) scl 28 Drive0
   ; (* 18 *) Jmp { cond = Y_dec_nz; addr = 8 }
   ; (* 19  stop: *) sda 10 Drive0
   ; (* 20 *) scl 52 Release
   ; (* 21 *) sda ~cls:start_stop_cls 55 Release (* STOP: t_SU_STO = 4.4 us *)
   ; (* 22 *) Jmp { cond = Always; addr = 22 } (* halt *)
  |]
;;

let i2c_pins = { Exec.data_pin = "SDA"; clk_pin = "SCL"; in_pin = "SDA"; aux_pin = "AUX" }
let byte b = b lsl 24

(* Write, then prove the write started: after the STOP, address the part again.
   An EEPROM in its write cycle NACKs, so the fourth sampled bit reads 1 only
   if the STOP was recognized and the write committed. The chip sees
   [0; 0; 0; 1] for a good write. Host FIFO: address, memory address, data,
   address again. Same timing and skew classes as [i2c_write]. *)
let i2c_write_and_poll ?(start_stop_cls = 2) ~bytes () : Isa.t array =
  let open Isa in
  let open Asm in
  let scl ?(cls = 1) dt act = Ins (Evt { dt; clk_pin = true; cls; act }) in
  let sda ?(cls = 2) dt act = Ins (Evt { dt; clk_pin = false; cls; act }) in
  let start = [ sda ~cls:start_stop_cls 0 Drive0; scl 55 Drive0 ] in
  let byte_ name =
    [ Ins (Pull { block = true })
    ; Ins (Set { dst = X; imm = 7 })
    ; Label name
    ; sda 10 Shift_out
    ; scl 52 Release
    ; scl 55 Drive0
    ; Jmp (X_dec_nz, name)
    ; (* ACK clock *)
      sda 10 Release
    ; scl 52 Release
    ; sda ~cls:0 27 Sample
    ; scl 28 Drive0
    ]
  in
  let stop = [ sda 10 Drive0; scl 52 Release; sda ~cls:start_stop_cls 55 Release ] in
  assemble
    ([ Ins (Set { dst = Coder_mode; imm = Coder_mode.open_drain })
     ; Ins (Set { dst = Prescale; imm = 1 })
     ; Ins (Set { dst = Y; imm = bytes - 1 })
     ; scl ~cls:0 0 Release
     ; sda ~cls:0 0 Release
     ; Ins (Dly { dt = 60 })
     ]
     @ start
     @ [ Label "byte" ]
     @ byte_ "bit"
     @ [ Jmp (Y_dec_nz, "byte") ]
     @ stop
     @ [ Ins (Dly { dt = 60 }) ] (* t_BUF before the poll *)
     @ start
     @ byte_ "poll_bit"
     @ stop
     @ [ Halt ])
;;

(* SPI READ ID (0x9F, then 24 bits in), any mode, SCLK half period [half]
   core cycles. MOSI is the data pin, SCLK the clock pin, MISO the input pin,
   CS the auxiliary pin. One 32-bit transfer: the host FIFO word 0x9F000000
   shifts out the command and then zeros while 32 samples are taken; the last
   24 are the ID. Half periods above 63 cycles use prescale x4 (multiples of 4).
   The loop is five instructions per bit, so below about 2.5 cycles per half
   period the sequencer cannot keep up and the on-time model reports LATE. *)
let spi_read_id ~mode ~half : Isa.t array =
  let open Isa in
  let open Asm in
  let cpol = mode land 2 <> 0 and cpha = mode land 1 <> 0 in
  let prescale, dt =
    if half <= 63
    then 0, half
    else if half % 4 = 0 && half / 4 <= 63
    then 1, half / 4
    else raise_s [%message "unsupported SPI half period" (half : int)]
  in
  let ev ?(clk = false) dt act = Ins (Evt { dt; clk_pin = clk; cls = 0; act }) in
  let bit =
    if not cpha
    then
      [ ev 0 Shift_out (* data valid half a period before the leading edge *)
      ; ev ~clk:true dt Toggle (* leading edge: both sides sample *)
      ; ev 0 Sample
      ; ev ~clk:true dt Toggle (* trailing edge: both sides change *)
      ]
    else
      [ ev ~clk:true dt Toggle (* leading edge: both sides change *)
      ; ev 0 Shift_out
      ; ev ~clk:true dt Toggle (* trailing edge: both sides sample *)
      ; ev 0 Sample
      ]
  in
  assemble
    ([ Ins (Set { dst = Coder_mode; imm = 0 })
     ; Ins (Set { dst = Prescale; imm = prescale })
     ; ev 0 Aux1 (* CS high *)
     ; ev ~clk:true 1 (if cpol then Drive1 else Drive0) (* SCLK idle level *)
     ; ev 1 Drive0 (* one per cycle: the queue fires at most two per cycle *)
     ; Ins (Dly { dt = 20 })
     ; ev 0 Aux0 (* CS low *)
     ; Ins (Pull { block = true })
     ; Ins (Set { dst = X; imm = 31 })
     ; Label "bit"
     ]
     @ bit
     @ [ Jmp (X_dec_nz, "bit"); ev dt Aux1 (* CS high *); Halt ])
;;

let spi_pins = { Exec.data_pin = "MOSI"; clk_pin = "SCLK"; in_pin = "MISO"; aux_pin = "CS" }
let spi_read_id_fifo = [ 0x9F lsl 24 ]
