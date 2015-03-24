class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :district_id
      t.integer :apartment_id
      t.string :street
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_index :addresses, :district_id
    add_index :addresses, :apartment_id
  end
end
