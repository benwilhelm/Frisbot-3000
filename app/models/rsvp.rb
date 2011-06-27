class Rsvp < ActiveRecord::Base
  belongs_to :player
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => [:game_id]
end
