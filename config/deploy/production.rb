set :staging, :production
set :branch, :master

role :app, %w{deploy@kentaro.run}
role :web, %w{deploy@kentaro.run}
role :db, %w{deploy@kentaro.run}

set :ssh_options, {
  keys: %w(/home/vagrant/.ssh/id_rsa)
  forward_agent: false,
  auth_methods: %w(publickey)
}
