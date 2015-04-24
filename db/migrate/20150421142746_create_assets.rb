class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :viewable_id
      t.string :viewable_type
      t.string :file
      t.string :type
      t.integer :position

      t.timestamps null: false
    end
    add_index :assets, :viewable_id
  end
end
