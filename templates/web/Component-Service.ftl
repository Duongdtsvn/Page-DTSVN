<#import "/templates/system/common/crafter.ftl" as crafter />



<section class="section sec-productBox">
    <div class="container-custom">
    <h1 class="sec-pageTitle__title fz-52">
                            ${contentModel.title_s!''}
                        </h1>
                        <p class="sec-pageTitle__text">${contentModel.text_s!''}</p>
        <div class="productbox-list">
            <#if contentModel.service_o.item?? && contentModel.service_o.item?has_content>
                <#list contentModel.service_o.item as service>
                    <div class="item">
                        <div class="productbox hover">
                            <div class="productbox__inner">
                                <div class="group">
                                    <!-- Hiển thị thẻ (tags) -->
                                    <span class="productbox__subtitle">
                                        ${service.key_main_s!''}
                                    </span>
                                    <h3 class="productbox__title">
                                        <a href="${service.link_s!''}">${service.title_s!''}</a>
                                    </h3>
                                </div>
                                <div class="productbox__btn">
                                    <a href="${service.link_s!''}" class="btn-text">
                                        ${service.text_s!''} <span></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
</section>