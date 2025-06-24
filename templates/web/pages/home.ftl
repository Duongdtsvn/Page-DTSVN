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
      <script>
    function popupTeamJs() {
      var item = $('.btn-popupTeam'),
          bg = $('.modal-team__bg'),
          close = $('.modal-team__close');

      item.on('click', function(e) {
        e.preventDefault();

        var self = $(this),
            getName = self.find('.teambox__name').text(),
            getPosition= self.find('.teambox__text').text(),
            getImage = self.find('.teambox__img').attr('style'),
            getList = self.find('.teambox__list').html(),
            getId = self.attr('href');

        $(getId).find('.modal-team__img').attr('style', getImage);
        $(getId).find('.modal-team__subtitle').text(getPosition);
        $(getId).find('.modal-team__title').text(getName);
        $(getId).find('.modal-team__list').html(getList);
        $(getId).addClass('show');
      });

      $('.modal-team__bg, .modal-team__close').on('click', function() {
        $('.modal-team').removeClass('show');
      });
    }

    $(document).ready(function() {
      popupTeamJs();
    });
  </script>
  <@crafter.head/>
</head>
  <body >
  <@crafter.body_top/>
  <@crafter.renderComponentCollection $field="header_o"/>
        <@crafter.renderComponentCollection $field="home_o"/>
  <@crafter.body_bottom/>
  <script src="/static-assets/js/header.js"></script>
  </body>
</html>