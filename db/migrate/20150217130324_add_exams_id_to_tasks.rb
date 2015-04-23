class AddExamsIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :exam_id, :integer
  end
end
