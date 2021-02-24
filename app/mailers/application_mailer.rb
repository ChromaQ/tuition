# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@salud.unm.edu'
  layout 'mailer'
end
