class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_games

  protected 
  def get_games
    @games = Game.where("game_time >= :date", date: Time.now).all
  end  
  
end
