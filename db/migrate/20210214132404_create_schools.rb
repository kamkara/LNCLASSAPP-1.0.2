class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools, id: :uuid do |t|
      t.string :title
      t.string :content
      t.uuid :teacher_id
      t.references :citytown, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :slug

      t.timestamps
    end
  end
end
