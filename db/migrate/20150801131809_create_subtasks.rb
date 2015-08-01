class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.integer :max_points
      t.references :task

      t.timestamps
    end
  end
end
