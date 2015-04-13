# -*- encoding : utf-8 -*-
require 'rvm-capistrano'
default_environment["PATH"] = "/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin"

set :application, "roommateclub"
set :repository,  "git@github.com:roommateclub/roommateclub_rails.git"
set :deploy_to, "/home/apps/roommateclub_staging"

set :branch, "master"
set :scm, :git

set :user, "apps"
set :group, "apps"

set :deploy_to, "/home/apps/#{application}"
set :runner, "apps"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

set :use_sudo, false
set :rvm_ruby_string, '2.2.0'

role :web, "roommateclub.co"                          # Your HTTP server, Apache/etc
role :app, "roommateclub.co"                         # This may be the same as your `Web` server
role :db,  "roommateclub.co"   , :primary => true # This is where Rails migrations will run

set :deploy_env, "production"
set :rails_env, "production"
set :scm_verbose, true
set :use_sudo, false


namespace :deploy do

  desc "Restart passenger process"
  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


namespace :my_tasks do
  task :symlink, :roles => [:web] do
    run "mkdir -p #{deploy_to}/shared/log"
    run "mkdir -p #{deploy_to}/shared/pids"

    symlink_hash = {
      "#{shared_path}/config/database.yml"   => "#{release_path}/config/database.yml",
    }

    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
  end

end



namespace :remote_rake do
  desc "Run a task on remote servers, ex: cap staging rake:invoke task=cache:clear"
  task :invoke do
    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end

after "deploy:finalize_update", "my_tasks:symlink"