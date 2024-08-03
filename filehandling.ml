
(* reading filess *)
let read_file filename =
  let ic = open_in filename in 
  try
    let rec read_lines() =
      try
        let line = input_line ic in
        print_endline(line);
        read_lines()
      with
      | End_of_file -> ()
    in
    read_lines();
    close_in ic
  with
  (* if any exceptions happens then it will close the ic  *)
  | e ->
    close_in_noerr ic;
    raise e;
;;

(* writingg files *)

let write_file filename content =
  let oc = open_out filename in
  try
    output_string oc content;
    (* write content to the file *)
    flush oc;
    close_out oc;
  with
  | e ->
         close_out_noerr oc;
         raise e;
  ;;


     