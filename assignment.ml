open Str  (* For regular expressions *)

(* Function to extract all integers from a string and return them as a list *)
let extract_integers s =
  let re = regexp "[0-9]+" in
  let rec aux pos acc =
    if string_match re s pos then
      let matched = matched_string s in
      aux (pos + String.length matched) (int_of_string matched :: acc)
    else
      List.rev acc
  in
  aux 0 []

(* Function to process each line: extract integers, emit list and sum *)
let process_line line =
  let numbers = extract_integers line in
  let sum = List.fold_left (+) 0 numbers in
  numbers, sum

(* Main function to read input from a file or terminal and process it *)
let () =
  let rec read_lines acc =
    try
      let line = input_line stdin in
      let numbers, sum = process_line line in
      (numbers, sum) :: acc |> read_lines
    with
    | End_of_file -> acc
  in
  let results = List.rev (read_lines []) in

  (* Print each line's numbers and sum *)
  let total_sum =
    List.fold_left
      (fun acc (numbers, sum) ->
         (match numbers with
          | [] -> Printf.printf "= 0\n"
          | _ ->
            Printf.printf "%s = %d\n"
              (String.concat " + " (List.map string_of_int numbers)) sum);
         acc + sum)
      0 results
  in

  (* Print the total sum of all numbers *)
  Printf.printf "Total sum = %d\n" total_sum
