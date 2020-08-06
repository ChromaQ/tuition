require 'capybara/rails'
require 'capybara/rspec'
require 'webdrivers'
# require 'selenium-webdriver'
# Integration testing

# default selenium configuration
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.register_driver :selenium do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument("--window-size=1024,768")
#
#   Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
# end
# https://github.com/itmammoth/capybara-bootstrap/blob/master/scrape.rb
# run as headless mode with set window size
Capybara.register_driver :selenium_headless do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w(headless disable-gpu window-size=1280,800)
      },
    )
  )
end

Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  # config.default_driver        = :selenium # :selenium_chrome and :selenium_chrome_headless
  config.default_driver = :selenium_headless
end

# used for Integration Testing
# https://gitlab.com/gitlab-org/gitlab-ce/blob/master/spec/support/capybara.rb
RSpec.configure do |config|
  # capybara/rspec already calls Capybara.reset_sessions! in an `after` hook,
  # but `block_and_wait_for_requests_complete` is called before it so by
  # calling it explicitly here, we prevent any new requests from being fired
  config.after(:each, :js) do
    # Clear sessions to remove logged in user from Capybara webdriver session
    Capybara.reset_sessions!
    block_and_wait_for_requests_complete
  end
end
