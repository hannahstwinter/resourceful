class SignupsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      Mailer.welcome_email(@user).deliver
      flash[:notice] = "Your account has been created. Login then visit the User Page to authorize your account."
      redirect_to :root
    else
      if params[:user][:password] != params[:user][:password_confirmation]
        flash[:error] = "Passwords don't match. Please try again."
      elsif @user.errors.full_messages
        flash[:error] = "#{@user.errors.full_messages.first}. Please try again."
      end
      redirect_to signup_url
    end
  end
end