const price = () => {

  window.addEventListener("load", () => {

    // 入力金額を取得
    const UnitPrice = document.getElementById('item-price');

    UnitPrice.addEventListener("input", () => {
      //手数料
      const inputValue = UnitPrice.value;
      const addTaxDom = document.getElementById('add-tax-price');
      addTaxDom.innerHTML = Math.floor(inputValue / 10);

      //利益
      const profit = document.getElementById('profit');
      profit.innerHTML = inputValue - Math.floor(inputValue / 10);;
    });

  });

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

