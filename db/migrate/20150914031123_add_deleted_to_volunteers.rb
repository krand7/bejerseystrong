class AddDeletedToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :deleted, :boolean, null: false, default: false
  end
end
