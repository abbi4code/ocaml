
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