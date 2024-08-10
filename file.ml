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

(* let () =
  let result = extract_integers "123hy 56jkl 8j5" in
  let sum = List.fold_left sumlft 0 result in
  print_endline(string_of_int(sum));;
  
  (* List.iter (Printf.printf "%d " ) result *)
;; *)
let process_line line =
  let result = extract_integers line in
  let sum = List.fold_left sumlft 0 result in
  (result,sum)
  (* print_endline(string_of_int(sum));; *)
  
  (* List.iter (Printf.printf "%d " ) result *)
;;


(* -------------revision *)

let line_integers line = 
  let expp = regexp "[0-9]+" in
  let rec aux lst pos =
    try
      let _ = search_forward expp line pos in 
      let num = matched_string line in 
      aux (int_of_string num :: lst) (match_end())
    with Not_found -> List.rev lst 
  in 
  aux [] 0
;;

let process_line line =
  let output = line_integers line in
  let summ = List.fold_left (+) 0 output in
  (output,summ)
;;

let process_file opt_file =
  let ic = match opt_file with
  | some filename -> open_in filename
  | None -> stdin
in
  let rec inp_line total_sum total_line_sums =
    try
      let line = input_line ic in 
      let output,summ = process_line line in 
      if output <> [] then 
        Printf.printf "%s = %d\n"
        (String.concat " + " (List.map string_of_int output)) 
        summ
      else
        Printf.printf "= 0\n";
      inp_line (total_sum + summ ) (total_line_sums @ [summ])
    with
    

        

