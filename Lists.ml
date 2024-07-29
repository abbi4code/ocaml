
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

