class DropSchool < ActiveRecord::Migration[6.0]
  def change
    drop_table :schools
  end
end
