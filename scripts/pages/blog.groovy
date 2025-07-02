import org.craftercms.sites.editorial.SearchHelper

def searchHelper = new SearchHelper(searchClient, urlTransformationService)
def category = contentModel.category_s
def maxArticles = contentModel.max_articles_i ?: 6

def query = 'content-type:"article"'
if (category) {
  query += ' AND category_s:"' + category + '"'
}

def results = searchHelper.search(query, 0, maxArticles)
templateModel.articles = results.documents
