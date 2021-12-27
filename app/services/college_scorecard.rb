# frozen_string_literal: true

require 'json'
require 'rest-client'

class CollegeScorecard
  def self.get_school(name)
    response = RestClient::Request.execute(method: :get,
                                           url: 'https://api.data.gov/ed/collegescorecard/v1/schools',
                                           headers: { params: { api_key: Rails.application.credentials[:api_key],
                                                                fields: 'id,ope8_id,school.name,school.alias,school.city,school.state,school.operating,latest.student.size',
                                                                'school.degrees_awarded.highest__not' => 0, 'school.name' => name, 'sort' => 'student.size:desc' } },
                                           timeout: 30)
    return [].freeze if response&.code != 200

    CollegeScorecard.parse_hash(JSON.parse(response&.body || {}))
  rescue
    # if the get API request errors out or times out, we want to return an email result
    []
  end

  def self.parse_hash(results)
    return [].freeze if results.blank? || results.dig('results', 0).blank?

    school_list = []
    results['results'].each do |school|
      school_list << {
        id: nil,
        unitid: school['id'],
        opeid: school['ope8_id'],
        name: school['school.name'],
        city: school['school.city'],
        state: school['school.state'],
        operating: school['school.operating'],
        aka: school['school.alias']
      }.freeze
    end
    school_list.presence || []
  end

  def self.school_lookup(name)
    name = name&.strip
    return [].freeze if name.blank?

    # Check our database to see if the school exists
    results = School.where('lower(name) LIKE :school OR lower(aka) LIKE :school', school: "%#{name.downcase}%")
    results = results.as_json(only: %i[id aka city name opeid operating state unitid]).map(&:symbolize_keys)

    # grab similar results from the the College ScoreCard API
    api_schools = CollegeScorecard.get_school(name)

    # Used to join the results from the API and the DB and ensure there's not duplicate results between the two
    # with uniq we need to map them as `s[:unitid]` instead of `uniq(&:unitid)` because the schools are nested hashes in the array
    combined_results = results&.union(api_schools).uniq { |s| s[:unitid] }
    ap combined_results
    combined_results
  end
end
