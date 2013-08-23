class ContactsController < ApplicationController
  def new
    @agency = Agency.find(params[:id])
    @contact = Contact.new
  end

  def create
    contact = Contact.new(params[:contact])

    if contact.save
      flash[:notice] = "Contact saved to your Contact Book on the User Page."
      redirect_to root_url
    else
      flash[:error] = "Sorry, but there was an error in creating your contact."
      redirect_to root_url
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.update(params[:id], params[:contact])
    flash[:notice] = "Your contact, #{contact.first_name} #{contact.last_name} has been updated."
    redirect_to "/users"
  end

  def destroy
    @contact = Contact.find(params[:id])

    if current_user.id == @contact.user_id
      flash[:notice] = "Your contact, #{@contact.first_name} #{@contact.last_name}, has been deleted."
      Contact.destroy(@contact.id)
      redirect_to "/users"
    else
      flash[:alert] = "Hack alert! You are not authorized to meddle in such ways!"
      redirect_to root_url
    end
  end
end