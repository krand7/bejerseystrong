class AddNotesAndCoverageToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :notes, :text
    add_column :conversations, :current_coverage, :string
  end
end
