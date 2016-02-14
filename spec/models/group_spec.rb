require 'rails_helper'

describe Group do
  it 'is valid with a name' do
    group = Group.new(name: 'Test Group')

    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new

    expect(group).not_to be_valid
  end

  it 'has unique name within an exam' do
    exam = create(:exam)
    first_group = Group.create(name: 'Test Group', exam: exam)

    second_group = Group.new(name: 'Test Group', exam: exam)

    expect(second_group).not_to be_valid  
  end

  it 'can have the same name in a different exam' do
    first_exam = create(:exam)
    second_exam = create(:exam)
    first_group = Group.create(name: 'Test Group', exam: first_exam)

    second_group = Group.new(name: 'Test Group', exam: second_exam)

    expect(second_group).to be_valid  
  end

  it 'returns full name of a group with exam name' do
    exam = create(:exam, name: 'Test Exam')
    group = Group.create(name: 'Test Group', exam: exam)

    expect(group.full_name).to eq('Test Exam - Test Group')
  end

  describe '#students_number' do
    it 'returns 0 when there is no students in the group' do
      group = create(:group)

      expect(group.students_number).to eq(0)
    end

    it 'returns 1 when there is one student in a group' do
      group = create(:group)
      create(:student, group: group)

      expect(group.students_number).to eq(1)
    end

    it 'returns all the students from the group with different levels' do
      group = create(:group)
      create(:student, group: group, level: 'standard')
      create(:student, group: group, level: 'extended')
      create(:student, group: group, level: 'bilingual')

      expect(group.students_number).to eq(3)
    end

    it 'does not include students from other groups' do
      exam = create(:exam)
      tested_group = create(:group, exam: exam)
      other_group = create(:group, exam: exam)

      create(:student, group: tested_group)
      create(:student, group: tested_group)
      create(:student, group: other_group)

      expect(tested_group.students_number).to eq(2)
    end
  end

  describe '#standard_tasks' do
    it 'returns all standard tasks from a given exam' do
      exam = create(:exam)
      group = create(:group, exam: exam)
      student = create(:student, level: 'standard', group: group)
      tasks = []

      3.times { |i| tasks << create(:task, exam: exam, level: 'standard', number: "#{i + 1}") }
      tasks.each { |task| create(:subtask, task: task) } 

      exam.subtasks.each do |subtask|
        student.scores << subtask.scores.build
      end
      student.save

      expect(group.standard_tasks.count).to eq(3)
      expect(group.standard_tasks).to eq(tasks)
    end
  end

  describe '#extended_tasks' do
    it 'returns all extended tasks from a given exam' do
      exam = create(:exam)
      group = create(:group, exam: exam)
      student = create(:student, level: 'extended', group: group)
      tasks = []

      3.times { |i| tasks << create(:task, exam: exam, level: 'extended', number: "#{i + 1}") }
      tasks.each { |task| create(:subtask, task: task) } 

      exam.subtasks.each do |subtask|
        student.scores << subtask.scores.build
      end
      student.save

      expect(group.extended_tasks.count).to eq(3)
      expect(group.extended_tasks).to eq(tasks)
    end
  end

  describe '#bilingual_tasks' do
    it 'returns all bilingual tasks from a given exam' do
      exam = create(:exam)
      group = create(:group, exam: exam)
      student = create(:student, level: 'bilingual', group: group)
      tasks = []

      3.times { |i| tasks << create(:task, exam: exam, level: 'bilingual', number: "#{i + 1}") }
      tasks.each { |task| create(:subtask, task: task) } 

      exam.subtasks.each do |subtask|
        student.scores << subtask.scores.build
      end
      student.save

      expect(group.bilingual_tasks.count).to eq(3)
      expect(group.bilingual_tasks).to eq(tasks)
    end
  end
end
