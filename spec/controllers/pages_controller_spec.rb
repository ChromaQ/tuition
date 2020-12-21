require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'verify before actions' do
    it { should use_before_action(:authenticate_user!) }
  end

  describe 'GET #welcome' do
    context 'logged in' do
      it 'returns http success' do
        login_as_user
        get :welcome
        expect(response).to have_http_status(:success)
      end
    end

    context 'not logged in' do
      it 'redirects to login' do
        get :welcome
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
