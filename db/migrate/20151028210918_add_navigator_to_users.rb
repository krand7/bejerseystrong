class AddNavigatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :navigator, :boolean, default: false, null: false
    add_column :users, :navigator_interest, :boolean, default: false, null: false
    add_column :users, :graduation_year, :integer
  end
end
