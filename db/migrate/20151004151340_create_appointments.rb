class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :completed, default: false, null: false
      t.boolean :deleted, default: false, null: false
      t.integer :created_by_id
      t.integer :user_id
      t.string :location
      t.string :address_line_one
      t.string :address_line_two
      t.string :zipcode
      t.string :city
      t.text :results

      t.timestamps null: false
    end

    add_index :appointments, :user_id
    add_index :appointments, :created_by_id
  end
end
