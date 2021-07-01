'use strict';

{
  const input = document.getElementsByClassName("limit-text");
  const count = document.getElementsByClassName("limit-count");

  for (let i = 0, j = 0; i < input.length, j < count.length; i++, j++) {
    count[j].textContent = input[i].value.length;
    
    input[i].addEventListener('keyup', () => {
      let inputText = input[i].value.length;
      count[j].innerHTML = inputText;
    })
  }
}

{
  const fileElem = document.getElementById('user_profile_attributes_avatar_img');
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
        img.onload = function () {
          URL.revokeObjectURL(this.src);
        }
        li.appendChild(img);
      }
    }
  }
}
