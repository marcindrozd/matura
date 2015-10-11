require 'rails_helper'

describe TaskScoresHandler do
  let!(:exam) { create :exam }
  let!(:group) { create :group, exam: exam }
  let!(:student1) { create :student, group: group }
  let!(:student2) { create :student, group: group }

  it 'adds newly created task to all existing students' do
    task = create :task, exam: exam
    subtask1 = create :subtask, task: task
    subtask2 = create :subtask, task: task

    service = TaskScoresHandler.new(exam, task)
    service.add_task_to_all_students

    expect(student1.reload.scores.count).to eq(2)
    expect(student2.reload.scores.count).to eq(2)
  end
end
