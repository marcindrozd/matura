require 'rails_helper'

describe StudentService do
  let!(:exam) { create :exam }
  let!(:group) { create :group, exam: exam, kind: 'rozszerzona' }
  let!(:task) { create :task, exam: exam, level: 'standard' }
  let!(:subtask1) { create :subtask, task: task }
  let!(:subtask2) { create :subtask, task: task }

  it 'assigns blank scores for all available exam tasks when new student is created' do
    student = create :student, group: group

    service = StudentService.new(student)
    service.create('standard')

    expect(student.reload.scores.count).to eq(2)
  end
end
