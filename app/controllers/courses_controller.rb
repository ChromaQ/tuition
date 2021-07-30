# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :submit, :withdraw, :approve]

  # GET /courses
  def index
    @q = Course.ransack(params[:q])
    @q.sorts = ['updated_at desc'] if @q.sorts.empty? # default sort by most recently updated
    @courses = @q.result.includes(goal: :user).references(:goal, :user)
    # @courses = Course.order(updated_at: :desc).includes(:user).references(:user)
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @goal = Goal.includes(:credential, :school).references(:credential, :school).where(user_id: current_user.id, active: true)
    @course = Course.new(user_id: current_user.id, employee_id: current_user.employee_id, status: 'draft', goal_id: @goal.first.id)
  end

  # GET /courses/1/edit
  def edit
    @goal = Goal.includes(:credential, :school).references(:credential, :school).where(user_id: current_user.id)
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      if @course.pending?
        UserMailer.with(user: true_user || current_user, course: @course).request_approval.deliver_now
        redirect_to @course, notice: 'Request for tuition reimbursement successfully created and sent to your manager for approval.'
      else
        redirect_to @course, notice: 'Draft request for tuition reimbursement successfully created. TO GET MANAGER APPROVAL, CLICK THE "SUBMIT APPLICATION" BUTTON.'
      end
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

  # Submit to manager: status becomes "pending" and emails manager - see app/mailers/user_mailer.rb if changing to, cc, or email subject
  def submit
    @course.pending!
    UserMailer.with(user: true_user || current_user, course: @course).request_approval.deliver_now
    redirect_to @course, notice: 'Your application for tuition reimbursement has been emailed to your manager for review.'
  end

  # Withdraw course request - regardless of current status, user can withdraw their request to free up allotted credits (if course was approved)
  def withdraw
    @course.withdrawn!
    redirect_to @course, notice: 'This request for tuition reimbursement has been withdrawn. If the request was previously approved, the credits have been released.'
  end

  # Triggers when manager approves the request, or someone in HR approves the course request if the user has no manager
  # See app/mailers/user_mailer.rb if changing to, cc, or email subject
  def approve
    if @course.approve_course(current_user)
      UserMailer.with(course: @course, user: @course.goal.user).approve_course.deliver_now
      redirect_to @course, notice: 'Thanks! Your approval for this tuition reimbursement request has been logged, the user will be emailed on next steps to take.'
    else
      redirect_to @course, notice: 'Approval did not complete - Sorry about that! Please reload the page and try again.'
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Tuition reimbursement request was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.includes(:approvals, :proofs, goal: [:user, :school, :credential]).references(:goal, :school, :credential, :approvals, :user, :proofs).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:user_id, :employee_id, :goal_id, :start_date, :end_date, :course_title, :course_short, :credit_hours, :cost, :status)
  end
end
