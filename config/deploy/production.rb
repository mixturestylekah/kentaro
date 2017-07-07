set :staging, :production
set :branch, :master

role :app, %w{deploy@kentaro.run}
role :web, %w{deploy@kentaro.run}
role :db, %w{deploy@kentaro.run}
