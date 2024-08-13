open Str

(* extracting out integers from the each line and putting them into the list and reversing them to get the correct order *)
let extract_integers line = 
  let exp = regexp "[0-9]+" in
  let rec aux acc pos =
    try
      let _ = search_forward exp line pos in 
      let num = matched_string line in 
      aux (int_of_string num :: acc) (match_end());
    with 
        End_of_file -> List.rev acc  
  in aux [] 0 
;;

(* now taking out each of them and getting the sum and list *)

let process_line line = 
  let integers = extract_integers line in 
  let sum = List.fold_left (+) 0 integers in 
  (integers,sum)
;;

(* now taking out input from the user depending on input type  *)

let process_input opt_filename =
  let ic = match opt_filename with
    | Some filename -> open_in filename
    | None -> stdin
in 
  let rec aux line_sum total_line_sums =
    let line = input_line ic in
    let integers,sum = process_line line in 
    if integers <> [] then
      Printf.printf "%s=%d\n" 
      (String.concat " + " (List.map  string_of_int integers)) sum
    else
      Printf.printf "=0\n"
    



