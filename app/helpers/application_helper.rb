module ApplicationHelper

  def filter_form_for(query, *args, &block)
    options = args.extract_options!
    options.merge!(
      builder: Builders::FilterFormBuilder,
      url: '',
      method: 'GET',
      html: {
        class: 'filter-form'
      }
    )
    form_for(query, *(args << options), &block)
  end
end
