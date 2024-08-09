
open Str

(* creating a function to extract integer from a line *)

let integers line =
  (* now need to create a expression to match and get the desiered no only *)
  let exp = regexp "[0-9]+" in
  (* now creating a function to get all those numbers *)
  let rec bulk acc pos =
    try
      (* checking for matches in the line
      it will take your created matched constrained exp and the exp with a 
      pos to start searching*)
      let _ = search_forward exp line pos in 
      (* get that num that matches with our given exp obj *)
      let num = matched_string line in
      (* converting our string to integer and accumulate in acc and continue
      seaching from end of the match *)
      bulk (int_of_string num :: acc) (match_end ())
    with Not_found -> List.rev acc
        (* if no match found it will returns you a reverse list to get the 
          correct order*)
  in
  (* this just taking two arg one a  *)
  bulk [] 0 
;;

let add_lft acc x = acc + x;;
let process_line eachline =
  let nums = integers eachline in 
  let sum = List.fold_left add_lft 0 nums in
  (* this below is just a tuple containing that two values *)
  (integers,sum)
;;
let () =
  let test_line = "Here are some numbers: 12, 34, and 56." in
  let (nums, sum) = process_line test_line in
  Printf.printf "Extracted integers: %s\n" (String.concat ", " (List.map string_of_int nums));
  Printf.printf "Sum of integers: %d\n" sum
;;

        
