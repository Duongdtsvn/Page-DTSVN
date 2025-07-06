import org.craftercms.sites.editorial.Searchnews
import org.craftercms.sites.editorial.ProfileUtils

// Khởi tạo Searchnews
def searchNews = new Searchnews(searchClient, urlTransformationService)

// Lấy tham số từ URL
def page = params.page ? params.page.toInteger() : 1
// Lấy tab đang chọn qua param tab (là key của category)
def selectedTab = params.tab ?: 'all'
def itemsPerPage = 12

// Tính toán offset cho phân trang
def start = (page - 1) * itemsPerPage

// Lấy danh sách categories từ contentModel
def tabs = []
if (contentModel.list_category_o && contentModel.list_category_o.item) {
    def items = contentModel.list_category_o.item
    if (items instanceof List) {
        tabs = items
    } else {
        tabs = [items]
    }
}

// Xác định category hiện tại
def currentCategory = null
if (tabs && tabs.size() > 0 && selectedTab != 'all') {
    currentCategory = tabs.find { it.item_s_s == selectedTab }
    if (!currentCategory) {
        currentCategory = tabs[0]
        selectedTab = currentCategory.item_s_s
    }
}

// Lấy dữ liệu tin tức dựa trên category được chọn
def newsItems = []
def totalItems = 0

if (selectedTab == 'all') {
    newsItems = searchNews.getAllNews(start, itemsPerPage)
    def allResults = searchNews.getAllNews(0, 1000)
    totalItems = allResults.size()
} else if (currentCategory) {
    // Sử dụng category.item_s_s để lọc tin tức
    // item_s_s chứa key của category từ taxonomy
    def categoryKey = currentCategory.item_s_s
    newsItems = searchNews.getNewsByCategoryKey(categoryKey, start, itemsPerPage)
    def allResults = searchNews.getNewsByCategoryKey(categoryKey, 0, 1000)
    totalItems = allResults.size()
}

// Tính toán phân trang
def totalPages = Math.ceil(totalItems / itemsPerPage).toInteger()
def hasNextPage = page < totalPages
def hasPrevPage = page > 1

// Tạo danh sách các trang để hiển thị
def pageNumbers = []
def startPage = Math.max(1, page - 2)
def endPage = Math.min(totalPages, page + 2)

for (int i = startPage; i <= endPage; i++) {
    pageNumbers << i
}

// Đưa dữ liệu vào template model
templateModel.tabs = tabs
templateModel.currentTab = currentCategory
templateModel.selectedTab = selectedTab
templateModel.newsItems = newsItems
templateModel.totalItems = totalItems
templateModel.currentPage = page
templateModel.totalPages = totalPages
templateModel.hasNextPage = hasNextPage
templateModel.hasPrevPage = hasPrevPage
templateModel.pageNumbers = pageNumbers
templateModel.searchTerm = ""
templateModel.currentCategory = currentCategory?.item_s_s ?: ""
templateModel.itemsPerPage = itemsPerPage
