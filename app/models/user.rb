class User < ApplicationRecord
  after_create :build_user_profile 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :tweeets 
  has_one :user_profile, :dependent => :destroy    
  
  def build_user_profile
    UserProfile.create(user: self) 
  end
end
