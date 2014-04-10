$(document).ready(function () {
  var body = $('body');

  var parallax = function (event) {
    var scroll = $(window).scrollTop();
    var bgPos = scroll * 0.2;
    // console.log(scroll,bgPos);

    body.css('background-position-y', -bgPos);
  };

  $(window).on('scroll', parallax);

  var $nav = $('nav');
  var hiddenLeft = 10 - $nav.width();
  $nav.css('left', hiddenLeft);

  $nav.hover( function () {
    $nav.animate({ left: 0 },400);
  }, function () {
    $nav.animate({ left: -60 },400);
  });

  $(window).on('mousemove',function (event) {
    var size = (4 * Math.random()) + 'em';
    var $bubble = $('<div class="bubble" />').css({
      top: event.clientY,
      left: event.clientX,
      width: size,
      height: size
    }).appendTo('body');
    setTimeout(function () {
      $bubble.fadeOut(function () {
        $bubble.remove();
      });
    });
  });
});

