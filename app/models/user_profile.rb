class UserProfile < ApplicationRecord
    belongs_to :user
    if ENV['RAILS_ENV'].to_s != 'production' 
        has_one_attached :image
    end    
    #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]    
end
