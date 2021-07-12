# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@salud.unm.edu'

  # Send to requesting user's Lawson-assigned manager when user requests approval for a course request
  def request_approval
    @user = params[:user]
    @course = params[:course]
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Tuition Reimbursement application submitted by #{@user.displayname}"
    )
  end

  # Send to manager to remind them to respond to a course reimbursement request
  def manager_reminder
    @user = params[:user]
    @course = params[:course]
    mail(
      to: @user.employee.manager.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Your action needed! Tuition Reimbursement application submitted by #{@user.displayname}"
    )
  end

  # Send to user when manager/HR approves a user's request for course reimbursement
  def approve_course
    @user = params[:user]
    @course = params[:course]
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Tuition Reimbursement Request Approved for #{@user.displayname}"
    )
  end

  # Send when manager denies a course reimbursement request
  def deny_course
    @user = params[:user]
    @approval = params[:approval]
    @course = @approval.course
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Tuition Reimbursement Denied for #{@course.course_title} - Action Needed"
    )
  end

  def proof_reminder
    @user = params[:user]
    @course = params[:course]
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Upload supporting documents for Tuition Reimbursement on #{@course.course_title}"
    )
  end

  # Send to requesting user when Human Resources denies an educational goal
  def deny_goal
    @user = params[:user]
    @approval = params[:approval]
    @goal = @approval.goal
    mail(
      to: @user.email,
      cc: 'saswanson@salud.unm.edu',
      subject: "Your Educational Goal Was Denied: #{@goal.credential.description} - Action Needed"
    )
  end
end
