class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: [:show, :edit, :update, :destroy]

  # GET /reimbursements
  def index
    @q = Reimbursement.ransack(params[:q])
    @q.sorts = ['updated_at desc'] if @q.sorts.empty? # default sort by most recently updated
    @reimbursements = @q.result.includes(:user, :course)
  end

  # GET /reimbursements/1
  def show
  end

  # GET /reimbursements/new
  def new
    fy = Reimbursement.estimate_fiscal_year
    @reimbursement = Reimbursement.new(course_id: params[:course_id], user_id: params[:user_id], payee: params[:payee], created_by: current_user.employee_id, fiscal_year: fy, status: 'draft')
  end

  # GET /reimbursements/1/edit
  def edit
  end

  # POST /reimbursements
  def create
    @reimbursement = Reimbursement.new(reimbursement_params)

    if @reimbursement.save
      redirect_to @reimbursement, notice: 'Reimbursement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reimbursements/1
  def update
    if @reimbursement.update(reimbursement_params)
      redirect_to @reimbursement, notice: 'Reimbursement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reimbursements/1
  def destroy
    @reimbursement.destroy
    redirect_to reimbursements_url, notice: 'Reimbursement was successfully destroyed.'
  end

  private

  def set_reimbursement
    @reimbursement = Reimbursement.includes(:course, :user).references(:course, :user, :employee).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reimbursement_params
    params.require(:reimbursement).permit(:course_id, :user_id, :payee, :created_by, :reviewed_by, :grade_met, :credits_approved, :amount, :fiscal_year, :status)
  end

end
