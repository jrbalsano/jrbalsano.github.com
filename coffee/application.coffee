$(document).ready ->
  win = $(window)
  scrollDistance = win.width()
  initialOffset = parseInt $(".title-bar").css 'top'
  toTop = initialOffset - 150
  fraction = toTop/(scrollDistance*.5)
  $projects = $ $(".page")[1]
  $contact = $ $(".page")[2]
  $home = $(".home")
  $proj = $(".proj")
  $cont = $(".cont")
  win.resize ->
    scrollDistance = win.width()
    initialOffset = parseInt $(".title-bar").css 'top'
    toTop = initialOffset - 150
    fraction = toTop/scrollDistance
  $(window).scroll (e) ->
    $(".title-bar ul a").removeClass("active")
    left = win.scrollLeft()
    if left < scrollDistance *.5
      $(".title-bar").css 'top', "#{initialOffset-left*fraction}px"
      $home.addClass("active")
    else if left < scrollDistance
      $projects.css 'left', "#{scrollDistance-left}px"
      $(".title-bar").css 'top', (initialOffset-toTop)+'px'
      $home.addClass("active")
    else if left < scrollDistance * 2
      $contact.css 'left', "#{scrollDistance*2-left}px"
      $projects.css 'left', "0px"
      $proj.addClass("active")
    else
      $contact.css 'left', "0px"
      $cont.addClass("active")
  $home.click (e)->
    $("html, body").animate (scrollLeft: 0), 750
  $proj.click (e)->
    $("html, body").animate (scrollLeft: scrollDistance), 750
  $cont.click (e)->
    $("html, body").animate (scrollLeft: scrollDistance * 2), 750
