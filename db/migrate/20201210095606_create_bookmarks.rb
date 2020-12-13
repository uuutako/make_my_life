class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true 
      t.references :plan, foreign_key: true

      t.timestamps
      t.index [:user_id, :plan_id], unique: true
    end
  end
end
