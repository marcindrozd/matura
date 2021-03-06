class Student < ActiveRecord::Base
  LEVELS = %w{standard extended bilingual}.freeze

  belongs_to :group
  has_many :scores, dependent: :destroy
  has_many :subtasks, through: :scores
  has_many :tasks, through: :subtasks

  accepts_nested_attributes_for :scores

  scope :standard, -> { where level: 'standard' }
  scope :extended, -> { where level: 'extended' }
  scope :bilingual, -> { where level: 'bilingual' }

  def sum_scores_by_task(task_id)
    scores.joins(subtask: :task).where('tasks.id = ?', task_id).sum(:score)
  end

  def standard_tasks
    tasks.standard.order(:number, :secondary_number).uniq
  end

  def extended_tasks
    tasks.extended.order(:number, :secondary_number).uniq
  end

  def bilingual_tasks
    tasks.bilingual.order(:number, :secondary_number).uniq
  end

  def exam
    group.exam
  end

  def total_for_all_tasks(level)
    scores.joins(subtask: :task).where('tasks.level = ?', level).sum(:score)
  end
end
