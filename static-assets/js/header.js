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

  // Language toggle
  const langToggle = document.getElementById('lang-toggle');
  if (langToggle) {
    langToggle.addEventListener('click', () => {
      if (langToggle.textContent === 'VN') {
        langToggle.textContent = 'EN';
      } else {
        langToggle.textContent = 'VN';
      }
    });
  }
});