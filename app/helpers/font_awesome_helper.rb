module FontAwesomeHelper

  def nbsp_safe(n = 1)
    1.upto(n).map{ '&nbsp;' }.join.html_safe
  end

  def fa_icon(icon, options = {})
    size = options[:size]
    text = options[:text] || ''
    title = options[:title]
    css_classes = [
      'fa',
      "fa-#{icon}",
      ("fa-#{size}x" if size),
      ('fa-spin' if options[:spin]),
      ('fa-fw' if options[:fw]),
      options[:class]
    ].compact
    text = "&nbsp;#{text}".html_safe unless text.blank?

    (content_tag(:i, '', class: css_classes, title: title) + text).html_safe
  end

  def fa_link(text, link, icon, options = {})
    gap = nbsp_safe(options[:gap_size] || 1)
    icon_options = options.slice(:fw, :size)

    link_to link, options do
      [fa_icon(icon, icon_options), text].compact.join(gap).html_safe
    end
  end

  def fa_boolean(boolean_expression)
    !!boolean_expression ? fa_icon(:check) : fa_icon(:close)
  end
end
