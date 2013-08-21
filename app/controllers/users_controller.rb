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

  def authz
    user = current_user
    if params[:access_key] == ENV["NRVCS_ADMIN_KEY"]
      user.authz = :admin
      user.save
      flash[:notice] = "You are now authorized to add and edit agencies to Resourceful."
    elsif params[:access_key] == ENV["NRVCS_BASIC_KEY"]
      user.authz = :basic
      user.save
      flash[:notice] = "You are now authorized to review agencies on Resourceful."
    else
      flash[:alert] = "Your authorization failed."
    end
    redirect_to users_path
  end

end
