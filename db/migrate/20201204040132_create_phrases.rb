class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.text :phrase, null: false
      t.string :name
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

