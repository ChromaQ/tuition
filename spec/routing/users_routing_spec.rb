require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  setup do
    @user = FactoryBot.create(:user)
  end

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #impersonate' do
      expect(post: '/users/impersonation').to route_to('users#impersonate')
    end

    it 'routes to #stop_impersonating' do
      expect(post: '/users/stop_impersonating').to route_to('users#stop_impersonating')
    end

    it 'routes to #impressions' do
      expect(get: '/impressions').to route_to('users#impressions')
    end
  end
end
