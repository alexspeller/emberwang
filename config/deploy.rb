require 'bundler/capistrano'
load 'deploy/assets'


set :application, "emberwang"
set :user, "emberwang"
set :repository,  "https://github.com/alexspeller/emberwang"
set :deploy_strategy, :remote_cache
set :use_sudo, false
set :deploy_to, "/home/emberwang/railsapp"
set :git_enable_submodules, true
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "emberwang.alexspeller.com"                          # Your HTTP server, Apache/etc
role :app, "emberwang.alexspeller.com"                          # This may be the same as your `Web` server
role :db,  "emberwang.alexspeller.com", :primary => true # This is where Rails migrations will run

set :default_environment, {
  'PATH' => "/home/emberwang/.rbenv/shims:/home/youruser/.rbenv/bin:$PATH"
}

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
