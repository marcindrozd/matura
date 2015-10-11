class Student < ActiveRecord::Base
  belongs_to :group
  has_many :scores
  has_many :subtasks, through: :scores

  accepts_nested_attributes_for :scores

  def sum_scores_by_task(task_id)
    scores.standard.where('tasks.id = ?', task_id).sum(:score)
  end
end
