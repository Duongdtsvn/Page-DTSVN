 import org.craftercms.sites.editorial.SearchHelper
 import org.craftercms.sites.editorial.ProfileUtils

def segment = ProfileUtils.getSegment(profile, siteItemService)
def categories = contentModel.categories_s 
def maxArticles = contentModel.max_articles_i
def searchHelper = new SearchHelper(searchClient, urlTransformationService)
def articles = searchHelper.searchArticles(false, category, segment, 0, maxArticles)

templateModel.articles = articles