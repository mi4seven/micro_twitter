class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :username      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.timestamps
    end
    add_index :user_profiles, :user
  end
end
