class User < ApplicationRecord
  after_create :build_user_profile 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one :user_profile, :dependent => :destroy 
  has_many :tweeets

  has_many :followers
  has_many :followings, foreign_key: 'follower_id', class_name: 'Follower'

  # def build_user_profile
  #   UserProfile.create(user: self) 
  # end


end
