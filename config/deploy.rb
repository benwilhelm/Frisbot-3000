set :application, "frisbot3000"
set :stages, %w(development staging production)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_via, :remote_cache
set :use_sudo, false
set :user, 'snoopy'
default_run_options[:pty] = true  # Must be set for the password prompt from git to work

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end