class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :city_id
      t.integer :district_id
      t.integer :owner_id
      t.text :discription
      t.integer :personal_amount
      t.integer :public_room_amount
      t.integer :balcony_amount
      t.boolean :kitchen
      t.integer :type
      t.string :address_details
      t.float :area_size

      t.timestamps null: false
    end
    add_index :apartments, :city_id
    add_index :apartments, :district_id
    add_index :apartments, :owner_id
  end
end
