class Rsvp < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  
  validates_uniqueness_of :player_id, :scope => [:game_id]
end
