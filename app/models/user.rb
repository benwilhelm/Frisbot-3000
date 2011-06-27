class User < ActiveRecord::Base
  has_many :rsvps, :dependent => :destroy


  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :token_authenticatable, :recoverable, :rememberable, 
         :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :remember_me, :role
end
