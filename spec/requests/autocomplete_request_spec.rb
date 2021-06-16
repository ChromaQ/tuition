require 'rails_helper'

RSpec.describe "Autocompletes", type: :request do

  describe "GET /schools" do
    it "returns http success" do
      get "/autocomplete/schools"
      expect(response).to have_http_status(:success)
    end
  end

end
