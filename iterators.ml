
(* "for" loop
for variable = start_value to end_value do
  (* code to execute *)
done

(* Decrementing loop *)
for variable = start_value downto end_value do
  (* code to execute *)
done *)
let () =
  for i = 1 to 5 do
    Printf.printf "%d\n" i
  done

let () =
  for i = 5 downto 1 do
    Printf.printf "%d\n" i
  done
;;
(* Nested Loops
You can nest loops to create more complex iterations. *)

let () =
  for i = 1 to 5 do
    for j = 1 to 5 do
      Printf.printf "%d * %d = %d\n" i j (i * j)
    done;
    print_newline ()
  done


  (* using breaks in iterators 

  * OCaml doesn’t have a built-in break statement to exit loops early, 
  but you can achieve a similar effect using exceptions*)
exception Break

let () =
  try
    for i = 1 to 10 do
      if i = 5 then raise Break;
      Printf.printf "%d\n" i
    done
  with Break -> Printf.printf "Loop exited at i = 5\n"
