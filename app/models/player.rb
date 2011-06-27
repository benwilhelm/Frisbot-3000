class Player < ActiveRecord::Base
  default_scope :order => 'lname'
  has_many :rsvps, :dependent => :destroy
  has_many :comments
  
  validates :fname, :lname, :email, :role, :password, :presence => true
  validates :email, :uniqueness => true

end
