class Student < ActiveRecord::Base
  belongs_to :group
  has_many :scores
  has_many :tasks, through: :scores
end
