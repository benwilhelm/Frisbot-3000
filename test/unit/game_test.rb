require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "game attributes must not be empty" do
    game = Game.new
    assert game.invalid?
    assert game.errors[:game_time].any?
    assert game.errors[:polling_cutoff].any?
    assert game.errors[:location].any?
    assert game.errors[:min_players].any?
  end
  
  test "game time must be after now" do 
    game = Game.new(:location => "Winnemac Park" ,
                    :min_players => 6 ,
                    :polling_cutoff => "2011-07-19 23:00"
                    )

    @game_time = Time.now - 1.day
    game.game_time = @game_time.strftime("%Y-%m-%d %H:%M")
    assert game.invalid?
    assert_equal "must be after " + Time.now.strftime("%Y-%m-%d %H:%M"), game.errors[:game_time].join('; ') ;
    
    @game_time = Time.now + 5.days
    game.game_time = @game_time.strftime("%Y-%m-%d %H:%M")
    assert game.valid?
    
  end

end
