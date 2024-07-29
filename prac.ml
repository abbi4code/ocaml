
(* appendings two lists into one *)

let list1 = [12;23;43;];;
let list2 = [1;2;3];;

let rec merge lst1 lst2 = 
  match (lst1 ,lst2) with
  | ([],[]) -> []
  | ([], h2::t2) -> h2::merge [] t2
  | (h1::t1, []) -> h1::merge t1 []
  | (h1::t1, h2::t2)-> h1::h2::merge t1 t2
;;

let res = merge list1 list2;;

(* print_endline(List.map x = print_int(x);; res) *)

(* question 1 
Write a function is_even that takes an integer and 
returns true if the integer is even and 
false otherwise using pattern matching.*)

let checkeven x =
  if x mod 2 == 0  then true
  else false
;;

(* question 2
Write a function head_option that takes a list and 
returns Some of the head element if the list is non-empty,
and None if the list is empty. *)

let rec head_option lst =
  match lst with 
  | [] -> 0
  | h::t -> h + head_option t
;;








