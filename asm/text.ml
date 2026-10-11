(* The FIPE assembly language: a text form of the ISA, with labels, comments
   and named constants. [assemble] and [disassemble] are exact inverses on
   every legal instruction word; tests check this exhaustively.

   Syntax (case-insensitive; ';' or '#' starts a comment):

     .equ NAME, VALUE               named constant, usable wherever a number is
     label:                         may share a line with an instruction

     nop
     halt                           jump to itself
     evt   DT, data|clk, ACT [, k0|k1|k2|k3]
           ACT: drive0 drive1 release toggle shift sample aux0 aux1
     dly   DT
     wait  in|data|clk|aux, low|high [, x|y]     (timeout in X or Y cycles)
     jmp   TARGET                    always
     jmp   x--|y--|flag|pin|osr_empty|isr_full|cap_ready, TARGET
     set   x|y|x_hi|y_hi|k1|k2|k3|coder|pindir|prescale, VALUE
           coder VALUE may be names joined by '|': nrz nrzi manchester invert opendrain
           prescale VALUE may be x1 x4 x16 x64
     mov   DST, SRC                  x y osr isr crc cap
     pull [noblock]   push [noblock]
     crc   feed_tx|feed_rx|reset|load_osr|arm_corrupt
     sync  set|wait, ID
     cap   on|off|marker, MASK

   Numbers: decimal, 0x hex, 0b binary, negative for skews. *)
open! Base
module Isa = Fipe_isa.Isa

exception Asm_error of int * string

let fail line fmt = Printf.ksprintf (fun s -> raise (Asm_error (line, s))) fmt

let act_names =
  Isa.Act.
    [ Drive0, "drive0"
    ; Drive1, "drive1"
    ; Release, "release"
    ; Toggle, "toggle"
    ; Shift_out, "shift"
    ; Sample, "sample"
    ; Aux0, "aux0"
    ; Aux1, "aux1"
    ]
;;

let cond_names =
  Isa.Cond.
    [ X_dec_nz, "x--"
    ; Y_dec_nz, "y--"
    ; Flag, "flag"
    ; Pin, "pin"
    ; Osr_empty, "osr_empty"
    ; Isr_full, "isr_full"
    ; Cap_ready, "cap_ready"
    ]
;;

let dst_names =
  Isa.Set_dst.
    [ X, "x"
    ; Y, "y"
    ; X_hi, "x_hi"
    ; Y_hi, "y_hi"
    ; K1, "k1"
    ; K2, "k2"
    ; K3, "k3"
    ; Coder_mode, "coder"
    ; Pin_dir, "pindir"
    ; Prescale, "prescale"
    ]
;;

let loc_names = Isa.Loc.[ X, "x"; Y, "y"; Osr, "osr"; Isr, "isr"; Crc, "crc"; Cap, "cap" ]

let crc_names =
  Isa.Crc_cmd.
    [ Feed_tx, "feed_tx"; Feed_rx, "feed_rx"; Reset, "reset"; Load_osr, "load_osr"; Arm_corrupt, "arm_corrupt" ]
;;

let cap_names = Isa.Cap_cmd.[ On, "on"; Off, "off"; Marker, "marker" ]
let wpin_names = Isa.Wait_pin.[ In, "in"; Data, "data"; Clk, "clk"; Aux, "aux" ]
let coder_flags = [ "nrz", 0; "nrzi", 1; "manchester", 2; "invert", 4; "opendrain", 8 ]
let prescale_names = [ "x1", 0; "x4", 1; "x16", 2; "x64", 3 ]
let name_of l v ~equal = List.find_map_exn l ~f:(fun (k, n) -> if equal k v then Some n else None)

let lookup line what l s =
  match List.find l ~f:(fun (_, n) -> String.equal n s) with
  | Some (k, _) -> k
  | None ->
    fail line "unknown %s %S (expected one of: %s)" what s (String.concat ~sep:" " (List.map l ~f:snd))
;;

(* --- assembling ----------------------------------------------------------- *)

let strip_comment s =
  match String.lfindi s ~f:(fun _ c -> Char.equal c ';' || Char.equal c '#') with
  | Some i -> String.prefix s i
  | None -> s
