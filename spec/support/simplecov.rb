if ENV['RAILS_ENV'] == 'test'
  # Used to generate a test coverage report
  require 'simplecov'
  SimpleCov.start 'rails'
end
