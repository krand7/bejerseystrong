class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :state, default: 'pending'

      t.integer :user_id
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end

    add_index :conversations, :user_id
  end
end
