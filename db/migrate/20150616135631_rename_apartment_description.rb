class RenameApartmentDescription < ActiveRecord::Migration
  def change
    rename_column :apartments, :discription, :description
    rename_column :rent_cases, :discription, :description
    rename_column :share_cases, :discription, :description
    rename_column :groups, :discription, :description
    rename_column :tenant_groups, :discription, :description
  end
end
