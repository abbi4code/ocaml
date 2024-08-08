
open Str

(* createing a function to extract integer from a line *)

let integers line =
  (* now need to create a expression to match and get the desiered no only *)
  let exp = regexp "[0-9]+" in
  (* now creating a function to get all those numbers *)
  let rec aux acc pos =
    try
      (* checking for matches in the line*)
      let _ = search_forward line in 
      (* get that num that matches with our given exp obj *)
      let num = matched_string line in
      (* converting our string to integer and accumulate in acc and continue
      seaching from end of the match *)
      aux (int_of_string num :: acc) (match_end ())
    with Not_found -> List.rev acc
        (* if no match found it will returns you a reverse list to get the 
          correct order*)
  in
  (* this just taking two arg one a  *)
  aux [] 0 

        
