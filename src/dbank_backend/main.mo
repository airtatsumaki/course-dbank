// to run program
// terminal 1 : dfx start
// terminal 2 : dfx deploy - after each set of changes

import Debug "mo:base/Debug";

actor DBank{
  let myConst = 123131242141; //let = constant 
  var curentValue = 300; //declare variable with value
  curentValue := 100; //assign new value to variable :=
  // Debug.print("Hello"); //print string only
  // Debug.print(debug_show(curentValue));
  // Debug.print(debug_show(myConst));

  public func topUp(amount: Nat){
    curentValue += amount;
    Debug.print(debug_show(curentValue));
  };

  public func withdraw(amount: Nat){
    let tempValue: Int = curentValue - amount;
    if(tempValue >= 0){
      curentValue -= amount;
      Debug.print(debug_show(curentValue));
    } else {
      Debug.print("Sorry couldn't withdraw. You'd be in an overdraft");
    };
  };

  //topUp();

};
