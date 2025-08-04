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
        <@crafter.renderComponentCollection $field="who_studies_o" />
        <@crafter.renderComponentCollection $field="target_o" />
        <@crafter.renderComponentCollection $field="why_choose_o" />
        <@crafter.renderComponentCollection $field="result_o" />
        <section class="section pb-0">
                <div class="container-custom">
                    <div class="row">
                        <div class="col-xl-12">
                            <@crafter.img $field="image_s" src=(contentModel.image_s!"") alt="" />
                        </div>
                    </div>
                </div>
            </section>
        <@crafter.renderComponentCollection $field="course_information_o" />
        <@crafter.renderComponentCollection $field="footer_o" />
    </main>
<script src="/static-assets/js/function.css"></script>
<script src="/static-assets/js/header.css"></script>
  <script src="/static-assets/js/header.js?site=${siteContext.siteName}"></script>

    <@crafter.body_bottom />
</body>

</html>