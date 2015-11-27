class AddSchoolIdToUser < ActiveRecord::Migration
  def change
    rename_column :users, :school, :old_school
    add_column :users, :school_id, :integer
  end
end
