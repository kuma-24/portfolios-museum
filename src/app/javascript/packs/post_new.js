'use strict';

{
  const input = document.getElementsByClassName("limit-text");
  const count = document.getElementsByClassName("limit-count");
  
  for (let i = 0, j = 0; i < input.length, j < count.length; i++, j++) {
    input[i].addEventListener('keyup', () => {
      let inputText = input[i].value.length
      count[j].innerHTML = inputText
    })
  }
}

{
  const fileElemnt = document.getElementById('post_form_thumbnail_img');
  const fileIcon = document.getElementById('thumbnail-img');

  fileElemnt.addEventListener("change", handleFiles, false);

  function handleFiles() {
    if (!this.files.length) {
      fileIcon.innerHTML = "<i class=\"fas fa-camera-retro size\"></i>"
    } else {
      fileIcon.innerHTML = "";
      const ul = document.createElement("ul");
      fileIcon.appendChild(ul);

      for (let i = 0; i < this.files.length; i++) {
        const li = document.createElement("li");
        ul.appendChild(li);

        const img = document.createElement("img");
        img.src = URL.createObjectURL(this.files[i]);
        img.onload = function () {
          URL.revokeObjectURL(this.src);
        }
        li.appendChild(img);
      }
    }
  }
}
