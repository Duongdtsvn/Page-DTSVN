<#import "/templates/system/common/crafter.ftl" as crafter />


<section class="section sec-hero">
            <div class="sec-hero__inner">
                <div class="sec-hero__bg" data-bg-mb="url(${contentModel.cover_mobile_s!''})"
                    data-bg-pc="url(${contentModel.cover_pc!''})"
                    style="background-image: url(${contentModel.cover_pc!''});">
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