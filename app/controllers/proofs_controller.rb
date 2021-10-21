# frozen_string_literal: true

class ProofsController < ApplicationController
  before_action :set_proof, only: [:show, :edit, :update, :destroy, :approve]

  # GET /proofs
  def index
    @proofs = Proof.includes(:course).references(:course).with_attached_document.all
  end

  # GET /proofs/1
  def show
  end

  # GET /proofs/new
  def new
    @proof = Proof.new(status: 'draft')
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
      if params[:proof].key? :document
        @proof.document.attach(params[:proof][:document])
      end
      redirect_to @proof, notice: 'Supporting document was successfully updated.'
    else
      render :edit
    end
  end

  # Submit document to HR Benefits for review: status becomes "pending" - see app/mailers/user_mailer.rb if changing to, cc, or email subject
  def submit
    @proof.pending!
    redirect_to @proof, notice: 'Your document has been submitted to the HR Benefits team for review.'
  end

  # Triggers when HR approves the proof document
  def approve
    if @proof.approve_proof(current_user)
      redirect_to @proof, notice: 'Thanks! Your approval on this supporting document has been logged.'
    else
      redirect_to @proof, notice: 'Approval did not complete - Sorry about that! Please reload the page and try again.'
    end
  end

  # When HR rejects a proof document
  def reject
    if @proof.reject_proof(current_user)
      redirect to @proof.course, notice: 'Your rejection of this document has been logged and the user will be notified by email.'
    else
      redirect_to @proof, notice: 'Proof rejection did not complete - Sorry about that! Please reload the page and try again.'
    end
  end

  # DELETE /proofs/1
  def destroy
    @proof.destroy
    # ActiveStorage::Blob.unattached.where("active_storage_blobs.created_at <= ?", 2.days.ago).find_each(&:purge_later) # routine cleanup of active storage blobs not attached to anything
    redirect_to proofs_url, notice: 'Supporting document was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proof
    @proof = Proof.includes(:course, :approvals).references(:course, :approvals).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def proof_params
    params.require(:proof).permit(:receipt, :grade, :course_id, :document, :status)
  end
end
