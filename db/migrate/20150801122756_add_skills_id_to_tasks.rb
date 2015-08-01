class AddSkillsIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :skill_id, :integer
    add_index :tasks, :skill_id
  end
end
