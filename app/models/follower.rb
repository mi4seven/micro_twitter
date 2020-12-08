class Follower < ApplicationRecord
    belongs_to :user    
    belongs_to :follower_user, foreign_key: 'follower_id', class_name: 'User'    
end
