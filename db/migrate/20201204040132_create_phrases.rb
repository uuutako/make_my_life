class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.string :phrase, null: false, default: 'black'
      t.string :name, default: 'nanashi'
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

