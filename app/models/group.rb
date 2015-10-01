class Group < ActiveRecord::Base
  KINDS = %w{rozszerzona dwujęzyczna}

  belongs_to :exam
  has_and_belongs_to_many :teachers, class_name: User.name
  has_many :students, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :exam }
  validates :kind, presence: true, inclusion: { in: KINDS }
end
