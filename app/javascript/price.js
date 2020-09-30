function tax_price(){

  const item_price = document.getElementById("item-price");
  item_price.addEventListener('input', () => {
    const tax = 10;
    const add_tax = document.getElementById("add-tax-price");
    const profit_price = document.getElementById("profit");
  
    add_tax.innerHTML = Math.floor((item_price.value * tax)/100);
    profit_price.innerHTML = Math.floor(item_price.value - (item_price.value * tax)/100);  
  });  
}
setInterval(tax_price , 1000);