# frozen_string_literal: true

Airbrake.configure do |config|
  config.host = 'https://errbit.uhapps.health.unm.edu'
  config.project_id = 1 # required, but any positive integer works
  config.project_key = '745e213824aed2019735c5387c540b9c'

  # Uncomment for Rails apps
  config.environment = Rails.env
  config.ignore_environments = %w(development test)
end
