<#-- Import thư viện Crafter CMS để sử dụng các directive và component -->
<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en" class="demo">
<head>
  <#-- Import các file CSS và thẻ head cần thiết từ fragment -->
  <#include "/templates/web/fragments/head.ftl">
  <#-- Import các file CSS riêng cho trang tuyển dụng -->
  <link rel="stylesheet" href="/static-assets/css/recruitment-program.css?site=${siteContext.siteName}"/>
  <link rel="stylesheet" href="/static-assets/css/home-tab-heading-slim.css?site=${siteContext.siteName}"/>
  <link rel="stylesheet" href="/static-assets/css/main-info-section.css?site=${siteContext.siteName}"/>
  <@crafter.head/>
</head>
<body class="recruitment">
  <@crafter.body_top/>
  
  <#-- Render phần header từ component collection -->
  <@crafter.renderComponentCollection $field="header_o"/>
  
  <#-- Render phần banner chính từ component collection -->
  <@crafter.renderComponentCollection $field="banner_main_o"/>
  
  <#-- Thêm khoảng cách và bắt đầu phần nội dung chính -->
  <div class="hrrr mb-5"></div>
  <section class="nk-content">
    <div class="container-fluid">
      <div class="nk-content-inner">
        <div class="nk-content-body">
          
          <#-- Form tìm kiếm tuyển dụng với các filter -->
          <div class="card card-preview mb-4">
            <div class="card-inner">
              <form action="" method="GET" class="search-form">
                <div class="row">
                  <#-- Input tìm kiếm theo vị trí tuyển dụng -->
                  <div class="col-md-2 mb-3">
                    <input type="text" name="title" value="${params.title!''}" 
                           class="form-control" placeholder="Vị trí tuyển dụng">
                  </div>
                  <#-- Input tìm kiếm theo địa điểm -->
                  <div class="col-md-2 mb-3">
                    <input type="text" name="location" value="${params.location!''}" 
                           class="form-control" placeholder="Địa điểm">
                  </div>
                  <#-- Input tìm kiếm theo số lượng -->
                  <div class="col-md-2 mb-3">
                    <input type="number" name="quantity" value="${params.quantity!''}" 
                           class="form-control" placeholder="Số lượng" min="1">
                  </div>
                  <#-- Input tìm kiếm theo thời hạn -->
                  <div class="col-md-2 mb-3">
                    <input type="date" name="deadline" value="${params.deadline!''}" 
                           class="form-control" placeholder="Thời hạn">
                  </div>
                  <#-- Dropdown sắp xếp kết quả -->
                  <div class="col-md-2 mb-3">
                    <select name="sort" class="form-control">
                      <option value="newest" <#if sort == "newest">selected</#if>>Mới nhất đến cũ nhất</option>
                      <option value="oldest" <#if sort == "oldest">selected</#if>>Cũ nhất đến mới nhất</option>
                      <option value="a_to_z" <#if sort == "a_to_z">selected</#if>>A đến Z</option>
                      <option value="z_to_a" <#if sort == "z_to_a">selected</#if>>Z đến A</option>
                    </select>
                  </div>
                  <#-- Nút submit form tìm kiếm -->
                  <div class="col-md-2 mb-3">
                    <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                  </div>
                </div>
                <#-- Giữ lại tham số page khi submit form để không mất trang hiện tại -->
                <#if params?? && params.page??>
                  <input type="hidden" name="page" value="${params.page}">
                </#if>
              </form>
            </div>
          </div>

          <#-- Form nhập họ và tên để submit thông tin ứng viên -->
          <div class="card card-preview mb-4">
            <div class="card-inner">
              <form id="nameSubmitForm" class="name-form">
                <div class="row">
                  <#-- Input nhập họ và tên -->
                  <div class="col-md-6 mb-3">
                    <label for="fullName" class="form-label">Họ và tên</label>
                    <input type="text" id="fullName" name="fullName" 
                           class="form-control" placeholder="Nhập họ và tên của bạn" required>
                  </div>
                  <#-- Nút submit form -->
                  <div class="col-md-6 mb-3 d-flex align-items-end">
                    <button type="submit" class="btn btn-success" id="submitBtn">Submit</button>
                  </div>
                </div>
              </form>
              
              <#-- Container để hiển thị kết quả từ API -->
              <div id="apiResponse" class="mt-3" style="display: none;">
                <div id="successMessage" class="alert alert-success" style="display: none;"></div>
                <div id="errorMessage" class="alert alert-danger" style="display: none;"></div>
              </div>
              
              <#-- Hiển thị message thành công từ URL parameters -->
              <#if params.success??>
                <div class="mt-3">
                  <div class="alert alert-success">
                    ${params.success}
                  </div>
                </div>
              </#if>
              
              <#-- Hiển thị message lỗi từ URL parameters -->
              <#if params.error??>
                <div class="mt-3">
                  <div class="alert alert-danger">
                    ${params.error}
                  </div>
                </div>
              </#if>
            </div>
          </div>

          <#-- Phần danh sách tuyển dụng hiển thị dạng bảng -->
          <div class="card card-preview table-rate" style="border: none;">
            
            <#-- Bảng hiển thị danh sách tuyển dụng trên desktop -->
            <div class="card card-bordered card-full table-pc">
              <div class="card-inner p-0">
                <div class="nk-tb-list nk-tb-orders">
                  <#-- Header của bảng với các cột thông tin -->
                  <div class="nk-tb-item nk-tb-head">
                    <div class="nk-tb-col p-0 col-md-3 subtitle-h-table-12"><span>VỊ TRÍ TUYỂN DỤNG</span></div>
                    <div class="nk-tb-col col-md-2 subtitle-h-table-12"><span>Địa Điểm</span></div>
                    <div class="nk-tb-col col-md-1 subtitle-h-table-12"><span>Số lượng</span></div>
                    <div class="nk-tb-col col-md-1 subtitle-h-table-12"><span>Thời hạn</span></div>
                    <div class="nk-tb-col col-md-1 "><span></span></div>
                  </div>

                  <#-- Vòng lặp hiển thị từng item tuyển dụng trong bảng -->
                  <#if recruitments?has_content>
                    <#list recruitments as rec>
                      <div class="nk-tb-item table-block">
                        <#-- Cột hiển thị vị trí tuyển dụng -->
                        <div class="nk-tb-col col-md-3 p-0 ">
                          <span class=" color-red-1 body-18 table-l">${rec.title_main}</span>
                        </div>
                        <#-- Cột hiển thị địa điểm làm việc -->
                        <div class="nk-tb-col col-md-2">
                          <span class="tb-sub">${rec.dia_diem_lam_viec}</span>
                        </div>
                        <#-- Cột hiển thị số lượng tuyển dụng -->
                        <div class="nk-tb-col col-md-1">
                          <span class="tb-sub">${rec.so_luong_lam_viec}</span>
                        </div>
                        <#-- Cột hiển thị hạn nộp hồ sơ -->
                        <div class="nk-tb-col col-md-1">
                          <span class="tb-sub ">${rec.han_nop_ho_so}</span>
                        </div>
                        <#-- Cột chứa nút xem chi tiết -->
                        <div class="nk-tb-col col-md-1 btn-button">
                          <a href="${rec.url}" 
                            class="btn btn-detail button-detail-hover p-2 body-14 color-white">
                            Xem chi tiết
                          </a>
                        </div>
                      </div>
                    </#list>
                  </#if>
                </div>
              </div>
            </div>

            <!-- Hiển thị danh sách tuyển dụng trên mobile dạng accordion -->
            <div class="card card-bordered card-full table-mobile">
              <div class="tab-content">
                <div class="col-12 pt-4 rate-accordions tab-pane active" id="mbtabRate1">
                  <#assign currentIndex=0>
                  <#if recruitments?has_content>
                    <#list recruitments as rec>
                      <#assign currentIndex=currentIndex + 1 />
                      <div id="accordion-rate-${currentIndex}" class="accordion mb-2" style="border: none;">
                        <div class="accordion-item">
                          <!-- Header của accordion -->
                          <a href="#" class="accordion-head <#if currentIndex != 1>collapsed</#if>" data-toggle="collapse" data-target="#accordion-item-${currentIndex}" >
                            <div class=" card-rate">
                              <span class="table-h">vị trí tuyển dụng</span></br>
                              <span class="color-red-1 body-18 pr-3">${rec.title_main}</span>
                            </div>
                            <span class="accordion-icon"></span>
                          </a>

                          <!-- Nội dung chi tiết trong accordion -->
                          <div class="accordion-body collapse <#if currentIndex == 1>show</#if>" id="accordion-item-${currentIndex}" data-parent="#accordion-rate-${currentIndex}">
                            <div class="accordion-inner row-ct pt-0">
                              <div class="col-4 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="table-h rate-title">Địa điểm</span>
                              </div>
                              <div class="col-8 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="body-15 rate-title-content">${rec.dia_diem_lam_viec}</span>
                              </div>
                            </div>
                            <div class="accordion-inner row-ct pt-0">
                              <div class="col-4 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="table-h rate-title">Số lượng</span>
                              </div>
                              <div class="col-8 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="body-15 rate-title-content">${rec.so_luong_lam_viec}</span>
                              </div>
                            </div>
                            <div class="accordion-inner row-ct pt-0">
                              <div class="col-4 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="table-h rate-title">Thời gian</span>
                              </div>
                              <div class="col-8 col-sm-6 pl-0 info-item-rate pt-3">
                                <span class="body-15 rate-title-content">${rec.han_nop_ho_so}</span>
                              </div>
                            </div>
                            <div class="accordion-inner pt-3">
                              <a href="${rec.url}" 
                                class=" btn button-detail-mobile p-2 w-100 body-14 color-white" >
                                Xem chi tiết
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </#list>
                  </#if>
                </div>

                <!-- Phân trang cho mobile -->
                <section class="tab table-mobile">
                  <div class="turn-page">
                    <#if currentPage gt 1>
                      <a href="?page=${currentPage - 1}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" style="margin-top: -3px">
                        <img src="/static-assets/images/blog/CaretRight.svg" alt="Previous" style="transform: rotate(180deg);" />
                      </a>
                    </#if>
                    
                    <#list 1..totalPages as pageNum>
                      <#if pageNum == currentPage>
                        <a href="?page=${pageNum}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" class="active-stt stt body-17">${pageNum}</a>
                      <#else>
                        <a href="?page=${pageNum}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" class="stt body-17">${pageNum}</a>
                      </#if>
                    </#list>
                    
                    <#if currentPage lt totalPages>
                      <a href="?page=${currentPage + 1}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" style="margin-top: -3px">
                        <img src="/static-assets/images/blog/CaretRight.svg" alt="Next" />
                      </a>
                    </#if>
                  </div>
                </section>
              </div>
            </div>
          </div>

          <!-- Phân trang cho desktop -->
          <section class="tab table-pc">
            <div class="turn-page">
              <#if currentPage gt 1>
                <a href="?page=${currentPage - 1}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" style="margin-top: -3px">
                  <img src="/static-assets/images/blog/CaretRight.svg" alt="Next" />
                </a>
              </#if>
              
              <#list 1..totalPages as pageNum>
                <#if pageNum == currentPage>
                  <a href="?page=${pageNum}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" class="active-stt stt body-17">${pageNum}</a>
                <#else>
                  <a href="?page=${pageNum}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" class="stt body-17">${pageNum}</a>
                </#if>
              </#list>
              
              <#if currentPage lt totalPages>
                <a href="?page=${currentPage + 1}<#if params.title??>&title=${params.title}</#if><#if params.location??>&location=${params.location}</#if><#if params.quantity??>&quantity=${params.quantity}</#if><#if params.deadline??>&deadline=${params.deadline}</#if><#if sort??>&sort=${sort}</#if>" style="margin-top: -3px">
                  <img src="/static-assets/images/blog/CaretRight.svg" alt="Previous" style="transform: rotate(180deg);" />
                </a>
              </#if>
            </div>
          </section>
        </div>
      </div>
    </div>
  </section>
  <section class="nk-content">
    <div class="col-12">
      <div class="mt-4 mb-4"> 
        <@crafter.renderComponentCollection $field="section_test_o"/>
      </div>
    </div>
  </section>
  
  <!-- Render phần footer từ component collection -->
  <@crafter.renderComponentCollection $field="footer_o"/>

  <!-- Script xử lý carousel và animation -->
  <script>
    // Cấu hình carousel cho màn hình lớn hơn 375px
    if (window.innerWidth > 375) {
      $(".owl-carousel").owlCarousel({
        loop: true,
        nav: false,
        responsive: {
          0: {
            items: 1,
          },
          768: {
            items: 2,
          },
          1024: {
            items: 3,
          },
          1366: {
            items: 4,
          },
        },
      });
    }

    // Khởi tạo animation AOS khi trang load xong
    document.addEventListener("DOMContentLoaded", () => {
      AOS.init({
        duration: 1000, // Thời gian hiệu ứng (ms)
        offset: 100,    // Khoảng cách từ đáy màn hình để kích hoạt (px)
      });
    });

    // Xử lý form submit bằng AJAX
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.getElementById('nameSubmitForm');
      const submitBtn = document.getElementById('submitBtn');
      const apiResponse = document.getElementById('apiResponse');
      const successMessage = document.getElementById('successMessage');
      const errorMessage = document.getElementById('errorMessage');

      form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Lấy dữ liệu form
        const formData = new FormData(form);
        const fullName = formData.get('fullName');
        
        // Validate dữ liệu
        if (!fullName || fullName.trim() === '') {
          showError('Vui lòng nhập họ và tên');
          return;
        }
        
        // Disable button và hiển thị loading
        submitBtn.disabled = true;
        submitBtn.textContent = 'Đang xử lý...';
        
        // Gọi REST API
        fetch('/api/recruitment/name-submit', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: new URLSearchParams(formData)
        })
        .then(response => {
          if (!response.ok) {
            throw new Error(`HTTP error! status: \${response.status}`);
          }
          return response.json();
        })
        .then(data => {
          if (data.success) {
            showSuccess(data.message);
            form.reset(); // Reset form sau khi thành công
          } else {
            showError(data.message || 'Có lỗi xảy ra');
          }
        })
        .catch(error => {
          console.error('Error:', error);
          showError('Có lỗi xảy ra khi gửi thông tin. Vui lòng thử lại.');
        })
        .finally(() => {
          // Enable button và khôi phục text
          submitBtn.disabled = false;
          submitBtn.textContent = 'Submit';
        });
      });
      
      function showSuccess(message) {
        successMessage.textContent = message;
        successMessage.style.display = 'block';
        errorMessage.style.display = 'none';
        apiResponse.style.display = 'block';
        
        // Tự động ẩn sau 5 giây
        setTimeout(() => {
          apiResponse.style.display = 'none';
        }, 5000);
      }
      
      function showError(message) {
        errorMessage.textContent = message;
        errorMessage.style.display = 'block';
        successMessage.style.display = 'none';
        apiResponse.style.display = 'block';
        
        // Tự động ẩn sau 5 giây
        setTimeout(() => {
          apiResponse.style.display = 'none';
        }, 5000);
      }
    });
  </script>

  <!-- Import các file script cần thiết -->
  <#include "/templates/web/fragments/scripts.ftl">
  <script src="/static-assets/js/calculation-section.js?site=${siteContext.siteName}"></script>
  <@crafter.body_bottom/>
</body>
</html>