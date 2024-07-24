let x = 
  match not true with
  | true -> "hi there"
  | false -> "false"
;;

let random = 
  match "abhishek" with
  | "abhishek" -> "hi there"
  | _ -> "false"

;;

let check = 
  match [1,2,4] with
  | [] -> "empty"
  | _ -> "not empty"
;;


(* taking out data out off pattern matching *)

let celeb = 
  match ["abhishek"; "kumar"; "one more"] with
  | [] -> ["empty"]
  | x::xs -> xs
;;
(* 
* here match will has the value will it match with the following pattern
* if it does it will return the value of the pattern
* if it does not it will return the value of the next pattern
* x :: xs means x is the first element of the list and xs is the rest of the list
 *)
(* let () = print_endline(celeb) *)


let () = print_endline(x)