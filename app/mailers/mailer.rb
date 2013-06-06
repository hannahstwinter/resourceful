class Mailer < ActionMailer::Base
  default from: 'hstwinter@gmail.com'

  def welcome_email(user)
    @user = user
    # @url = "http://example.com/login"
    mail(:to => @user.email, :subject => "Welcome to Resourceful")
  end

  def contact_email(contact)
    @contact = contact
    @user = current_user.id
  end

end