;;

let number line consts s =
  let s = String.strip s in
  match Hashtbl.find consts s with
  | Some v -> v
  | None ->
    let neg, body = if String.is_prefix s ~prefix:"-" then true, String.drop_prefix s 1 else false, s in
    let v =
      try
        if String.is_prefix body ~prefix:"0x"
        then Int.of_string ("0x" ^ String.drop_prefix body 2)
        else if String.is_prefix body ~prefix:"0b"
        then Int.of_string ("0b" ^ String.drop_prefix body 2)
        else Int.of_string body
      with
      | _ -> fail line "not a number or constant: %S" s
    in
    if neg then -v else v
;;

let in_range line what v ~lo ~hi =
  if v < lo || v > hi then fail line "%s %d out of range %d..%d" what v lo hi;
  v
;;

type pending =
  | Done of Isa.t
  | Jump of Isa.Cond.t * string * int (* cond, target text, line *)
  | Halt_here

let parse_line line consts toks =
  let num = number line consts in
  let args n =
    if List.length toks <> n
    then fail line "expected %d operand(s), got %d" n (List.length toks)
  in
  function
  | "nop" ->
    args 0;
    Done Nop
  | "halt" ->
    args 0;
    Halt_here
  | "evt" ->
    if List.length toks < 3 || List.length toks > 4 then fail line "evt DT, data|clk, ACTION [, kN]";
    let dt = in_range line "dt" (num (List.nth_exn toks 0)) ~lo:0 ~hi:63 in
    let clk_pin =
      match List.nth_exn toks 1 with
      | "data" -> false
      | "clk" -> true
      | t -> fail line "evt target must be data or clk, not %S" t
    in
    let act = lookup line "action" act_names (List.nth_exn toks 2) in
    let cls =
      match List.nth toks 3 with
      | None -> 0
      | Some k -> lookup line "skew class" [ 0, "k0"; 1, "k1"; 2, "k2"; 3, "k3" ] k
    in
    Done (Evt { dt; clk_pin; cls; act })
  | "dly" ->
    args 1;
    Done (Dly { dt = in_range line "dt" (num (List.hd_exn toks)) ~lo:0 ~hi:4095 })
  | "wait" ->
    if List.length toks < 2 || List.length toks > 3 then fail line "wait PIN, low|high [, x|y]";
    let pin = lookup line "wait pin" wpin_names (List.nth_exn toks 0) in
    let pol =
      match List.nth_exn toks 1 with
      | "low" -> false
      | "high" -> true
      | t -> fail line "wait level must be low or high, not %S" t
    in
    let timeout =
      match List.nth toks 2 with
      | None -> Isa.Wait_timeout.Forever
      | Some "x" -> X_cycles
      | Some "y" -> Y_cycles
      | Some t -> fail line "wait timeout must be x or y, not %S" t
    in
    Done (Wait { pin; pol; timeout })
  | "jmp" ->
    (match toks with
     | [ target ] -> Jump (Always, target, line)
     | [ c; target ] -> Jump (lookup line "jump condition" cond_names c, target, line)
     | _ -> fail line "jmp [COND,] TARGET")
  | "set" ->
    args 2;
    let dst = lookup line "set destination" dst_names (List.nth_exn toks 0) in
    let v = List.nth_exn toks 1 in
    let imm =
      match dst with
      | Coder_mode when not (Char.is_digit v.[0]) ->
        String.split v ~on:'|'
        |> List.fold ~init:0 ~f:(fun a f -> a lor lookup line "coder flag" (List.map coder_flags ~f:(fun (n, b) -> b, n)) f)
      | Prescale when Char.equal v.[0] 'x' ->
        lookup line "prescale" (List.map prescale_names ~f:(fun (n, b) -> b, n)) v
      | K1 | K2 | K3 -> in_range line "skew" (num v) ~lo:(-128) ~hi:255 land 0xFF
      | _ -> in_range line "immediate" (num v) ~lo:0 ~hi:255
    in
    Done (Set { dst; imm })
  | "mov" ->
    args 2;
    Done
      (Mov
         { dst = lookup line "location" loc_names (List.nth_exn toks 0)
         ; src = lookup line "location" loc_names (List.nth_exn toks 1)
         })
  | ("pull" | "push") as m ->
    let block =
      match toks with
      | [] -> true
      | [ "noblock" ] -> false
      | _ -> fail line "%s [noblock]" m
    in
    Done (if String.equal m "pull" then Pull { block } else Push { block })
  | "crc" ->
    args 1;
    Done (Crc (lookup line "crc command" crc_names (List.hd_exn toks)))
  | "sync" ->
    args 2;
    let wait =
      match List.nth_exn toks 0 with
      | "wait" -> true
      | "set" -> false
      | t -> fail line "sync set|wait, not %S" t
    in
    Done (Sync { wait; id = in_range line "sync id" (num (List.nth_exn toks 1)) ~lo:0 ~hi:3 })
  | "cap" ->
    args 2;
    Done
      (Cap
         { cmd = lookup line "capture command" cap_names (List.nth_exn toks 0)
         ; mask = in_range line "mask" (num (List.nth_exn toks 1)) ~lo:0 ~hi:255
         })
  | m -> fail line "unknown instruction %S" m
