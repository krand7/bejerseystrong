class AddEnrollmentCountToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :confirmed_enrollment_count, :integer
  end
end
