/**
 * Component chuyển đổi ngôn ngữ
 * Xử lý chức năng chuyển đổi ngôn ngữ với hiệu ứng mượt mà
 */
class LanguageSwitcher {
    constructor() {
        this.langButtons = document.querySelectorAll('.lang-btn');
        this.currentLang = window.location.pathname.endsWith('.en') ? 'en' : 'vi';
        this.init();
    }

    init() {
        if (this.langButtons.length === 0) return;
        this.setActiveButton();
        this.setupEventListeners();
    }

    setActiveButton() {
        this.langButtons.forEach(btn => {
            const btnLang = btn.textContent === 'VN' ? 'vi' : 'en';
            if (btnLang === this.currentLang) {
                btn.classList.add('active');
                btn.setAttribute('aria-pressed', 'true');
            } else {
                btn.classList.remove('active');
                btn.setAttribute('aria-pressed', 'false');
            }
        });
    }

    setupEventListeners() {
        this.langButtons.forEach(button => {
            button.addEventListener('click', (e) => {
                const newLang = button.textContent === 'VN' ? 'vi' : 'en';
                if (newLang === this.currentLang) {
                    e.preventDefault();
                }
                // Nếu khác ngôn ngữ, để trình duyệt tự chuyển trang qua href
            });
            button.addEventListener('keydown', (e) => {
                if ((e.key === 'Enter' || e.key === ' ') && !button.classList.contains('active')) {
                    window.location.href = button.href;
                }
            });
        });
    }
}

document.addEventListener('DOMContentLoaded', function () {
    window.languageSwitcher = new LanguageSwitcher();
});

// Export cho các hệ thống module
if (typeof module !== 'undefined' && module.exports) {
    module.exports = LanguageSwitcher;
}