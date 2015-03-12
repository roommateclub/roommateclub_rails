class ChangeApartmentDistrictId < ActiveRecord::Migration
  def change
    rename_column :apartments, :district_id, :dist_id
  end
end
