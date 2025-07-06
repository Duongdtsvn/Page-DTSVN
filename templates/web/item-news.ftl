<#import "/templates/system/common/crafter.ftl" as crafter />
<!doctype html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DTSVN-NEWS</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/static-assets/css/header.css">
    <link rel="stylesheet" href="/static-assets/css/main.css?site=${siteContext.siteName}"/>
    <link rel="stylesheet" href="/static-assets/css/language-switcher.css"/>
    <@crafter.head />
  </head>
  <body>
    <@crafter.body_top />
    <@crafter.renderComponentCollection $field="header_o"/>
    <section class="section sec-pageTitle style-blogDetail style-2">
        <div class="sec-pageTitle__wrap">
            <div class="sec-pageTitle__header">
                <ul class="sec-pageTitle__breadcrumb">
                    <li><a href="/"> Trang chủ </a></li>
                    <li><span>TIN TỨC</span></li>
                </ul>
            </div>
            <div class="sec-pageTitle__content">
                <div class="container-custom">
                    <div class="row align-items-end">
                        <div class="col-md-9 col-xl-6">
                            <h1 class="sec-pageTitle__title fz-52" data-lang="vi">${contentModel.title_vi_s!''}</h1>
                            <h1 class="sec-pageTitle__title fz-52" data-lang="en" style="display: none;">${contentModel.title_en_s!''}</h1>
                        </div>
                        <div class="col-md-3 col-xl-6">
                            <div class="sec-pageTitle__share" style="display: flex; align-items: center; gap: 16px; justify-content: flex-end;">
                                <a href="#" class="btn-share">Chia sẻ
                                    <span>
                                        <svg width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.6703 5.00004C9.99771 5.00004 9.3913 4.70437 8.96803 4.23304L4.77962 6.68282C4.84477 6.90188 4.87982 7.13429 4.87982 7.37496C4.87982 7.61555 4.8448 7.84788 4.7797 8.06687L8.96769 10.5164C9.39098 10.0448 9.99753 9.74902 10.6703 9.74902C11.947 9.74902 12.9852 10.8143 12.9852 12.1241C12.9852 13.4338 11.947 14.4991 10.6703 14.4991C9.39363 14.4991 8.35547 13.4338 8.35547 12.1241C8.35547 11.931 8.37802 11.7433 8.42057 11.5635L4.17483 9.08017C3.75793 9.49457 3.18997 9.74993 2.56486 9.74993C1.28827 9.74993 0.25 8.68481 0.25 7.37496C0.25 6.06512 1.28827 5 2.56486 5C3.1899 5 3.75779 5.25529 4.17468 5.66961L8.42069 3.1861C8.37807 3.00613 8.35547 2.81821 8.35547 2.62496C8.35547 1.31523 9.39363 0.25 10.6703 0.25C11.947 0.25 12.9852 1.31523 12.9852 2.62496C12.9852 3.93481 11.947 5.00004 10.6703 5.00004Z" fill="#2B6BB2"></path>
                                        </svg>
                                    </span>
                                </a>
                                <div class="language-switcher" role="group" aria-label="Chọn ngôn ngữ">
                                    <a href="#" class="lang-btn active" role="button" aria-pressed="true" aria-label="Tiếng Việt">VN</a>
                                    <a href="#" class="lang-btn" role="button" aria-pressed="false" aria-label="English">EN</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section sec-blogDetail">
        <div class="container-custom">
            <div class="row">
                <div class="col-xxxl-10 offset-xxxl-1">
                    <div class="sec-blogDetail__content stickyJs">
                        <div class="row">
                            <div class="col-xl-8 col-xxxl-7">
                                <div class="entry-text" data-lang="vi">
                                    ${contentModel.content_vi_html!''}
                                </div>
                                <div class="entry-text" data-lang="en" style="display: none;">
                                    ${contentModel.content_en_html!''}
                                </div>
                                <div class="entry-share">
                                    <span>Chia sẻ: <a> </a></span>
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
            </div>
            <div class="row">
                <div class="col-xxxl-10 offset-xxxl-1">
                    <div class="sec-blogDetail__content stickyJs">
                        <div class="row">
                            <div class="col-xl-8 col-xxxl-7">
                                <div class="entry-text">
                                    <br>
                                    <h3 class="sec-contactPage__title">Gửi thông điệp tới DTSVN</h3>
                                    
