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

    return result
  end

  def get
    student
  end

  def update_number(group, count, level)
    count = count.to_i

    if group.students.where(level: level).count > count
      number_to_delete = group.students.where(level: level).count - count
      group.students.where(level: level).last(number_to_delete + 1).each do |item|
        item.destroy
      end
    elsif group.students.where(level: level).count < count
      number_to_create = count - group.students.where(level: level).count
      number_to_create.times do
        new_student = group.students.create(name: generate_name(level), level: level)
        add_all_tasks_to_student(new_student)
      end
    end

    return true
  end

  def update(params)
    result = student.update_attributes params

    return result
  end

  def destroy
    student.destroy
  end

  private

  def add_all_tasks_to_student(student)
    level = student.level
    subtasks = exam.subtasks.select { |s| s.level == level }

    subtasks.each do |subtask|
      student.scores << subtask.scores.create
    end

    student.save
  end

  def generate_name(level)
    next_student = group.students.where(level: level).count || 0
    "Uczeń #{next_student + 1}"
  end
end
