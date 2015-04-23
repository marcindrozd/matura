class Group < ActiveRecord::Base
  belongs_to :exam
  has_many :students
end
