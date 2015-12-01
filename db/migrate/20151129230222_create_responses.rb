class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :conversation_id
      t.string :value
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end

    add_index :responses, [:question_id, :conversation_id]
  end
end
