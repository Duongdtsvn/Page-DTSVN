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
    <@crafter.renderComponentCollection $field="header_o" />
    <main class="page-content">
        <@crafter.renderComponentCollection $field="banner_blog_o" />
        <section class="section sec-blogPage">
            <div class="container-custom">
                <@crafter.renderComponentCollection $field="list_blog_o" />
            </div>
        </section>
    </main>
    <@crafter.renderComponentCollection $field="footer_o" />
    <@crafter.body_bottom />
    <script src="/static-assets/js/header.js"></script>
</body>

</html>