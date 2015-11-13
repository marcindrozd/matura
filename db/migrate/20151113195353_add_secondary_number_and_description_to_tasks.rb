class AddSecondaryNumberAndDescriptionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :secondary_number, :integer
    add_column :tasks, :description, :string
  end
end
