class AddNameDiscriptionToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :name, :string
    add_column :groups, :discription, :text
  end
end
