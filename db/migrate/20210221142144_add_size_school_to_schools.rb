class AddSizeSchoolToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :size, :string
    add_column :users, :city_id, :uuid
  end
end
