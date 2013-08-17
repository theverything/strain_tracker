source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'jquery-rails'
gem 'pg'
gem 'active_model_serializers'
gem 'httparty'
gem 'omniauth-facebook'
gem 'fuzzily'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

group :production do
  gem 'unicorn'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.13'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-doc'
  gem 'figaro'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl', '2.6.4'
  gem 'launchy'
  gem 'simplecov', :require => false
  gem 'email_spec'
end
