class CreateTenantGroups < ActiveRecord::Migration
  def change
    create_table :tenant_groups do |t|
      t.string :title
      t.integer :organizer_id
      t.integer :share_case_id
      t.integer :group_size
      t.text :discription
      t.string :workflow_state

      t.timestamps null: false
    end
    add_index :tenant_groups, :organizer_id
    add_index :tenant_groups, :share_case_id
  end
end