<div class="wpcf7 js" id="wpcf7-f6-o1" lang="vi" dir="ltr">
<div class="screen-reader-response"><p role="status" aria-live="polite" aria-atomic="true"></p> <ul></ul></div>
<form action="/ngan-hang-doanh-nghiep-tai-chinh-can-chuan-bi-nhung-gi-de-dap-ung-cac-yeu-cau-bat-buoc-tu-nhnn/#wpcf7-f6-o1" method="post" class="wpcf7-form init" aria-label="Form liên hệ" novalidate="novalidate" data-status="init">
<div style="display: none;">
<input type="hidden" name="_wpcf7" value="6">
<input type="hidden" name="_wpcf7_version" value="5.9.8">
<input type="hidden" name="_wpcf7_locale" value="vi">
<input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f6-o1">
<input type="hidden" name="_wpcf7_container_post" value="0">
<input type="hidden" name="_wpcf7_posted_data_hash" value="">
</div>
<div class="row">
	<div class="col-md-6">
		<div class="form-item">
			<p><span class="wpcf7-form-control-wrap" data-name="your-name"><input size="40" maxlength="400" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" autocomplete="name" aria-required="true" aria-invalid="false" placeholder="Họ và tên*" value="" type="text" name="your-name"></span>
			</p>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-item">
			<p><span class="wpcf7-form-control-wrap" data-name="company-name"><input size="40" maxlength="400" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" autocomplete="company" aria-required="true" aria-invalid="false" placeholder="Công ty*" value="" type="text" name="company-name"></span>
			</p>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-item">
			<p><span class="wpcf7-form-control-wrap" data-name="your-email"><input size="40" maxlength="400" class="wpcf7-form-control wpcf7-email wpcf7-validates-as-required wpcf7-text wpcf7-validates-as-email" autocomplete="email" aria-required="true" aria-invalid="false" placeholder="Email*" value="" type="email" name="your-email"></span>
			</p>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-item">
			<p><span class="wpcf7-form-control-wrap" data-name="phone-number"><input size="40" maxlength="400" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" autocomplete="phone" aria-required="true" aria-invalid="false" placeholder="Số điện thoại*" value="" type="text" name="phone-number"></span>
			</p>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-item">
			<p><span class="wpcf7-form-control-wrap" data-name="your-message"><textarea cols="40" rows="10" maxlength="2000" class="wpcf7-form-control wpcf7-textarea" aria-invalid="false" placeholder="Nội dung tin nhắn*" name="your-message"></textarea></span>
			</p>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-btn">
			<p><input class="wpcf7-form-control wpcf7-submit has-spinner" type="submit" value="Gửi thông tin"><span class="wpcf7-spinner"></span>
			</p>
		</div>
	</div>
</div><div class="wpcf7-response-output" aria-hidden="true"></div>
</form>
</div>
                                </div>
                                <div class="entry-share">
                                    <span>Chia sẻ:</span>
                                    <a href="http://www.facebook.com/sharer.php?u=https://dtsvn.net/ngan-hang-doanh-nghiep-tai-chinh-can-chuan-bi-nhung-gi-de-dap-ung-cac-yeu-cau-bat-buoc-tu-nhnn/&amp;p[title]=Phát triển phần mềm thẩm định dữ liệu, phần mềm web-based">
                                        <img src="https://dtsvn.net/wp-content/themes/dtsvn-hello-elementor/assets/img/icon-facebook.svg" alt="">
                                    </a>
                                    <a href="https://www.linkedin.com/sharing/share-offsite/?url=https://dtsvn.net/ngan-hang-doanh-nghiep-tai-chinh-can-chuan-bi-nhung-gi-de-dap-ung-cac-yeu-cau-bat-buoc-tu-nhnn/">
                                        <img src="https://dtsvn.net/wp-content/themes/dtsvn-hello-elementor/assets/img/icon-linkedin.svg" alt="">
                                    </a>
                                </div>
                            </div>

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