require 'rails_helper'

describe TaskScoresHandler do
  # it 'adds newly created task to all existing students' do
  #   exam = Exam.create(name: 'Test Matura')
  #   group = exam.groups.create(name: 'a1', kind: 'rozszerzona')
  #   student1 = group.students.create(name: 'student 1')
  #   student2 = group.students.create(name: 'student 2')
  #
  #   task = exam.tasks.create(number: 1, level: 'podstawa')
  #   subtask1 = task.subtasks.create(name: '1', max_points: 1)
  #   subtask2 = task.subtasks.create(name: '2', max_points: 1)
  #
  #   student = create :student
  #
  #   service = TaskScoresHandler.new(exam, task)
  #   service.add_task_to_all_students
  #
  #   expect(student1.reload.scores.count).to eq(2)
  #   expect(student2.reload.scores.count).to eq(2)
  # end
end
