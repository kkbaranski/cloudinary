# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'devise-encryptable'
gem 'devise-security'
gem 'jbuilder'
gem 'mysql2'
gem 'puma'
gem 'rails', '~> 6.0.0'
gem 'sass-rails'
gem 'turbolinks'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dawnscanner'
  gem 'equivalent-xml'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rack-cors'
  gem 'rails-erd'
  gem 'rspec-json_expectations'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier-guard', require: false
end
