# frozen_string_literal: true

class CredentialsController < ApplicationController
  before_action :set_credential, only: [:show, :edit, :update, :destroy]

  # GET /credentials
  def index
    @credentials = Credential.all

  end

  # GET /credentials/1
  def show
  end

  # GET /credentials/new
  def new
    @credential = Credential.new
  end

  # GET /credentials/1/edit
  def edit
  end

  # POST /credentials
  def create
    @credential = Credential.new(credential_params)

    if @credential.save
      redirect_to @credential, notice: 'Credential was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /credentials/1
  def update
    if @credential.update(credential_params)
      redirect_to @credential, notice: 'Credential was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /credentials/1
  def destroy
    @credential.destroy
    redirect_to credentials_url, notice: 'Credential was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_credential
    @credential = Credential.includes(:degree, :courses).references(:degree, :courses).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def credential_params
    params.require(:credential).permit(:credential, :description, :auto_approve, :degree_id)
  end
end
