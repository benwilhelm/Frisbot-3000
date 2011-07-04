require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "game_created" do
    @rsvp = rsvps(:one)
    @game = games(:one)
    @user = User.find(@rsvp.user_id)
    
    mail = Notifier.game_created(@rsvp)
    assert_equal "New Ultimate Game: " + @game.game_time.to_s(:game_time_long), mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["games@frisbot3000.com"], mail.from
    
    yes_url = "http://localhost:3000/rsvps/" + @rsvp.id.to_s + "/respond/Y/" + @rsvp.auth_token
    no_url = "http://localhost:3000/rsvps/" + @rsvp.id.to_s + "/respond/N/" + @rsvp.auth_token
    assert_match yes_url, mail.body.encoded
    assert_match no_url, mail.body.encoded
  end

end
