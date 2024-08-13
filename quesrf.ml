open Str

(* Function to extract integers from a line *)
let extract_integers line =
  let re = regexp "[0-9]+" in
  let rec aux acc pos =
    try
      let _ = search_forward re line pos in
      let num = matched_string line in
      aux (int_of_string num :: acc) (match_end ())
      (* Accumulate: aux (123 :: acc) (match_end ()) is called with acc = [123]
       and pos = match_end (), where match_end () 
       returns the position right after "123" (which is 3). *)
    with Not_found -> List.rev acc
  in
  aux [] 0

(* Function to process each line *)
let process_line line =
  let integers = extract_integers line in
  let sum = List.fold_left (+) 0 integers in
  (integers, sum)
  (* this (integers,sum ) means this process_line resurning this two things *)

(* Function to process input from either a file or stdin *)

(* this proces_input function taking a ext file or standard input 
then
  there is another recursive function aux that will take sum of each line and total sum 
 *)
let process_input filename_opt =
  (* so this input_channel take filename 
  if file is there then it will open it 
    and if not user can put inputs from terminal
       *)
  let input_channel = match filename_opt with
    | Some filename -> open_in filename
    | None -> stdin
  in
  let rec aux total_sum total_line_sums =
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
      (* Update the total sum and list of line sums *)
      aux (total_sum + sum) (total_line_sums @ [sum])
    with End_of_file ->
      (* Print the final sum calculation *)
      let line_sum_str = String.concat " + " (List.map string_of_int total_line_sums) in
      Printf.printf "%s = %d\n" line_sum_str total_sum;
      if input_channel <> stdin then close_in input_channel
  in
  aux 0 []

let () =
  if Array.length Sys.argv <= 1 then 
  print_endline("press ctrl + D to get the results");;
  let filename_opt = if Array.length Sys.argv > 1 then Some Sys.argv.(1) else None in
  process_input filename_opt
