class Admin::ExamsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @exam.save
      redirect_to admin_exams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exam.update(exam_params)
      redirect_to edit_admin_exam_path(exam)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end
end
