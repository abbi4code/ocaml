
(* appendings two lists into one *)
open Str
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

(* Write a function swap that takes a tuple (a, b) and returns a tuple (b, a) using pattern matching. *)

let tuple = (12,23,45);;
let swap (int1,int2)  =
  match (int1,int2) with
  | (int1,int2) -> (int2,int1)
;;

(* squaring the element of the lists *)

let sq x = x*x;;
let sqlist = List.map sq [12;23;123;32];;

(* file handlinggg *)

(* readflie
open 
input_line *)

let read_file filename =
  let ic = open_in filename in 
  try
    let rec lines() =
    try
      let each_line = input_line ic in
      print_endline(each_line);
      lines()
    with
        End_of_file -> ()
     in 
      lines();
      close_in ic
  with 
      | e ->
        close_in_noerr ic;
        raise e
      ;;

(* Trees revision 
creating a tree 2 3 4 5 6 7 8*)

type 'a tree =
| Leaf 
| Node of int * 'a tree * 'a tree
;;

let t2 = 
  Node(2,
      Node(3,
        Node(5,Leaf,Leaf),
        Node(6,Leaf,Leaf)),
      Node(4,
        Node(7,Leaf,Leaf),
        Node(8,Leaf,Leaf))

);;

let rec length t=
  match t with
  | Leaf -> 0
  | Node (_,left_node,right_node) -> 1 + length left_node + length right_node 
;;


let newlst = [1;2;4;5;6];;

let revlst = List.rev newlst

(* List.left_fold *)

let mullft ran x = ran * x;;
let lftfoldsum = List.fold_left mullft 1 newlst
let lftfoldsum2 = List.fold_left (+) 0 revlst;;


(* some string functionss *)
(* String.concat used to concat a list of strings into a single string
sep: A string that will be inserted between each pair of elements in the list.
list_of_strings: A list of strings that you want to concatenate.
<-----sep is optional----->
  eg: let result = String.concat ", " ["apple"; "banana"; "cherry"];;
 *)
Printf.printf "%s = %d\n"
  (String.concat " + " (List.map string_of_int newlst))


         













