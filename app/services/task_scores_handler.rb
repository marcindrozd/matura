class TaskScoresHandler
  def initialize(exam, task)
    @exam = exam
    @task = task
  end

  def add_task_to_all_students
    students = @exam.groups.map { |t| t.students }.flatten

    students.each do |student|
      @task.subtasks.map do |subtask|
        student.scores << subtask.scores.build unless student.scores.pluck(:subtask_id).include?(subtask.id)
      end
      
      student.save
    end
  end
end
