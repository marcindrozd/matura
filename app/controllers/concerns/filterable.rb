module Filterable
  def apply_filters(records, options = {})
    db_filter_key = options[:db_filter_key] || full_controller_name

    @query = records.search(db_filter_store(db_filter_key))
    @query.sorts = options[:default_sorts] if @query.sorts.empty? and options[:default_sorts].present?
    @scope = @query.result

    return options[:no_pagination] ? @scope : @scope.page(params[:page])
  end

  def db_filter_store(filter_key, q = params[:q])
    @filter_key = filter_key
    @filter_q = q
    set_variables
    @filter_id.blank? ? current_filter : predefined_filter

    @filter.filter_hash || {}
  end

  protected

  def set_variables
    @filter_id = params[:filter_id]
    @clear_sort = params[:clear_sort]
    @clear_filter = params[:clear_filter]
  end

  def current_filter
    @filter = get_current_filter
    prepare_current_filter
  end

  def get_current_filter
    if no_filter_params?
      UserFilter.active_for(current_user, @filter_key)
    else
      UserFilter.new_for(current_user, @filter_key)
    end
  end

  def no_filter_params?
    @filter_q.nil? && @clear_filter.blank? && @clear_sort.blank?
  end

  def prepare_current_filter
    if @clear_filter && @filter_q.nil?
      @filter.update_attribute(:filter_hash, nil)
    else
      @filter.filter_hash.delete('s') if @filter && @filter.filter_hash && @clear_sort
      return true unless @filter_q

      if sort_requested?
        @filter.update_attribute(:filter_hash, @filter_q)
      else
        @filter.update_attribute(:filter_hash, (@filter.filter_hash || {}).merge(@filter_q))
      end
    end
  end

  def sort_requested?
    @filter_q && @filter_q.keys.any?{ |key| key == 's' }
  end

  def full_controller_name
    controller_path.gsub('/', '_').to_sym
  end
end
