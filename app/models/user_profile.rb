class UserProfile < ApplicationRecord
    belongs_to :user
    #has_one_attached :image
    #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]    
end
