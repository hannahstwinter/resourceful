class UsersController < ApplicationController

  def show
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

end
