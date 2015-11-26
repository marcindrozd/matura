class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :subtask

  validate :score_cannot_be_larger_than_max_points

  scope :standard, -> { joins(subtask: :task).where('tasks.level = ?', 'standard').order('tasks.number asc').order('subtasks.number asc') }
  scope :extended, -> { joins(subtask: :task).where('tasks.level = ?', 'extended').order('tasks.number asc').order('subtasks.number asc') }
  scope :bilingual, -> { joins(subtask: :task).where('tasks.level = ?', 'bilingual').order('tasks.number asc').order('subtasks.number asc') }

  def task_number
    subtask.task.number
  end

  def task
    subtask.task
  end

  private

  def score_cannot_be_larger_than_max_points
    if score > subtask.max_points
      errors.add(:score, I18n.t('errors.messages.cannot_be_larger_than_max_poins', max_points: subtask.max_points))
    end
  end
end
