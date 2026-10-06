(* Firmware written against the ISA. Kept as OCaml values so the checker, the
   reference model and (later) the assembler all read the same program. *)
open! Base
module Isa = Fipe_isa.Isa

(* I2C master write, standard mode, at 50 MHz with prescale x4 (80 ns per dt
   unit). SCL edges use skew class 1 and SDA edges class 2, so K1 and K2 can be
   swept independently. Each host FIFO word holds one byte in bits 31..24.
   Y = number of bytes - 1. *)
let i2c_write ~bytes : Isa.t array =
  let open Isa in
  let scl ?(cls = 1) dt act = Evt { dt; clk_pin = true; cls; act } in
  let sda ?(cls = 2) dt act = Evt { dt; clk_pin = false; cls; act } in
  [| (* 0 *) Set { dst = Coder_mode; imm = Coder_mode.open_drain }
   ; (* 1 *) Set { dst = Y; imm = bytes - 1 }
   ; (* 2 *) scl ~cls:0 0 Release (* idle setup is never skewed *)
   ; (* 3 *) sda ~cls:0 0 Release
   ; (* 4 *) Dly { dt = 60 } (* bus free, t_BUF *)
   ; (* 5 *) sda 0 Drive0 (* START: SDA falls while SCL is high *)
   ; (* 6 *) scl 55 Drive0 (* t_HD_STA = 4.4 us *)
   ; (* 7  byte: *) Pull { block = true }
   ; (* 8 *) Set { dst = X; imm = 7 }
   ; (* 9  bit: *) sda 10 Shift_out (* t_HD_DAT = 0.8 us *)
   ; (* 10 *) scl 52 Release (* t_SU_DAT = 4.16 us; t_LOW = 4.96 us *)
   ; (* 11 *) scl 55 Drive0 (* t_HIGH = 4.4 us *)
   ; (* 12 *) Jmp { cond = X_dec_nz; addr = 9 }
   ; (* 13 ack *) sda 10 Release
   ; (* 14 *) scl 52 Release
   ; (* 15 *) sda ~cls:0 27 Sample (* sample ACK mid-high *)
   ; (* 16 *) scl 28 Drive0
   ; (* 17 *) Jmp { cond = Y_dec_nz; addr = 7 }
   ; (* 18 stop *) sda 10 Drive0
   ; (* 19 *) scl 52 Release
   ; (* 20 *) sda 55 Release (* STOP: SDA rises while SCL is high; t_SU_STO = 4.4 us *)
  |]
;;

let i2c_pins = { Exec.data_pin = "SDA"; clk_pin = "SCL" }
let byte b = b lsl 24
