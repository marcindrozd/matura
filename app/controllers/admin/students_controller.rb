class Admin::StudentsController < Admin::BaseController
  load_and_authorize_resource :group
  load_and_authorize_resource through: :group

  def index
  end

  def create
    @student.name = generate_name

    if @student.save
      redirect_to admin_group_students_path(@group)
    else
      render :index
    end
  end

  def update
  end

  private

  def generate_name
    next_student = @group.students.count || 0
    "Uczeń #{next_student + 1}"
  end
end
