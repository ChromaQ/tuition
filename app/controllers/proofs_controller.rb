class ProofsController < ApplicationController
  before_action :set_proof, only: [:show, :edit, :update, :destroy]

  # GET /proofs
  def index
    @proofs = Proof.all

  end

  # GET /proofs/1
  def show
  end

  # GET /proofs/new
  def new
    @proof = Proof.new
    @proof.course_id = params[:course_id]
  end

  # GET /proofs/1/edit
  def edit
  end

  # POST /proofs
  def create
    @proof = Proof.new(proof_params)
    @proof.document.attach(params[:proof][:document])
    if @proof.save
      redirect_to @proof, notice: 'Supporting document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proofs/1
  def update
    if @proof.update(proof_params)
      @proof.document.attach(params[:proof][:document])
      redirect_to @proof, notice: 'Supporting document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /proofs/1
  def destroy
    @proof.document.purge
    @proof.destroy
    redirect_to proofs_url, notice: 'Supporting document was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proof
    @proof = Proof.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def proof_params
    params.require(:proof).permit(:receipt, :grade, :course_id, :document, :course)
  end
end
