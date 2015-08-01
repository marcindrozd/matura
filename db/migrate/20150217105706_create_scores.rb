class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :subtask
      t.references :student
      t.integer :score

      t.timestamps
    end
  end
end
