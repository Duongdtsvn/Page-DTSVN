import org.craftercms.sites.editorial.SearchHelper

def searchHelper = new SearchHelper(searchClient, urlTransformationService)
def category = urlTransformationService.getRequestParameters().get("category")?.get(0)
def maxArticles = contentModel.max_articles_i ?: 10

def query = 'content-type:"article"'
if (category && category != "all") {
  query += ' AND category_s:"' + category + '"'
}

def results = searchHelper.search(query, 0, maxArticles)
templateModel.articles = results.documents

// Lấy toàn bộ danh mục có trong các bài viết
def catResults = searchHelper.search('content-type:"article"', 0, 1000)
def allCategories = new HashSet()
catResults.documents.each { doc ->
  def cat = doc.get("category_s")
  if (cat) {
    allCategories.add(cat)
  }
}
templateModel.categories = allCategories
templateModel.selectedCategory = category
