class AddSizeSchoolToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :size, :string
  end
end
