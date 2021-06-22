'use strict';

{
  window.addEventListener('load', () => {
    const menuTrigger = document.getElementById('user-menu-trigger');

    if (menuTrigger == null) {
      return false
    } else {
      const headerHeight = document.querySelector('.header-page');
      const menuOpen = document.querySelector('.header-user-nav');
      const menuClose = document.querySelector('.header-user-menu');
      const menuPosition = document.getElementById('nav-menu-target');

      menuPosition.style.top = getComputedStyle(headerHeight).height;

      menuTrigger.addEventListener('click', () => {
        if (menuOpen.className == 'header-user-nav show') {
          menuOpen.classList.remove('show');
          menuClose.innerHTML = 'メニュー';
        } else {
          menuOpen.classList.add('show');
          menuClose.innerHTML = '閉じる';
        }
      });
    }
  });
}

{
  window.addEventListener('load', () => {
    const windowWidth = window.outerWidth;
    
    if (319 <= windowWidth && windowWidth < 520) {
      const headerHeight = document.querySelector('.header-page');
      const searchTrigger = document.querySelector('.header-search-trigger');
      const searchName = document.querySelector('.header-search-name');
      const searchMenu = document.querySelector('.header-search');

      searchTrigger.addEventListener('click', () => {
        searchMenu.style.top = getComputedStyle(headerHeight).height;

        if (searchMenu.className == 'header-search show') {
          searchMenu.classList.remove('show');
          searchName.innerHTML = '検索'
        } else {
          searchMenu.classList.add('show');
          searchName.innerHTML = '閉じる'
        }
      });
    } else {
      return false;
    }
  });
}