require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "game_created" do
    mail = Notifier.game_created
    assert_equal "Game created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "game_updated" do
    mail = Notifier.game_updated
    assert_equal "Game updated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
