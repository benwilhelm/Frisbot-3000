class Rsvp < ActiveRecord::Base
  before_create :generate_auth_token
  belongs_to :player
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => [:game_id]
  
  
  
  private 
  
  def generate_auth_token
    my_auth_token = RandSmartPass(12)
    self.auth_token = my_auth_token unless self.auth_token
  end
  
end
