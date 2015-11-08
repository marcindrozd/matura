class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :scores, dependent: :destroy
  has_many :students, through: :scores

  accepts_nested_attributes_for :scores

  delegate :level, to: :task

  def to_s
    "#{task.number}-#{number}"
  end
end
