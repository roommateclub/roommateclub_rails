class CreateRentCases < ActiveRecord::Migration
  def change
    create_table :rent_cases do |t|
      t.integer :apartment_id
      t.integer :landlord_id
      t.integer :price
      t.datetime :move_in_date
      t.text :discription

      t.timestamps null: false
    end
    add_index :rent_cases, :apartment_id
    add_index :rent_cases, :landlord_id
  end
end