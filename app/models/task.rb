class Task < ActiveRecord::Base
  belongs_to :exam
  has_many :scores
  has_many :students, through: :scores

  scope :standard, -> { where task_type: 'standardowe' }
  scope :extended, -> { where task_type: 'rozszerzone' }
end
