# frozen_string_literal: true

Airbrake.configure do |config|
  config.host = 'https://errbit.uhapps.health.unm.edu'
  config.project_id = 1 # required, but any positive integer works
  config.project_key = 'APIKEY_GOES_HERE'

  # Uncomment for Rails apps
  config.environment = Rails.env
  config.ignore_environments = %w(development test)
end