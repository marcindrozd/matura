class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :subtask

  scope :standard, -> { joins(subtask: :task).where('tasks.level = ?', 'podstawa') }
  scope :extended, -> { joins(subtask: :task).where('tasks.level = ?', 'rozszerzenie') }
  scope :bilingual, -> { joins(subtask: :task).where('tasks.level = ?', 'dwujęzyczne') }
end
