config =
  animation:
    speed: 80
    distance: '0px'
    iterations: 3
  alertTimeout: 2000
  noticeTimeout: 1000
  fadeOutSpeed: 1000

flashAnimation = ->
  for i in [1..config.animation.iterations]
    $('.flash')
      .animate 'margin-left': '-' + config.animation.distance, config.animation.speed
      .animate 'margin-left': config.animation.distance, config.animation.speed

  $('.flash').animate 'margin-left': 0, config.animation.speed / 2
  $('.flash').promise()
    .then ->
      $('.flash.alert').delay(config.alertTimeout).fadeOut(config.fadeOutSpeed)
      $('.flash.notice').delay(config.noticeTimeout).fadeOut(config.fadeOutSpeed)

class Flash
  constructor: (@message, @type) ->
    @_clearFlashes()
    @_createDomElement()
    @promise = flashAnimation()

  _clearFlashes: ->
    $('.flash').finish().remove()

  _createDomElement: ->
    $('#flash').append '<div class="flash ' + @type + '">' + @message + '</div>'

$ ->
  # In js views, to create a flash message:
  #   new Flash('Something went wrong!', 'alert')
  window.Flash = Flash
  flashAnimation() if $('.flash').length > 0

  $('body').on 'click', '#flash, .flash', (e) ->
    $('.flash').clearQueue().fadeOut()
