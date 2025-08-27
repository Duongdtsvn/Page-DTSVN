<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en" class="demo">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTSVN</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/static-assets/css/header.css">
    <link rel="stylesheet" href="/static-assets/css/main.css">
    <@crafter.head />
</head>

<body>
    <@crafter.body_top />

    <main class="page-content">
        <@crafter.renderComponentCollection $field="header_o" />
        <@crafter.renderComponentCollection $field="banner_o" />
        <@crafter.renderComponentCollection $field="challenge_o" />
        <#import "/templates/system/common/crafter.ftl" as crafter />

<section class="section sec-productOrien">
    <div class="container-custom">
        <div class="row">
            <div class="col-xl-5">
                <div class="titlebox">
                    <!-- Tiêu đề -->
                    <h2 class="titlebox__title fz-32">
                        ${contentModel.title_s!''}
                    </h2>
                    <!-- Mô tả -->
                    <p>${contentModel.text_s!''}</p>
                </div>
            </div>
        </div>

        <div class="sec-productOrien__header">
            <div class="numberBox-list">
                <div class="row">
                    <#if contentModel.orientation_o.item?? && contentModel.orientation_o.item?has_content>
                        <#list contentModel.orientation_o.item as item>
                            <div class="col-md-6 col-xl-5">
                                <div class="numberBox">
                                    <div class="numberBox__inner">
                                        <!-- Số thứ tự -->
                                        <span class="numberBox__number">
                                            ${item.number_s!''}
                                        </span>
                                        <!-- Nội dung -->
                                        <h3 class="numberBox__title">
                                            ${item.title_s!''}
                                        </h3>
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
<#import "/templates/system/common/crafter.ftl" as crafter />

<section class="section sec-vision">
        <div class="bg" style="background-image: url(${contentModel.background_s!''});"></div>
    <div class="container-custom">
        <div class="row">
            <div class="col-xl-7 col-xxl-6 col-xxxl-5">
                <#if contentModel.title?? && contentModel.title?has_content>
                    <h2 class="item-quote">${contentModel.title}</h2>
                </#if>
                <#if contentModel.description?? && contentModel.description?has_content>
                    <p style="color:white">${contentModel.description}</p>
                </#if>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-8 offset-xl-4 col-xxl-6 offset-xxl-6">
                <div class="sec-vision__list">
                    <div class="row">
                        <#if contentModel.list_item_o?? && contentModel.list_item_o.item?? && contentModel.list_item_o.item?size > 0>
                            <#list contentModel.list_item_o.item as item>
                                <div class="col-lg-7">
                                    <div class="item">
                                        <label class="item__label">
                                            <input type="checkbox">
                                            <#if item.title?? && item.title?has_content>
                                                <h3 class="item__title">${item.title}</h3>
                                            </#if>
                                            <#if item.text?? && item.text?has_content>
                                                <div class="item__content">
                                                    <p class="item__text">${item.text}</p>
                                                </div>
                                            </#if>
                                        </label>
                                    </div>
                                </div>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        
        <@crafter.renderComponentCollection $field="custom_o" />
        <@crafter.renderComponentCollection $field="partner_o" />
        <@crafter.renderComponentCollection $field="footer_o" />
    </main>
    
<script src="/static-assets/js/function.js"></script>
  <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>


    <@crafter.body_bottom />
</body>

</html>