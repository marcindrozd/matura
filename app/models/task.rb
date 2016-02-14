class Task < ActiveRecord::Base

  LEVELS = %w{standard extended bilingual}
  SKILLS = %w{listening reading grammar writing}

  belongs_to :exam
  has_many :subtasks, dependent: :destroy
  has_many :scores, through: :subtasks
  has_many :students, through: :subtasks

  accepts_nested_attributes_for :subtasks, allow_destroy: true

  validates :number, :level, :skill, presence: true
  validates_uniqueness_of :number, scope: [:exam_id, :level, :secondary_number]

  scope :standard, -> { where level: 'standard' }
  scope :extended, -> { where level: 'extended' }
  scope :bilingual, -> { where level: 'bilingual' }

  def subtasks_list
    subtasks.map { |s| s.number }.compact.join(', ')
  end

  def full_score(student)
    scores.where(student: student).sum(:score)
  end

  def full_number
    number.to_s + ' - ' + I18n.t("task.levels.#{level}") if valid?
  end

  def extended_number
    description.present? ? "#{number} - #{description_initials}" : number
  end

  def max_points
    subtasks.sum(:max_points)
  end

  def pretty_level
    I18n.t("task.levels.#{level}")
  end

  def self.levels_collection
    LEVELS.map { |l| [I18n.t("task.levels.#{l}"), l] }
  end

  def description_initials
    description.scan(/\b\S/).join
  end
end
