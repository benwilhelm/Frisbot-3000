require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "game time must be after now" do 
    game = Game.new(:location => "Winnemac Park" ,
                    :min_players => 6 ,
                    :polling_cutoff => 1.day.from_now
                    )

    game.game_time = 1.day.ago
    game.invalid?
    assert_present game.errors[:game_time]
    
    game.game_time = 5.days.from_now 
    assert game.valid?
    
  end
  
  test "polling cutoff must be after now and prior to game time" do 
    game = Game.new(
                    :location => "Winnemac Park" ,
                    :min_players => 6 ,
                    :game_time => 5.days.from_now
                    )

    game.polling_cutoff = 6.days.from_now
    game.invalid?
    assert_present game.errors[:polling_cutoff]
    
    game.polling_cutoff = 1.day.ago
    game.invalid?
    assert_present game.errors[:polling_cutoff]
    
    game.polling_cutoff = 4.days.from_now
    assert game.valid?
    
  end

end
