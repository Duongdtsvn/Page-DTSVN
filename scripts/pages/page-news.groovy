import org.craftercms.sites.editorial.Searchnews
import org.craftercms.sites.editorial.ProfileUtils

// Khởi tạo Searchnews
def searchNews = new Searchnews(searchClient, urlTransformationService)

// Lấy tham số từ URL
def page = params.page ? params.page.toInteger() : 1
// Lấy tab đang chọn qua param tab (là key của item_s_s)
def selectedTab = params.tab ?: null
def itemsPerPage = 12

// Tính toán offset cho phân trang
def start = (page - 1) * itemsPerPage

def tabs = []
if (contentModel.list_category_o?? && contentModel.list_category_o.item) {
    def items = contentModel.list_category_o.item
    if (items instanceof List) {
        tabs = items
    } else {
        tabs = [items]
    }
}

def currentTab = null
if (tabs && tabs.size() > 0) {
    if (selectedTab) {
        currentTab = tabs.find { it.item_s_s == selectedTab }
    }
    if (!currentTab) {
        currentTab = tabs[0]
        selectedTab = currentTab.item_s_s
    }
}

// Lấy dữ liệu tin tức
def newsItems = []
def totalItems = 0
if (currentTab) {
    newsItems = searchNews.getNewsByCategoryKey(currentTab.item_s_s, start, itemsPerPage)
    def allResults = searchNews.getNewsByCategoryKey(currentTab.item_s_s, 0, 1000)
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

// Lấy danh sách danh mục để hiển thị trong navigation
def allNews = searchNews.getAllNews(0, 1000)
def categories = []
allNews.each { news ->
    if (news.categories) {
        news.categories.each { cat ->
            if (!categories.contains(cat)) {
                categories << cat
            }
        }
    }
}

// Đưa dữ liệu vào template model
templateModel.tabs = tabs
templateModel.currentTab = currentTab
templateModel.selectedTab = selectedTab
templateModel.newsItems = newsItems
templateModel.totalItems = totalItems
templateModel.currentPage = page
templateModel.totalPages = totalPages
templateModel.hasNextPage = hasNextPage
templateModel.hasPrevPage = hasPrevPage
templateModel.pageNumbers = pageNumbers
templateModel.searchTerm = ""
templateModel.currentCategory = ""
templateModel.categories = categories
templateModel.itemsPerPage = itemsPerPage
