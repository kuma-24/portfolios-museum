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
  const spMax = 519;
  const tbMax = 1024;
  let window_w = window.innerWidth;
  let page_header = document.querySelector(".page-header");
  
  if (window_w < spMax) {
    page_header.style.marginTop = "12vh";
    page_header.style.width = "100%";
  } 
  if (window_w > spMax & window_w < tbMax) {
    page_header.style.marginTop = "12vh";
    page_header.style.width = "100%";
  } 
  if (window_w > tbMax) {
    page_header.style.marginTop = "25vh";
    page_header.style.width = "100%";
  }
}