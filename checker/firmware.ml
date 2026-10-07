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

let i2c_pins = { Exec.data_pin = "SDA"; clk_pin = "SCL" }
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
