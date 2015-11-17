class Builders::FilterFormBuilder < Ransack::Helpers::FormBuilder

  def filter(method, type, options = {})
    heading = sort_link(options.delete(:sort) || method, options[:text] || @template.ta(method.to_sym))

    [
      (heading unless (options[:sort_link] == false)),
      filter_input(method, type, options),
    ].join.html_safe
  end

  def sort_link_only(method, options = {})
    sort_link(options.delete(:sort) || method, options[:text] || @template.ta(method.to_sym))
  end

  def filter_input(method, type, options = {})
    filter_method = {
      string: :string_filter,
      collection: :collection_filter,
      association: :association_filter,
      boolean: :boolean_filter,
      multi: :multi_filter,
      date: :date_filter,
      datetime: :datetime_filter,
      range: :generic_range_filter,
      collection_range: :collection_range_filter
    }[type] || :string_filter

    send filter_method, method, options
  end

  def controls
    @template.content_tag :div, class: 'controls' do
      [
        @template.button_tag(@template.fa_icon(:search), class: 'submit-filter btn btn-info'),
        @template.fa_link(nil, @template.url_for(clear_filter: true), 'times', class: 'clear-filter btn btn-danger')
      ].join.html_safe
    end
  end

  def string_filter(method, options = {})
    param = options[:param] || "#{method}_cont"

    @template.content_tag :div, class: 'filter string-filter' do
      [
        text_field(param),
        clear_single_filter
      ].join.html_safe
    end
  end

  def generic_range_filter(method, options = {})
    param_from = "#{method}_gteq"
    param_to = "#{method}_lteq"

    @template.content_tag :div, class: 'filter range-filter' do
      [
        text_field(param_from, placeholder: I18n.t('from')),
        text_field(param_to, placeholder: I18n.t('to')),
        clear_single_filter
      ].join.html_safe
    end
  end

  def collection_filter(method, options = {})
    param = options[:param] || "#{method}_cont"
    collection = options.delete :collection

    @template.content_tag :div, class: 'filter collection-filter' do
      select(param, collection, include_blank: true)
    end
  end

  def collection_range_filter(method, options = {})
    param_from = "#{method}_gteq"
    param_to = "#{method}_lteq"
    collection = options.delete :collection

    @template.content_tag :div, class: 'filter collection-range-filter' do
      @template.concat select(param_from, collection, include_blank: true)
      @template.concat select(param_to, collection, include_blank: true)
    end
  end

  def association_filter(method, options = {})
    param = "#{method}_id_eq"
    collection = options.delete :collection
    collection = collection.to_a.map { |item| [item.to_s, item.id] }

    @template.content_tag :div, class: 'filter association-filter' do
      select(param, collection, include_blank: true)
    end
  end

  def boolean_filter(method, options = {})
    param = "#{method}_eq"
    collection = { I18n.t('yes') => true, I18n.t('no') => false }

    @template.content_tag :div, class: 'filter boolean-filter' do
      select(param, collection, include_blank: true)
    end
  end

  def date_filter(method, options = {})
    param_from = "#{method}_gteq"
    param_to = "#{method}_lteq"
    input_options = { class: 'datepicker', include_blank: true }

    @template.content_tag :div, class: 'filter date-filter' do
      @template.concat text_field(param_from, input_options.merge(
        placeholder: I18n.t('from'),
        value: (I18n.l(@object.send(param_from)) if @object.send(param_from))
      ))
      @template.concat text_field(param_to, input_options.merge(
        placeholder: I18n.t('to'),
        value: (I18n.l(@object.send(param_to)) if @object.send(param_to))
      ))
    end
  end

  def datetime_filter(method, options = {})
    param_from = "#{method}_gteq"
    param_to = "#{method}_lteq"
    input_options = { class: 'datetimepicker', include_blank: true }

    @template.content_tag :div, class: 'filter datetime-filter' do
      @template.concat text_field(param_from, input_options.merge(
        placeholder: I18n.t('from'),
        value: (I18n.l(@object.send(param_from)) if @object.send(param_from))
      ))
      @template.concat text_field(param_to, input_options.merge(
        placeholder: I18n.t('to'),
        value: (I18n.l(@object.send(param_to)) if @object.send(param_to))
      ))
    end
  end

  def multi_filter(method, options = {})
    text = options[:text] || I18n.t('filter')
    param = options[:param] || "#{method}_id_in"
    collection = options[:collection]
    display_text = options[:display_text] || :to_s

    content = @template.content_tag(:span, text + ' (') + @template.content_tag(:span, '0', class: 'multi-filter-count') + @template.content_tag(:span, ')')

    @template.content_tag(:div, '', class: 'filter multi-filter') do
      @template.content_tag(:div, content, class: 'multi-filter-control') +
      @template.content_tag(:div, '', class: 'multi-filter-box hidden') do
        @template.concat collection_select param, collection, :id, display_text, { required: false, include_blank: '---' }, { multiple: true, class: 'not-submittable' }
      end
    end
  end

  def clear_single_filter
    @template.link_to '#', class: 'clear-single-filter' do
      @template.content_tag :i, nil, class: 'fa fa-times'
    end
  end
end
