# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@salud.unm.edu'

  def request_approval
    @course = params[:course]
    @user = params[:user]
    @url = 'localhost:3000'
    mail(
      to: @user.email,
      subject: 'Tuition Reimbursement application submitted',
    )
  end
end
