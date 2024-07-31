

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
  | e ->
    close_in_noerr ic;
    raise e;
;;


     