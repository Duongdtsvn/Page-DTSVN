<#-- Import thư viện Crafter CMS để sử dụng các component và macro -->
<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en">
  <head>
    <#-- Thiết lập meta charset và viewport cho responsive -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTSVN - Tin tức</title>
    
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
    
    <#-- Section hiển thị tiêu đề trang và breadcrumb -->
    <section class="section sec-pageTitle style-2 style-doitac">
        <div class="sec-pageTitle__wrap">
            <#-- Breadcrumb navigation -->
            <ul class="sec-pageTitle__breadcrumb">
                <li><a href="#">Trang chủ</a></li>
                <li><span>Tin tức</span></li>
            </ul>
            
            <#-- Nội dung tiêu đề trang -->
            <div class="sec-pageTitle__content">
                <div class="container-custom">
                    <div class="row">
                        <div class="col-md-8 col-lg-7 col-xl-6">  
                            <#-- Hiển thị tiêu đề trang từ content model -->
                            <h1 class="sec-pageTitle__title fz-52">${contentModel["internal-name"]!''}</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <#-- Section chính hiển thị danh sách tin tức -->
    <section class="section sec-blogPage">
        <div class="container-custom">

            <#-- Navigation menu cho các danh mục tin tức -->
            <nav class="nav-cat">
                <ul>
                    <#-- Tab "Tất cả tin bài" - luôn hiển thị -->
                    <li>
                        <a href="?tab=all" class="<#if (selectedTab!'') == 'all'>active</#if>">Tất cả tin bài</a>
                    </li>
                    
                    <#-- Hiển thị các danh mục tin tức từ content model -->
                    <#if contentModel.list_category_o?? && contentModel.list_category_o?has_content>
                        <#list contentModel.list_category_o.item as category>
                            <li>
                                <a href="?tab=${category.item_s_s!''}" class="<#if (selectedTab!'') == (category.item_s_s!'')>active</#if>">${category.title_category_s!''}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </nav>

            <#-- Grid hiển thị danh sách tin tức -->
            <div class="row">
                <#-- Kiểm tra có tin tức để hiển thị không -->
                <#if newsItems?? && (newsItems?size > 0)>
                    <#-- Lặp qua từng tin tức -->
                    <#list newsItems as news>
                        <div class="col-md-6 col-lg-4">
                            <div class="blog">
                                <div class="blog__inner">
                                    <#-- Link và hình ảnh tin tức -->
                                    <a class="blog__img" href="${news.url!''}" style="background-image: url('${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/default-news.jpg')}');">
                                        <img src="${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/default-news.jpg')}" alt="${news.title!''}">
                                    </a>
                                    
                                    <#-- Nội dung tin tức -->
                                    <div class="blog__body">
                                        <#-- Tiêu đề tin tức -->
                                        <h3 class="blog__title">
                                            <a href="${news.url!''}">${news.title!''}</a>
                                        </h3>
                                        
                                        <#-- Tóm tắt tin tức (nếu có) -->
                                        <#if news.highlight?? && (news.highlight!'') != ''>
                                            <div class="blog__excerpt">
                                                <p>${news.highlight!''}</p>
                                            </div>
                                        </#if>
                                        
                                        <#-- Meta information (ngày tạo) -->
                                        <ul class="postMin__meta">
                                            <#if news.created_date??>
                                                <li>
                                                    <#-- Kiểm tra và format ngày tạo -->
                                                    <#if news.created_date?is_date>
                                                        ${news.created_date?string("dd/MM/yyyy HH:mm")}
                                                    <#else>
                                                        ${news.created_date!''}
                                                    </#if>
                                                </li>
                                            </#if>
                                            <#-- Comment: Hiển thị categories (đã tắt) -->
                                            <#--  <#if news.categories?? && (news.categories?size > 0)>
                                                <li>
                                                    <#list news.categories as category>
                                                        <span class="badge badge-secondary">${category!''}</span>
                                                    </#list>
                                                </li>
                                            </#if>  -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <#-- Hiển thị thông báo khi không có tin tức -->
                    <div class="col-12">
                        <div class="text-center py-5">
                            <h3>Không tìm thấy tin tức nào</h3>
                            <p>Vui lòng thử lại với tab khác.</p>
                        </div>
                    </div>
                </#if>
            </div>

            <#-- Phân trang - chỉ hiển thị khi có nhiều hơn 1 trang -->
            <#if totalPages?? && (totalPages > 1)>
                <div class="pagination">
                    <nav class="navigation pagination" aria-label="Phân trang bài viết">
                        <h2 class="screen-reader-text">Phân trang bài viết</h2>
                        <div class="nav-links">
                            <#-- Nút Previous -->
                            <#if hasPrevPage?? && hasPrevPage>
                                <a class="prev page-numbers" href="?tab=${selectedTab!''}&page=${(currentPage!1) - 1}">← Previous</a>
                            </#if>
                            
                            <#-- Hiển thị các số trang -->
                            <#if pageNumbers?? && (pageNumbers?size > 0)>
                                <#-- Hiển thị dấu ... và số 1 nếu cần -->
                                <#if pageNumbers?first?number gt 1>
                                    <#if pageNumbers?first?number gt 2>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1">1</a>
                                        <span class="page-numbers dots">…</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1">1</a>
                                    </#if>
                                </#if>
                                
                                <#-- Lặp qua các số trang -->
                                <#list pageNumbers as pageNum>
                                    <#if (pageNum?number) == (currentPage!1)?number>
                                        <span aria-current="page" class="page-numbers current">${pageNum}</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${pageNum}">${pageNum}</a>
                                    </#if>
                                </#list>
                                
                                <#-- Hiển thị dấu ... và số trang cuối nếu cần -->
                                <#if pageNumbers?last?number lt (totalPages!1)?number>
                                    <#if pageNumbers?last?number lt (totalPages!1)?number - 1>
                                        <span class="page-numbers dots">…</span>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${totalPages!1}">${totalPages!1}</a>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${totalPages!1}">${totalPages!1}</a>
                                    </#if>
                                </#if>
                            </#if>
                            <#if hasNextPage?? && hasNextPage>
                                <a class="next page-numbers" href="?tab=${selectedTab!''}&page=${(currentPage!1) + 1}">Next →</a>
                            </#if>
                        </div>
                    </nav>
                </div>
            </#if>

            <!-- Thông tin phân trang -->
            <#if totalItems?? && (totalItems > 0)>
                <div class="pagination-info text-center mt-3">
                    <#assign fromItem = (((currentPage!1) - 1) * (itemsPerPage!12)) + 1 />
                    <#assign toItem = ((currentPage!1) * (itemsPerPage!12) < (totalItems!0))?then((currentPage!1) * (itemsPerPage!12), (totalItems!0)) />
                    <p>Hiển thị ${fromItem} - ${toItem} trong tổng số ${totalItems!0} tin tức</p>
                </div>
            </#if>
        </div>
    </section>
    <@crafter.renderComponentCollection $field="footer_o"/>
    <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>
    <@crafter.body_bottom />
  </body>
</html>