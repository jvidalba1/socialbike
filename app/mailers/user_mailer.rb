class UserMailer < ActionMailer::Base
  default :from => "example@example.com"

  def registration_confirmation(email)

    mail(:to => email, :subject => "testing")
  end
end