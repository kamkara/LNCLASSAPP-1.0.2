class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices, id: :uuid do |t|
      t.string :title
      t.text :content
      t.text :annonce1
      t.string :champ1
      t.string :champ2
      t.string :champ3
      t.string :annonce2
      t.string :champ4
      t.string :champ5
      t.string :champ6
      t.string :annonce3
      t.string :champ7
      t.string :champ8
      t.string :champ9
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :course, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
