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

(* Function to process input from either a file or stdin *)
let process_input filename_opt =
  let input_channel = match filename_opt with
    | Some filename -> open_in filename
    | None -> stdin
  in
  let rec aux total_sum =
    try
      let line = input_line input_channel in
      let integers, sum = process_line line in
      (* Print the list of integers *)
      if integers <> [] then
        Printf.printf "%s = %d\n" 
          (String.concat " + " (List.map string_of_int integers))
          sum
      else
        Printf.printf "= 0\n";
      (* Update the total sum *)
      aux (total_sum + sum)
    with End_of_file ->
      (* Print the total sum *)
      Printf.printf "%d + %d = %d\n" total_sum total_sum total_sum;
      if input_channel <> stdin then close_in input_channel
  in
  aux 0

let () =
  let filename_opt = if Array.length Sys.argv > 1 then Some Sys.argv.(1) else None in
  process_input filename_opt
