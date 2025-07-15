// Import các thư viện cần thiết để xử lý tìm kiếm tin tức và profile
import org.craftercms.sites.editorial.Searchnews
import org.craftercms.sites.editorial.ProfileUtils

// Khởi tạo đối tượng Searchnews để thực hiện các thao tác tìm kiếm tin tức
def searchNews = new Searchnews(searchClient, urlTransformationService)

// Lấy tham số trang hiện tại từ URL, mặc định là trang 1 nếu không có
def page = params.page ? params.page.toInteger() : 1
// Lấy tab category đang được chọn từ URL, mặc định là 'all' nếu không có
def selectedTab = params.tab ?: 'all'
// Lấy từ khóa tìm kiếm từ URL
def searchQuery = params.q ?: ''
// Số lượng tin tức hiển thị trên mỗi trang
def itemsPerPage = 12

// Tính toán vị trí bắt đầu để lấy dữ liệu cho trang hiện tại
def start = (page - 1) * itemsPerPage

// Lấy danh sách các category từ contentModel để hiển thị các tab
def tabs = []
if (contentModel.list_category_o && contentModel.list_category_o.item) {
    def items = contentModel.list_category_o.item
    // Đảm bảo tabs luôn là một list, ngay cả khi chỉ có 1 item
    tabs = (items instanceof List) ? items : [items]
}

// Khởi tạo biến để lưu trữ danh sách tin tức và tổng số tin tức
def newsItems = []
def totalItems = 0

// Xử lý logic lấy tin tức dựa trên category được chọn và từ khóa tìm kiếm
if (searchQuery && searchQuery.trim() != '') {
    // Nếu có từ khóa tìm kiếm
    def categories = []
    if (selectedTab != 'all') {
        // Nếu chọn category cụ thể, tìm category tương ứng trong danh sách tabs
        def currentCategory = tabs.find { it.item_s_s == selectedTab }
        if (currentCategory) {
            categories = [currentCategory.item_s_s]
        }
    }
    // Chỉ tìm theo tiêu đề tiếng Anh
    newsItems = searchNews.searchNewsByTitle(searchQuery, categories, 'en', start, itemsPerPage)
    totalItems = newsItems.size()
} else {
    // Nếu không có từ khóa tìm kiếm, sử dụng logic cũ
    if (selectedTab == 'all') {
        // Nếu chọn "Tất cả", lấy tất cả tin tức
        newsItems = searchNews.getAllNews(start, itemsPerPage)
        totalItems = searchNews.getAllNews(0, 1000).size()
    } else {
        // Nếu chọn category cụ thể, tìm category tương ứng trong danh sách tabs
        def currentCategory = tabs.find { it.item_s_s == selectedTab }
        if (currentCategory) {
            // Dùng trực tiếp item_s_s làm key truy vấn
            def categoryKey = currentCategory.item_s_s
            if (categoryKey) {
                // Lấy tin tức theo category và tính tổng số
                newsItems = searchNews.getNewsByCategoryKey(categoryKey, start, itemsPerPage)
                totalItems = searchNews.getNewsByCategoryKey(categoryKey, 0, 1000).size()
            }
        }
    }
}

// Đảm bảo newsItems luôn là list, không null
if (!newsItems) newsItems = []

// Tính toán thông tin phân trang
def totalPages = Math.ceil(totalItems / itemsPerPage).toInteger()
def hasNextPage = page < totalPages
def hasPrevPage = page > 1

// Tạo danh sách các số trang để hiển thị trong thanh phân trang
// Hiển thị tối đa 5 trang (trang hiện tại ± 2)
def pageNumbers = []
def startPage = Math.max(1, page - 2)
def endPage = Math.min(totalPages, page + 2)

// Thêm các số trang vào danh sách để hiển thị
for (int i = startPage; i <= endPage; i++) {
    pageNumbers << i
}

// Đưa tất cả dữ liệu đã xử lý vào templateModel để template có thể sử dụng
templateModel.tabs = tabs                    // Danh sách các tab category
templateModel.selectedTab = selectedTab      // Tab đang được chọn
templateModel.searchQuery = searchQuery      // Từ khóa tìm kiếm
templateModel.newsItems = newsItems          // Danh sách tin tức cho trang hiện tại
templateModel.totalItems = totalItems        // Tổng số tin tức
templateModel.currentPage = page             // Trang hiện tại
templateModel.totalPages = totalPages        // Tổng số trang
templateModel.hasNextPage = hasNextPage      // Có trang tiếp theo không
templateModel.hasPrevPage = hasPrevPage      // Có trang trước không
templateModel.pageNumbers = pageNumbers      // Danh sách số trang để hiển thị
templateModel.itemsPerPage = itemsPerPage    // Số tin tức trên mỗi trang
