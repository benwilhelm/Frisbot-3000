class Notifier < ActionMailer::Base
  default :from => "Frisbot 3000 <games@frisbot3000.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.game_created.subject
  #
  def game_created(rsvp)
    @rsvp = rsvp
    @game = Game.find(rsvp.game_id)
    @player = User.find(rsvp.user_id)
    @comment = Comment.where(:game_id => @game.id, :limit => 1)

    subject = "New Ultimate Game: " + @game.game_time.to_s(:game_time_long)

    mail :to => @player.email, :subject => subject
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.game_updated.subject
  #
  def generic_email
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
