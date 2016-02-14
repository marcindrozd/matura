require 'rails_helper'

describe Exam do
  it 'is valid with name' do
    exam = Exam.new(name: 'Test Exam')

    expect(exam).to be_valid
  end

  it 'is invalid without a name' do
    exam = Exam.new

    expect(exam).not_to be_valid
  end

  it 'should have a unique name' do
    first_exam = Exam.create(name: 'Test Exam')
    second_exam = Exam.new(name: 'Test Exam')

    expect(second_exam).not_to be_valid
  end

  it 'returns exam name when exam is called' do
    exam = Exam.create(name: 'Test Exam')

    expect(exam.to_s).to eq('Test Exam')
  end
end
