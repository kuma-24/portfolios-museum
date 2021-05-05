'use strict';

{
  const fileElem = document.getElementById('user_profile_attributes_avatar_img');
  const fileSelect = document.getElementById('file-select');
  const fileList = document.getElementById('file-list');
  
  
  fileElem.addEventListener("change", handleFiles, false);
  
  function handleFiles() {
    if (!this.files.length) {
      fileList.innerHTML = "<i class=\"fas fa-camera-retro size\"></i>"
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

{
  let any_input = document.getElementById("any-input");
  let any_count = document.getElementById("any-count");
  
  any_input.addEventListener("keyup", function() {
    any_count.textContent = any_input.value.length;
  });
}

{
  let mandatory_input = document.getElementById("mandatory-input");
  let mandatory_count = document.getElementById("mandatory-count");

  mandatory_input.addEventListener("keyup", function() {
    mandatory_count.textContent = mandatory_input.value.length;
  });
}

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

{
  const button = document.getElementById('toggle');
  button.addEventListener('click', () => {
    button.classList.toggle('lock');
  });
}
