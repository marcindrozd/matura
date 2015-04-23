class AddExamIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :exam_id, :integer
  end
end
