class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :email,              null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :zip_code

      t.timestamps null: false
    end
    add_index :volunteers, :email,                unique: true
  end
end
