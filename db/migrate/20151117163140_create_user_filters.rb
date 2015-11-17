class CreateUserFilters < ActiveRecord::Migration
  def change
    create_table :user_filters do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.datetime :activated_at
      t.string :filter_key
      t.text :filter_hash

      t.timestamps
    end
  end
end
