class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :scores
  has_many :students, through: :scores

  delegate :level, to: :task

  default_scope { order(:number) }

  def to_s
    "#{task.number}-#{number}"
  end
end
