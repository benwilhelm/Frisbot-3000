class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_games

  def default_url_options
    if Rails.env.production?
      {:host => "frisbot3000.com"}
    elsif Rails.env.staging?
      {:host => "staging.frisbot3000.com"}
    elsif Rails.env.development?
      {:host => "localhost:3000"}
    end
  
  end

  protected 
  def get_games
    @games = Game.where("game_time >= :date", date: Time.now).all
  end  
  
end
