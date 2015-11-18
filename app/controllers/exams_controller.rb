class ExamsController < BaseController
  load_and_authorize_resource

  def set_current
    set_current_exam(@exam.id)
    redirect_to root_path, notice: t('custom_messages.exam_changed', exam: @exam.name)
  end
end
