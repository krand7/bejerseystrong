class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :slug
      t.integer :campus_captain_id
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end
