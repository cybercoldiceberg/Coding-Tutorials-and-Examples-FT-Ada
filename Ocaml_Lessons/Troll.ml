(* Troll.ml *) 
let red = "\027[31m"
let green = "\027[32m"
let cyan  = "\027[36m"
let magenta = "\027[35m"
let bold = "\027[1m"
let reset = "\027[0m"
type bot_status = 
  | Online (* Added bot thats online Warning fixed! *)
  | Offline 
  | Rogue of string 
  | LaunchingToMoon
  
let evaluate_unit name status = 
  match status with 
  | Online -> green ^ name ^ " is operating normal." ^ reset (* Adding ASCII Escape codes to make colors from declared variables *) 
  | Offline -> "\027[90m" ^ name ^ " is currently powered down." ^ reset 
  | Rogue reason -> red ^ name ^ " is out of control! Reason: " ^ reason ^ reset
  | LaunchingToMoon -> cyan ^ name ^ " is blasting off with shit-rocket propulsion!" ^ reset
;;

type bot_record = { 
  name : string; 
  status : bot_status; 
  battery_level : int;
};; 

let rocket_unit = { 
  name = "Rocket-Bot";
  status = Rogue "Arab shit posting and twerking to beware of the boys.";
  battery_level = 12345;
};;
(* He is unstoppable his battery level is insane *) 

let alpha_unit = { 
  name = "Alpha-Bot"; 
  status = LaunchingToMoon;
  battery_level = 67;
};; 

(* Added beta_unit fix *) 

let beta_unit = { 
  name = "Bet-Bot"; 
  status = Offline; 
  battery_level = 0;
};;

let online_unit = { 
  name = "Omega-Bot";
  status = Online; (* Here we added the online unit fixed delimeter not used error *) 
  battery_level = 67; 
};;

let () = 
  print_endline (evaluate_unit rocket_unit.name rocket_unit.status);
  print_endline ("Reactor Core Status -> Battery Power: " ^ string_of_int rocket_unit.battery_level); 
  print_endline (evaluate_unit alpha_unit.name alpha_unit.status); 
  print_endline (evaluate_unit beta_unit.name beta_unit.status); 
  print_endline (evaluate_unit online_unit.name online_unit.status); (* Added online_unit fix to let block, to fix delimeter online not used Warning! *) 

;;

let fleet = [rocket_unit; alpha_unit; beta_unit; online_unit];;

let rouge_bots = List.filter (fun bot -> 
 match bot.status with 
 | Rogue _ -> true 
 | _ -> false 
) fleet;; 
let () = 
  print_endline ("Total rouge units detected: " ^ string_of_int (List.length rouge_bots)); 
;;

(* Check bots danger levels *)
let danger_score bot = 
 match bot.status with 
 | Offline -> 0 
 | Online -> 10
 | LaunchingToMoon -> 80
 | Rogue _ -> 1000
;;
(* Compare set [A, B] pair of bots *)

let compare_danger_pair bot_a bot_b = 
  let score_a = danger_score bot_a in
  let score_b = danger_score bot_b in 
  if score_a > score_b then 
  bot_a.name ^ " (" ^ string_of_int score_a ^ ") outweigs " ^ bot_b.name ^ " in threat level." 
  else if score_b > score_a then
    bot_b.name ^ " (" ^ string_of_int score_b ^ ") outweighs " ^ bot_a.name ^ " in threat level."
  else 
   bot_a.name ^ " and " ^ bot_b.name ^ " are at equal threat levels."
;;

let sorted_fleet = List.sort (fun b1 b2 -> compare (danger_score b2) (danger_score b1)) fleet;; 

(* Lets add our let block. *)
let () = 
  print_endline (compare_danger_pair rocket_unit alpha_unit); 
  print_endline @@ ("Most dangerous unit in fleet: " ^ magenta ^ bold ^ (List.hd sorted_fleet).name) ^ reset; (* Added Magenta Color from declared variable to add dramatic feelings *) (* Syntax fixed with the little spice a sprinkled using the @@ operator!*) 
;; 
