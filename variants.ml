

type point = float * float ;;

(* define as many type you want that you can use later *)
type shape =
  | Circle of {center: point ; radius: float}
  | Square of {lw_lft: point ; upr_rt: point}
  | Cylinder of {center: point;radius: float ; height: float}
;;

let c1 = Circle {center = (2.3,3.4); radius = 4.5}
let r1 = Square {lw_lft = (1.0,2.0); upr_rt = (3.5,4.5)}

let cyl  = Cylinder {center = (0.0,0.0);radius = 5.6 ; height = 7.0}

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

  let cylvol r h =
    3.14 *. r *. r *. h ;;
  ;;

  (* this is much cleaner will help when dealing with more complexity *)

let center s = 
  match s with
  | Circle {center; radius} -> center
  | Square {lw_lft = (x_ll, y_ll) ; upr_rt = (x_ur, y_ur)} -> 
    (avg x_ll x_ur, avg y_ll y_ur) 
  | Cylinder {radius; height;_} -> (cylvol radius height, 0.0)
  ;;


type person = 
  | Child of {name: string ; age: int}
  | Woman of {name: string ; age: int}
;;

let child1 = Child {name= "abhishek";age= 19};;
let woman1 = Child {name= "abhii";age= 24};;






