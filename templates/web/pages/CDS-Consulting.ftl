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
        <@crafter.renderComponentCollection $field="why_choose_o" />
        <section class="section sec-vision">
    <div class="bg" style="background-image: url(assets/img/vision-bg.jpg);"></div>
    <div class="container-custom">
        <div class="row">
            <div class="col-xl-7 col-xxl-6 col-xxxl-5">
                <h2 class="item-quote">Những vấn đề & thách thức khi chuyển đổi số</h2>
                <p class="item__text" style="color: white;">Doanh nghiệp của bạn có đang gặp phải những khó khăn dưới đây khi Chuyển đổi số không?</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-8 offset-xl-4 col-xxl-6 offset-xxl-6">
                <div class="sec-vision__list">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="item">
                                <label class="item__label">
                                    <input type="checkbox">
                                    <h3 class="item__title">Năng suất làm việc suy giảm</h3>
                                    <div class="item__content">
                                        <p class="item__text">Nhiều công việc không tên, các công việc thủ công khiến nhân sự trong Doanh nghiệp mất thời gian giải quyết, không tập trung được cho các công việc quan trọng.</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="item">
                                <label class="item__label">
                                    <input type="checkbox">
                                    <h3 class="item__title">Quy trình làm việc phức tạp</h3>
                                    <div class="item__content">
                                        <p class="item__text">Quy trình không đồng bộ thống nhất giữa các phòng ban, các phòng ban bị động trong công việc khiến hiệu quả vận hành Doanh nghiệp giảm sút.</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="item">
                                <label class="item__label">
                                    <input type="checkbox">
                                    <h3 class="item__title">Dữ liệu phân tán không đồng nhất</h3>
                                    <div class="item__content">
                                        <p class="item__text">Quản lý dữ liệu theo cách thủ công truyền thống và không được thống nhất dẫn đến sự thiếu minh bạch và chậm chạp trong việc ra các quyết định kịp thời cho Doanh nghiệp.</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="item">
                                <label class="item__label">
                                    <input type="checkbox">
                                    <h3 class="item__title">Hiệu quả kinh doanh giảm sút</h3>
                                    <div class="item__content">
                                        <p class="item__text">Khách hàng mất đàn hứng thú và không còn quay lại với Doanh nghiệp vì không có phương thức chăm sóc khách hàng thường xuyên, liên tục.</p>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section sec-strength">
    <div class="container-custom">
        <div class="sec-strength__wrap">
            <div class="sec-strength__list owl-carousel">
            <div class="titlebox item">
                <h2 class="titlebox__title fz-44">Các gói dịch vụ tư vấn chuyển đổi số tại DTSVN</h2>
            </div>
                <div class="item">
                    <div class="featurebox" style="border: 1px solid #E3E5EA">
                        <div class="featurebox__inner">
                            <span class="featurebox__icon"><img src="assets/img/featurebox-icon-1.svg" alt=""></span>
                            <div class="featurebox__body">
                                <div class="translate" data-translate=".featurebox__text" style="--y: 90px">
                                    <span class="featurebox__number">01</span>
                                    <h3 class="featurebox__title">Tư vấn cơ bản</h3>
                                    <p class="featurebox__text"style="visibility: visible;">Dành cho doanh nghiệp mới bắt đầu có mong muốn chuyển đổi số<br>✔️Đánh giá mức độ sẵn sàng và trưởng thành số<br>✔️Đánh giá mức độ văn hóa số<br>✔️Xây dựng danh mục ưu tiên, sáng kiến số<br>✔️Xây dựng chiến lược và lộ trình Chuyển đổi số</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="featurebox" style="border: 1px solid #E3E5EA">
                        <div class="featurebox__inner">
                            <span class="featurebox__icon"><img src="assets/img/featurebox-icon-2.svg" alt=""></span>
                            <div class="featurebox__body">
                                <div class="translate" data-translate=".featurebox__text" style="--y: 90px">
                                    <span class="featurebox__number">02</span>
                                    <h3 class="featurebox__title">Tư vấn chuyên sâu</h3>
                                    <p class="featurebox__text">Dành cho doanh nghiệp muốn tối ưu hạ tầng chuyển đổi số<br>✔️Đánh giá để xuất tối ưu hóa hạ tầng CNTT<br>✔️Chuyển đổi mô hình kinh doanh theo định hướng số<br>✔️Tối ưu vận hành cho Doanh nghiệp<br>✔️Xây dựng chiến lược khách hàng trong môi trường số</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="featurebox" style="border: 1px solid #E3E5EA">
                        <div class="featurebox__inner">
                            <span class="featurebox__icon"><img src="assets/img/featurebox-icon-3.svg" alt=""></span>
                            <div class="featurebox__body">
                                <div class="translate" data-translate=".featurebox__text" style="--y: 90px">
                                    <span class="featurebox__number">03</span>
                                    <h3 class="featurebox__title">Tư vấn nâng cao</h3>
                                    <p class="featurebox__text">Dành cho doanh nghiệp muốn phát triển chuyển đổi số toàn diện <br> Trao đổi trực tiếp 1:1 để chúng tôi hiểu rõ được nhu cầu chuyển đổi số cho doanh nghiệp của bạn</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section sec-teamLeader">
    <div class="container-custom">
        <div class="row">
            <div class="col-xl-5">
                <div class="titlebox">
                    <h2 class="titlebox__title fz-44">Ban chuyên gia tư vấn Chuyển đổi số tại DTSVN</h2>
                    <p class="titlebox__text">Với đội ngũ chuyên gia hơn 10 năm kinh nghiệm trong lĩnh vực Chuyển đổi số và sử dụng các phương pháp tiếp cận tiên tiến, DTSVN cam kết đồng hành cùng doanh nghiệp trên hành trình Chuyển đổi số, giúp tối ưu hóa hoạt động và nâng cao hiệu quả kinh doanh.</p>
                </div>
            </div>
        </div>
        <div class="sec-teamLeader__content">
            <div class="row">
                <div class="col-6 col-lg-4 col-xl-3">
                    <a href="#popup-team" class="teambox btn-popupTeam">
                        <div class="teambox__inner">
                            <div class="teambox__img" style="background-image: url(assets/img/AnhChien.jpg);"></div>
                            <div class="teambox__body">
                                <h3 class="teambox__name">Nguyễn Bá Chiến</h3>
                                <p class="teambox__text">CEO</p>
                            </div>
                            <div class="teambox__list">
                                <ul>
                                    <li>
                                        <div class="item-inner">
                                            <div class="row">
                                                <div class="col-xl-12 offset-xl-1">
                                                    <p>- Chủ tịch kiêm Tổng Giám đốc Công ty Cổ phần Giải pháp Chuyển đổi số Việt Nam DTSVN.</p>
                                                    <p>- Nguyên Giám đốc Kinh doanh khối Tài chính – Ngân hàng tại Tập đoàn Công nghệ CMC Corporation.</p>
                                                    <p>- Chuyên gia tư vấn chuyển đổi số và giải pháp tài chính 4.0 trong lĩnh vực Tài chính – Ngân hàng.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-6 col-lg-4 col-xl-3">
                    <a href="#popup-team" class="teambox btn-popupTeam">
                        <div class="teambox__inner">
                            <div class="teambox__img" style="background-image: url(assets/img/thaoPT.jpg);"></div>
                            <div class="teambox__body">
                                <h3 class="teambox__name">Nguyễn Thị Hương Thảo</h3>
                                <p class="teambox__text">Head Consultant</p>
                            </div>
                            <div class="teambox__list">
                                <ul>
                                    <li>
                                        <div class="item-inner">
                                            <div class="row">
                                                <div class="col-xl-12 offset-xl-1">
                                                    <p>- 16 năm kinh nghiệm tư vấn và triển khai chuyển đổi số trong lĩnh vực tài chính, ngân hàng.</p>
                                                    <p>- Trưởng bộ phận sản phẩm và dịch vụ kỹ thuật số tại VPBank Securities</p>
                                                    <p>- Trưởng bộ phận số hóa ngân hàng bán lẻ tại OCB</p>
                                                    <p>- Tư vấn trưởng tại Công ty Cổ phần Giải pháp Chuyển đổi số Việt Nam DTSVN</p>
                                                    <p>- Giám đốc chương trình cải tiến quy trình cho vay bán lẻ và dự án cho vay thế chấp kỹ thuật số tại OCB</p>
                                                    <p>- Chuyên gia đào tạo về chuyển đổi số, chuyển đổi Agile tại MBBank, OCB, VNPT, Rạng Đông, SAVIS….</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-6 col-lg-4 col-xl-3">
                    <a href="#popup-team" class="teambox btn-popupTeam">
                        <div class="teambox__inner">
                            <div class="teambox__img" style="background-image: url(assets/img/namCTO.jpg);"></div>
                            <div class="teambox__body">
                                <h3 class="teambox__name">Vũ Thành Nam</h3>
                                <p class="teambox__text">CTO</p>
                            </div>
                            <div class="teambox__list">
                                <ul>
                                    <li>
                                        <div class="item-inner">
                                            <div class="row">
                                                <div class="col-xl-12 offset-xl-1">
                                                    <p>- 30 năm giảng dạy và làm việc trong lĩnh vực công nghệ và giải pháp phần mềm.</p>
                                                    <p>- Giảng viên/ Trưởng bộ môn Toán-Tin – Đại học Bách Khoa Hà Nội</p>
                                                    <p>- Giám đốc Công nghệ tại Công ty Cổ phần Giải pháp Chuyển đổi số Việt Nam DTSVN</p>
                                                    <p>- Kỹ sư hệ thống/ Kiến trúc sư hệ thống kiêm chuyên gia tư vấn giải pháp tại Tập đoàn Công nghệ CMC Corporation</p>
                                                    <p>- Chuyên môn về an ninh thông tin, điện toán đám mây, an toàn máy tính, blockchain và IOT.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal-team" id="popup-team">
    <div class="modal-team__bg"></div>
    <div class="modal-team__inner">
        <div class="modal-team__content">
            <span class="modal-team__close">
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12.59 0L7 5.59L1.41 0L0 1.41L5.59 7L0 12.59L1.41 14L7 8.41L12.59 14L14 12.59L8.41 7L14 1.41L12.59 0Z" fill="black" />
                </svg>
            </span>

            <div class="modal-team__img" style="background-image: url(assets/img/teambox-1.jpg);"></div>
            <div class="modal-team__body">
                <span class="modal-team__subtitle">Deputy CEO of Professional Service</span>
                <h2 class="modal-team__title">Trần Bá Trọng</h2>
                <div class="modal-team__list">
                    <ul>
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
                                        <p>Có hơn 5 năm kinh Nghiêm triển khai trực tiếp các dự án lớn tại Ngân hàng</p>
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
                                        <p>Trên 10 năm triển khai các hệ thống lớn và phức tạp cho khách hàng trong và ngoài nước.</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

        
        <@crafter.renderComponentCollection $field="member_o" />
        <@crafter.renderComponentCollection $field="footer_o" />
    </main>
<script src="/static-assets/js/function.js"></script>
    <@crafter.body_bottom />
</body>

</html>