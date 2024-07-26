
type student = {
  name: string;
  std: int;
}
let intro  = {
  name = "abhishek";
  std = 5;
};;

let details s =
  match s with 
  | {name; std} -> name ^ " is in " ^ string_of_int std ^ "th standard"
;;

let lst = ["abhishek"; "abhinav";"rohit"];;
let nums = [12;34;423];;

let namecheck lst= 
  match lst with 
  | [] -> true
  | _ -> false
;;

let rec sum nums = 
  match nums with 
  | [] -> 0
  | h::t -> h + sum t

let () = print_endline (string_of_int (sum nums))


(* find the length of the list *)
let names = ["abhishek"; "ram";"shyam"; "nothing" ];;

let rec totalcount lst = 
  match lst with
  | [] -> 0
  | h ::t -> 1 + totalcount t
;;
print_endline(string_of_int(totalcount names) ^ " total lsit count");;

(* appending one list with the other *)

let list1 = [12;45;23];;
let list2 = [56;67;87];;

let rec append lst1 lst2 = 
  match lst1 with
  | [] -> lst2
  | h::t -> h::append t lst2

  
