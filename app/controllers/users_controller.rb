# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :require_admin?, except: :stop_impersonating
  before_action :set_user, except: [:index, :list, :show, :impersonate, :stop_impersonating, :impressions]

  def index
    @q = User.ransack(params[:q])
    @q.sorts = ['username desc'] if @q.sorts.empty? # this is temporary default sort order
    @users = @q.result.includes(:courses).references(:employee, :courses)
  end

  # this enables customized lists of users on the index, allowing managers to only see their subordinates
  def list
    @q = User.ransack(params[:q])
    @q.sorts = ['username desc'] if @q.sorts.empty? # this is temporary default sort order
    @users = @q.result.includes(:courses).references(:employee, :courses)
    if params[:type] == 'team'
      @users = @users.where(id: current_user.subordinate_users)
    end
    render 'index'
  end

  def new
    @user = User.new
  end

  def show
    @goals = Goal.where(user_id: params[:id]).includes(:school, :credential, :user).eager_load(:courses).references(:employee, :school, :credential).order(active: :desc)
    @user = @goals.first&.user || User.references(:employee).find(params[:id])
  end

  def employee_info
    @employee = Employee.select(:full_name, :first_name, :last_name, :ldapid, :email).where(employee_id: @user.employee_id)
  end

  def impersonate
    user = User.find_by_username(params[:username])
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

  private

  def set_user
    @user = User.includes(goals: [:user, :school, :credential]).eager_load(:courses).references(:goals, :employee, :school, :credential).find(params[:id])
  end

end
