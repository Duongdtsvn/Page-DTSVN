<#import "/templates/system/common/crafter.ftl" as crafter />

<!doctype html>
<html lang="en" class="demo">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DTSVN</title>
      <link rel="stylesheet" href="/static-assets/css/main.css">
      <script src="/static-assets/js/functions.js"></script>
  <@crafter.head/>
</head>
  <body >
  <@crafter.body_top/>
        <@crafter.renderComponentCollection $field="home_o"/>
  <@crafter.body_bottom/>
  </body>
</html>