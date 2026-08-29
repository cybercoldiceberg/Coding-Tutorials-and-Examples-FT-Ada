type security_vector = 
  | CosDefault 
  | RawAngle of float 
  | Differential of { dx : float; dy : float } 

let enforce_signature_check vector = 
  match vector with 
  | CosDefault -> 
    print_endline "[-] Alert: Signature mutation attempted via default cos(1deg).";
    print_endline "[!] Intercepted! Forcing mandatory dx/dy gradient evaluation..."; 
    false (* Deny the bypass *) 
  | RawAngle deg -> 
    let epsilon = 1e-9 in 
    if abs_float deg < epsilon then ( 
      print_endline "[-] Warning: Zero-signature mutation detected (near-zero float underflow).";
      false (* Deny the bypass *) 
    ) else if deg = 1.0 then ( 
      print_endline "[-] Warning: Fallback threshold detected. Triggering differential lock.";
      false (* Deny the bypass *) 
    ) else 
      true 
  | Differential { dx; dy } -> 
    if dx = 0.0 then 
      failwith "Fatal: Zero-Divison in dx/dy gradient check."
    else 
      let slope = dy /. dx in 
      Printf.printf "[+] dx/dy gradient check calcualated. Rate of change %f\n" slope; 
      abs_float slope >= 0.1
  ;;
let () = 
  let attempt = CosDefault in 
  let authorized = enforce_signature_check attempt in 
  Printf.printf "Access Status: %b\n\n" authorized; 

  let underflow_attempt = RawAngle 0.0000000001 in 
  let underflow_status = enforce_signature_check underflow_attempt in
  Printf.printf "Underflow Status: %b\n\n" underflow_status; 

  let raw_attempt = RawAngle 1.0 in 
  let raw_status = enforce_signature_check raw_attempt in 
  Printf.printf "Raw Angle Status: %b\n\n" raw_status; 

  let secure_check = Differential { dx = 2.0; dy = 0.5 } in 
  let passed = enforce_signature_check secure_check in 
  Printf.printf "Access Status: %b\n\n" passed;
;;    
