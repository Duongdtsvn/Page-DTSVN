document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.querySelector('.nav-toggle');
  const mobileNav = document.querySelector('.nav-mobile');
  const submenuLinks = document.querySelectorAll('.nav-mobile__menu .nav-has-submenu > a');
  const langToggle = document.getElementById('lang-toggle');

  // Function to determine current language from URL
  function getCurrentLanguage() {
    const path = window.location.pathname;
    return path.startsWith('/en/') ? 'EN' : 'VN';
  }

  // Function to switch language and update URL
  function switchLanguage() {
    const currentPath = window.location.pathname;
    const currentLang = getCurrentLanguage();

    let newPath;
    if (currentLang === 'VN') {
      // Switch from Vietnamese to English
      if (currentPath === '/') {
        newPath = '/en/';
      } else {
        newPath = '/en' + currentPath;
      }
    } else {
      // Switch from English to Vietnamese
      if (currentPath.startsWith('/en/')) {
        newPath = currentPath.replace('/en/', '/');
        if (newPath === '/') {
          newPath = '/';
        }
      } else {
        newPath = currentPath.replace('/en', '');
      }
    }

    // Navigate to new URL
    window.location.href = newPath;
  }

  // Initialize language button
  function initializeLanguageButton() {
    const currentLang = getCurrentLanguage();
    langToggle.textContent = currentLang;
    langToggle.setAttribute('data-current-lang', currentLang);

    // Update button styling based on current language
    if (currentLang === 'EN') {
      langToggle.classList.add('active');
    } else {
      langToggle.classList.remove('active');
    }
  }

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

  // Language toggle functionality
  if (langToggle) {
    // Initialize button on page load
    initializeLanguageButton();

    // Add click event listener
    langToggle.addEventListener('click', switchLanguage);
  }
});