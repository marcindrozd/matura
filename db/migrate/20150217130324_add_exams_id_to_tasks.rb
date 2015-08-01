class AddExamsIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :exam_id, :integer
    add_index :tasks, :exam_id
  end
end
