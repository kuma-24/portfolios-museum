'use strict';

// {
//   window.addEventListener('scroll', () => {
//     const page_top = document.querySelector('.page-top')
//     const currentY = window.pageYOffset;
  
//     if (currentY > 300) {
//       setTimeout(function() {
//         page_top.classList.add('scroll');
//       }, 1);
//     } else {
//       setTimeout(function() {
//         page_top.classList.remove('scroll');
//       }, 1);
//     }
//   });
// }

// {
//   const logo = document.getElementById('logo');
//   const header = document.querySelector('.header-page');
//   const logoSize = document.getElementById('page-logo-size');
  
//   if (logo === null) {
//     header.style.marginTop = "0vh";
//   } else {
//     header.style.marginTop = getComputedStyle(logoSize).height;
//   }
// }

{
  const logoHeight = document.querySelector('.postIndex-page-logo');
  const header_marginTop = document.querySelector('.header-page');
  header_marginTop.style.marginTop = getComputedStyle(logoHeight).height;
}
