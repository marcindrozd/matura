class TaskScoresHandler
  def initialize(exam, task)
    @exam = exam
    @task = task
  end

  def add_task_to_all_students
    students = @exam.groups.map { |t| t.students }.flatten

    students.each do |student|
      scores = @task.subtasks.map { |s| s.scores.build }
      student.scores << scores
      student.save
    end
  end
end