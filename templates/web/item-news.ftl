<#-- Xác định URL gốc và ngôn ngữ hiện tại -->
<#assign requestPath   = siteContext.requestPath />
<#assign basePath      = requestPath?replace("\\.en$", "") />
<#assign currentLang   = (requestPath?ends_with('.en'))? then('en','vi') />

<!doctype html>
<html lang="${currentLang}">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${currentLang == 'en'? 'News - DTSVN' : 'Tin tức - DTSVN'}</title>

    <!-- CSS chung -->
    <link rel="stylesheet" href="/static-assets/css/header.css">
    <link rel="stylesheet" href="/static-assets/css/main.css?site=${siteContext.siteName}">
    <link rel="stylesheet" href="/static-assets/css/language-switcher.css">

    <@crafter.head />
  </head>
  <body>
    <@crafter.body_top />
    <@crafter.renderComponentCollection $field="header_o"/>

    <!-- Page title & breadcrumb -->
    <section class="section sec-pageTitle style-blogDetail style-2">
      <div class="sec-pageTitle__wrap">
        <ul class="sec-pageTitle__breadcrumb">
          <li><a href="/">Trang chủ</a></li>
          <li><span>TIN TỨC</span></li>
        </ul>
        <div class="sec-pageTitle__content">
          <div class="container-custom">
            <div class="row align-items-end">
              <div class="col-md-9 col-xl-6">
                <h1 class="sec-pageTitle__title fz-52" data-lang="vi"
                    style="display: ${currentLang == 'vi'? 'block':'none'};">
                  ${contentModel.title_vi_s!''}
                </h1>
                <h1 class="sec-pageTitle__title fz-52" data-lang="en"
                    style="display: ${currentLang == 'en'? 'block':'none'};">
                  ${contentModel.title_en_s!''}
                </h1>
              </div>
              <div class="col-md-3 col-xl-6">
                <div class="sec-pageTitle__share" style="display: flex; align-items: center; gap: 16px; justify-content: flex-end;">
                  <a href="#" class="btn-share">Chia sẻ
                    <span>…SVG…</span>
                  </a>
                  <div class="language-switcher" role="group" aria-label="Chọn ngôn ngữ">
                    <a href="${basePath}"
                       class="lang-btn ${currentLang == 'vi'? 'active':''}"
                       aria-pressed="${currentLang == 'vi'}"
                       aria-label="Tiếng Việt">VN</a>
                    <a href="${basePath}.en"
                       class="lang-btn ${currentLang == 'en'? 'active':''}"
                       aria-pressed="${currentLang == 'en'}"
                       aria-label="English">EN</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Nội dung bài viết -->
    <section class="section sec-blogDetail">
      <div class="container-custom">
        <div class="sec-blogDetail__content stickyJs">
          <div class="row">
            <div class="col-xl-8 col-xxxl-7">
              <div class="entry-text" data-lang="vi"
                   style="display: ${currentLang == 'vi'? 'block':'none'};">
                ${contentModel.content_vi_html!''}
              </div>
              <div class="entry-text" data-lang="en"
                   style="display: ${currentLang == 'en'? 'block':'none'};">
                ${contentModel.content_en_html!''}
              </div>
              <div class="entry-share">
                <span>Chia sẻ:</span>
                <a href="#"><img src="assets/img/icon-facebook.svg" alt=""></a>
                <a href="#"><img src="assets/img/icon-pinterest.svg" alt=""></a>
                <a href="#"><img src="assets/img/icon-linkedin.svg" alt=""></a>
                <a href="#"><img src="assets/img/icon-skype.svg" alt=""></a>
                <a href="#"><img src="assets/img/icon-discord.svg" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <@crafter.renderComponentCollection $field="footer_o"/>
    <script src="/static-assets/js/language-switcher.js"></script>
    <@crafter.body_bottom />
  </body>
</html>
