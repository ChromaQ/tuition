# frozen_string_literal: true

class ApprovalsController < ApplicationController
  before_action :set_approval, only: [:show, :edit, :update, :destroy]
  # before_action :set_course, only: :new

  # GET /approvals
  def index
    @q = Approval.ransack(params[:q])
    @q.sorts = ['updated_at desc'] if @q.sorts.empty?
    @approvals = @q.result.includes(:course, :proof, :user, goal: [:school, :credential]).references(:user, :course, :goal, :proof)
  end

  # GET /approvals/1
  def show
  end

  # GET /approvals/new
  def new
    @approval = Approval.new(user_id: current_user.id, employee_id: current_user.employee_id, response: params[:response], role: params[:role], course_id: params[:course_id], goal_id: params[:goal_id], proof_id: params[:proof_id])
  end

  # GET /approvals/1/edit
  def edit
  end

  # POST /approvals
  def create
    @approval = Approval.new(approval_params)
    if @approval.save
      if @approval.course? && @approval.denied?
        @approval.course.denied!
        UserMailer.with(approval: @approval, course: @approval.course, user: @approval.course.goal.user).deny_course.deliver_now
      elsif @approval.goal? && @approval.denied?
        @approval.goal.denied!
        UserMailer.with(approval: @approval, goal: @approval.goal, user: @approval.goal.user).deny_goal.deliver_now
      else
        # waiting to wire up proofs
      end
      redirect_to @approval, notice: 'Your response to this request was successfully logged. The user has been notified by email of this response.'
    else
      render :new
    end
  end

  # PATCH/PUT /approvals/1
  def update
    if @approval.update(approval_params)
      redirect_to @approval, notice: 'Your response to this request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /approvals/1
  def destroy
    @approval.destroy
    redirect_to request.referer, notice: 'Your response to this request was deleted successfully.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_approval
    @approval = Approval.includes(:course, :goal, :proof).references(:user, :course, :goal, :proof).find(params[:id])
  end

  # def set_course
  #   @course = Course.includes(:goal, goal: :user).references(:user, :goal).find(params[:course_id])
  # end

  # Only allow a trusted parameter "white list" through.
  def approval_params
    params.require(:approval).permit(:course_id, :goal_id, :proof_id, :user_id, :employee_id, :role, :response, :deny_reason, :goal_details, :school, :credential, :approval_type)
  end
end
