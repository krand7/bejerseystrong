class AddContactInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :race, :string
    add_column :users, :familiar_communities, :text
  end
end
