$(document).ready ->
  $('.accordion-tabs-minimal').each (index) ->
    if request_params
      $(this).children('li').first().children('a').removeClass('is-active')
      $(this).children('li#' + request_params).children('a').addClass('is-active').next().addClass('is-open').show()
    else
      $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show()
    return
  $('.accordion-tabs-minimal').on 'click', 'li > a.tab-link', (event) ->
    if !$(this).hasClass('is-active')
      event.preventDefault()
      accordionTabs = $(this).closest('.accordion-tabs-minimal')
      accordionTabs.find('.is-open').removeClass('is-open').hide()
      $(this).next().toggleClass('is-open').toggle()
      accordionTabs.find('.is-active').removeClass 'is-active'
      $(this).addClass 'is-active'
    else
      event.preventDefault()
    return
  return
