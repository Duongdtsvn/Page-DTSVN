import org.craftercms.sites.editorial.BlogtSearchHelper

// Lấy số lượng bài tuyển dụng cần hiển thị
def categoryKey = contentModel.category_s
def maxItems = contentModel.max_item_i

// Không cần lọc theo category, do đó không cần truyền giá trị cho categoryKey.
def blogHelper = newBlogSearchHelper(searchClient, urlTransformationService)
def blog = recruitmentHelper.getAllBlog(null, 0, maxItems)

// Gán kết quả vào template model để hiển thị ra giao diện
templateModel.blog = blog

