class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :year

      t.timestamps
    end
  end
end
