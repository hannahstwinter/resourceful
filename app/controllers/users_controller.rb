class UsersController < ApplicationController

  def new
    if @user = User.create(params[:user])
      # success
      redirect_to :root
    else
      # error handling
    end
  end

  def create
  end

end
