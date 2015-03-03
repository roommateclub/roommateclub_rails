class AddDefaultValueToGroupUserShipStatus < ActiveRecord::Migration
  def change
    change_column :user_group_ships, :status, :integer, default: 0
  end
end
