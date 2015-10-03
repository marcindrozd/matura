class ChangeSubtaskNameToNumber < ActiveRecord::Migration
  def change
    remove_column :subtasks, :name
    add_column :subtasks, :number, :integer
    add_column :subtasks, :description, :string
  end
end
