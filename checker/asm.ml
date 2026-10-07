(* A minimal assembler: instructions plus labels, resolved in two passes. The
   start of the real assembler; it removes hand-counted jump targets. *)
open! Base
module Isa = Fipe_isa.Isa

type item =
  | Label of string
  | Ins of Isa.t
  | Jmp of Isa.Cond.t * string
  | Halt (* JMP to itself *)

let assemble items =
  let addrs = Hashtbl.create (module String) in
  let n = ref 0 in
  List.iter items ~f:(function
    | Label l ->
      if Hashtbl.mem addrs l then raise_s [%message "duplicate label" l];
      Hashtbl.set addrs ~key:l ~data:!n
    | Ins _ | Jmp _ | Halt -> Int.incr n);
  if !n > 64 then raise_s [%message "program exceeds 64 words" (!n : int)];
  let here = ref 0 in
  List.filter_map items ~f:(fun item ->
    let ins =
      match item with
      | Label _ -> None
      | Ins i -> Some i
      | Jmp (cond, l) ->
        (match Hashtbl.find addrs l with
         | Some addr -> Some (Isa.Jmp { cond; addr })
         | None -> raise_s [%message "undefined label" l])
      | Halt -> Some (Isa.Jmp { cond = Always; addr = !here })
    in
    Option.iter ins ~f:(fun _ -> Int.incr here);
    ins)
  |> Array.of_list
;;
