# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @q = Course.ransack(params[:q])
    @q.sorts = ['updated_at desc'] if @q.sorts.empty? # default sort by most recently updated
    @courses = @q.result.includes(:user).references(:user)
    # @courses = Course.order(updated_at: :desc).includes(:user).references(:user)
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new(user_id: current_user.id, employee_id: current_user.employee_id, status: 'draft')
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Tuition reimbursement request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Tuition reimbursement request was successfully updated.'
    else
      render :edit
    end
  end

  # Submit to manager: status becomes "pending" - emails manager
  def submit
    @course = Course.find(params[:id])
    @course.pending!
    redirect_to @course, notice: 'Your application for tuition reimbursement has been emailed to your manager for review.'
  end



  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Tuition reimbursement request was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.includes(:user, :credential, :approvals, :proofs).references(:credential, :approvals, :user, :proofs).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:user_id, :employee_id, :credential_id, :start_date, :end_date, :course_title, :course_short, :credit_hours, :cost, :status)
  end
end
