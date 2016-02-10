require 'rails_helper'

describe TaskService do
  let!(:exam) { create :exam }
  let!(:group) { create :group, exam: exam }
  let!(:student1) { create :student, group: group, level: 'standard' }
  let!(:student2) { create :student, group: group, level: 'standard' }

  it 'adds newly created task to all existing students' do
    task = create :task, exam: exam, level: 'standard'
    subtask1 = create :subtask, task: task
    subtask2 = create :subtask, task: task

    service = TaskService.new(task)
    service.create

    expect(student1.reload.scores.count).to eq(2)
    expect(student2.reload.scores.count).to eq(2)
  end
end
