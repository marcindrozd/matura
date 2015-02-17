class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :task_id
      t.integer :student_id
      t.integer :score

      t.timestamps
    end
  end
end
