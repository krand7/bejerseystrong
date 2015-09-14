class AddDeletedToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :deleted, :boolean
  end
end
