<#import "/templates/system/common/crafter.ftl" as crafter />

<section class="section sec-clientList pb-0">
  <div class="container-custom">
    <div class="row">
      <div class="col-md-12 col-lg-12 col-xl-12">
        <!-- <div class="col-md-8 col-lg-5 col-xl-4"> -->
        <div class="titlebox">
          <h2 class="titlebox__title fz-44">50+ Khách hàng đã đồng hành cùng chúng tôi</h2>
        </div>
      </div>
    </div>
    <div class="clientList">
      <div class="row">
        <#if contentModel.solution_o.item?? && contentModel.solution_o.item?has_content>
          <#list contentModel.solution_o.item as solution>
            <div class="col-4 col-md-3 col-xl-2">
              <a class="clientbox">
                <div class="clientbox__inner">
                  <@crafter.img $field="image_s" src=(solution.image_s!"") alt="" />
                </div>
              </a>
            </div>
          </#list>
        </#if>
      </div>
    </div>
  </div>
</section>