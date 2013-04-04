class UserMailer < ActionMailer::Base
  default :from => "jvidalba@gmail.com"

  def registration_confirmation(user, pass)
    @usuario =   user
    @pass = pass
    mail(:to => user.email, :subject => "Invitacion")
  end
end