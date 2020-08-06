require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe 'GET /' do
    context 'logged in' do
      it 'should work' do
        login_as FactoryBot.create(:user)
        get root_path
        expect(response).to have_http_status(200)
      end
    end

    context 'not logged in' do
      it 'should redirect' do
        get root_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
