class Exam < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
