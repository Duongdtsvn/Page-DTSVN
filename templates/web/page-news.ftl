<#import "/templates/system/common/crafter.ftl" as crafter />
<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/static-assets/css/main.css?site=${siteContext.siteName!''}"/>
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
                                <#if categories?? && (categories?size > 0)>
                                    <#list categories as cat>
                                        <option value="${cat!''}" <#if (currentCategory!'') == (cat!'')>selected</#if>>${cat!''}</option>
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
                    <#if tabs?? && (tabs?size > 0)>
                        <#list tabs as tab>
                            <li>
                                <a href="?tab=${tab.item_s_s!''}&page=1" class="<#if (selectedTab!'') == (tab.item_s_s!'')>active</#if>">${tab.title_category_s!''}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </nav>

            <!-- Hiển thị kết quả tìm kiếm -->
            <#if searchTerm?? && (searchTerm!'') != "">
                <div class="search-results mb-3">
                    <p>Tìm thấy <strong>${totalItems!0}</strong> kết quả cho "<strong>${searchTerm!''}</strong>"</p>
                </div>
            </#if>

            <div class="row">
                <#if newsItems?? && (newsItems?size > 0)>
                    <#list newsItems as news>
                        <div class="col-md-6 col-lg-4">
                            <div class="blog">
                                <div class="blog__inner">
                                    <a class="blog__img" href="${news.url!''}" style="background-image: url('${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/default-news.jpg')}');">
                                        <img src="${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/default-news.jpg')}" alt="${news.title!''}">
                                    </a>
                                    <div class="blog__body">
                                        <h3 class="blog__title">
                                            <a href="${news.url!''}">${news.title!''}</a>
                                        </h3>
                                        <#if news.highlight?? && (news.highlight!'') != ''>
                                            <div class="blog__excerpt">
                                                <p>${news.highlight!''}</p>
                                            </div>
                                        </#if>
                                        <ul class="postMin__meta">
                                            <#if news.created_date??>
                                                <li>
                                                    <#-- Kiểm tra kiểu dữ liệu của created_date -->
                                                    <#if news.created_date?is_date>
                                                        ${news.created_date?string("dd/MM/yyyy HH:mm")}
                                                    <#else>
                                                        ${news.created_date!''}
                                                    </#if>
                                                </li>
                                            </#if>
                                            <#if news.categories?? && (news.categories?size > 0)>
                                                <li>
                                                    <#list news.categories as category>
                                                        <span class="badge badge-secondary">${category!''}</span>
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
                            <p>Vui lòng thử lại với tab khác.</p>
                        </div>
                    </div>
                </#if>
            </div>

            <!-- Phân trang -->
            <#if totalPages?? && (totalPages > 1)>
                <div class="pagination">
                    <nav class="navigation pagination" aria-label="Phân trang bài viết">
                        <h2 class="screen-reader-text">Phân trang bài viết</h2>
                        <div class="nav-links">
                            <#if hasPrevPage?? && hasPrevPage>
                                <a class="prev page-numbers" href="?tab=${selectedTab!''}&page=${(currentPage!1) - 1}">← Previous</a>
                            </#if>
                            <#if pageNumbers?? && (pageNumbers?size > 0)>
                                <#if pageNumbers?first?number gt 1>
                                    <#if pageNumbers?first?number gt 2>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1">1</a>
                                        <span class="page-numbers dots">…</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1">1</a>
                                    </#if>
                                </#if>
                                <#list pageNumbers as pageNum>
                                    <#if (pageNum?number) == (currentPage!1)?number>
                                        <span aria-current="page" class="page-numbers current">${pageNum}</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${pageNum}">${pageNum}</a>
                                    </#if>
                                </#list>
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
    <@crafter.body_bottom />
  </body>
</html>