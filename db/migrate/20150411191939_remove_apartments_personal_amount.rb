class RemoveApartmentsPersonalAmount < ActiveRecord::Migration
  def change
    remove_column :apartments, :personal_amount
  end
end
