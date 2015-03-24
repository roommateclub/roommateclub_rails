class RemoveGeolocationInfoInApartment < ActiveRecord::Migration
  def change
    remove_column :apartments, :city_id
    remove_column :apartments, :district_id
  end
end
