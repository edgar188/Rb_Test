source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise', '~> 4.8'
# Translations for the devise gem
gem 'devise-i18n'

# Kimurai is a modern web scraping framework written in Ruby.
gem 'kimurai'
gem 'chromedriver-helper'
gem 'selenium-webdriver', '< 4'

# Simple, efficient background processing for Ruby
gem 'sidekiq'
# Light weight job scheduling extension for Sidekiq that adds support for queueing jobs in a recurring way
gem 'sidekiq-scheduler', '~> 3.0', '>= 3.0.1'

# Haml-rails provides Haml generators for Rails 5. It also enables Haml as the templating engine 
gem "haml-rails", "~> 2.0"

# Make sure Bootstrap is installed, either as a Ruby gem or using CDN
gem 'devise-bootstrap-views', '~> 1.0'
# The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web.
gem 'bootstrap', '~> 5.1'

# AutoStripAttributes helps to remove unnecessary whitespaces from ActiveRecord or ActiveModel attributes.
gem "auto_strip_attributes", "~> 2.6"

# Used to load environment variables from .env into ENV
gem 'dotenv-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
