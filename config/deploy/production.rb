set :repository, "git@github.com:benwilhelm/Frisbot-3000.git"
set :branch, "release"

set :deploy_to, "/home/snoopy/public_html/#{application}"

role :web, "frisbot3000.com", :port => 22000
role :app, "frisbot3000.com", :port => 22000
role :db,  "frisbot3000.com", :port => 22000, :primary => true # This is where Rails migrations will run
