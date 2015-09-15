class Score < ActiveRecord::Base
  belongs_to :student
  belongs_to :subtask

  def self.for_tasks
    joins(:task).where(tasks: { task_type: "standardowe" })
  end
end
