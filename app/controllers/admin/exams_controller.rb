class Admin::ExamsController < Admin::BaseController
  # load_and_authorize_resource

  def index
  end

  def new
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end
end
