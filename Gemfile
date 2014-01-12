source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use pg as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :developmentng

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
	# Recommended by Heroku, see https://devcenter.heroku.com/articles/rails-integration-gems for more information.
	gem 'rails_12factor'
end

group :development, :test do
	# test suite
	gem "rspec-rails"

	# Mock stubbing/doubling
	gem "factory_girl_rails"

	# Guard allows us to keep an rspec server running while it watches files and
	# automatically runs tests as files change.
	gem "guard-spork"
  gem "guard-rspec"

  # Handles procfile .env file so that we can basically replicate the heroku
	# app.
	gem "foreman"

	# Generate fake data for tests
	gem "forgery"
end

# Easy integration for bootstrap. Makes upgrading as easy as updating the version number
gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'

# User authentication
gem 'devise'

# Authentication gems for allowing users to sign up/in with third party apps
# such as facebook and twitter.
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'twitter'
gem 'fb_graph'

# Used for decorating models so that presentation code is stored separately
# (not in model). 
gem 'draper', '~> 1.3'

# Simplify and make forms consistent
gem 'formtastic'
gem "formtastic-bootstrap"

# Use HAML instead of erb for cleaner view templates
gem "haml-rails"

# Makes it easy to add breadcrumbs
gem "breadcrumbs_on_rails"

# AngularJS
gem "angularjs-rails"

# Background processor. Will be used when an action triggers a process that
# is too time consuming for the user to wait with his browser window open.
gem 'delayed_job_active_record'

# File uploads
gem 'carrierwave'

# Used with carrierwave to allow fileuploads to s3
gem "fog", "~> 1.3.1"

# Process images (crop, resize, etc)
gem "rmagick", "2.13.2"

# Generate auth tokens for firebase/firepad
gem "firebase_token_generator"