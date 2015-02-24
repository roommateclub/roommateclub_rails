class AddStatusToRentCases < ActiveRecord::Migration
  def change
    add_column :rent_cases, :state, :string
  end
end
