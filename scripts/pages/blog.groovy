import org.craftercms.sites.editorial.BlogSearchHelper  // ✅ đúng tên

// Lấy tham số từ contentModel
def categoryKey = contentModel.category_s
def maxItems = contentModel.max_item_i ?: 10

// Tạo instance của helper
def blogHelper = new BlogSearchHelper(searchClient, urlTransformationService)

// Gọi đúng tên hàm từ class
def blogs = blogHelper.getAllBlogs(categoryKey, 0, maxItems)

// Đưa vào templateModel để dùng ở FTL
templateModel.blogs = blogs
