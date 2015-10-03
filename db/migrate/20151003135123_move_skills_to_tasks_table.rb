class MoveSkillsToTasksTable < ActiveRecord::Migration
  def change
    add_column :tasks, :skill, :string
    remove_column :tasks, :skill_id
  end
end
