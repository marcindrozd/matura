class Exam < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :students, through: :groups
  has_many :subtasks, through: :tasks

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
