class RemoveTypeRentcase < ActiveRecord::Migration
  def change
    remove_column :rent_cases, :type
    rename_column :rent_cases, :owner_id, :user_id
  end
end
