class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.string :display_type
      t.string :slug
      t.boolean :other_option, null: false, default: false
      t.boolean :optional, null: false, default: false
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end
  end
end
