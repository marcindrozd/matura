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

  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        object.errors.messages[field_name].join(', ')
      end
    end
  end

  def dashes(n = 3)
    '-' * n
  end
end
