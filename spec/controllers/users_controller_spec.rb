require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'verify before actions' do
    it { is_expected.to use_before_action(:authenticate_user!) }
  end

  describe 'GET #index' do
    context 'as superuser' do
      it 'returns http success' do
        login_as_admin
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'as user' do
      it 'should redirect' do
        login_as_user
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'not logged in' do
      it 'should redirect' do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET #impressions' do
    context 'as superuser' do
      it 'should be a success' do
        login_as_admin
        get :impressions
        expect(response).to have_http_status(:success)
      end
    end

    context 'as user' do
      it 'should redirect' do
        login_as_user
        get :impressions
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
