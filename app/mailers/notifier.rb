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
    @organizer = User.find(@game.organizer)
    @comment = Comment.where(:game_id => @game.id).first

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
    @text = "This is a test of the generic_email function of the Notifier Mailer."
    mail :to => "benjamin.m.wilhelm@gmail.com"
  end
end
