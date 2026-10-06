(* Protocol timing specs: the single source of truth for what "correct" means.

   One spec is enforced in three places:
   1. on our own outputs, before running: the checker proves a program meets
      every rule and maps each fault knob to the rules it breaks;
   2. on the device's outputs, live: rules compile into timing-monitor slots;
   3. on a real part: the host sweeps knobs and watches the monitors, producing
      a measured datasheet.

   A rule says: after an edge matching [from_], the next edge matching [to_]
   must come within [min_ns, max_ns]. If an edge matching [abort] comes first,
   there is no instance (for example, a repeated START only exists if SDA falls
   before SCL does). *)
open! Base

type edge =
  | Rise
  | Fall
  | Any
[@@deriving sexp, equal]

type trigger =
  { pin : string
  ; edge : edge
  ; while_high : string option (* qualifier: this other pin is high *)
  ; while_low : string option (* qualifier: this other pin is low *)
  }
[@@deriving sexp, equal]

type rule =
  { name : string
  ; descr : string
  ; from_ : trigger
  ; to_ : trigger
  ; abort : trigger option
  ; min_ns : int option
  ; max_ns : int option
  }
[@@deriving sexp]

type t =
  { protocol : string
  ; rules : rule list
  }
[@@deriving sexp]

let on ?while_high ?while_low pin edge = { pin; edge; while_high; while_low }

let rule ?abort ?min_ns ?max_ns name descr ~from_ ~to_ =
  { name; descr; from_; to_; abort; min_ns; max_ns }
;;

(* I2C standard mode (100 kHz), from NXP UM10204 rev. 7, table 10. *)
module I2c_standard_mode = struct
  let start = on "SDA" Fall ~while_high:"SCL"
  let stop = on "SDA" Rise ~while_high:"SCL"
  let scl_rise = on "SCL" Rise
  let scl_fall = on "SCL" Fall

  let spec =
    { protocol = "I2C standard mode"
    ; rules =
        [ rule "t_HD_STA" "hold time after START" ~from_:start ~to_:scl_fall ~min_ns:4000
        ; rule "t_LOW" "SCL low period" ~from_:scl_fall ~to_:scl_rise ~min_ns:4700
        ; rule "t_HIGH" "SCL high period" ~from_:scl_rise ~to_:scl_fall ~min_ns:4000
        ; rule
            "t_SU_STA"
            "setup before repeated START"
            ~from_:scl_rise
            ~to_:start
            ~abort:scl_fall
            ~min_ns:4700
        ; rule
            "t_SU_DAT"
            "data setup before SCL rises"
            ~from_:(on "SDA" Any ~while_low:"SCL")
            ~to_:scl_rise
            ~min_ns:250
        ; rule
            "t_HD_DAT"
            "data hold after SCL falls; below 0, SDA moves while SCL is high, which \
             the bus reads as START or STOP"
            ~from_:scl_fall
            ~to_:(on "SDA" Any ~while_low:"SCL")
            ~abort:scl_rise
            ~min_ns:0
        ; rule "t_SU_STO" "setup before STOP" ~from_:scl_rise ~to_:stop ~abort:scl_fall ~min_ns:4000
        ; rule "t_BUF" "bus free between STOP and START" ~from_:stop ~to_:start ~min_ns:4700
        ]
    }
  ;;
end