;;

let assemble_exn (src : string) : Isa.t array =
  let consts = Hashtbl.create (module String) in
  let labels = Hashtbl.create (module String) in
  let items = Queue.create () in
  String.split_lines src
  |> List.iteri ~f:(fun i raw ->
    let line = i + 1 in
    let s =
      String.map (strip_comment raw) ~f:(fun c -> if Char.equal c '\t' then ' ' else c)
      |> String.lowercase
      |> String.strip
    in
    (* labels *)
    let rec take_labels s =
      match String.lsplit2 s ~on:':' with
      | Some (l, rest)
        when (not (String.is_empty l)) && String.for_all l ~f:(fun c -> Char.is_alphanum c || Char.equal c '_') ->
        if Hashtbl.mem labels l then fail line "duplicate label %S" l;
        Hashtbl.set labels ~key:l ~data:(Queue.length items);
        take_labels (String.strip rest)
      | _ -> s
    in
    let s = take_labels s in
    if not (String.is_empty s)
    then (
      let m, rest =
        match String.lsplit2 s ~on:' ' with
        | Some (m, r) -> m, String.strip r
        | None -> s, ""
      in
      let toks =
        if String.is_empty rest then [] else String.split rest ~on:',' |> List.map ~f:String.strip
      in
      if String.equal m ".equ"
      then (
        match toks with
        | [ n; v ] -> Hashtbl.set consts ~key:n ~data:(number line consts v)
        | _ -> fail line ".equ NAME, VALUE")
      else Queue.enqueue items (parse_line line consts toks m)));
  let n = Queue.length items in
  if n > 64 then raise (Asm_error (0, Printf.sprintf "program has %d instructions; the limit is 64" n));
  Queue.to_array items
  |> Array.mapi ~f:(fun addr -> function
    | Done i -> i
    | Halt_here -> Isa.Jmp { cond = Always; addr }
    | Jump (cond, target, line) ->
      let addr =
        match Hashtbl.find labels target with
        | Some a -> a
        | None when Char.is_alpha target.[0] && not (Hashtbl.mem consts target) ->
          fail line "undefined label %S" target
        | None -> in_range line "jump address" (number line consts target) ~lo:0 ~hi:63
      in
      Isa.Jmp { cond; addr })
;;

let assemble src =
  match assemble_exn src with
  | p -> Ok p
  | exception Asm_error (line, msg) -> Error (Printf.sprintf "line %d: %s" line msg)
;;

(* --- disassembling ---------------------------------------------------------- *)

let coder_string v =
  if v > 15 || v land 3 = 3
  then Int.to_string v
  else (
    let base = name_of [ 0, "nrz"; 1, "nrzi"; 2, "manchester" ] (v land 3) ~equal:Int.equal in
    let flags = List.filter [ 4, "invert"; 8, "opendrain" ] ~f:(fun (b, _) -> v land b <> 0) in
    String.concat ~sep:"|" (base :: List.map flags ~f:snd))
;;

