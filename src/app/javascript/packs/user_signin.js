'use strict';

{
  let btn_passview = document.getElementById("btn_passview");
  let input_pass = document.getElementById("user_password");

  btn_passview.addEventListener("click", (e) => {
    e.preventDefault();

    if (input_pass.type === "password") {
      input_pass.type = "text";
      btn_passview.textContent = "非表示";
    } else {
      input_pass.type = 'password';
      btn_passview.textContent = '表示';
    }
  });
}