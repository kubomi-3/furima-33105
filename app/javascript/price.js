function reflection() {

  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('input', function(){
    current_price = price.value
    tax.innerHTML = Math.floor(current_price * 0.1)
    profit.innerHTML = current_price - tax.innerHTML
  })  
}

window.addEventListener('load', reflection)