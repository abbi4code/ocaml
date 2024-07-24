let num = fun x -> x + 1;;

(* finding avg of nos from 1 to 100 *)

(* let n = 100;; *)



let rec sum n = 
  if n=0 then 0
  else n + sum(n -1);;

let result = sum 100
let x = result / 100;; 



print_int(x);;
