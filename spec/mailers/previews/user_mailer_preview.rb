# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def request_approval
    UserMailer.with(user: User.first).request_approval
  end
end
