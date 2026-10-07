(* Core plus monitors, with the core's pins looped back into the monitors
   through pull-ups: a released pin reads high, a driven pin reads its value.

   This is the first "device" the chip audits: itself. It lets the tests check
   that the monitors, compiled from the spec, flag exactly the rules the checker
   predicts our own waveform breaks. The EEPROM model plugs in here next. *)
open! Base
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { core : 'a Core.I.t [@rtlprefix "c_"]
    ; mon : 'a Monitors.I.t [@rtlprefix "m_"]
    }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { core : 'a Core.O.t [@rtlprefix "c_"]
    ; mon : 'a Monitors.O.t [@rtlprefix "m_"]
    ; levels : 'a [@bits Core.n_pins]
    }
  [@@deriving sexp_of, hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let core = Core.create i.core in
  let levels = (core.pins_oe &: core.pins_out) |: ~:(core.pins_oe) in
  let mon =
    Monitors.create { i.mon with clock = i.core.clock; clear = i.core.clear; pins = levels }
  in
  { core; mon; levels }
;;
