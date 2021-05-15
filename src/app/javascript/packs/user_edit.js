'use strict';

{
  let name_input = document.getElementById("name-input");
  let name_count = document.getElementById("name-count");
  
  name_count.textContent = name_input.value.length;

  name_input.addEventListener("keyup", function() {
    name_count.textContent = name_input.value.length;
  });

  let introduction_input = document.getElementById("introduction-input");
  let introduction_count = document.getElementById("introduction-count");

  introduction_count.textContent = introduction_input.value.length;

  introduction_input.addEventListener("keyup", function () {
    introduction_count.textContent = introduction_input.value.length;
  });
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
