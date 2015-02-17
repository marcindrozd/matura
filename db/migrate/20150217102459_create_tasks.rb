class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_number
      t.string :task_subnumber
      t.string :task_type
      t.integer :max_points

      t.timestamps
    end
  end
end
