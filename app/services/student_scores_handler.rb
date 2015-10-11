class StudentScoresHandler
  attr_accessor :exam, :student

  def initialize(exam, student)
    @exam = exam
    @student = student
  end

  def add_all_tasks_to_student
    exam.subtasks.each do |subtask|
      student.scores << subtask.scores.create
    end

    student.save
  end
end
