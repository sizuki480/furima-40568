const pay = () => {

  const payjp = Payjp('pk_test_9d7a613339ba24b27ba65261')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // フォームの定義
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')

  // submitしたら
  form.addEventListener("submit", (e) => {

    // 本来の処理をキャンセル
    e.preventDefault();

    // 戻り値としてトークン情報を取得
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {

        // トークンの情報をフォームに追加
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }


      
      // フォームのクリア
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      // トークン情報のサーバーへの送信
      document.getElementById("charge-form").submit();
    });


  });
};


window.addEventListener("load", pay);


  // console.log("");