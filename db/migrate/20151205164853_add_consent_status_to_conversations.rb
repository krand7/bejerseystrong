class AddConsentStatusToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :consented, :boolean, null: false, default: false
  end
end
