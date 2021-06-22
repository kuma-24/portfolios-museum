'use strict';

{ //ユーザーアイコンプレビュー機能
  const fileElem = document.getElementById('user_profile_attributes_avatar_img');
  const fileList = document.getElementById('file-list');

  fileElem.addEventListener("change", handleFiles, false);
  
  function handleFiles() {
    if (!this.files.length) {
      fileList.innerHTML = "<i class=\"fas fa-camera-retro size\"></i>";
    } else {
      fileList.innerHTML = "";
      const list = document.createElement("ul"); 
      fileList.appendChild(list);
      for (let i = 0; i < this.files.length; i++) { 
        const li = document.createElement("li");
        list.appendChild(li); 
  
        const img = document.createElement("img"); 
        img.src = URL.createObjectURL(this.files[i]);
        img.height = 60;
        img.width = 60;
        img.onload = function() { 
          URL.revokeObjectURL(this.src); 
        }
        li.appendChild(img);
      }
    }
  }
}

{ //文字数カウント機能
  let mandatoryInput = document.getElementById('user_name');
  let mandatoryCount = document.getElementById('name-count');

  let anyInput = document.getElementById('self-introduction-input');
  let anyCount = document.getElementById('self-introduction-count');

  mandatoryInput.addEventListener('keyup', () => {
    mandatoryCount.textContent = mandatoryInput.value.length;
  });

  anyInput.addEventListener('keyup', () => {
    anyCount.textContent = anyInput.value.length;
  })
}

{ //パスワード表示切り替え機能
  let btnPassview = document.getElementById("btn_passview");
  let inputPass = document.getElementById("user_password");

  btnPassview.addEventListener("click", (e) => {
    e.preventDefault();

    if (inputpass.type === "password") {
      inputPass.type = "text";
      btnPassview.textContent = "非表示";
    } else {
      inputPass.type = 'password';
      btnPassview.textContent = '表示';
    }
  });
}

{ //任意項目切り替え機能
  let checkbox = document.getElementById('check1');
  let labelText = document.getElementById('check1-content');
  let anyForm = document.getElementById('any-form');

  checkbox.addEventListener('change', () => {
    if (checkbox.checked) {
      labelText.innerHTML = '任意項目の設定を閉じますか？';
      anyForm.style.display = 'flex';
    } else {
      labelText.innerHTML = '任意項目の設定をしますか？';
      anyForm.style.display = 'none';
    }
  });
}
