// Đợi trang web load xong hoàn toàn trước khi chạy code
document.addEventListener('DOMContentLoaded', () => {
  // Lấy các phần tử cần thiết từ DOM
  const toggleButton = document.querySelector('.nav-toggle'); // Nút hamburger menu
  const mobileNav = document.querySelector('.nav-mobile'); // Menu mobile
  const submenuLinks = document.querySelectorAll('.nav-mobile__menu .nav-has-submenu > a'); // Các link có submenu

  // Xử lý sự kiện click vào nút hamburger để mở/đóng menu mobile
  toggleButton.addEventListener('click', () => {
    mobileNav.classList.toggle('active'); // Thêm/xóa class active để hiện/ẩn menu
    // Đổi icon từ hamburger (☰) thành X (✕) khi menu mở
    toggleButton.textContent = mobileNav.classList.contains('active') ? '✕' : '☰';
  });

  // Xử lý sự kiện click vào các link có submenu trên mobile
  submenuLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault(); // Ngăn chặn chuyển trang khi click vào link cha
      const parentLi = link.parentElement; // Lấy thẻ li cha
      const submenu = parentLi.querySelector('.nav-submenu'); // Tìm submenu con
      parentLi.classList.toggle('active'); // Thêm/xóa class active cho li cha
      submenu.classList.toggle('active'); // Thêm/xóa class active cho submenu
    });
  });

  // Đóng menu mobile khi click vào link không có submenu
  const menuLinks = document.querySelectorAll('.nav-mobile__menu a:not(.nav-has-submenu > a)');
  menuLinks.forEach(link => {
    link.addEventListener('click', () => {
      mobileNav.classList.remove('active'); // Ẩn menu mobile
      toggleButton.textContent = '☰'; // Đổi icon về hamburger
    });
  });

  // Xử lý chuyển đổi ngôn ngữ
  const langBtns = document.querySelectorAll('.lang-btn'); // Các nút ngôn ngữ
  const currentPath = window.location.pathname; // Đường dẫn hiện tại
  let isEN = currentPath.startsWith('/en/'); // Kiểm tra xem có đang ở trang EN không

  // Thiết lập trạng thái active cho các nút ngôn ngữ
  langBtns.forEach(btn => {
    // Nếu nút là EN và đang ở trang EN, hoặc nút là VN và đang ở trang VN
    if ((btn.textContent === 'EN' && isEN) || (btn.textContent === 'VN' && !isEN)) {
      btn.classList.add('active'); // Thêm class active
    } else {
      btn.classList.remove('active'); // Xóa class active
    }

    // Xử lý sự kiện click vào nút ngôn ngữ
    btn.addEventListener('click', () => {
      let newUrl;
      if (btn.textContent === 'EN' && !isEN) {
        // Chuyển từ VN sang EN: thêm /en vào đầu đường dẫn
        newUrl = '/en' + (currentPath === '/' ? '' : currentPath);
      } else if (btn.textContent === 'VN' && isEN) {
        // Chuyển từ EN sang VN: bỏ /en khỏi đường dẫn
        newUrl = currentPath.replace(/^\/en/, '') || '/';
      } else {
        return; // Đã ở đúng ngôn ngữ rồi, không cần chuyển
      }
      window.location.pathname = newUrl; // Chuyển hướng đến trang mới
    });
  });
});