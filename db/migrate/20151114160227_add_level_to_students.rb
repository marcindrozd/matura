class AddLevelToStudents < ActiveRecord::Migration
  def change
    add_column :students, :level, :string
  end
end
