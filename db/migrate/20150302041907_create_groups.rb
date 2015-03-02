class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :rent_case_id
      t.integer :organizer_id
      t.integer :group_size

      t.timestamps null: false
    end
    add_index :groups, :rent_case_id
    add_index :groups, :organizer_id
  end
end
