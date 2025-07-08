<#import "/templates/system/common/crafter.ftl" as crafter />

<section class="section sec-productOrien pb-0">
    <div class="container-custom">
        <div class="row">
            <div class="col-xl-5">
                <div class="titlebox">
                    <span class="titlebox__title fz-32 ">${contentModel.title_s!''}</span>
                    <h2 class="titlebox__title fz-32">${contentModel.subtitle_s!''}</h2>
                </div>
            </div>
        </div>
        <div class="sec-productOrien__header">
            <div class="numberBox-list">
                <div class="row">
                    <#if contentModel.why_choose_o.item?? && contentModel.why_choose_o.item?has_content>
                        <#list contentModel.why_choose_o.item as why_choose>
                            <div class="col-md-6 col-xl-4">
                                <div class="numberBox">
                                    <div class="numberBox__inner">
                                        <span class="featurebox__icon"><img
                                            src="${why_choose.icon_s!''}"
                                            alt=""></span>
                                        <span class="numberBox__number">${why_choose.number_s!''}</span>
                                        <h3 class="numberBox__title">${why_choose.title_s!''}</h3>
                                        <p class="featurebox__text" style="visibility: visible;">${why_choose.subtitle_s!''}</p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</section>