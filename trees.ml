
(* creating a another variant type tree *)
type 'a tree = 
  | Leaf 
  | Node of int * 'a tree * 'a tree
;;

let t = 
  Node (3,
          Node (2,Leaf, Leaf),
          Node (4, Leaf, Leaf)
      )
;;

(* size of the binary tree *)

(* let rec size tree = 
  match tree with
  | Leaf -> 0 
  | Node (_,l,r) -> 1 + size l + size r
;; *)
let rec size = function
  | Leaf -> 0
  | Node (_,l,r) -> 1 + size l + size r
;;

(* summation of all values of each node *)

let rec sum = function 
  | Leaf -> 0
  | Node (v,l,r) -> v + sum l + sum r
;;
