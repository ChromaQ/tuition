class UsersController < ApplicationController
  before_action :require_superuser?, except: :stop_impersonating
  before_action :set_user, except: [:index, :impersonate, :stop_impersonating]

  def index
    @q = User.includes(:employee).ransack(params[:q])
    @q.sorts = ['name_case_insensitive'] if @q.sorts.empty?
    @users = @q.result
    respond_to do |format|
      format.html
      format.json { render json: user_list(@users) }
    end
  end

  def new
    @user = User.new
  end

  def show
    @employee = Employee.find_by(employee_id: @user.employee_id)
    @manager = Employee.get_manager(@user.employee_id)
    @courses = Course.where(employee_id: @user.employee_id)
  end

  def employee_info
    @employee = Employee.select(:full_name, :first_name, :last_name, :ldapid, :email,  ).where(:employee_id => @user.employee_id)
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
    @user = User.find(params[:id])
  end
end
