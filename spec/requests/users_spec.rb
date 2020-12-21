require 'rails_helper'

RSpec.describe "Pages", type: :request do
  setup do
    @superuser = FactoryBot.create(:user, superuser: true)
    @user = FactoryBot.create(:user)
  end

  describe 'GET /users' do
    context 'as a user' do
      it 'should should redirect' do
        login_as @user
        get users_path
        expect(response).to redirect_to(root_path)
      end
    end

    context 'as a superuser' do
      it 'should work' do
        login_as @superuser
        get users_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  # verify access to impersonates_user_path
  describe 'POST impersonate_user_path' do
    context 'as a user' do
      it 'should redirect' do
        login_as @user
        post user_impersonation_path(params[:username])
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to match(/You do not have the required privileges in order to access this page.*/)
      end
    end

    context 'as a superuser' do
      it 'should succeed' do
        login_as @superuser
        post user_impersonation_path(params[:username])
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'POST stop_impersonating_path' do
    context 'as a superuser' do
      it 'should succeed' do
        login_as @superuser
        post user_impersonation_path(@user.username)
        expect(response).to have_http_status(:redirect)
        post stop_user_impersonation_path
        expect(response).to have_http_status(:redirect)
      end

      it 'should not work, but redirect' do
        login_as @superuser
        post stop_impersonating_user
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'as a user' do
      it 'should fail' do
        login_as @user
        post impersonate_user_path(@user)
        post stop_impersonating_users_path
        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to match(/You do not have the required privileges in order to access this page.*/)
      end
    end
  end
end
