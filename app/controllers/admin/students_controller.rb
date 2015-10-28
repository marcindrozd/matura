class Admin::StudentsController < Admin::BaseController
  load_and_authorize_resource :group
  load_and_authorize_resource through: :group

  def index
  end

  def create
    success, @student = student_service.create

    if success
      redirect_to admin_group_students_path(@group)
    else
      render :index
    end
  end

  def update
  end

  private

  def student_service
    @student_service ||= StudentService.new @student
  end
end
