class Group < ActiveRecord::Base
  belongs_to :exam
  has_many :students, dependent: :destroy

  validates :name, presence: true
end
