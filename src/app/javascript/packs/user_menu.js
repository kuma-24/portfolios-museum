'use strict';

window.onload = function() {
  const open = document.getElementById('open');
  const user_menu = document.querySelector('.user-menu'); 
  
  if (open === null) {
    return false;
  }
  else {
    open.addEventListener('click', () => {
      user_menu.classList.toggle('show');
    });
  }
};