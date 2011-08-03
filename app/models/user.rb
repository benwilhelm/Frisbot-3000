class User < ActiveRecord::Base
  has_many :rsvps, :dependent => :destroy
  
  after_create :create_rsvps

  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :token_authenticatable, :recoverable, :rememberable, 
         :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :remember_me, :role
  
  def get_rsvp_response(game_id)
    rsvp = Rsvp.where(:game_id => game_id, :user_id=>self.id).first 
    if rsvp.resp == 'Y'
      ret = "Playing"
    elsif rsvp.resp == 'N'
      ret = "Not Playing"
    else
      ret = "Undecided"
    end
    
    ret
  end
  
  private
  
  def create_rsvps
    future_games = Game.all(:conditions => ["game_time > ?", Time.now])
    future_games.each do |game|
      Rsvp.create(:game_id => game.id, :user_id => self.id)
    end
  end
end
