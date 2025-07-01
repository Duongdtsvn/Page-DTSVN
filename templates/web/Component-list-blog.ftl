<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.body>
  <nav class="nav-cat">
    <ul>
      <li>Tất cả tin bài</li>
      <li>Tin kinh doanh</li>
      <li>Tin công nghệ</li>
      <li>DTSVN tuyển dụng</li>
      <li>Business Analytics</li>
      <li>Blog</li>
    </ul>
  </nav>
  <div class="row">
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
</@crafter.body>
