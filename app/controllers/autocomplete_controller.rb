class AutocompleteController < ApplicationController
  before_action :set_response_as_json, only: %i[schools]

  def schools
    query_str = params[:q]&.strip

    @results = (query_str.present? && query_str.to_s.length > 3) ? CollegeScorecard.school_lookup(query_str) : {}

    @results = @results.map { |result| [result[:id], result[:name]] } if @results.present?
    render json: @results.to_json
  end

  def create_school
    school_name = params[:school_name]

    @school = School.find_by(name: school_name)
    if @school.blank?
      school = CollegeScorecard.school_lookup(school_name)&.first
      @school = School.create!(unitid: school[:unitid], opeid: school[:opeid], name: school[:name],
                               city: school[:city], state: school[:state], operating: school[:operating],
                               aka: school[:aka]) unless school.blank?
    end
    render json: (@school || {}).to_json
  end
end
