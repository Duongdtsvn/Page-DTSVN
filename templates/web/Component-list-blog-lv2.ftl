<#if contentModel.category_s?has_content>
  <#list articles as article>
    <div class="blog">
      <div class="blog__inner">
        <div class="blog__img"
             style="background-image: url('${article.image_s!'/static-assets/images/placeholder.jpg'}');">
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
  </#list>
</#if>
