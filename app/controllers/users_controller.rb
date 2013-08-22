class UsersController < ApplicationController

  def show
    @user = current_user
    if !params[:search]
      @contact_list = Contact.display(current_user.id)
    else
      @contact_list = Contact.search(params[:search], current_user.id)
      if @contact_list.empty?
        @contact_list = Contact.display(current_user.id)
        flash.now[:alert] = "Your search, '#{params[:search]}', did not return any results."
      end
    end
    @alphabet_array = ('A'..'Y').to_a
  end

  def authorization
    user = User.authorize(current_user.id, params[:access_key])
    if user.authz == "admin"
      flash[:notice] = "You are now authorized to add and edit agencies to Resourceful."
    elsif user.authz == "basic"
      flash[:notice] = "You are now authorized to review agencies on Resourceful."
    else
      flash[:alert] = "Your authorization failed."
    end
    redirect_to users_path
  end

end
