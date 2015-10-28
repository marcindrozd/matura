class StudentService < ApplicationService

  attr_accessor :student, :group

  def initialize(student)
    @student = student
    @group = student.group
  end

  def create
    result = student.update_attributes(name: generate_name)

    return result, student
  end

  def get
    student
  end

  def update(params)
    result = student.update_attributes params

    return result, student
  end

  def destroy
    student.destroy
  end

  private

  def add_all_tasks_to_student
    exam.subtasks.each do |subtask|
      student.scores << subtask.scores.create
    end

    student.save
  end

  def generate_name
    next_student = group.students.count || 0
    "Uczeń #{next_student + 1}"
  end
end
