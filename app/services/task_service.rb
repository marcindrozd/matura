class TaskService < ApplicationService

  attr_accessor :task, :exam

  def initialize(task)
    @task = task
    @exam = @task.exam
  end

  def create
    result = task.save
    add_task_to_all_exam_students

    return result, task
  end

  def update(params)
    result = task.update params
    add_task_to_all_exam_students

    return result, task
  end

  private

  def add_task_to_all_exam_students
    students = exam.students.where(level: task.level)

    students.each do |student|
      task.subtasks.map do |subtask|
        student.scores << subtask.scores.build unless student.scores.pluck(:subtask_id).include?(subtask.id)
      end

      student.save
    end
  end
end
