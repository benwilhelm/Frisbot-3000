class Game < ActiveRecord::Base
  default_scope :order => 'game_time'
  has_many :rsvps, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :game_time, :location, :polling_cutoff, :min_players, :presence => true
  validates :min_players, :numericality => { :greater_than_or_equal_to => 2, :only_integer => true }
  validate :game_time_is_future
  validate :polling_cutoff_is_future
    
  def after_initialize
    # classify rsvps
    @yesses = self.rsvps.where("resp='Y'").order("updated_at DESC") ;
    @nos = self.rsvps.where("resp='N'").order("updated_at DESC") ;
    @undecideds = self.rsvps.where("resp IS NULL") ;
  
    # set game status messages
    if self.polling_cutoff
      if self.polling_cutoff.future? 
        if @yesses.count < self.min_players
          @needed = self.min_players - @yesses.count
          @game_status = "Waiting for " + @needed.to_s + " more."
        else
          @game_status = "Game Tentatively On"
        end
        @game_status_simple = "maybe"
        @polling_status = "Polling closes " + self.polling_cutoff.to_s(:cutoff_time) 
      else
        if @yesses.count < self.min_players
          @game_status = "No Game"
          @game_status_simple = "off"
          @polling_status = "Polling closed. See you next time."
        else
          @game_status = "Game On"
          @game_status_simple = "on"
          if self.location
            @polling_status = "See you at " + self.location + "!"
          else
            @polling_status = "See you on the field!"
          end
        end
      end
    end
  end




  def yesses
    @yesses
  end
  
  def nos
    @nos
  end
  
  def undecideds
    @undecideds
  end 
  
  def game_status
    @game_status
  end 
  
  def polling_status
    @polling_status
  end
  
  def game_status_simple
    @game_status_simple
  end
  
  private 
  def game_time_is_future
    self.errors.add(:game_time, "Game time must be in future") unless game_time.future?
  end

  def polling_cutoff_is_future
    self.errors.add(:polling_cutoff, "Polling Cutoff must be after now and prior to game time") unless polling_cutoff.future? && polling_cutoff < game_time
  end

end
