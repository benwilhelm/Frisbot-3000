class Player < ActiveRecord::Base
  default_scope :order => 'lname'
  has_many :rsvps, :dependent => :destroy
  
  validates :fname, :lname, :email, :role, :password, :presence => true
  validates :email, :uniqueness => true

end
