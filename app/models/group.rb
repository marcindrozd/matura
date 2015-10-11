class Group < ActiveRecord::Base
  KINDS = %w{rozszerzona dwujęzyczna}

  belongs_to :exam
  has_and_belongs_to_many :teachers, class_name: User.name
  has_many :students, dependent: :destroy
  has_many :scores, through: :students
  has_many :tasks, through: :students

  accepts_nested_attributes_for :students

  validates :name, presence: true, uniqueness: { scope: :exam }
  validates :kind, presence: true, inclusion: { in: KINDS }
end
