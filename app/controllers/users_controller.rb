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

  def show
    # LOOK INTO CANCAN
  end

end
