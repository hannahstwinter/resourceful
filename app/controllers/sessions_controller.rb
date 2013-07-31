class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    elsif user && !user.authenticate(params[:password])
      flash[:error] = "Invalid password."
      redirect_to signin_path
    else
      flash[:error] = "Invalid email address."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have been successfully logged out!"
    redirect_to root_path
  end

end