(* creating array in ocaml there are multiple ways actually *)

(* using Array.make
1st arg: size of array
2nd arg: initial value of all element
 *)

let arr = Array.make 5 0;;

(* using Array.init
1st arg -> size of array
2nd arg -> function that takes the index of an element and returns the value 
of that element *)

(* let arr1 = Array.init 5 (fun i -> i+2);; *)
let func i = i + 2;;
let arr1 = Array.init 5 func ;;

(* You can also create an array using the [| ... |] syntax  *)

let arr3  = [|1;2;3;5|];;

(* <----------Accessing Elements--------------> *)