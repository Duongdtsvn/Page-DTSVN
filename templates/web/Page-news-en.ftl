<#import "/templates/system/common/crafter.ftl" as crafter />
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DTSVN-NEWS</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/static-assets/css/header.css">
  <link rel="stylesheet" href="/static-assets/css/main.css">
    <@crafter.head />
  </head>
  <body>
    <@crafter.body_top />
    <@crafter.renderComponentCollection $field="header_o"/>
    <section class="section sec-pageTitle style-2 style-doitac">
        <div class="sec-pageTitle__wrap">
            <ul class="sec-pageTitle__breadcrumb">
                <li><a href="#">Home</a></li>
                <li><span>News</span></li>
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

            <!-- Search form -->
            <div class="search-form mb-4">
                <form method="GET" action="" class="d-flex align-items-center">
                    <!-- Dropdown for category selection -->
                    <div class="search-category-dropdown me-2">
                        <select name="tab" class="form-select" style="padding: 12px 16px; border-radius: 8px; border: 1px solid #ddd; min-width: 140px;">
                            <option value="all" <#if (selectedTab!'all') == 'all'>selected</#if>>All</option>
                            <#list tabs as cat>
                                <option value="${cat.item_s_s!''}" <#if (selectedTab!'') == (cat.item_s_s!'')>selected</#if>>${cat.title_category_s!''}</option>
                            </#list>
                        </select>
                    </div>
                    <!-- Search input with icon search on the right -->
                    <div class="search-input-wrapper flex-grow-1 position-relative me-2">
                        <input 
                            type="text" 
                            name="q" 
                            value="${searchQuery!''}" 
                            placeholder="Enter search keywords..." 
                            class="form-control"
                            style="padding: 12px 16px; border-radius: 8px; border: 1px solid #ddd;"
                        >
                    </div>
                    <button type="submit" class="btn btn-primary d-flex align-items-center justify-content-center" style="padding: 12px 16px; border-radius: 8px; min-width: 48px;">
                        <i class="fa fa-search"></i>
                    </button>
                    <!-- Clear search button if there's a search query -->
                    <#if searchQuery?? && searchQuery != ''>
                        <a href="?tab=${selectedTab!''}" class="btn btn-outline-secondary ms-2" style="padding: 12px 16px; border-radius: 8px;">
                            <i class="fa fa-times"></i> Clear
                        </a>
                    </#if>
                </form>
            </div>

            <!-- Search results title if searching -->
            <#if searchQuery?? && searchQuery != ''>
                <h2 class="search-result-title" style="margin-bottom: 24px; font-size: 2rem; font-weight: bold; color: #1a237e;">Relative Search Results</h2>
                <p class="search-info" style="margin-bottom: 16px; color: #666; font-style: italic;">
                    Showing results related to "${searchQuery}" (including similar keywords and spelling corrections)
                </p>
            </#if>
            <!-- Navigation danh mục -->
            <nav class="nav-cat">
                <ul>
                    <li>
                        <a href="?tab=all<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>" class="<#if (selectedTab!'') == 'all'>active</#if>">Featured news</a>
                    </li>
                    <#if contentModel.list_category_o?? && contentModel.list_category_o?has_content>
                        <#list contentModel.list_category_o.item as category>
                            <li>
                                <a href="?tab=${category.item_s_s!''}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>" class="<#if (selectedTab!'') == (category.item_s_s!'')>active</#if>">${category.title_category_s!''}</a>
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
                                    <a class="blog__img" href="${news.url_en!''}" style="background-image: url('${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/new1000.jpg')}');">
                                        <img src="${(news.img_main_s?? && (news.img_main_s?length > 0))?then(news.img_main_s, '/static-assets/images/news/new1000.jpg')}" alt="${news.title!''}">
                                    </a>
                                    <div class="blog__body">
                                        <h3 class="blog__title">
                                            <a href="${news.url_en!''}">${news.title_en!''}</a>
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
                            <h3>No news found</h3>
                            <p>
                                No news found related to "${searchQuery}". 
                                <br>You can try with different keywords or check your spelling.
                            </p>
                        </div>
                    </div>
                </#if>
            </div>

            <!-- Phân trang -->
            <#if totalPages?? && (totalPages > 1)>
                <div class="pagination">
                    <nav class="navigation pagination" aria-label="News pagination">
                        <h2 class="screen-reader-text">News pagination</h2>
                        <div class="nav-links">
                            <#if hasPrevPage?? && hasPrevPage>
                                <a class="prev page-numbers" href="?tab=${selectedTab!''}&page=${(currentPage!1) - 1}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">← Previous</a>
                            </#if>
                            <#if pageNumbers?? && (pageNumbers?size > 0)>
                                <#if pageNumbers?first?number gt 1>
                                    <#if pageNumbers?first?number gt 2>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">1</a>
                                        <span class="page-numbers dots">…</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=1<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">1</a>
                                    </#if>
                                </#if>
                                <#list pageNumbers as pageNum>
                                    <#if (pageNum?number) == (currentPage!1)?number>
                                        <span aria-current="page" class="page-numbers current">${pageNum}</span>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${pageNum}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">${pageNum}</a>
                                    </#if>
                                </#list>
                                <#if pageNumbers?last?number lt (totalPages!1)?number>
                                    <#if pageNumbers?last?number lt (totalPages!1)?number - 1>
                                        <span class="page-numbers dots">…</span>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${totalPages!1}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">${totalPages!1}</a>
                                    <#else>
                                        <a class="page-numbers" href="?tab=${selectedTab!''}&page=${totalPages!1}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">${totalPages!1}</a>
                                    </#if>
                                </#if>
                            </#if>
                            <#if hasNextPage?? && hasNextPage>
                                <a class="next page-numbers" href="?tab=${selectedTab!''}&page=${(currentPage!1) + 1}<#if searchQuery?? && searchQuery != ''>&q=${searchQuery}</#if>">Next →</a>
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
                    <p>
                        Showing ${fromItem} - ${toItem} of ${totalItems!0} news articles
                        <#if searchQuery?? && searchQuery != ''>
                            related to "${searchQuery}"
                        </#if>
                    </p>
                </div>
            </#if>
        </div>
    </section>
    <@crafter.renderComponentCollection $field="footer_o"/>
    <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>
    <@crafter.body_bottom />
  </body>
</html>