class Mailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    # @url = "http://example.com/login"
    mail(:to => @user.email, :subject => "Welcome to Resourceful")
  end

  def contact_email(email)
    @name = email[:name]
    @agency = email[:agency]
    @agency_desc = email[:agency_desc]
    @phone = email[:phone]
    @notes = email[:notes]
    @additional_notes = email[:additional_notes]
    @user = email[:user]
    mail(:to => email[:recipient], :subject => "Shared Contact from Resourceful")
  end

  def dev_message(email)
    @message = email[:message]
    @name = email[:name]
    @email = email[:email]
    mail(:to => ENV["GMAIL_USERNAME"], :subject => "Email from Resourceful User")
  end

end
