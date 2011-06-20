# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Game.delete_all

Game.create(
            :game_time => DateTime.parse("2011-06-25 10:00") ,
            :polling_cutoff => DateTime.parse("2011-06-24 23:00") ,
            :location => "Welles Park, Montrose and Western, Chicago" ,
            :min_players => 6
           )

Game.create(
            :game_time => DateTime.parse("2011-07-02 10:00") ,
            :polling_cutoff => DateTime.parse("2011-07-01 23:00") ,
            :location => "Winnemac Park, Damen and Foster, Chicago" ,
            :min_players => 6
           )           
           

# Player.create(
#               :fname => "Ben" ,
#               :lname => "Wilhelm" ,
#               :email => "benjamin.m.wilhelm@gmail.com" ,
#               :role => 'administrator' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Jen" ,
#               :lname => "Gadda" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Scotty" ,
#               :lname => "Iseri" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Lucas" ,
#               :lname => "Merino" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Sean" ,
#               :lname => "O'Brien" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Yoni" ,
#               :lname => "Pizer" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Adrian" ,
#               :lname => "Danzig" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
# Player.create(
#               :fname => "Tommy" ,
#               :lname => "Rapley" ,
#               :email => "email@email.com" ,
#               :role => 'player' ,
#               :password => 'password'
#               )
#               
              