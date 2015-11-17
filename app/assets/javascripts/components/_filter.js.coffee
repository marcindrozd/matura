window.TableFilters =
  init: ->
    TableFilters.bindAutosubmit()
    TableFilters.bindControls()
    TableFilters.initMultiFilter()
    TableFilters.showHideMultiFilter()

  bindAutosubmit: ->
    $('.filter-form')
      .find('input, select, textarea').not('.not-submittable')
      .change (e) ->
        $(e.target).closest('form').submit()

  bindControls: ->
    $('.filter-form')
      .find('.clear-single-filter')
      .click (e) ->
        $(e.target).closest('th')
          .find('input, select, textarea').val('').change()

  initMultiFilter: ->
    $('.multi-filter').each (i, el) ->
      $(el).find('.multi-filter-count').html($(el).find('select :selected').length)    


  showHideMultiFilter: ->
    $('.multi-filter').on 'click', '.multi-filter-control', ->
      el = $(this).siblings('.multi-filter-box')
      console.log el.hasClass('hidden')
      if ( el.hasClass('hidden') )
        el.removeClass('hidden')
        el.parents('th').siblings().find('.multi-filter-box').addClass('hidden')
      else
        el.addClass('hidden')
        submitFilter(el) if $('.multi-filter-control').hasClass('changed')

$ ->
  TableFilters.init()