# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

############
# SEED GAMES

Game.delete_all

game1 = Game.new
game1.game_time = 1.day.from_now 
game1.polling_cutoff = 1.days.ago 
game1.location = "Welles Park" 
game1.address = "2400 W. Montrose Ave.<br />Chicago, IL, 60625" 
game1.min_players = 6
game1.save(false) 

game2 = Game.new 
game2.game_time = 21.days.from_now 
game2.polling_cutoff = 20.days.from_now 
game2.location = "Welles Park" 
game2.address = "2400 W. Montrose Ave.<br />Chicago, IL, 60625" 
game2.min_players = 6
game2.save(false) 

game3 = Game.new
game3.game_time = 1.day.ago 
game3.polling_cutoff = 2.days.ago 
game3.location = "Winnemac Park" 
game3.address = "5200 N. Damen Ave.<br />Chicago, IL, 60625" 
game3.min_players = 6
game3.save(false) 

game4 = Game.new 
game4.game_time = 14.days.from_now 
game4.polling_cutoff = 13.days.from_now 
game4.location = "Winnemac Park" 
game4.address = "5200 N. Damen Ave.<br />Chicago, IL, 60625" 
game4.min_players = 6
game4.save(false) 
           
                    
##############
# SEED PLAYERS

Player.delete_all           

Player.create(
              :fname => "Ben" ,
              :lname => "Wilhelm" ,
              :email => "benjamin.m.wilhelm@gmail.com" ,
              :role => 'administrator' ,
              :password => 'password'
              )
              
#Player.create(
#              :fname => "Jen" ,
#              :lname => "Gadda" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Scotty" ,
#              :lname => "Iseri" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Lucas" ,
#              :lname => "Merino" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Sean" ,
#              :lname => "O'Brien" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Yoni" ,
#              :lname => "Pizer" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Adrian" ,
#              :lname => "Danzig" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )
#              
#Player.create(
#              :fname => "Tommy" ,
#              :lname => "Rapley" ,
#              :email => "email@email.com" ,
#              :role => 'player' ,
#              :password => 'password'
#              )

25.times {

  fname = RandSmartPass(3)
  lname = RandSmartPass(4)
  emailUser = RandSmartPass(5)
  emailDomain = RandSmartPass(8) + '.com'
  email = emailUser + '@' + emailDomain
  
  Player.create(
                :fname => fname ,
                :lname => lname ,
                :email => email ,
                :role => 'player' ,
                :password => 'password'
                )
}           


Rsvp.delete_all 

Game.find(:all).each do |game| 
  Player.find(:all,:order=>'lname',:limit=>7).each do |player|
    Rsvp.create(
                :game => game ,
                :player => player ,
                :resp => 'yes' ,
                :auth_token => 'erlkjslkje' 
                )
  end
  Player.find(:all,:order=>'lname',:limit=>5,:offset=>7).each do |player|
    Rsvp.create(
                :game => game ,
                :player => player ,
                :resp => 'no' ,
                :auth_token => 'erlkjslkje' 
                )
  end
end
              