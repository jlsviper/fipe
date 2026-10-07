(* Firmware written against the ISA. Kept as OCaml values so the checker, the
   reference model and the RTL tests all run the same program. *)
open! Base
module Isa = Fipe_isa.Isa

(* I2C master write, standard mode, at 50 MHz with prescale x4 (80 ns per dt
   unit). SCL edges use skew class 1 and SDA edges class 2, so K1 and K2 can be
   swept independently. Idle setup and the ACK sample use class 0 (never
   skewed). Each host FIFO word holds one byte in bits 31..24.
   A JMP to itself halts. *)
let i2c_write ~bytes : Isa.t array =
  let open Isa in
  let scl ?(cls = 1) dt act = Evt { dt; clk_pin = true; cls; act } in
  let sda ?(cls = 2) dt act = Evt { dt; clk_pin = false; cls; act } in
  [| (*  0 *) Set { dst = Coder_mode; imm = Coder_mode.open_drain }
   ; (*  1 *) Set { dst = Prescale; imm = 1 } (* x4: 80 ns per dt unit *)
   ; (*  2 *) Set { dst = Y; imm = bytes - 1 }
   ; (*  3 *) scl ~cls:0 0 Release (* idle setup is never skewed *)
   ; (*  4 *) sda ~cls:0 0 Release
   ; (*  5 *) Dly { dt = 60 } (* bus free, t_BUF *)
   ; (*  6 *) sda 0 Drive0 (* START: SDA falls while SCL is high *)
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
   ; (* 21 *) sda 55 Release (* STOP: SDA rises while SCL is high; t_SU_STO = 4.4 us *)
   ; (* 22 *) Jmp { cond = Always; addr = 22 } (* halt *)
  |]
;;

let i2c_pins = { Exec.data_pin = "SDA"; clk_pin = "SCL" }
let byte b = b lsl 24
