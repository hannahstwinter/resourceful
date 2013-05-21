class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:email])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid login"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end