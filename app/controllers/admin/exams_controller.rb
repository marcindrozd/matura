class Admin::ExamsController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @exam.save
      redirect_to admin_exams_path, notice: t('.exam_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exam.update(exam_params)
      redirect_to edit_admin_exam_path(@exam), notice: t('.exam_updated')
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to admin_exams_path, notice: t('.exam_destroyed')
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end
end
