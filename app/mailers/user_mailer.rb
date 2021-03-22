# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@salud.unm.edu'

  def request_approval
    @user = params[:user]
    @course = params[:course]
    @url = 'localhost:3000'
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: 'Tuition Reimbursement application submitted',
    )
  end
end
