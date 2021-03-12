# frozen_string_literal: true

class UsersController < ApplicationController
  # need to tweak to allow HR access -- before_action :require_superuser?, except: :stop_impersonating
  before_action :set_user, except: [:index, :impersonate, :stop_impersonating]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.includes(:courses).references(:employee, :courses)
  end

  def new
    @user = User.new
  end

  def show
    @manager = Employee.find_by(employee_id: @user.employee.manager_id)
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
    @user = User.includes(:courses).references(:employee, :courses).find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end
