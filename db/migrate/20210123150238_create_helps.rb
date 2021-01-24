class CreateHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :helps, id: :uuid do |t|
      t.string :title
      t.string :content
      t.string :author
      t.references :material, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
