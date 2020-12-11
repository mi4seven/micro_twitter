class Follower < ApplicationRecord
    belongs_to :user    
    belongs_to :follower_user, foreign_key: 'follower_id', class_name: 'User'
    
    
    def is_folloded_by_curr_user
        return (Follower.where(["user_id = ? AND follower_id = ?", self.follower_id, self.user_id]).count) > 0
    end

end
