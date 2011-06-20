class Game < ActiveRecord::Base

  validates :game_time, :location, :polling_cutoff, :min_players, :presence => true
  validates :min_players, :numericality => { :greater_than_or_equal_to => 2, :only_integer => true }
  validate :game_time_is_future
  validate :polling_cutoff_is_future
  
  private 
  
  def game_time_is_future
    self.errors.add(:game_time, "Game time must be in future") unless game_time.future?
  end

  def polling_cutoff_is_future
    self.errors.add(:polling_cutoff, "Polling Cutoff must be after now and prior to game time") unless polling_cutoff.future? && polling_cutoff < game_time
  end

end
