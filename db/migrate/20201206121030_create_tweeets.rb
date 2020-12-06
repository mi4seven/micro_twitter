class CreateTweeets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweeets do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: { to_table: :users }          
      t.text "tweeet"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false     
    end
  end
end
