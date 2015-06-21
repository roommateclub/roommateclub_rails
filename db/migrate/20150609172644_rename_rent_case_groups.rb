class RenameRentCaseGroups < ActiveRecord::Migration
  def change
    rename_table :rent_case_groups, :pins
  end
end
