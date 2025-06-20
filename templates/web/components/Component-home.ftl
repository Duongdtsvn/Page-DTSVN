<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="page-wrapper">
    <main class="page-content">
        <section class="section sec-hero">
            <div class="sec-hero__inner">
                <div class="sec-hero__bg" data-bg-mb="url(${contentModel.cover_mobile_s!''})"
                    data-bg-pc="url(${contentModel.cover_pc_s!''})"
                    style="background-image: url(${contentModel.cover_pc_s!''});">
                </div>
                <div class="sec-hero__content">
                    <div class="container-custom">
                        <div class="row">
                            <div class="col-md-7 col-lg-5 col-xl-5">
                                <div class="wow fadeInUp">
                                    <h1 class="sec-hero__title">${contentModel.title1_s!''}
                                    </h1>
                                    <p class="sec-hero__text">${contentModel.subtitle1_s!''}</p>
                                    <div class="sec-hero__btn">
                                        <p class="sec-hero__text"><a href="contact.html"
                                                class="btn btn-secondary-3">Liên hệ ngay</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section sec-productFeatured">
            <div class="container-custom">
                <div class="row">
                    <div class="col-md-8 col-xl-5">
                        <div class="titlebox wow fadeInUp">
                            <h2 class="titlebox__title fz-52">${contentModel.title2_s!''}</h2>
                            <p class="titlebox__text fz-18">${contentModel.subtitle2_s!''}</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <#if contentModel.products_o.item?? && contentModel.products_o.item?has_content>
                        <#list contentModel.products_o.item as products>
                            <div class="col-md-6 col-xl-4">
                                <div class="productFeatured wow fadeInUp">
                                    <div class="productFeatured__inner">
                                        <div class="fix">
                                            <span class="productFeatured__subtitle">${products.slogan_s!''}</span>
                                            <h3 class="productFeatured__title"><a
                                                    href="https://dtsvn.net/node/67">${products.product_name_s!''}</a></h3>
                                            <div class="productFeatured__btn">
                                                <a href="https://dev.dtsvn.net/martech/" class="btn-text">Learn more
                                                    <span></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </section>

        <section class="section sec-clientList">
            <div class="container-custom">
                <div class="row">
                    <div class="col-md-8 col-lg-5 col-xl-7">
                        <div class="titlebox">
                            <h2 class="titlebox__title fz-44">${contentModel.title5_s!''}</h2>
                        </div>
                    </div>
                </div>
                <div class="clientList">
                    <div class="row">
                        <#if contentModel.member_o.item?? && contentModel.member_o.item?has_content>
                            <#list contentModel.member_o.item as member>
                                <div class="col-4 col-md-3 col-xl-3">
                                    <a class="clientbox" href="https://beau.vn/vi">
                                        <div class="clientbox__inner">
                                            <@crafter.img $field="image_s" src=(member.image_member_s!"") alt="" />
                                        </div>
                                    </a>
                                </div>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </section>
        <section class="section sec-clientList" style="padding-top: 0px !important">
            <div class="container-custom">
                <div class="row">
                    <div class="col-md-8 col-lg-5 col-xl-7">
                        <div class="titlebox">
                            <h2 class="titlebox__title fz-44">${contentModel.title6_s!''}</h2>
                        </div>
                    </div>
                </div>
                <div class="clientList">
                    <div class="row">
                        <#if contentModel.partner_o.item?? && contentModel.partner_o.item?has_content>
                            <#list contentModel.partner_o.item as partner>
                                <div class="col-4 col-md-3 col-xl-2">
                                    <a class="clientbox" href="https://clevertap.com/">
                                        <div class="clientbox__inner">
                                            <@crafter.img $field="image_s" src=(partner.image_partner_s!"") alt="" />
                                        </div>
                                    </a>
                                </div>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </section>
        <section class="section sec-motto">
            <div class="container-custom">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="sec-motto__content wow fadeInUp">
                            <span class="sec-motto__quote">
                                <@crafter.img $field="nh_bld_s" src=(contentModel.icon_s!"") alt="" />
                            </span>
                            <h3 class="sec-motto__title fz-40"> ${contentModel.title3_s!''}
                                <br>------------<br>
                                ${contentModel.author_s!''}
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section sec-impressiveNumber wow fadeInUp">
            <div class="container-custom">
                <div class="row">
                    <div class="col-md-8 col-lg-5 col-xl-5 col-xxxl-5">
                        <div class="titlebox">
                            <h2 class="titlebox__title fz-44"> ${contentModel.achievements_s!''}</h2>
                        </div>
                    </div>
                </div>
                <div class="impressiveNumber-list">
                    <div class="row">
                        <#if contentModel.achievements_o.item?? && contentModel.achievements_o.item?has_content>
                            <#list contentModel.achievements_o.item as achievements>
                                <div class="col-md-6 col-xl-3">
                                    <div class="item">
                                        <div class="item__inner">
                                            <div class="item__number">${achievements.number_s!''}</div>
                                            <h4 class="item__title">${achievements.subtitle4_s!''}</h4>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
        </section>
        <section class="section sec-teamLeader">
                <div class="container-custom">
                    <div class="row">
                        <div class="col-xl-5">
                            <div class="titlebox">
                                <h2 class="titlebox__title fz-44">Đội ngũ lãnh đạo tại DTSVN</h2>
                            </div>
                        </div>
                    </div>

                    <div class="sec-teamLeader__content">
                        <div class="row"></div>
                        <div class="row">
                            <div class="col-6 col-lg-4 col-xl-2">
                                <a href="#popup-team" class="teambox btn-popupTeam">
                                    <div class="teambox__inner">
                                        <div class="teambox__img"
                                            style="background-image: url(./assets/img/AnhChien.jpg);">
                                        </div>
                                        <div class="teambox__body">
                                            <h3 class="teambox__name">Nguyễn Bá Chiến</h3>
                                            <p class="teambox__text">CEO</p>
                                        </div>
                                        <div class="teambox__list">
                                            <div class="item-inner">
                                                <span>01</span>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <h3>Trình độ <br>học vấn</h3>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <p>Tốt nghiệp Đại học quốc gia Hà Nội</p>
                                                    </div>
                                                </div>
                                            </div class="item-inner">
                                            <div><span>02</span></div>
                                            <div class="row">
                                                <div class="col-xl-5">
                                                    <div>
                                                        <h3>Kinh nghiệm <br>làm việc</h3>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 offset-xl-1">
                                                    <div>
                                                        <p>Kinh nghiệm hơn 20 năm trong lĩnh vực bán hàng và lãnh đạo
                                                            kinh doanh với các công ty công nghệ hàng đầu thế giới tại
                                                            Việt Nam.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-inner">
                                            <div><span>03</span></div>
                                            <div class="row">
                                                <div class="col-xl-5">
                                                    <div>
                                                        <h3>Lĩnh vực <br>chuyên môn</h3>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 offset-xl-1">
                                                    <div>
                                                        <p>Có kiến thức vững chắc và đã được chứng minh trong việc
                                                            chuyển đổi kỹ thuật số tập trung vào dịch vụ Tài chính &
                                                            Ngân hàng.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        </a>
                    </div>
                    <div class="col-6 col-lg-4 col-xl-2">
                        <a href="#popup-team" class="teambox btn-popupTeam">
                            <div class="teambox__inner">
                                <div class="teambox__img" style="background-image: url(./assets/img/AnhLinh.jpg);">
                                </div>
                                <div class="teambox__body">
                                    <h3 class="teambox__name">Vũ Bảo Linh</h3>
                                    <p class="teambox__text">Account Manager</p>
                                </div>
                                <div class="teambox__list">
                                    <ul class="">
                                        <li>
                                            <div class="item-inner">
                                                <span>01</span>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <h3>Trình độ <br>học vấn</h3>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <p>Tốt nghiệp Đại học khoa học xã hội và nhân văn - ĐHQGHN</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-inner">
                                                <span>02</span>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <h3>Kinh nghiệm <br>làm việc</h3>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <p>Có kinh nghiệm xây dựng đội ngũ, phát triển kênh đối tác</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-inner">
                                                <span>03</span>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <h3>Lĩnh vực <br>chuyên môn</h3>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <p>Xây dựng chuẩn hóa quy trình kinh doanh.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-6 col-lg-4 col-xl-2">
                        <a href="#popup-team" class="teambox btn-popupTeam">
                            <div class="teambox__inner">
                                <div class="teambox__img" style="background-image: url(./assets/img/AnhThang.jpg);">
                                </div>
                                <div class="teambox__body">
                                    <h3 class="teambox__name">Ngô Đạt Thắng</h3>
                                    <p class="teambox__text">COO</p>
                                </div>
                                <div class="teambox__list">
                                    <ul class="">
                                        <li>
                                            <div class="item-inner">
                                                <span>01</span>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <h3>Trình độ <br>học vấn</h3>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <p>Tốt nghiệp Đại học kinh tế quốc dân</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-inner">
                                                <div><span>02</span></div>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <div>
                                                            <h3>Kinh nghiệm <br>làm việc</h3>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <div>
                                                            <p>Có kỹ năng về Tư vấn Kinh doanh, Quy trình Kinh doanh, Kỹ
                                                                năng Phân tích, Cơ sở dữ liệu Oracle, Quản lý Dự án và
                                                                Huấn luyện</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item-inner">
                                                <div><span>03</span></div>
                                                <div class="row">
                                                    <div class="col-xl-5">
                                                        <div>
                                                            <h3>Lĩnh vực <br>chuyên môn</h3>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 offset-xl-1">
                                                        <div>
                                                            <p>Có kinh nghiệm và kiến thức thực sự trong ngành ngân
                                                                hàng.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-6 col-lg-4 col-xl-2">
                        <a href="#popup-team" class="teambox btn-popupTeam">
                            <div class="teambox__inner">
                                <div class="teambox__img" style="background-image: url(./assets/img/anh_Nam.jpg);">
                                </div>
                                <div class="teambox__body">
                                    <h3 class="teambox__name">Vũ Thành Nam</h3>
                                    <p class="teambox__text">CTO</p>
                                </div>
                                <div class="teambox__list">
                                    <ul class="">
                                        <p>30 năm giảng dạy và làm việc trong lĩnh vực Giải pháp phần mềm, hiện tại là
                                            Tiến sĩ & Giám đốc Chương trình đào tạo HTTTQL tại HUST</p>
                                    </ul>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-6 col-lg-4 col-xl-2">
                        <a href="#popup-team" class="teambox btn-popupTeam">
                            <div class="teambox__inner">
                                <div class="teambox__img" style="background-image: url(./assets/img/anh_Thinh.png);">
                                </div>
                                <div class="teambox__body">
                                    <div>
                                        <h3 class="teambox__name">Lê Xuân Thịnh</h3>
                                    </div>
                                    <div>
                                        <p class="teambox__text">CFO</p>
                                    </div>
                                    <div class="teambox__list">
                                        <ul class="">
                                            <div>
                                                <p>Hơn 15 năm kinh nghiệm làm Kế toán trưởng tại Công ty lĩnh vực Phần
                                                    mềm</p>
                                            </div>
                                        </ul>
                                    </div>
                                </div>
                        </a>
                    </div>
                </div>
    </div>
    </div>
    </section>
        <section class="section sec-newUpdate">
            <div class="container-custom">
                <div class="sec-newUpdate__wrap">
                    <div class="sec-newUpdate__header wow fadeInUp">
                        <div class="row align-items-center">
                            <div class="col-md-7 col-xl-6">
                                <h2 class="item-title">Tin tức cập nhật</h2>
                            </div>
                            <div class="col-md-5 col-xl-6">
                                <div class="item-btn d-none d-md-block">
                                    <a href="category/tin-tuc.html" class="btn-text">Xem tất cả <span></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec-newUpdate__content wow fadeInUp">
                        <!-- Static news items for demo, replace with actual content -->
                        <div class="item">
                            <div class="postMin">
                                <div class="postMin__inner">
                                    <h3 class="postMin__title"><a href="news-post-1.html">DTSVN ra mắt giải pháp phần
                                            mềm
                                            mới</a></h3>
                                    <ul class="postMin__meta">
                                        <li>18/06/2023</li>
                                        <li><a href="category/subcategory.html">Công nghệ</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="postMin">
                                <div class="postMin__inner">
                                    <h3 class="postMin__title"><a href="news-post-2.html">Hội thảo chuyển đổi số ngân
                                            hàng</a>
                                    </h3>
                                    <ul class="postMin__meta">
                                        <li>15/05/2023</li>
                                        <li><a href="category/subcategory.html">Sự kiện</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sec-newUpdate__btn d-md-none">
                        <a href="category/tin-tuc.html" class="btn-text">Xem tất cả <span></span></a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>