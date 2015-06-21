class MoveOrganizerIdToUserGroupShip < ActiveRecord::Migration
  def change
    remove_column :tenant_groups, :organizer_id
    remove_column :groups, :organizer_id
    add_column :user_group_ships, :is_organizer, :boolean
  end
end
