<#import "/templates/system/common/crafter.ftl" as crafter />
<#-- Hiển thị danh sách danh mục -->
<#if categories?? && categories?size gt 0>
  <nav class="nav-cat">
    <ul>
      <li>
        <a href="?category=all" <#if selectedCategory?default("all") == "all">class="active"</#if>>
          Tất cả
        </a>
      </li>
      <#list categories?sort as cat>
        <li>
          <a href="?category=${cat}" <#if selectedCategory == cat>class="active"</#if>>
            ${cat}
          </a>
        </li>
      </#list>
    </ul>
  </nav>
</#if>

<div class="row">
  <#-- Hiển thị danh sách bài viết -->
  <#if articles?? && articles?has_content>
    <#list articles as article>
      <div class="col-md-6 col-lg-4">
        <div class="blog">
          <div class="blog__inner">
            <div class="blog__img" style="background-image: url('${article.image_s!'/static-assets/images/placeholder.jpg'}');">
              <img src="${article.image_s!'/static-assets/images/placeholder.jpg'}" alt="">
            </div>
            <div class="blog__body">
              <h3 class="blog__title">${article.title!''}</h3>
              <ul class="postMin__meta">
                <li>${article.date_dt?string("dd/MM/yyyy")}</li>
              </ul>
              <#if article.summary??>
                <p class="blog__summary">${article.summary}</p>
              </#if>
            </div>
          </div>
        </div>
      </div>
    </#list>
  <#else>
    <div class="col-12">
      <p>Không có bài viết nào trong danh mục này.</p>
    </div>
  </#if>
</div>


