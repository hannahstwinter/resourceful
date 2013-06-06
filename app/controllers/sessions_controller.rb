class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid email of password"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

end