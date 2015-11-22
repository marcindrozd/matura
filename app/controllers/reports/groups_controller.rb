class Reports::GroupsController < Reports::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def show
    @standard_tasks = @group.standard_tasks
    @extended_tasks = @group.extended_tasks
    @bilingual_tasks = @group.bilingual_tasks

    @standard_students = @group.students.standard
    @extended_students = @group.students.extended
    @bilingual_students = @group.students.bilingual
  end
end
