$(document).ready ->
  win = $(window)
  pageWidth = win.width()
  initialOffset = parseInt $(".title-bar").css 'top'
  toTop = initialOffset - 150
  fraction = toTop/(pageWidth*.5)
  $page1 = $ $(".page")[1]
  $page2 = $ $(".page")[2]
  $page3 = $ $(".page")[3]
  $nav0 = $ $("a.nav")[0]
  $nav1 = $ $("a.nav")[1]
  $nav2 = $ $("a.nav")[2]
  $nav3 = $ $("a.nav")[3]
  $("body").resize ->
    pageWidth = win.width()
    initialOffset = parseInt $(".title-bar").css 'top'
    toTop = initialOffset - 150
    fraction = toTop/pageWidth
  $(window).scroll (e) ->
    $(".title-bar ul a").removeClass("active")
    left = win.scrollLeft()

    #moving pages
    $(".title-bar").css 'top', if left < pageWidth * .5 then "#{initialOffset-left*fraction}px" else '150px'
    $(".above-title-bar").css 'height', if left < pageWidth * .5 then "#{initialOffset-left*fraction}px" else '150px'
    $page1.css 'left', if left < pageWidth then "#{pageWidth-left}px" else '0px'
    $page2.css 'left', if left < pageWidth * 2 then "#{(pageWidth * 2 - left)}px" else '0px'
    $page3.css 'left', if left < pageWidth * 3 then "#{(pageWidth * 3 - left)}px" else '0px'
    #nav bar
    activeNav = $ $("a.nav")[Math.round left / pageWidth ]
    activeNav.addClass("active")
  $nav0.click (e)->
    $("html, body").animate (scrollLeft: 0), 750
  $nav1.click (e)->
    $("html, body").animate (scrollLeft: pageWidth), 750
  $nav2.click (e)->
    $("html, body").animate (scrollLeft: pageWidth * 2), 750
  $nav3.click (e)->
    $("html, body").animate (scrollLeft: pageWidth * 3), 750
