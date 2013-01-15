$(document).ready ->
  win = $(window)
  scrollDistance = win.width()
  initialOffset = parseInt $(".title-bar").css 'top'
  toTop = initialOffset - 150
  fraction = toTop/(scrollDistance*.5)
  win.resize ->
    scrollDistance = win.width()
    initialOffset = parseInt $(".title-bar").css 'top'
    toTop = initialOffset - 150
    fraction = toTop/scrollDistance
  $(window).scroll (e) ->
    left = win.scrollLeft()
    $projects = $ $(".page")[1]
    $contact = $ $(".page")[2]
    if left < scrollDistance *.5
      $(".title-bar").css 'top', "#{initialOffset-left*fraction}px"
    else if left < scrollDistance
      $projects.css 'left', "#{scrollDistance-left}px"
      $(".title-bar").css 'top', (initialOffset-toTop)+'px'
    else if left < scrollDistance * 2
      $contact.css 'left', "#{scrollDistance*2-left}px"
      $projects.css 'left', "0px"
    else
      $contact.css 'left', "0px"

