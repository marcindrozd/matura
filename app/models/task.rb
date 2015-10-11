class Task < ActiveRecord::Base

  LEVELS = %w{standard extended bilingual}
  SKILLS = %w{listening reading grammar writing}

  belongs_to :exam
  has_many :subtasks, dependent: :destroy
  has_many :students, through: :subtasks

  accepts_nested_attributes_for :subtasks

  validates_uniqueness_of :number, scope: [:exam_id, :level]

  default_scope { order(:number) }

  scope :standard, -> { where level: 'standard' }
  scope :extended, -> { where level: 'extended' }
  scope :bilingual, -> { where level: 'bilingual' }

  def subtasks_list
    subtasks.map { |s| s.number }.compact.join(', ')
  end
end
