lock '3.4.0'

set :application, "roommateclub"

set :scm, :git
set :repo_url,  "git@github.com:roommateclub/roommateclub_rails.git"


# set :ssh_options, {
#   forward_agent: true,
#   port: 3456
# }

set :log_level, :info

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle}

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

set :keep_releases, 20

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :finishing, "deploy:cleanup"

end
