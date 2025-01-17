require "bundler/capistrano"
require "rvm/capistrano"

server "162.243.230.19", :web, :app, :db, :primary => true

set :application, "experimental-center"
set :user, "ding"
set :port, 22
set :use_sudo,false 
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :rvm_type, :system

set :repository,  "git@github.com:dinglixiang/experimental-center.git"
set :scm, :git
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
 
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, :roles => :app, except: {no_release: true} do
      sudo "/etc/init.d/unicorn_#{application} #{command}"
    end
  end
 
  desc "things I need to do after deploy:setup"
  task :setup_config, :roles => :app do
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/mongoid.example.yml"), "#{shared_path}/config/mongoid.yml"
    puts "Now edit the config files in #{shared_path}. create db"
  end
  after "deploy:setup", "deploy:setup_config"
 
  task :symlink_config, :roles => :app do
    run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
 
  #desc 'copy ckeditor nondigest assets'
  #task :copy_nondigest_assets, roles: :app do
      #run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} ckeditor:create_nondigest_assets"
  #end
  #after 'deploy:assets:precompile', 'copy_nondigest_assets'

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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
