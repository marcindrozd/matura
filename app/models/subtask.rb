class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :scores
  has_many :students, through: :scores
end