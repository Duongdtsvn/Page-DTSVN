<#-- Import thư viện Crafter CMS để sử dụng các component và macro -->
<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en">
  <head>
    <#-- Thiết lập meta charset và viewport cho responsive -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTSVN - Dự án</title>
    
    <#-- Load jQuery library cho JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <#-- Import các file CSS cho styling -->
    <link rel="stylesheet" href="/static-assets/css/header.css">
    <link rel="stylesheet" href="/static-assets/css/main.css">
    
    <#-- Render head component từ Crafter CMS -->
    <@crafter.head />
  </head>
  <body>
    <#-- Render body top component từ Crafter CMS -->
    <@crafter.body_top />
    
    <#-- Render header component collection -->
    <@crafter.renderComponentCollection $field="header_o"/>
    
   <main class="page-content">
        <!-- Page Title Section -->
        <section class="section sec-pageTitle style-productF style-2">
            <div class="sec-pageTitle__wrap">
                <ul class="sec-pageTitle__breadcrumb">
                    <li><a href="https://dtsvn.net">Trang chủ</a></li>
                    <li><span>Dự án nổi bật</span></li>
                </ul>
                <div class="sec-pageTitle__content">
                    <div class="container-custom">
                        <div class="row">
                            <div class="col-md-8 col-lg-7 col-xl-6">
                                <h1 class="sec-pageTitle__title fz-52">Các dự án DTSVN đã triển khai</h1>
                                <p class="sec-pageTitle__text">Xuyên suốt quá trình phát triển, đội ngũ DTSVN đã triển khai nhiều dự án đa dạng ở nhiều lĩnh vực khác nhau</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section class="section sec-projectFeature">
            <div class="container-custom">
                <div class="projectFeature-list">
                                                <div class="projectFeature">
                                <div class="row">
                                    <div class="col-md-5 col-xxxl-4">
                                        <a href="https://dtsvn.net/nang-cap-trai-nghiem-so-toan-dien-voi-ngan-hang-ncb/" class="projectFeature__img" style="background-image: url(https://dtsvn.net/wp-content/uploads/2025/01/z6256834228534_cda6f828dd035823febc45bcbdbdfa97.jpg);"></a>
                                    </div>
                                    <div class="col-md-7 col-xxxl-6">
                                        <div class="projectFeature__body">
                                            <h3 class="projectFeature__title">
                                                <a href="https://dtsvn.net/nang-cap-trai-nghiem-so-toan-dien-voi-ngan-hang-ncb/">Nâng cấp trải nghiệm số toàn diện với Ngân hàng NCB</a>
                                            </h3>
                                            <div class="projectFeature__text">
                                                <p>NCB định vị mình là Nhà tư vấn tài chính thông minh, thân thiện; Cam kết phát triển bền vững nhằm đem lại sự an toàn tuyệt đối cho khách hàng. Với những sản phẩm dịch vụ hoàn hảo, tiện...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                <div class="projectFeature">
                                <div class="row">
                                    <div class="col-md-5 col-xxxl-4">
                                        <a href="https://dtsvn.net/efast-giai-phap-internet-banking-cho-khach-hang-doanh-nghiep/" class="projectFeature__img" style="background-image: url(https://dtsvn.net/wp-content/uploads/2025/01/z6256817522471_4d8f6ff4e0e9c6933ef86cbd1a153292.jpg);"></a>
                                    </div>
                                    <div class="col-md-7 col-xxxl-6">
                                        <div class="projectFeature__body">
                                            <h3 class="projectFeature__title">
                                                <a href="https://dtsvn.net/efast-giai-phap-internet-banking-cho-khach-hang-doanh-nghiep/">eFAST – Giải pháp Internet Banking cho Khách hàng Doanh nghiệp</a>
                                            </h3>
                                            <div class="projectFeature__text">
                                                <p>VietinBank đã thành công ra mắt giải pháp Digital Banking toàn diện dành cho khách hàng doanh nghiệp vào cuối năm 2022, đánh dấu một bước phát triển quan trọng trong dịch vụ kinh doanh của Ngân hàng. Khi VietinBank...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                <div class="projectFeature">
                                <div class="row">
                                    <div class="col-md-5 col-xxxl-4">
                                        <a href="https://dtsvn.net/bidv-nghiem-thu-du-an-martech-tren-website/" class="projectFeature__img" style="background-image: url(https://dtsvn.net/wp-content/uploads/2025/01/454648696_509965898218951_7303333919260901718_n.jpg);"></a>
                                    </div>
                                    <div class="col-md-7 col-xxxl-6">
                                        <div class="projectFeature__body">
                                            <h3 class="projectFeature__title">
                                                <a href="https://dtsvn.net/bidv-nghiem-thu-du-an-martech-tren-website/">BIDV nghiệm thu dự án Martech trên Website</a>
                                            </h3>
                                            <div class="projectFeature__text">
                                                <p>Trước khi triển khai, BIDV đã gặp rất nhiều vấn đề trong việc tiếp cận, thu hút và giữ chân Khách hàng trên Webiste. Thấu hiểu nhu cầu và mong muốn của BIDV, DTSVN cùng với Insider – Đơn vị...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                <div class="projectFeature">
                                <div class="row">
                                    <div class="col-md-5 col-xxxl-4">
                                        <a href="https://dtsvn.net/aaaaa/" class="projectFeature__img" style="background-image: url(https://dtsvn.net/wp-content/uploads/2025/01/z6256843189338_c9ecaab281445f9e3f4a6237aca48d0e.jpg);"></a>
                                    </div>
                                    <div class="col-md-7 col-xxxl-6">
                                        <div class="projectFeature__body">
                                            <h3 class="projectFeature__title">
                                                <a href="https://dtsvn.net/aaaaa/">Triển khai dự án VietinBank LAOeFAST</a>
                                            </h3>
                                            <div class="projectFeature__text">
                                                <p>Ngân hàng VietinBank đặt mục tiêu hệ thống hóa “Trợ lý tài chính số” - VietinBank eFast cho tất cả khách hàng doanh nghiệp trong và ngoài nước của mình, tạo nên một dịch vụ Ngân hàng điện tử hiện...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="pagination"></div>                </div>
            </div>
        </section>
    </main>
    <@crafter.renderComponentCollection $field="footer_o"/>
    <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>
    <@crafter.body_bottom />
  </body>
</html>