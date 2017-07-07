# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "kentaro"
set :repo_url, "git@github.com:mixturestylekah/kentaro.git"
set :deploy_to, "/var/www/${fetch(:application)}"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
