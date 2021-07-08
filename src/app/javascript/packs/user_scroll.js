'use strict';

{
  const logoHeight = document.querySelector('.postIndex-page-logo');
  const header_marginTop = document.querySelector('.header-page');
  header_marginTop.style.marginTop = getComputedStyle(logoHeight).height;
}
