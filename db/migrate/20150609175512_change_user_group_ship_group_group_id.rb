class ChangeUserGroupShipGroupGroupId < ActiveRecord::Migration
  def change
    add_column :user_group_ships, :groupable_type, :string
    rename_column :user_group_ships, :group_id, :groupable_id
  end
end
