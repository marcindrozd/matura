class RenameTypeInGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :type, :group_type
  end
end
