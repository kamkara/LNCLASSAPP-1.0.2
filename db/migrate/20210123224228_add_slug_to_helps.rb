class AddSlugToHelps < ActiveRecord::Migration[6.0]
  def change
    add_column :helps, :slug, :string
  end
end
