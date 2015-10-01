class ExamsController < BaseController
  load_and_authorize_resource

  def set_current
    set_current_exam(@exam.id)
    redirect_to root_path
  end
end
