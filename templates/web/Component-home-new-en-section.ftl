<#import "/templates/system/common/crafter.ftl" as crafter />

<section class="section sec-newUpdate">
    <div class="container-custom">
        <div class="sec-newUpdate__wrap">
            <div class="sec-newUpdate__header wow fadeInUp  effect" style="visibility: visible;">
                <div class="row align-items-center">
                    <div class="col-md-7 col-xl-6">
                        <h2 class="item-title">${contentModel.title_s!''}</h2>
                    </div>
                    <div class="col-md-5 col-xl-6">
                        <div class="item-btn d-none d-md-block">
                            <a href="${contentModel.link_s!''}" class="btn-text">${contentModel.label_s!''}<span></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sec-newUpdate__content wow fadeInUp  effect" style="visibility: visible;">
                                  



                                    <div class="item">
                        <div class="postMin">
                            <div class="postMin__inner">
                                <h3 class="postMin__title"><a href="url-en">title_en</a></h3>
                                <ul class="postMin__meta">
                                    <li>${news.created_date?string("dd/MM/yyyy")}</li>
                                                                            <li><a href="url-tab-en">tabname-en</a></li>
                                                                    </ul>
                            </div>
                        </div>
                    </div>
                                


                            </div>
            <div class="sec-newUpdate__btn d-md-none">
                <a href="${contentModel.link_s!''}" class="btn-text">${contentModel.label_s!''}<span></span></a>
            </div>
        </div>
    </div>
</section>