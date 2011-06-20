class Game < ActiveRecord::Base

  validates :game_time, :location, :polling_cutoff, :min_players, :presence => true
  validates :game_time, :date => { :after => Time.now }
  validates :polling_cutoff, :date => { :after => Time.now, :before => :game_time }
  validates :min_players, :numericality => { :greater_than_or_equal_to => 2, :only_integer => true }

end
