module I18nHelper

  def current_locale
    I18n.locale
  end

  def available_locales
    I18n.available_locales
  end

  def ta(model_or_attribute, attribute_name = nil)
    case model_or_attribute
    when Symbol
      attribute_name = model_or_attribute
      model_or_attribute = guess_model_class
    when String
      model_or_attribute = model_or_attribute.classify.constantize
    end

    return model_or_attribute.human_attribute_name(attribute_name)
  end

  def tc(model_class, count = 1)
    model_class.model_name.human count: count
  end

  def tc_few(model_class)
    tc model_class, :few
  end

  def tc_many(model_class)
    tc model_class, :many
  end

  def yes_no(boolean_expression)
    !!boolean_expression ? t('yes') : t('no')
  end

  private

  def guess_model_class
    controller_name.classify.constantize
  end
end
