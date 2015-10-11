class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :subtask

  scope :standard, -> { joins(subtask: :task).where('tasks.level = ?', 'standard').order('tasks.number asc').order('subtasks.number asc') }
  scope :extended, -> { joins(subtask: :task).where('tasks.level = ?', 'extended').order('tasks.number asc').order('subtasks.number asc') }
  scope :bilingual, -> { joins(subtask: :task).where('tasks.level = ?', 'bilingual').order('tasks.number asc').order('subtasks.number asc') }
end
