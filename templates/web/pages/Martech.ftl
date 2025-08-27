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
        
        <@crafter.renderComponentCollection $field="custom_o" />
        <@crafter.renderComponentCollection $field="partner_o" />
        <@crafter.renderComponentCollection $field="footer_o" />
    </main>
    
<script src="/static-assets/js/function.js"></script>
  <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>


    <@crafter.body_bottom />
</body>

</html>