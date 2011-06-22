class Player < ActiveRecord::Base
  default_scope :order => 'lname'
  has_many :rsvps, :dependent => :destroy
end
