class CreateVolunteerResources < ActiveRecord::Migration
  def change
    create_table :volunteer_resources do |t|
      t.string :file
      t.string :title
      t.text :description
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end
  end
end
