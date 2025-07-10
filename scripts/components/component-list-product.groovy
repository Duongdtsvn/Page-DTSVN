// Import các thư viện cần thiết để xử lý tìm kiếm sản phẩm
import org.craftercms.sites.editorial.SearchProduct

// Khởi tạo đối tượng SearchProduct để thực hiện các thao tác tìm kiếm sản phẩm
def searchProduct = new SearchProduct(searchClient, urlTransformationService)

// Lấy tham số trang hiện tại từ URL, mặc định là trang 1 nếu không có
def page = params.page ? params.page.toInteger() : 1
// Số lượng sản phẩm hiển thị trên mỗi trang
def itemsPerPage = 6

// Tính toán vị trí bắt đầu để lấy dữ liệu cho trang hiện tại
def start = (page - 1) * itemsPerPage

// Khởi tạo biến để lưu trữ danh sách sản phẩm và tổng số sản phẩm
def productItems = []
def totalItems = 0

// Lấy tất cả sản phẩm
productItems = searchProduct.getAllProducts(start, itemsPerPage)
totalItems = searchProduct.getAllProducts(0, 1000).size()

// Tính toán thông tin phân trang
def totalPages = Math.ceil(totalItems / itemsPerPage).toInteger()
def hasNextPage = page < totalPages
def hasPrevPage = page > 1

// Tạo danh sách các số trang để hiển thị trong thanh phân trang
// Hiển thị tối đa 5 trang (trang hiện tại ± 2)
def pageNumbers = []
def startPage = Math.max(1, page - 2)
def endPage = Math.min(totalPages, page + 2)

// Thêm các số trang vào danh sách để hiển thị
for (int i = startPage; i <= endPage; i++) {
    pageNumbers << i
}

// Đưa tất cả dữ liệu đã xử lý vào templateModel để template có thể sử dụng
templateModel.productItems = productItems    // Danh sách sản phẩm cho trang hiện tại
templateModel.totalItems = totalItems        // Tổng số sản phẩm
templateModel.currentPage = page             // Trang hiện tại
templateModel.totalPages = totalPages        // Tổng số trang
templateModel.hasNextPage = hasNextPage      // Có trang tiếp theo không
templateModel.hasPrevPage = hasPrevPage      // Có trang trước không
templateModel.pageNumbers = pageNumbers      // Danh sách số trang để hiển thị
templateModel.itemsPerPage = itemsPerPage    // Số sản phẩm trên mỗi trang
