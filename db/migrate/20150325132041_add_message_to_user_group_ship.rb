class AddMessageToUserGroupShip < ActiveRecord::Migration
  def change
    add_column :user_group_ships, :message, :text, before: :status
  end
end
