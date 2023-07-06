// to run program
// terminal 1 : dfx start
// terminal 2 : dfx deploy - after each set of changes

import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  let myConst = 123131242141; //let = constant 
  //stable keywork makes the variable persistent. It will keep it's state between deploys.
  stable var curentValue: Float = 300; //declare variable with value
  // curentValue := 300; //assign new value to variable :=
  // Debug.print("Hello"); //print string only
  // Debug.print(debug_show(curentValue));
  // Debug.print(debug_show(myConst));
  stable var startTime = Time.now();


  //update method - public func topUp(amount: Nat)
  public func topUp(amount: Float): async Float{
    curentValue += amount;
    return curentValue;
  };

  public func withdraw(amount: Float): async Float{
    let tempValue: Float = curentValue - amount;
    if(tempValue < 0){
      return 0;
    };
    curentValue -= amount;
    return curentValue - amount;
  };

  // query function, quicker, doesn't change state of canister.
  // return methods must be async and have a return type (): async Nat
  public query func checkBalance(): async Float {
    return curentValue;
  };

  public func compound(): async Float{
    let curentTime = Time.now();
    let timeElapsedNanoSec = curentTime - startTime;
    let timeElapsedSec = timeElapsedNanoSec / 1000000000;
    curentValue := curentValue * (1.01 ** Float.fromInt(timeElapsedSec));
    startTime := curentTime;
    return curentValue;
  };

  public query func getTime(): async Int {
    return startTime;
  };

  //here is a comment
  public query func sayHello(): async Text {
    return "Hello there";
  };
};
