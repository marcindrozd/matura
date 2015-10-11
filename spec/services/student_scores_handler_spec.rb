require 'rails_helper'

describe StudentScoresHandler do
  let!(:exam) { create :exam }
  let!(:task) { create :task, exam: exam }
  let!(:subtask1) { create :subtask, task: task }
  let!(:subtask2) { create :subtask, task: task }

  it 'assigns blank scores for all available exam tasks when new student is created' do
    student = create :student

    service = StudentScoresHandler.new(exam, student)
    service.add_all_tasks_to_student

    expect(student.reload.scores.count).to eq(2)
  end
end
