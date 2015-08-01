class Group < ActiveRecord::Base
  KINDS = %w{rozszerzona dwujęzyczna}

  belongs_to :exam
  has_many :students, dependent: :destroy

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
end
