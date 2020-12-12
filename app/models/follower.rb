class Follower < ApplicationRecord
    belongs_to :user    
    belongs_to :follower_user, foreign_key: 'follower_id', class_name: 'User'
    
    def is_followed_by_me
        Follower.where(:user_id => self.follower_id, :follower_id => self.user_id).count > 0
    end    

end
