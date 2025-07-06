/**
 * Language Switcher Component
 * Handles language switching functionality with smooth animations
 */
class LanguageSwitcher {
    constructor() {
        this.langButtons = document.querySelectorAll('.lang-btn');
        this.currentLang = 'vi'; // Default language
        this.init();
    }

    init() {
        if (this.langButtons.length === 0) {
            console.warn('Language switcher buttons not found');
            return;
        }

        this.setupEventListeners();
        this.initializeLanguage();
    }

    setupEventListeners() {
        this.langButtons.forEach(button => {
            // Click event
            button.addEventListener('click', (e) => {
                e.preventDefault();
                this.handleLanguageSwitch(button);
            });

            // Keyboard navigation
            button.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.handleLanguageSwitch(button);
                }
            });

            // Focus management
            button.addEventListener('focus', () => {
                button.setAttribute('aria-pressed', 'true');
            });
        });
    }

    handleLanguageSwitch(clickedButton) {
        const newLang = clickedButton.textContent === 'VN' ? 'vi' : 'en';

        if (newLang === this.currentLang) {
            return; // Already on this language
        }

        // Update button states
        this.updateButtonStates(clickedButton);

        // Switch content
        this.switchContent(newLang);

        // Update current language
        this.currentLang = newLang;

        // Update page title
        this.updatePageTitle(newLang);

        // Dispatch custom event for other components
        this.dispatchLanguageChangeEvent(newLang);
    }

    updateButtonStates(activeButton) {
        this.langButtons.forEach(btn => {
            btn.classList.remove('active');
            btn.setAttribute('aria-pressed', 'false');
        });

        activeButton.classList.add('active');
        activeButton.setAttribute('aria-pressed', 'true');
    }

    switchContent(lang) {
        const elements = document.querySelectorAll('[data-lang]');

        elements.forEach(element => {
            const elementLang = element.getAttribute('data-lang');

            if (elementLang === lang) {
                // Show element with fade-in animation
                this.showElement(element);
            } else {
                // Hide element with fade-out animation
                this.hideElement(element);
            }
        });
    }

    showElement(element) {
        element.style.opacity = '0';
        element.style.display = 'block';

        // Force reflow
        element.offsetHeight;

        element.style.opacity = '1';
        element.classList.add('fade-in');
        element.classList.remove('fade-out');
    }

    hideElement(element) {
        element.style.opacity = '0';
        element.classList.add('fade-out');
        element.classList.remove('fade-in');

        setTimeout(() => {
            element.style.display = 'none';
        }, 300);
    }

    updatePageTitle(lang) {
        const titles = {
            'vi': 'Tin tức - DTSVN',
            'en': 'News - DTSVN'
        };

        document.title = titles[lang] || document.title;
    }

    dispatchLanguageChangeEvent(lang) {
        const event = new CustomEvent('languageChanged', {
            detail: { language: lang },
            bubbles: true
        });
        document.dispatchEvent(event);
    }

    initializeLanguage() {
        // Set initial language
        this.switchContent(this.currentLang);

        // Set initial button state
        const initialButton = Array.from(this.langButtons).find(btn =>
            btn.textContent === 'VN'
        );

        if (initialButton) {
            this.updateButtonStates(initialButton);
        }
    }

    // Public method to get current language
    getCurrentLanguage() {
        return this.currentLang;
    }

    // Public method to switch language programmatically
    switchToLanguage(lang) {
        const button = Array.from(this.langButtons).find(btn => {
            const buttonLang = btn.textContent === 'VN' ? 'vi' : 'en';
            return buttonLang === lang;
        });

        if (button) {
            this.handleLanguageSwitch(button);
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function () {
    // Initialize language switcher
    window.languageSwitcher = new LanguageSwitcher();

    // Add global language change listener
    document.addEventListener('languageChanged', function (e) {
        console.log('Language changed to:', e.detail.language);

        // You can add additional logic here for other components
        // that need to react to language changes
    });
});

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = LanguageSwitcher;
} 