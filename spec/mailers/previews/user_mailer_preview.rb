# Preview all emails at [localhost:3000 || tuition.staging.health.unm.edu]/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Send to requesting user's Lawson-assigned manager when user requests approval for a course request
  def request_approval
    UserMailer.with(user: User.first, course: Course.first).request_approval
  end

  # Send to user when manager/HR approves a user's request for course reimbursement
  def approve_course
    UserMailer.with(user: User.first, course: Course.first).approve_course
  end

  # Send when manager denies a course reimbursement request
  def deny_course
    UserMailer.with(user: User.first, approval: Approval.is_course.denied.first).deny_course
  end

  # Send to manager to remind them to respond to a course reimbursement request
  def manager_reminder
    UserMailer.with(user: User.first, course: Course.first).manager_reminder
  end

  # Sent to user when HR rejects proof document
  def reject_proof
    UserMailer.with(user: User.first, approval: Approval.is_proof.denied.first, proof: Proof.last, course: Course.last).reject_proof
  end

  # Send to user to remind them to submit their proof documents
  def proof_reminder
    UserMailer.with(user: User.first, course: Course.first).proof_reminder
  end

  # Send to requesting user when Human Resources denies an educational goal
  def deny_goal
    UserMailer.with(user: User.first, approval: Approval.is_goal.denied.first).deny_goal
  end
end
