'use strict';

{
  window.addEventListener('scroll', () => {
    const page_top = document.querySelector('.page-top')
    const currentY = window.pageYOffset;
  
    if (currentY > 300) {
      setTimeout(function() {
        page_top.classList.add('scroll');
      }, 1);
    } else {
      setTimeout(function() {
        page_top.classList.remove('scroll');
      }, 1);
    }
  });
}

{
  const logo = document.getElementById('logo');
  const header = document.querySelector('.page-header');
  
  if (logo === null) {
    header.style.marginTop = "0vh";
  } else {
    header.style.marginTop = "12vh";
  }
}