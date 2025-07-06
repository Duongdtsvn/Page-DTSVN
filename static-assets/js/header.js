document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.querySelector('.nav-toggle');
  const mobileNav = document.querySelector('.nav-mobile');
  const submenuLinks = document.querySelectorAll('.nav-mobile__menu .nav-has-submenu > a');

  // Toggle mobile menu
  toggleButton.addEventListener('click', () => {
    mobileNav.classList.toggle('active');
    toggleButton.textContent = mobileNav.classList.contains('active') ? '✕' : '☰';
  });

  // Toggle submenu on mobile
  submenuLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault(); // Prevent navigation for parent link
      const parentLi = link.parentElement;
      const submenu = parentLi.querySelector('.nav-submenu');
      parentLi.classList.toggle('active');
      submenu.classList.toggle('active');
    });
  });

  // Close mobile menu when clicking a non-submenu link
  const menuLinks = document.querySelectorAll('.nav-mobile__menu a:not(.nav-has-submenu > a)');
  menuLinks.forEach(link => {
    link.addEventListener('click', () => {
      mobileNav.classList.remove('active');
      toggleButton.textContent = '☰';
    });
  });

  // Language switcher logic
  const langBtns = document.querySelectorAll('.lang-btn');
  const currentPath = window.location.pathname;
  let isEN = currentPath.startsWith('/en/');

  langBtns.forEach(btn => {
    if ((btn.textContent === 'EN' && isEN) || (btn.textContent === 'VN' && !isEN)) {
      btn.classList.add('active');
    } else {
      btn.classList.remove('active');
    }
    btn.addEventListener('click', () => {
      let newUrl;
      if (btn.textContent === 'EN' && !isEN) {
        // Chuyển sang EN: thêm /en vào trước path
        newUrl = '/en' + (currentPath === '/' ? '' : currentPath);
      } else if (btn.textContent === 'VN' && isEN) {
        // Chuyển sang VN: bỏ /en khỏi path
        newUrl = currentPath.replace(/^\/en/, '') || '/';
      } else {
        return; // Đã ở đúng ngôn ngữ
      }
      window.location.pathname = newUrl;
    });
  });
});