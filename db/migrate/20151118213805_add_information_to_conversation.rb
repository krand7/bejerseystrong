class AddInformationToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :address, :string
    add_column :conversations, :city, :string
    add_column :conversations, :zip_code, :string
  end
end
