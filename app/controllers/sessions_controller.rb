class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
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
    cookies.delete(:auth_token)
    flash[:notice] = "You have been successfully logged out."
    redirect_to root_path
  end
end