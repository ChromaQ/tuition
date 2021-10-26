class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: [:show, :edit, :update, :destroy]
  
  # GET /reimbursements
  def index
    @reimbursements = Reimbursement.all
    
  end

  # GET /reimbursements/1
  def show
  end

  # GET /reimbursements/new
  def new
    @reimbursement = Reimbursement.new
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
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement
      @reimbursement = Reimbursement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reimbursement_params
      params.require(:reimbursement).permit(:course_id, :user_id, :payee, :created_by, :reviewed_by, :grade_met, :credits_approved, :amount, :fiscal_year, :status)
    end
end
