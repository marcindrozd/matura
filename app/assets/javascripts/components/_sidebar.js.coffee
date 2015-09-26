$ ->
  menuLeft = document.getElementById('cbp-spmenu-s1')
  showLeft = document.getElementById('showLeft')
  body = document.body

  showLeft.onclick = (event) ->
    classie.toggle this, 'active'
    classie.add menuLeft, 'cbp-spmenu-open'
    event.stopPropagation()

  body.onclick = ->
    classie.remove menuLeft, 'cbp-spmenu-open'

  menuLeft.onclick = (event) ->
    event.stopPropagation()
