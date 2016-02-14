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
    exam = Exam.create(name: 'Test Exam')
    first_group = Group.create(name: 'Test Group', exam: exam)

    second_group = Group.new(name: 'Test Group', exam: exam)

    expect(second_group).not_to be_valid  
  end

  it 'can have the same name in a different exam' do
    first_exam = Exam.create(name: 'First Exam')
    second_exam = Exam.create(name: 'Second Exam')
    first_group = Group.create(name: 'Test Group', exam: first_exam)

    second_group = Group.new(name: 'Test Group', exam: second_exam)

    expect(second_group).to be_valid  
  end

  it 'returns full name of a group with exam name' do
    exam = Exam.create(name: 'Test Exam')
    group = Group.create(name: 'Test Group', exam: exam)

    expect(group.full_name).to eq('Test Exam - Test Group')
  end
end
