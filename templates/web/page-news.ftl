<#import "/templates/system/common/crafter.ftl" as crafter />
<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/static-assets/css/main.css?site=${siteContext.siteName}"/>
    <@crafter.head />
  </head>
  <body>
    <@crafter.body_top />
    <section class="section sec-pageTitle style-2 style-doitac">
        <div class="sec-pageTitle__wrap">
            <ul class="sec-pageTitle__breadcrumb">
                <li><a href="#">Trang chủ</a></li>
                <li><span>Tin tức</span></li>
            </ul>
            <div class="sec-pageTitle__content">
                <div class="container-custom">
                    <div class="row">
                        <div class="col-md-8 col-lg-7 col-xl-6">
                            <h1 class="sec-pageTitle__title fz-52"> Tin tức cập nhật</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section sec-blogPage">
        <div class="container-custom">
            <!-- Form tìm kiếm -->
            <div class="search-form mb-4">
                <form method="GET" action="">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" name="q" value="${searchTerm!''}" placeholder="Tìm kiếm tin tức..." class="form-control">
                        </div>
                        <div class="col-md-4">
                            <select name="category" class="form-control">
                                <option value="">Tất cả danh mục</option>
                                <#if categories??>
                                    <#list categories as cat>
                                        <option value="${cat}" <#if currentCategory == cat>selected</#if>>${cat}</option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Navigation danh mục -->
            <nav class="nav-cat">
                <ul>
                    <li><a href="?page=1" class="<#if !currentCategory?? || currentCategory == "">active</#if>">Tất cả tin bài</a></li>
                    <#if categories??>
                        <#list categories as cat>
                            <li><a href="?category=${cat}&page=1" class="<#if currentCategory == cat>active</#if>">${cat}</a></li>
                        </#list>
                    </#if>
                </ul>
            </nav>

            <!-- Hiển thị kết quả tìm kiếm -->
            <#if searchTerm?? && searchTerm != "">
                <div class="search-results mb-3">
                    <p>Tìm thấy <strong>${totalItems}</strong> kết quả cho "<strong>${searchTerm}</strong>"</p>
                </div>
            </#if>

            <div class="row">
                <#if newsItems?? && newsItems?size gt 0>
                    <#list newsItems as news>
                        <div class="col-md-6 col-lg-4">
                            <div class="blog">
                                <div class="blog__inner">
                                    <a class="blog__img" href="${news.url}" style="background-image: url(/static-assets/images/news/default-news.jpg);">
                                        <img src="/static-assets/images/news/default-news.jpg" alt="${news.title}">
                                    </a>
                                    <div class="blog__body">
                                        <h3 class="blog__title">
                                            <a href="${news.url}">${news.title}</a>
                                        </h3>
                                        <#if news.highlight??>
                                            <div class="blog__excerpt">
                                                <p>${news.highlight}</p>
                                            </div>
                                        </#if>
                                        <ul class="postMin__meta">
                                            <#if news.created_date??>
                                                <li>${news.created_date?string("dd/MM/yyyy HH:mm")}</li>
                                            </#if>
                                            <#if news.categories?? && news.categories?size gt 0>
                                                <li>
                                                    <#list news.categories as category>
                                                        <span class="badge badge-secondary">${category}</span>
                                                    </#list>
                                                </li>
                                            </#if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="col-12">
                        <div class="text-center py-5">
                            <h3>Không tìm thấy tin tức nào</h3>
                            <p>Vui lòng thử lại với từ khóa khác hoặc chọn danh mục khác.</p>
                        </div>
                    </div>
                </#if>
            </div>

            <!-- Phân trang -->
            <#if totalPages?? && totalPages gt 1>
                <div class="pagination">
                    <nav class="navigation pagination" aria-label="Phân trang bài viết">
                        <h2 class="screen-reader-text">Phân trang bài viết</h2>
                        <div class="nav-links">
                            <#-- Nút Previous -->
                            <#if hasPrevPage>
                                <a class="prev page-numbers" href="?page=${currentPage - 1}<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">← Previous</a>
                            </#if>

                            <#-- Hiển thị các trang -->
                            <#if pageNumbers??>
                                <#-- Hiển thị dấu ... nếu có trang trước startPage -->
                                <#if pageNumbers?first gt 1>
                                    <#if pageNumbers?first gt 2>
                                        <a class="page-numbers" href="?page=1<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">1</a>
                                        <span class="page-numbers dots">…</span>
                                    <#else>
                                        <a class="page-numbers" href="?page=1<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">1</a>
                                    </#if>
                                </#if>

                                <#list pageNumbers as pageNum>
                                    <#if pageNum == currentPage>
                                        <span aria-current="page" class="page-numbers current">${pageNum}</span>
                                    <#else>
                                        <a class="page-numbers" href="?page=${pageNum}<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">${pageNum}</a>
                                    </#if>
                                </#list>

                                <#-- Hiển thị dấu ... nếu có trang sau endPage -->
                                <#if pageNumbers?last lt totalPages>
                                    <#if pageNumbers?last lt totalPages - 1>
                                        <span class="page-numbers dots">…</span>
                                        <a class="page-numbers" href="?page=${totalPages}<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">${totalPages}</a>
                                    <#else>
                                        <a class="page-numbers" href="?page=${totalPages}<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">${totalPages}</a>
                                    </#if>
                                </#if>
                            </#if>

                            <#-- Nút Next -->
                            <#if hasNextPage>
                                <a class="next page-numbers" href="?page=${currentPage + 1}<#if searchTerm?? && searchTerm != "">&q=${searchTerm}</#if><#if currentCategory?? && currentCategory != "">&category=${currentCategory}</#if>">Next →</a>
                            </#if>
                        </div>
                    </nav>
                </div>
            </#if>

            <!-- Thông tin phân trang -->
            <#if totalItems?? && totalItems gt 0>
                <div class="pagination-info text-center mt-3">
                    <p>Hiển thị ${((currentPage - 1) * itemsPerPage) + 1} - ${(currentPage * itemsPerPage < totalItems)?then(currentPage * itemsPerPage, totalItems)} trong tổng số ${totalItems} tin tức</p>
                </div>
            </#if>
        </div>
    </section>
    <@crafter.body_bottom />
  </body>
</html>