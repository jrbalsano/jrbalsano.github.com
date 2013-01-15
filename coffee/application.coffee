$(document).ready ->
  win = $(window)
  scrollDistance = $(".page").width()
  initialOffset = parseInt $(".title-bar").css 'top'
  toTop = initialOffset - 150
  fraction = toTop/scrollDistance
  win.resize ->
    scrollDistance = $(".page").width()
    initialOffset = parseInt $(".title-bar").css 'top'
    toTop = initialOffset - 150
    fraction = toTop/scrollDistance
  $(window).scroll (e) ->
    left = win.scrollLeft()
    top = win.scrollTop()
    if top != 0
      win.scrollLeft left+top
    if left < scrollDistance
      $(".title-bar").css('top', (initialOffset-left*fraction)+'px')
    else
      $(".title-bar").css('top', (initialOffset-toTop)+'px')
