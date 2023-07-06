import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async (event) => {
  const balance = await dbank_backend.checkBalance();
  document.getElementById("value").innerHTML = balance.toFixed(2);
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();
  
  const topUpAmount = parseFloat(document.getElementById("topup-amount").value);
  const withdrawAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  console.log([topUpAmount, withdrawAmount]);

  if(topUpAmount){
    const afterTopup = await dbank_backend.topUp(topUpAmount);
  }
  if(withdrawAmount){
    const afterWithdraw = await dbank_backend.withdraw(withdrawAmount);
  }
  
  const compountBalance = await dbank_backend.compound();
  console.log(compountBalance);
  document.getElementById("value").innerHTML = compountBalance.toFixed(2);
});

