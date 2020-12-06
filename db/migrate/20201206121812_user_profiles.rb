class UserProfiles < ActiveRecord::Migration[5.2]
  def change
      create_table :user_profiles do |t|    
      t.belongs_to :user, null: false, index: true, foreign_key: { to_table: :users } 
      t.string "name"
      t.string "username"
      t.string "image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false  
    end  
  end
end
