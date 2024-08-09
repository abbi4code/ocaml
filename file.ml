(* using str module *)
open Str

(* creating a function that will take line as input and extract integer from it and push them in list *)

let extract_integers line =
  let expp = regexp "[0-9]+" in 

  (* now creating a recusive function that takes a list and pos to start as arg *)
  let rec bulk acc ind =
    try
      let _ = search_forward expp line ind in 
      (* now getting that number if above is successfull means it able to find a number *)
        (* matched_string will give you that return number *)
      let number = matched_string line in 
      bulk (int_of_string number :: acc) (match_end())
      (* now if no number found as list will reverse as everytime  *)
    with Not_found -> List.rev acc 
  in
  bulk [] 0
;;
(* need to create a function that will sum up the list *)
let sumlft acc x = acc + x ;;

let () =
  let result = extract_integers "123hy 56jkl 8j5" in
  let sum = List.fold_left sumlft 0 result in
  print_endline(string_of_int(sum));;
  
  (* List.iter (Printf.printf "%d " ) result *)
;;
