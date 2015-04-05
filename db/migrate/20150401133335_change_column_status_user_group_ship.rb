class ChangeColumnStatusUserGroupShip < ActiveRecord::Migration
  def change
    rename_column :user_group_ships, :status, :state
    change_column :user_group_ships, :state, :string
  end
end
