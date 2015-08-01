class Task < ActiveRecord::Base

  LEVELS = %w{podstawa rozszerzenie dwujęzyczne}

  belongs_to :exam
  belongs_to :skill
  has_many :subtasks, dependent: :destroy

  accepts_nested_attributes_for :subtasks

  scope :standard, -> { where level: 'podstawa' }
  scope :extended, -> { where level: 'rozszerzenie' }
  scope :bilingual, -> { where level: 'dwujęzyczne' }
end
