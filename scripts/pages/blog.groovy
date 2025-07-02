import org.craftercms.sites.editorial.SearchHelper
import java.util.HashSet

def searchHelper = new SearchHelper(searchClient, urlTransformationService)

def maxArticles = contentModel.max_articles_i ?: 12

// Lấy category từ query string (?category=...)
def category = urlTransformationService.getRequestParameters()?.get("category")?.get(0)
if (!category || category == "all") {
  category = null
}

// Tạo query cho bài viết
def query = 'content-type:"article"'
if (category) {
  query += ' AND category_s:"' + category + '"'
}

// Lấy danh sách bài viết
def result = searchHelper.search(query, 0, maxArticles)
templateModel.articles = result.documents
templateModel.selectedCategory = category

// Lấy danh sách tất cả category có trong bài viết
def allCategories = new HashSet()
def allResult = searchHelper.search('content-type:"article"', 0, 1000)
allResult.documents.each { doc ->
  def cat = doc.get("category_s")
  if (cat) {
    allCategories.add(cat)
  }
}
templateModel.categories = allCategories
