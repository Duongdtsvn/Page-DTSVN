// Import các thư viện cần thiết để xử lý tìm kiếm tuyển dụng và profile
import org.craftercms.sites.editorial.SearchRecruitment
import org.craftercms.sites.editorial.ProfileUtils

// Lấy tham số tìm kiếm từ URL
// Hỗ trợ: title, content, category (tab), sort, page

def page = params.page ? params.page.toInteger() : 1
int itemsPerPage = 12
int start = (page - 1) * itemsPerPage

def searchParams = [:]
if (params.title?.trim()) {
    searchParams.title = params.title.trim().toLowerCase()
}
if (params.content?.trim()) {
    searchParams.content = params.content.trim().toLowerCase()
}
if (params.tab && params.tab != 'all') {
    searchParams.category = params.tab
}

def sort = params.sort ?: "newest"
def validSorts = ["newest", "oldest", "a_to_z", "z_to_a"]
if (!validSorts.contains(sort)) {
    sort = "newest"
}

def searchRecruitment = new SearchRecruitment(searchClient, urlTransformationService)
def recruitmentItems = searchRecruitment.searchRecruitmentAdvanced(searchParams, start, itemsPerPage, sort, 'vi')
def totalItems = searchRecruitment.getTotalRecruitment(searchParams, 'vi')
def totalPages = Math.ceil(totalItems / itemsPerPage) as Integer
if (totalPages < 1) totalPages = 1

def tabs = []
if (contentModel.list_category_o && contentModel.list_category_o.item) {
    def items = contentModel.list_category_o.item
    tabs = (items instanceof List) ? items : [items]
}

def selectedTab = params.tab ?: 'all'

templateModel.tabs = tabs
templateModel.selectedTab = selectedTab
templateModel.searchParams = searchParams
templateModel.sort = sort
templateModel.recruitmentItems = recruitmentItems ?: []
templateModel.totalItems = totalItems

templateModel.currentPage = page
templateModel.totalPages = totalPages
templateModel.itemsPerPage = itemsPerPage

def pageNumbers = []
def startPage = Math.max(1, page - 2)
def endPage = Math.min(totalPages, page + 2)
for (int i = startPage; i <= endPage; i++) {
    pageNumbers << i
}
templateModel.pageNumbers = pageNumbers
templateModel.hasNextPage = page < totalPages
templateModel.hasPrevPage = page > 1

if ((searchParams.title || searchParams.content) && selectedTab != 'all') {
    recruitmentItems = recruitmentItems.findAll { item ->
        item.categories && item.categories.contains(selectedTab)
    }
    if (!recruitmentItems || recruitmentItems.size() == 0) {
        recruitmentItems = []
        totalItems = 0
        totalPages = 1
    } else {
        totalItems = recruitmentItems.size()
        totalPages = Math.ceil(totalItems / itemsPerPage) as Integer
        if (totalPages < 1) totalPages = 1
    }
}
