

type point = float * float ;;

(* define as many type you want that you can use later *)
type shape =
  | Circle of {center: point ; radius: float}
  | Square of {lw_lft: point ; upr_rt: point}
;;

let c1 = Circle {center = (2.3,3.4); radius = 4.5}
let r1 = Square {lw_lft = (1.0,2.0); upr_rt = (3.5,4.5)}

let avg a b =
  (a +. b) /. 2. 
;;

(* using pattern matching for printing center *)

(* let center s = 
  match s with
  | Circle {center; radius} -> center
  | Square {lw_lft ; upr_rt} -> 
    let (x_ll, y_ll) = lw_lft in 
    let (x_ur, y_ur) =  upr_rt in 
    (avg x_ll x_ur, avg y_ll y_ur)  *)

  ;;

  (* this is much cleaner will help when dealing with more complexity *)
let center s = 
  match s with
  | Circle {center; radius} -> center
  | Square {lw_lft = (x_ll, y_ll) ; upr_rt = (x_ur, y_ur)} -> 
    (avg x_ll x_ur, avg y_ll y_ur) 




