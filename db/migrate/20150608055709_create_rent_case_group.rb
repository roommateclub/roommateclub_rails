class CreateRentCaseGroup < ActiveRecord::Migration
  def change
    create_table :rent_case_groups do |t|
      t.integer :rent_case_id
      t.integer :group_id
    end
    add_index :rent_case_groups, :rent_case_id
    add_index :rent_case_groups, :group_id
  end
end
