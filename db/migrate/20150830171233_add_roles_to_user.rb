class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :leadership, :boolean, default: false, null: false
    add_column :users, :campus_captain, :boolean, default: false, null: false
  end
end
