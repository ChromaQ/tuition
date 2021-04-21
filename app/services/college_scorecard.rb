require 'json'
require 'rest-client'
$api_key = 'YNbhZ6k32uIfh1jAHUzcFfgmx450fNbVnbP9z0x0'

class CollegeScorecard
  def self.get_school(name)
    response = RestClient::Request.execute(method: :get, url: 'https://api.data.gov/ed/collegescorecard/v1/schools',
      headers: {params: {api_key: $api_key, fields: 'id,ope8_id,school.name,school.alias,school.city,school.state,school.operating,latest.student.size',
      'school.degrees_awarded.highest__not' => 0, 'school.name' => name }}, timeout: 30)
    return {}.freeze if response&.code != 200

    CollegeScorecard.parse_hash(JSON.parse(response&.body || {}))
  end

  def self.parse_hash(results)
    return {} if results.blank? or results['results'].blank?
    school_list = []
    results['results'][0].each do |school|
      # school_list << {name: school['school.name']}
      puts school.inspect
    end
  end

  def self.school_lookup(name)
    name = name&.strip
    return {} if name.blank?

    results = School.where("lower(name) LIKE '%#{name.downcase}%' OR lower(aka) LIKE '%#{name.downcase}%'")
    return results unless results.blank?

    CollegeScorecard.get_school(name)
  end
end
