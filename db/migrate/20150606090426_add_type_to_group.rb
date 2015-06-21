class AddTypeToGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :rent_case_id
    add_column :groups, :type, :string
  end
end
