class SignupsController < ApplicationController

  def new
    @user = User.create(params[:user])
  end

  def create
    user = User.new(params[:user])
    if user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = user.id
      redirect_to :root
    else
      flash[:notice] = "Invalid signup, please try again"
      redirect_to signup_url
    end
  end

end