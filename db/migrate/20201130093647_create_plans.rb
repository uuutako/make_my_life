class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string      :title,        null: false
      t.text        :concept,      null: false
      t.text        :item,         null: false
      t.integer     :cost,         null: false
      t.text        :process,      null: false
      t.integer     :time,         null: false
      t.integer     :timezone_id,  null: false  
      t.integer     :category_id,  null: false  
      t.string      :place,        null: false 
      t.integer     :season_id,   null: false 
      t.references  :user,         foreign_key: true
      t.timestamps
    end
  end

end
