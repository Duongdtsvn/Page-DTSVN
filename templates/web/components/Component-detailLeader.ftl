<#import "/templates/system/common/crafter.ftl" as crafter />


<#if contentModel.detail_leader_o.item?? && contentModel.detail_leader_o.item?has_content>
  <#list contentModel.detail_leader_o.item as detail_leader>
    <li>
    <div class="item-inner">
      <span>${detail_leader.stt!''}</span>
      <div class="row">
        <div class="col-xl-5">
          <h3>${detail_leader.title1_s!''}</h3>
        </div>
        <div class="col-xl-6 offset-xl-1">
          <p>${detail_leader.title2_s!''}</p>
        </div>
      </div>
    </div>
  </li>
 </#list>
</#if>