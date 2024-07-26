

type point = float * float;;

type shapes = 
  | Circle of {center: point ; radius: float}
  | Rectangle 

;;

(* you defining center with two coordinates *)
let c1 = Circle {center= (0.4,2.3); radius = 5.4};;

(* print_int(c1);; *)