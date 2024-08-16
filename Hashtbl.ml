
(* Hashtbl is one of the module in ocaml which helps you store key-value pair *)
(* faster retrival of keys *)

(* to create a hashtbl also you need to specify some size *)
Hashtbl.create : int -> ('a,'b) Hashtbl.t

let my_tbl = Hashtbl.create 10;

