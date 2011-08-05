class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_games, :body_class

  protected 
  def get_games
    @games = Game.where("game_time >= :date", date: Time.now).all
  end  
  
  def body_class
    ctrlr = params[:controller].gsub(/\//,"_")
    @body_classes = ctrlr + ' '
    @body_classes += ctrlr + '_' + params[:action] + ' '
  end
  
end
