# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'config'
gem 'devise'
gem 'devise-encryptable'
gem 'devise-security'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails', '~> 6.0.0'
gem 'sass-rails'
gem 'turbolinks'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webmock'
gem 'webpacker'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dawnscanner'
  gem 'equivalent-xml'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'rspec-json_expectations'
  gem 'rspec-rails', '4.0.0.beta4' # compatibility with rails 6
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
