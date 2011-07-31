set :repository, "git@github.com:benwilhelm/Frisbot-3000.git"
set :branch, "master"

RAILS_ENV = 'staging'

set :deploy_to, "/home/snoopy/public_html/#{application}.staging"

role :web, "staging.frisbot3000.com", :port => 22000
role :app, "staging.frisbot3000.com", :port => 22000
role :db,  "staging.frisbot3000.com", :port => 22000, :primary => true # This is where Rails migrations will run
