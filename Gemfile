source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
git_source(:unmh){ |repo| "git@git.health.unm.edu:devgroup/#{repo}.git" }

# ruby '2.7.1'

gem 'rails', "~> 5.2.4.3"
gem 'puma', '~> 4.3'         # Use Puma as the app server

##############################
### ActiveStorage
##############################
# Used to allow ActiveStorage to store uploads as database blobs
gem 'activestorage-database-service', github: 'TitovDigital/activestorage-database-service'
gem 'image_processing' # Preview PDF files in browser window


##############################
### Database
##############################
group :development, :production, :staging do
  gem 'activerecord-oracle_enhanced-adapter'
  gem 'ruby-oci8', require: 'oci8' # only for CRuby users
end
group :development, :production, :staging do
  gem 'activerecord-sqlserver-adapter'
end
gem 'sqlite3', '~> 1.3.13'
gem 'rails-erd', group: :development # Generate an application ERD
gem 'ransack', github: 'activerecord-hackery/ransack'



##############################
### Deployment
##############################
# Multidb branch is to be used with applications that need to connect to Oracle and SQLserver
# => This should be mainly used for data and application migration purposes.
# => Once the applications have been converted you should switch the branches to SQLserver,
# => in order to deploy the applications with smaller container sizes.

gem 'unmh-docker', '~> 0.8', unmh: 'unmh-docker', branch: 'ruby2.7_multidb'


##############################
### Assets
##############################
gem 'autoprefixer-rails'        # add vendor prefixes to particular css properties
gem 'coffee-rails', "~> 4.2"     # Use CoffeeScript for .coffee assets and views
gem 'bootstrap', '~> 4.5.3'
# gem 'font-awesome-rails' # for supporting fontawesome 4
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'mini_racer', platforms: :ruby # C based alternative instead of rubyracer
gem 'sassc-rails'               # Libsass for rails pipeline (fast sass-rails replacement)
gem 'sprockets', '3.7.2'
# gem 'sass-rails'
gem 'turbolinks', "~> 5"        # turbolinks for browsing your application faster
gem 'uglifier', ">= 1.3.0"      # Use Uglifier as compressor for JavaScript assets


##############################
# Authorization, Authentication [Roles], and LDAP
##############################
gem 'pundit'               # user authorization (roles and permissions)
gem 'pretender'                 # allows superusers to emulate being another user
gem 'unmh-auth', unmh: 'unmh-auth_gem', branch: 'devise_cas' # user authentication, using devise and UNMH-cas
# gem 'net-ldap', '~> 0.16.1'   # For accessing the ldap server, in order to manually add or search users
# gem 'wddx', unmh: 'wddx'  # Used for accessing user permissions in the perms table

##############################
# Misc
##############################
gem 'jbuilder', '~> 2.5'        # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'meta-tags'                 #  Used for adding dynamic titles when switching between pages.
gem 'unmh-ldap', unmh: 'unmh-ldap'  # An ldap helper gem, used for searching UNMH/LDAP by users, groups, etc.

##############################
### Performance Optimizations
##############################
gem 'attendance', github: 'schneems/attendance' # Speed up for ActiveRecord#present? (removes additional query requests)
gem 'bootsnap', require: false                  # Reduces boot times through caching
gem 'fast_blank', platform: :mri                # fast implementation of .blank?

##############################
### Security/Logging
##############################
gem 'airbrake', '~> 5.0'        # For errbit exception logging
gem 'lograge'                   # For cleaning up your application logs
gem 'logstop'                   # Keep personally identifiable information (PII) out of your application logs

##############################
### Development/Testing gems
##############################
group :development, :test do
  gem 'amazing_print', require:'ap'
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'       # For building objects associated with your models
  gem 'faker'                   # for generating sample data
  # gem 'forgery'               # github: 'sevenwire/forgery' # Generate fake user data (similar to faker)
  gem 'pry-rails'               # pry console output
  gem 'rails_best_practices'    # for testing for rails best practice methods
  gem 'rubocop', require: false # github: 'rubocop-hq/rubocop'
  gem 'rubocop-performance', require: false     # github: 'rubocop-hq/rubocop-performance'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  # --- Linters / Asset testing
  gem 'erb_lint', github: 'Shopify/erb-lint', require: false

  gem 'scss_lint', require: false
end

group :development do
  gem 'annotate'
  gem 'better_errors'           # dev: better error messages
  gem 'binding_of_caller'
  # gem 'bullet'
  gem 'listen', ">= 3.0.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'        # n+1 database test monitoring
  # gem 'formulaic'             # Simplify form filling with Capybara
  gem 'cucumber-rails', require: false
  gem 'fuubar'
  # gem 'parallel_tests'        # needs to be ran against a database other than sqlite3
  gem 'rspec-rails', '~> 3.8'
  gem 'rails-controller-testing' # , github: 'rails/rails-controller-testing'
  gem 'simplecov'               # generate html report on the applications test results
  gem 'shoulda'                 # Write easy to understand and maintainable tests

  ##############################
  ### integration testing
  ##############################
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
