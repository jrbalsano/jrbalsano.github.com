// Generated by CoffeeScript 1.4.0
(function() {

  $(document).ready(function() {
    var $cont, $contact, $home, $proj, $projects, fraction, initialOffset, scrollDistance, toTop, win;
    win = $(window);
    scrollDistance = win.width();
    initialOffset = parseInt($(".title-bar").css('top'));
    toTop = initialOffset - 150;
    fraction = toTop / (scrollDistance * .5);
    $projects = $($(".page")[1]);
    $contact = $($(".page")[2]);
    $home = $(".home");
    $proj = $(".proj");
    $cont = $(".cont");
    win.resize(function() {
      scrollDistance = win.width();
      initialOffset = parseInt($(".title-bar").css('top'));
      toTop = initialOffset - 150;
      return fraction = toTop / scrollDistance;
    });
    $(window).scroll(function(e) {
      var left;
      $(".title-bar ul a").removeClass("active");
      left = win.scrollLeft();
      if (left < scrollDistance * .5) {
        $(".title-bar").css('top', "" + (initialOffset - left * fraction) + "px");
        return $home.addClass("active");
      } else if (left < scrollDistance) {
        $projects.css('left', "" + (scrollDistance - left) + "px");
        $(".title-bar").css('top', (initialOffset - toTop) + 'px');
        return $home.addClass("active");
      } else if (left < scrollDistance * 2) {
        $contact.css('left', "" + (scrollDistance * 2 - left) + "px");
        $projects.css('left', "0px");
        $(".title-bar").css('top', (initialOffset - toTop) + 'px');
        return $proj.addClass("active");
      } else {
        $contact.css('left', "0px");
        $(".title-bar").css('top', (initialOffset - toTop) + 'px');
        return $cont.addClass("active");
      }
    });
    $home.click(function(e) {
      return $("html, body").animate({
        scrollLeft: 0
      }, 750);
    });
    $proj.click(function(e) {
      return $("html, body").animate({
        scrollLeft: scrollDistance
      }, 750);
    });
    return $cont.click(function(e) {
      return $("html, body").animate({
        scrollLeft: scrollDistance * 2
      }, 750);
    });
  });

}).call(this);
