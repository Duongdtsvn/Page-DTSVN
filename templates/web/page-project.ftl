<#-- Import thư viện Crafter CMS để sử dụng các component và macro -->
<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en">
  <head>
    <#-- Thiết lập meta charset và viewport cho responsive -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTSVN - Dự án</title>
    
    <#-- Load jQuery library cho JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <#-- Import các file CSS cho styling -->
    <link rel="stylesheet" href="/static-assets/css/header.css">
    <link rel="stylesheet" href="/static-assets/css/main.css">
    
    <#-- Render head component từ Crafter CMS -->
    <@crafter.head />
  </head>
  <body>
    <#-- Render body top component từ Crafter CMS -->
    <@crafter.body_top />
    
    <#-- Render header component collection -->
    <@crafter.renderComponentCollection $field="header_o"/>
    
   <main class="page-content">
        <!-- Page Title Section -->
        <section class="section sec-pageTitle style-productF style-2">
            <div class="sec-pageTitle__wrap">
                <ul class="sec-pageTitle__breadcrumb">
                    <li><a href="https://dtsvn.net">Trang chủ</a></li>
                    <li><span>Dự án nổi bật</span></li>
                </ul>
                <div class="sec-pageTitle__content">
                    <div class="container-custom">
                        <div class="row">
                            <div class="col-md-8 col-lg-7 col-xl-6">
                                <h1 class="sec-pageTitle__title fz-52">${contentModel.title_main_s!''}</h1>
                                <p class="sec-pageTitle__text">${contentModel.text_main_t!''}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section class="section sec-projectFeature">
            <div class="container-custom">
                <div class="projectFeature-list">



                                                <div class="projectFeature">
                                <div class="row">
                                    <div class="col-md-5 col-xxxl-4">
                                        <a href="url" class="projectFeature__img" style="background-image: url_img;"></a>
                                    </div>
                                    <div class="col-md-7 col-xxxl-6">
                                        <div class="projectFeature__body">
                                            <h3 class="projectFeature__title">
                                                <a href="url">title</a>
                                            </h3>
                                            <div class="projectFeature__text">
                                                <p>text</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                    <div class="pagination"></div>                </div>
            </div>
        </section>
    </main>
    <@crafter.renderComponentCollection $field="footer_o"/>
    <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>
    <@crafter.body_bottom />
  </body>
</html>