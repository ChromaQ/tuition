class UsersController < ApplicationController
  before_action :require_superuser?, except: :stop_impersonating

  def index
    @users = User.order(:displayname)
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    # Log when a superuser is impersonating any other user
    # => This can be used as a audit-log in case an incident happens while logged in as another user
    Impression.create(user: true_user, target: current_user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end

  def impressions
    @impressions = Impression.get_list
  end
end
