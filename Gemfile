source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.6.2'
gem 'carrierwave', '~> 2.2.6'
# gem 'cloudinary'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dropzonejs-rails'
gem 'mini_magick'
gem 'fog-aws', '~> 3.9'
gem 'figaro'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'meta-tags'
gem 'omniauth', '~> 1.6'
gem 'omniauth-twitter'
gem 'puma', '~> 3.7'
gem 'rails', '~> 6.1.7.8'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'toastr-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '~> 4.2.0'
gem 'will_paginate_bootstrp'
gem 'squasher'
gem 'emoji'
gem 'gemoji'
gem 'redis'
gem 'nokogiri', '~> 1.16.6'
gem 'globalid'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # gem 'sqlite3'
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '3.9.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
