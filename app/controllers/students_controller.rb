class StudentsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @student = @group.students.create(student_name: generate_name)

    if @student.save
      flash[:notice] = "Dodano ucznia!"
      redirect_to group_path(@group)
    else
      render 'groups/show'
    end
  end

  # count the occurrences of group_id to create next student
  def generate_name
    next_student = Student.group(:group_id).count[params[:group_id].to_i]
    "Student#{next_student + 1}"
  end
end
