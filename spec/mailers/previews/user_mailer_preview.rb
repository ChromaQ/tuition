# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def request_approval
    UserMailer.with(user: User.first, course: Course.third_to_last).request_approval
  end

  def approve
    UserMailer.with(user: User.first, course: Course.third_to_last).approve
  end

  def reminder
    UserMailer.with(user: User.first, course: Course.third_to_last).reminder
  end
end
