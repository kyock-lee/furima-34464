window.addEventListener('load', () => {
  
  const costInput = document.getElementById("item-price");
  costInput.addEventListener("input", () => {
  const inputValue = costInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML =  (Math.floor(inputValue * 0.1));

    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));


  });
})