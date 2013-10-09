class UsersController < ApplicationController
  def show
    @user = current_user
    @agencies_for_authz_select = [["None", 0], ["NRVCS", 37]]
    @contact_list = Contact.display(@user.id, params[:search])
    @alphabet_array = ('a'..'y').to_a

    if @contact_list.empty?
      @contact_list = nil if @contact_list.empty?
    end
    if @contact_list == nil && params[:search] != nil
      flash.now[:alert] = "Your search, '#{params[:search]}', did not return any results."
    end
  end

  def authorization
    @user = User.authorize(current_user.id, params[:access_key])
    if @user.authz == "admin"
      flash[:notice] = "You are now authorized to add and edit agencies to Resourceful."
    elsif @user.authz == "basic"
      flash[:notice] = "You are now authorized to review agencies on Resourceful."
    else
      flash[:alert] = "Your authorization failed."
    end
    redirect_to users_path
  end
end
