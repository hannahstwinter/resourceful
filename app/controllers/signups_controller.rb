class SignupsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      Mailer.welcome_email(@user).deliver
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash[:notice] = "Invalid signup, please try again"
      redirect_to signup_url
    end
  end

end