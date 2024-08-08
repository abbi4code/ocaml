open Str

(* Function to extract integers from a line *)
let extract_integers line =
  let re = regexp "[0-9]+" in
  let rec aux acc pos =
    try
      let _ = search_forward re line pos in
      let num = matched_string line in
      aux (int_of_string num :: acc) (match_end ())
    with Not_found -> List.rev acc
  in
  aux [] 0
(* Function to process each line *)
let process_line line =
  let integers = extract_integers line in
  let sum = List.fold_left (+) 0 integers in
  (integers, sum)

(* Main function to process input *)
let process_input () =
  let rec aux total_sum =
    try
      let line = input_line stdin in
      let integers, sum = process_line line in
      (* Print integers and their sum *)
      List.iter (fun n -> Printf.printf "%d + " n) integers;
      if integers <> [] then Printf.printf "\b\b= %d\n" sum;
      aux (total_sum + sum)
    with End_of_file ->
      Printf.printf "Total Sum = %d\n" total_sum
  in
  aux 0

let () =
  print_endline "Enter lines of text (Ctrl+D to finish):";
  process_input ()
