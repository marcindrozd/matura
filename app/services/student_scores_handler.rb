class StudentScoresHandler
  def initialize(exam, student)
    @exam = exam
    @student = student
  end

  def add_all_tasks_to_student
    subtasks = @exam.tasks.map { |t| t.subtasks }.flatten

    subtasks.each do |task|
      @student.scores << task.scores.create
    end

    @student.save
  end
end