
let list1 = [12;34;43;23];;

let rec addone lst =
  match lst with
  | [] -> []
  | h::t -> (h+1) :: addone t
;;


let countries = ["india"; "usa";"france"];;

let length  = List.length countries;;


let uppercase = List.map String.uppercase_ascii countries;;

(* Printf.printf "%s\n" uppercase *)

(* Printf.printf "%s\n" (String.concat ", " uppercase) *)

(* checking even with filter *)

let check_even x = x mod 2 == 0;; 
let fil_list = List.filter check_even [12;34;45;55;44];;

(* reversing a list *)

let rec reverse lst =
  match lst with
  | [] -> []
  | h::t -> (reverse t) @ [h]
;;


let rec sum = function 
  | [] -> 0
  | h::t -> h + sum t
;;

let half x = x/2;;
let halfchk x = x mod 2 = 0;;


let sum = List.map half [12;45;34];;
let halfarr = List.filter halfchk [20;21;23];;

let sum_list = [12;23;45;56];;

let t_sum = List.fold_left ( fun acc x -> acc + x ) 10 sum_list;;

Printf.printf "The result is: %d\n " t_sum



