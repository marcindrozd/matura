class Admin::StudentsController < Admin::BaseController
  load_and_authorize_resource :group
  load_and_authorize_resource through: :group

  def index
  end

  def create
    success = student_service.create params[:level]

    if success
      redirect_to admin_group_students_path(@group), notice: t('.student_added')
    else
      render :index
    end
  end

  def update_number
    @student = @group.students.new
    success = student_service.update_number(params[:students_count], params[:students_level])

    if success
      redirect_to admin_group_students_path(@group), notice: t('.number_updated')
    else
      render :index
    end
  end

  def update
  end

  def destroy
    student_service.destroy
    redirect_to admin_group_students_path(@group), notice: t('.student_deleted')
  end

  private

  def student_service
    @student_service ||= StudentService.new @student
  end
end
