class Exam < ActiveRecord::Base
  has_many :tasks
  has_many :groups
end
