$(document).ready ->
  if $('#subtasks').length > 0
    $('#subtasks').on 'cocoon:after-insert', (e, insertedItem) ->
      $(insertedItem).find('.subtask-number-field').attr('value', $('.subtask-number-field').length)
      $(insertedItem).find('.subtask-points-field').focus()