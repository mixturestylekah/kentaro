source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Ruby on rails
gem 'rails', '5.1.0'

# Authorization
gem 'devise', git: 'https://github.com/gogovan/devise.git', branch: 'rails-5.1'
gem 'erubis'

# Asset
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

# Model
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

# Background work
gem 'sidekiq'
gem 'sinatra', require: false

# View
gem 'react-rails'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'slim-rails'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'

# Search
gem 'elasticsearch-rails'
gem 'elasticsearch-model'

gem 'mysql2', '>= 0.3.18', '< 0.5'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
