class Task < ActiveRecord::Base
  belongs_to :exam
  has_many :scores
  has_many :students, through: :scores
end
