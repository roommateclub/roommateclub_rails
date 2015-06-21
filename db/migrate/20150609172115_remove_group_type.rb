class RemoveGroupType < ActiveRecord::Migration
  def change
    remove_column :groups, :type
    rename_column :groups, :state, :workflow_state
  end
end
