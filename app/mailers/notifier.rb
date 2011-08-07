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
    @organizer = User.find(@game.organizer_id)
    @comment = Comment.where(:game_id => @game.id).first

    subject = "New Ultimate Game: " + @game.game_time.to_s(:game_time_long)

    mail :to => @player.email, :subject => subject
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_players.subject
  #
  def email_players(recipient, params)
    
    subject = params[:email_subject]
    @text = params[:email_text]
    @game = Game.find(params[:game_id])
    @sender = User.find(params[:sender_id])
    
    mail :to => recipient, :subject => subject
  end
end
