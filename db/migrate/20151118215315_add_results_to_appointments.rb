class AddResultsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :conversation_count, :integer
    add_column :appointments, :contact_card_count, :integer
    add_column :appointments, :referral_count, :integer
    add_column :appointments, :followup_call_count, :integer
  end
end
