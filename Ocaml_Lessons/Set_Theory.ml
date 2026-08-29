type 'a set = 'a list 
let empty : 'a set = []
let rec mem x s = 
  match s with 
  | [] -> false 
  | h :: t -> h = x || mem x t 
;; 
let insert x s = 
  if mem x s then s else x :: s 
;;
let of_list lst = 
List.fold_left (fun acc x -> insert x acc) empty lst
;;

let rec union s1 s2 = 
  match s1 with 
  | [] -> s2
  | h :: t -> union t (insert h s2) 
;;
let rec intersection s1 s2 = 
  match s1 with 
  | [] -> [] 
  | h :: t -> 
    if mem h s2 then h :: intersection t s2 
    else intersection t s2

let rec difference s1 s2 = 
  match s1 with 
  | [] -> []
  | h :: t -> 
    if mem h s2 then difference t s2 
    else h :: difference t s2 
;;
let print_set name s =
  print_string (name ^ " = { ");
  List.iter (fun x -> print_int x; print_string " ") s; 
  print_endline "}"
;;

let () = 
  let set_a = of_list [1; 2; 3; 4; 5] in 
  let set_b = of_list [4; 5; 6; 7; 8] in 
  print_set "Set A" set_a; 
  print_set "Set B" set_b; 
  let u = union set_a set_b in 	
  print_set "Union (A U B)" u; 
  let inter = intersection set_a set_b in 
  print_set "Intersection (A n B)" inter;
  let diff = difference set_a set_b in 
  print_set "Difference (A \ B)" diff; 
  
;; 
