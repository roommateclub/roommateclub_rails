class CreateShareCases < ActiveRecord::Migration
  def change
    create_table :share_cases do |t|
      t.integer :apartment_id
      t.integer :user_id
      t.integer :price
      t.datetime :move_in_date
      t.text :discription

      t.timestamps null: false
    end
    add_index :share_cases, :apartment_id
    add_index :share_cases, :user_id
  end
end
