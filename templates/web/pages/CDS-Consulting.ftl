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

        
        <@crafter.renderComponentCollection $field="member_o" />
        <@crafter.renderComponentCollection $field="footer_o" />
    </main>
<script src="/static-assets/js/function.css"></script>
    <@crafter.body_bottom />
</body>

</html>