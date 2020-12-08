class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :user_id, null: false, index: true, foreign_key: { to_table: :users } 
      t.integer :follower_id, null: false, index: true, foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
