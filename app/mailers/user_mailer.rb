# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@salud.unm.edu'

  def request_approval
    @user = params[:user]
    @course = params[:course]
    @url = 'localhost:3000'
    mail(
      to: @user.employee.manager&.email,
      cc: @user.email,
      subject: "Tuition Reimbursement application submitted by #{@user.displayname}"
    )
  end

  def approve
    @user = params[:user]
    @course = params[:course]
    @url = 'localhost:3000'
    mail(
      to: @user.email,
      cc: @user.employee.manager&.email,
      subject: "Tuition Reimbursement Request Approved for #{@user.displayname}"
    )
  end

  def reminder
    @user = params[:user]
    @course = params[:course]
    @url = 'localhost:3000'
    mail(
      to: @user.email,
      cc: @user.employee.manager&.email,
      subject: "Tuition Reimbursement Reminder to upload supporting documents for #{@course.course_title}"
    )
  end
end
