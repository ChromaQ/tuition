require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tuitrem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Set the applications timezone
    config.time_zone = 'Mountain Time (US & Canada)'
    # Set the applications default config and generators
    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.stylesheets false
      g.integration_tool :rspec
      g.test_framework :rspec, fixture: false
    end

    # enable gzip asset compressing to reduce the page size
    config.middleware.use Rack::Deflater

    # Allows belongs_to associations to be set as optional by default [Disabled by default in Rails5.+]
    config.active_record.belongs_to_required_by_default = false

    config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
    config.action_mailer.delivery_method = :app_mail
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
