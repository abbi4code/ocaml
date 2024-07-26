

type point = float * float;;

type shapes = 
  | Circle of {center: point ; radius: float}
  | Rectangle of {lower_left: point; upper_left: point}

;;

(* you defining center with two coordinates *)
let c1 = Circle {center= (0.0,0.0); radius = 5.4};;
let r1 = Rectangle {lower_left = (1.2,4.5); upper_left=(11.3,5.6)};;

(* print_int(c1);; *)