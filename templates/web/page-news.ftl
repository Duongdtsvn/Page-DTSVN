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
                            <h1 class="sec-pageTitle__title fz-52">${contentModel["internal-name"]!''}</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section sec-blogPage">
        <div class="container-custom">

            <!-- Navigation danh mục -->
            <nav class="nav-cat">
                <ul>
                    <li>
                        <a href="?tab=all" class="<#if (selectedTab!'') == 'all'>active</#if>">Tất cả tin bài</a>
                    </li>
                    <#if contentModel.list_category_o?? && contentModel.list_category_o?has_content>
                        <#list contentModel.list_category_o.item as category>
                            <li>
                                <a href="?tab=${category.item_s_s!''}" class="<#if (selectedTab!'') == (category.item_s_s!'')>active</#if>">${category.title_category_s!''}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </nav>

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