let instr_string ~label_of ~addr (i : Isa.t) =
  let target a = Option.value (label_of a) ~default:(Int.to_string a) in
  match i with
  | Nop -> "nop"
  | Jmp { cond = Always; addr = a } when a = addr -> "halt"
  | Jmp { cond = Always; addr = a } -> "jmp   " ^ target a
  | Jmp { cond; addr = a } -> Printf.sprintf "jmp   %s, %s" (name_of cond_names cond ~equal:Isa.Cond.equal) (target a)
  | Evt { dt; clk_pin; cls; act } ->
    Printf.sprintf
      "evt   %d, %s, %s%s"
      dt
      (if clk_pin then "clk" else "data")
      (name_of act_names act ~equal:Isa.Act.equal)
      (if cls = 0 then "" else Printf.sprintf ", k%d" cls)
  | Dly { dt } -> Printf.sprintf "dly   %d" dt
  | Wait { pin; pol; timeout } ->
    Printf.sprintf
      "wait  %s, %s%s"
      (name_of wpin_names pin ~equal:Isa.Wait_pin.equal)
      (if pol then "high" else "low")
      (match timeout with
       | Forever -> ""
       | X_cycles -> ", x"
       | Y_cycles -> ", y")
  | Set { dst; imm } ->
    let v =
      match dst with
      | Coder_mode -> coder_string imm
      | Prescale when imm <= 3 ->
        List.find_map_exn prescale_names ~f:(fun (n, b) -> if b = imm then Some n else None)
      | K1 | K2 | K3 -> Int.to_string (if imm >= 128 then imm - 256 else imm)
      | _ -> Int.to_string imm
    in
    Printf.sprintf "set   %s, %s" (name_of dst_names dst ~equal:Isa.Set_dst.equal) v
  | Mov { dst; src } ->
    Printf.sprintf "mov   %s, %s" (name_of loc_names dst ~equal:Isa.Loc.equal) (name_of loc_names src ~equal:Isa.Loc.equal)
  | Pull { block } -> if block then "pull" else "pull  noblock"
  | Push { block } -> if block then "push" else "push  noblock"
  | Crc c -> "crc   " ^ name_of crc_names c ~equal:Isa.Crc_cmd.equal
  | Sync { wait; id } -> Printf.sprintf "sync  %s, %d" (if wait then "wait" else "set") id
  | Cap { cmd; mask } -> Printf.sprintf "cap   %s, %d" (name_of cap_names cmd ~equal:Isa.Cap_cmd.equal) mask
;;

(* Labels for every jump target inside the program, then one instruction per
   line, with its address and encoding in a comment. *)
let disassemble (p : Isa.t array) =
  let targets =
    Array.to_list p
    |> List.filter_mapi ~f:(fun here -> function
      | Isa.Jmp { cond; addr } when not (Isa.Cond.equal cond Always && addr = here) -> Some addr
      | _ -> None)
    |> List.filter ~f:(fun a -> a < Array.length p)
    |> List.dedup_and_sort ~compare:Int.compare
  in
  let label_of a = if List.mem targets a ~equal:Int.equal then Some (Printf.sprintf "l%d" a) else None in
  Array.to_list p
  |> List.mapi ~f:(fun addr i ->
    let lbl = Option.value_map (label_of addr) ~default:"" ~f:(fun l -> l ^ ":") in
    Printf.sprintf "%-6s  %-28s ; %2d: %04x" lbl (instr_string ~label_of ~addr i) addr (Isa.encode i))
  |> String.concat ~sep:"\n"
  |> fun s -> s ^ "\n"
;;

(* Hex image for the host loader: one 16-bit word per line. *)
let to_hex p =
  Array.to_list p |> List.map ~f:(fun i -> Printf.sprintf "%04x" (Isa.encode i)) |> String.concat ~sep:"\n" |> fun s -> s ^ "\n"
;;

let of_hex s =
  String.split_lines s
  |> List.map ~f:String.strip
  |> List.filter ~f:(fun l -> not (String.is_empty l))
  |> List.mapi ~f:(fun i l ->
    match Isa.decode (Int.of_string ("0x" ^ l)) with
    | Some ins -> ins
    | None -> raise (Asm_error (i + 1, "illegal instruction word " ^ l)))
  |> Array.of_list
;;
