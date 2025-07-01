<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row">
  <#if contentModel.list_blog_o.item?? && contentModel.list_blog_o.item?has_content>
    <#list contentModel.list_blog_o.item as list_blog>
      <div class="col-md-6 col-lg-4">
        <div class="blog">
          <div class="blog__inner">
            <a class="blog__img" href="#" style="background-image: url(${list_blog.image_s!''});">
              <img src="assets/img/blog-img-1.jpg" alt="">
            </a>
            <div class="blog__body">
              <h3 class="blog__title"><a href="#">${list_blog.title1_s!''}</a></h3>
              <ul class="postMin__meta">
                <li>${list_blog.date_s!''}</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </#list>
  </#if>
</div>