require 'factory_bot'

# generate test data using FactoryBot
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
