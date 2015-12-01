class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :value
      t.string :content
      t.string :slug
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end

    add_index :answers, :question_id
  end
end
