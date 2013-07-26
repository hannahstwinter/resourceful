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
      flash[:notice] = "Sorry, but there was an error in creating your contact."
      redirect_to root_url
    end
  end

  def index
  end

end