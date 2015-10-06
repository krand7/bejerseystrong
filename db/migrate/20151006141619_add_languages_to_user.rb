class AddLanguagesToUser < ActiveRecord::Migration
  def change
    add_column :users, :language_one, :string
    add_column :users, :language_two, :string
    add_column :users, :language_three, :string
  end
end
