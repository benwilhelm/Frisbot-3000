# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

##################
# DELETE OLD DATA

Player.delete_all           
User.delete_all
Game.delete_all
Rsvp.delete_all 
Comment.delete_all

##############
# SEED PLAYERS


ben = User.new
ben.fname = "Ben" 
ben.lname = "Wilhelm" 
ben.email = "benjamin.m.wilhelm@gmail.com" 
ben.confirmed_at = '2011-06-26 22:16:49' 
ben.password = 'mun81kie' 
ben.password_confirmation = 'mun81kie' 
ben.admin = 1
ben.save(false)


if RAILS_ENV != 'production'

  jen = User.new
  jen.fname = "Jen" 
  jen.lname = "Gadda" 
  jen.email = "jgadda@gmail.com" 
  jen.confirmed_at = '2011-06-26 22:16:49' 
  jen.password = 'mun81kie' 
  jen.password_confirmation = 'mun81kie' 
  jen.admin = 0
  jen.save(false)
 
  25.times {
  
    fname = RandSmartPass(3)
    lname = RandSmartPass(4)
    emailUser = RandSmartPass(5)
    emailDomain = RandSmartPass(8) + '.com'
    email = emailUser + '@' + emailDomain
    
    user = User.new
    user.fname = fname 
    user.lname = lname 
    user.email = email 
    user.password = 'password'
    user.confirmed_at = '2011-06-26 22:16:49'
    user.save(false)
  }           
                
  
  ############
  # SEED GAMES
  
  
  game1 = Game.new
  game1.game_time = 1.day.from_now 
  game1.polling_cutoff = 1.days.ago 
  game1.location = "Welles Park" 
  game1.address = "2400 W. Montrose Ave.<br>Chicago, IL, 60625" 
  game1.min_players = 6
  game1.save(false) 
  
  game2 = Game.new 
  game2.game_time = 21.days.from_now 
  game2.polling_cutoff = 20.days.from_now 
  game2.location = "Welles Park" 
  game2.address = "2400 W. Montrose Ave.<br>Chicago, IL, 60625" 
  game2.min_players = 6
  game2.save(false) 
  
  game3 = Game.new
  game3.game_time = 1.day.ago 
  game3.polling_cutoff = 2.days.ago 
  game3.location = "Winnemac Park" 
  game3.address = "5200 N. Damen Ave.<br>Chicago, IL, 60625" 
  game3.min_players = 6
  game3.save(false) 
  
  game4 = Game.new 
  game4.game_time = 14.days.from_now 
  game4.polling_cutoff = 13.days.from_now 
  game4.location = "Winnemac Park" 
  game4.address = "5200 N. Damen Ave.<br>Chicago, IL, 60625" 
  game4.min_players = 6
  game4.save(false) 
             
             
  ##############################
  # CREATE RSVPS AND COMMENTS
  
  Game.find(:all).each do |game| 
  
    User.find(:all).each do |user|
      auth_token = RandSmartPass(12)
      Rsvp.create(:game_id => game.id, :user_id => user.id, :auth_token => auth_token) 
    end
  
    rand_num = rand(2)
    num_players = 5+rand_num
    game.rsvps.find(:all,:order=>'rand()',:limit=>num_players).each do |rsvp|
      rsvp.resp = 'Y'
      rsvp.save() 
    end
    game.rsvps.find(:all,:order=>'rand()',:limit=>5,:offset=>num_players).each do |rsvp|
      rsvp.resp = 'N'
      rsvp.save()
    end
    
    comment_rand = rand(2)
    num_comments = 2 + comment_rand
    User.find(:all, :order=>'rand()', :limit => num_comments).each do |user|
      Comment.create(:user_id => user.id, :game_id => game.id, :comment_text => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    end
    
  end
end