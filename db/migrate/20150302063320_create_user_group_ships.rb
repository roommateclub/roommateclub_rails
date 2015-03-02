class CreateUserGroupShips < ActiveRecord::Migration
  def change
    create_table :user_group_ships do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :status

      t.timestamps null: false
    end
    add_index :user_group_ships, :user_id
    add_index :user_group_ships, :group_id
  end
end
