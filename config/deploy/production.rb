set :staging, :production
set :branch, :master
set :rails_env, 'production'
set :workers, '*': 2
set :log_level, :debug

role :app, %w{deploy@kentaro.run}
role :web, %w{deploy@kentaro.run}
role :db, %w{deploy@kentaro.run}

set :ssh_options, {
  keys: %w(/home/vagrant/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}
