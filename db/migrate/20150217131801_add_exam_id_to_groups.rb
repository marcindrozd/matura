class AddExamIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :exam_id, :integer
    add_index :groups, :exam_id
  end
end
