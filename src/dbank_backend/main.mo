// to run program
// terminal 1 : dfx start
// terminal 2 : dfx deploy - after each set of changes

import Debug "mo:base/Debug";

actor DBank{
  let myConst = 123131242141; //let = constant 
  var curentValue = 300; //declare variable with value
  curentValue := 100; //assign new value to variable :=
  Debug.print("Hello"); //print string only
  Debug.print(debug_show(curentValue));
  Debug.print(debug_show(myConst));
};
