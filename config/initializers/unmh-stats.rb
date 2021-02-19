# frozen_string_literal: true

if defined?(Unmh::Stats)
  Unmh::Stats::configure do |config|
    config.api_host = '' # a valid URL to start_logger application
    config.api_key = '' # the specified applications api_key (each application will have a unique key to associate it's requests)
    config.ignore_envs = %i[development]  # Note: :test will always be ignored
      # config.ignore_paths =
      # meta is a hash of data you want to log with the application request, all meta need to have a key and most value types allowed in JSON are accepted as the atttributes value.
      # config.meta: { commit: '123aBc789FdE', tag: 'staging-Pharmacy', users: [1,2,3], page: 1 }
  end
end
