# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def request_approval
    UserMailer.with(user: User.first, course: Course.first).request_approval
  end

  def approve
    UserMailer.with(user: User.first, course: Course.first).approve
  end

  def reminder
    UserMailer.with(user: User.first, course: Course.first).reminder
  end
end
