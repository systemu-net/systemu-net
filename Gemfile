# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.6.2'
gem 'carrierwave', '~> 3.0.7'
# gem 'cloudinary'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dropzonejs-rails'
gem 'emoji'
gem 'figaro'
gem 'fog-aws', '~> 3.9'
gem 'gemoji'
gem 'globalid'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'meta-tags'
gem 'mini_magick'
gem 'nokogiri', '~> 1.16.6'
gem 'omniauth', '~> 1.6'
gem 'omniauth-twitter'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 7.2.1'
gem 'redis'
gem 'sprockets-rails'
gem 'squasher'
gem 'toastr-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '~> 4.2.0'
gem 'will_paginate_bootstrp'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # gem 'sqlite3'
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '3.9.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rubocop', '~> 1.64'

gem 'dartsass-rails', '~> 0.5.1'
