class AddStatusToRentCases < ActiveRecord::Migration
  def change
    add_column :rent_cases, :state, :string
    add_column :rent_cases, :type, :string, limit: 25
  end
end
