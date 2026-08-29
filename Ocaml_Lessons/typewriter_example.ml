(* Typewriter for OCAML. *)
let typewriter_print text delay_seconds = 
  String.iter (fun c -> 
    print_char c; 
    flush stdout;
    Unix.sleepf delay_seconds 
  ) text; 
  print_newline () 
;;
let () = 
  typewriter_print "Hello welcome to ocaml ride on my back JI!..." 0.05; (* I added 0.05 as my time you can choose whatever time you would like! *) 
;;
