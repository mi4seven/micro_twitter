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

  def who_to_follow(usr_id)
    #User.where.not(:id => usr_id).where.not(:id => Follower.where(:follower_id => usr_id).select(:user_id))

    User.where.not(:id => usr_id).where.not(:id => Follower.where(:follower_id => usr_id).select(:user_id)).where.not(:id => Follower.where(:user_id => usr_id).select(:follower_id))    
  end

end
