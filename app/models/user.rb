class User < ApplicationRecord
  after_create :build_user_profile 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one :user_profile, :dependent => :destroy 
  has_many :tweeets, :dependent => :destroy

  has_many :followers
  has_many :followings, foreign_key: 'follower_id', class_name: 'Follower'

  def who_to_follow
    User.where.not(:id => 1).where.not(:id => Follower.where(:follower_id => 1).select(:user_id))
  end

end
