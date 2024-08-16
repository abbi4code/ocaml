(* creating a function to create a array of integers from 1 to 10 *)

let intarr x = x + 1;;

let arr_size = int_of_string( read_line()) in 
let arr = Array.init arr_size intarr in

Array.iter (fun x -> print_endline(string_of_int(x))) arr;;


(* Question: Write a function that takes an array of integers and returns the sum of its elements. *)

let sumlft acc x = acc + x ;;

let arr1 = [|12;34;45;23|] in 
let arr_sum = Array.fold_left sumlft 0 arr1 in 
print_endline(string_of_int(arr_sum));;

(* Finding the Maximum Element *)