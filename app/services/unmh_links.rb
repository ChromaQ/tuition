# frozen_string_literal: true

require 'json'
require 'rest-client'

class UnmhLinks
  def self.get_nav_items(id=10013)
    response = RestClient::Request.execute(method: :get,
                                            url: "https://links.uhapps.health.unm.edu/api/v1/navlists/#{id}.json",
                                            timeout: 30)
    Rails.logger.info 'Loading Navigation Links from Links app'
    return [].freeze if response&.code != 200

    return JSON.parse(response&.body)

  end
end
