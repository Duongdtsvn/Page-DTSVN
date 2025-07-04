import org.craftercms.sites.editorial.Searchnews
import org.craftercms.sites.editorial.ProfileUtils

// Khởi tạo Searchnews
def searchNews = new Searchnews(searchClient, urlTransformationService)

// Lấy tham số từ URL
def page = params.page ? params.page.toInteger() : 1
def searchTerm = params.q ?: ""
def category = params.category ?: ""
def itemsPerPage = 12

// Tính toán offset cho phân trang
def start = (page - 1) * itemsPerPage

// Lấy dữ liệu tin tức
def newsItems = []
def totalItems = 0

if (searchTerm) {
    // Tìm kiếm theo từ khóa
    def categories = category ? [category] : null
    newsItems = searchNews.searchNews(searchTerm, categories, start, itemsPerPage)
    
    // Để lấy tổng số items, chúng ta cần thực hiện một query khác
    def allResults = searchNews.searchNews(searchTerm, categories, 0, 1000) // Lấy tất cả để đếm
    totalItems = allResults.size()
} else if (category) {
    // Lọc theo danh mục
    newsItems = searchNews.getNewsByCategory([category], start, itemsPerPage)
    
    // Lấy tổng số items theo danh mục
    def allResults = searchNews.getNewsByCategory([category], 0, 1000)
    totalItems = allResults.size()
} else {
    // Lấy tất cả tin tức
    newsItems = searchNews.getAllNews(start, itemsPerPage)
    
    // Lấy tổng số items
    def allResults = searchNews.getAllNews(0, 1000)
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
templateModel.newsItems = newsItems
templateModel.totalItems = totalItems
templateModel.currentPage = page
templateModel.totalPages = totalPages
templateModel.hasNextPage = hasNextPage
templateModel.hasPrevPage = hasPrevPage
templateModel.pageNumbers = pageNumbers
templateModel.searchTerm = searchTerm
templateModel.currentCategory = category
templateModel.categories = categories
templateModel.itemsPerPage = itemsPerPage
