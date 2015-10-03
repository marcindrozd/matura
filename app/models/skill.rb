class Skill < ActiveRecord::Base

  has_many :tasks, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
