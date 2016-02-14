class Group < ActiveRecord::Base
  KINDS = %w{extended bilingual}

  belongs_to :exam
  has_and_belongs_to_many :teachers, class_name: User.name
  has_many :students, dependent: :destroy
  has_many :scores, through: :students
  has_many :tasks, through: :students

  accepts_nested_attributes_for :students

  scope :groups_for_select, -> { joins(:exam).order('exams.name', :name) }

  validates :name, presence: true, uniqueness: { scope: :exam }

  def students_number
    students.standard.count + students.extended.count + students.bilingual.count
  end

  def standard_tasks
    tasks.where(level: 'standard').order(:number, :secondary_number).uniq
  end

  def extended_tasks
    tasks.where(level: 'extended').order(:number, :secondary_number).uniq
  end

  def bilingual_tasks
    tasks.where(level: 'bilingual').order(:number, :secondary_number).uniq
  end

  def full_name
    "#{exam.name} - #{name}"
  end
end
