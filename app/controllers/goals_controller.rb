class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :submit, :approve]

  # GET /goals
  def index
    @q = Goal.ransack(params[:q])
    @q.sorts = ['status = pending'] if @q.sorts.empty?
    @goals = @q.result.includes(:user, :credential, :school).references(:user, :credential, :school)
  end

  # GET /goals/1
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new(user_id: current_user.id, degree_id: 3)
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      if @goal.auto_approved?
        redirect_to @goal, notice: 'Your goal has been created and automatically approved based on the credential you are pursuing. Good luck with your studies!'
      elsif @goal.pending?
        redirect_to @goal, notice: 'Your goal has been created, and has been submitted to Human Resources for review.'
      else
        redirect_to @goal, notice: 'Education Goal was successfully created as a draft. Please make sure to submit this goal for approval!'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal has been successfully updated. Make sure to re-submit this goal for approval if necessary.'
    else
      render :edit
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    redirect_to @goal.user, notice: 'Education Goal was successfully deleted.'
  end

  # Submit goal for review - if the credential is auto-approvable, status becomes "auto-approved"; else status becomes "pending" for HR review.
  def submit
    @goal.pending!
    @goal.goal_autoapproval
    if @goal.auto_approved?
      redirect_to @goal, notice: 'Your goal has been submitted and automatically approved based on the credential you are pursuing. Good luck with your studies!'
    else
      redirect_to @goal, notice: 'Your goal has been submitted to Human Resources for review.'
    end
  end

  # Triggers when HR approves the educational goal
  def approve
    if @goal.approve_goal(current_user)
      redirect_to @goal, notice: 'Thanks! Your approval for this educational goal has been logged.'
    else
      redirect_to @goal, notice: 'Approval did not complete - Sorry about that! Please reload the page and try again.'
    end
  end

  # for use in adding credentials to a goal by changing the degree type
  def update_credentials
    @credentials = Credential.where("degree_id = ?", params[:degree_id])
    respond_to do |format|
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal
    @goal = Goal.includes(:user, :credential, :school, :courses).references(:user, :credential, :degree, :school, :courses).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def goal_params
    params.require(:goal).permit(:focus, :active, :user_id, :school_id, :credential_id, :degree_id, :status)
  end
end
