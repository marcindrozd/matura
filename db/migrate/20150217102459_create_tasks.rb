class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :number
      t.string :subnumber
      t.string :level
      t.integer :max_points

      t.timestamps
    end
  end
end
