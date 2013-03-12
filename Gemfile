source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

group :test, :development do
  gem "capistrano"
  gem "rvm-capistrano"
  gem 'rspec-rails'
  gem 'sqlite3', '1.3.6'
  gem 'factory_girl_rails'
  gem 'mailcatcher'
  gem 'debugger'
  gem 'selenium-webdriver', '2.30.0'
  gem "rvm-capistrano"
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'spork', '~> 1.0rc'
  gem 'database_cleaner'
  gem 'headless', :git => 'git://github.com/leonid-shevtsov/headless.git', :branch => 'wait-for-xvfb-to-launch'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '2.1.3' #Need for markitup jquery, any older then 1.8 breaks js on site

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'russian', '~> 0.6.0'
gem 'devise'
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'rbbcode', '0.1.11'
gem 'will_paginate', '~> 3.0'
gem "unicorn"
gem "therubyracer", :require => 'v8'
gem "cancan"
gem "paperclip"
gem 'tinymce-rails'
gem 'tinymce-rails-imageupload', '~> 3.5.6.3'
gem 'ruby-recaptcha'
gem "ckeditor", '3.7.3'

gem "nokogiri"
gem "htmlentities"

gem "friendly_id", "~> 4.0.1"
