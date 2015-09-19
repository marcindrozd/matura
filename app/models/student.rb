class Student < ActiveRecord::Base
  belongs_to :group
  has_many :scores
  has_many :subtasks, through: :scores

  accepts_nested_attributes_for :scores
end
