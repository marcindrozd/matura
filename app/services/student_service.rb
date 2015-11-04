class StudentService < ApplicationService

  attr_accessor :student, :group, :exam

  def initialize(student)
    @student = student
    @group = student.group
    @exam = @group.exam
  end

  def create
    result = student.update_attributes(name: generate_name)
    add_all_tasks_to_student(student)

    return result, student
  end

  def get
    student
  end

  def update_number(group, count)
    count = count.to_i

    if group.students.count > count
      number_to_delete = group.students.count - count
      group.students.last(number_to_delete + 1).each do |item|
        item.destroy
      end
    elsif group.students.count < count
      number_to_create = count - group.students.count
      number_to_create.times do
        new_student = group.students.create(name: generate_name)
        add_all_tasks_to_student(new_student)
      end
    end

    return true, group
  end

  def update(params)
    result = student.update_attributes params

    return result, student
  end

  def destroy
    student.destroy
  end

  private

  def add_all_tasks_to_student(student)
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
