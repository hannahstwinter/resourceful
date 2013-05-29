class ContactsController < ApplicationController

  def new
    @agency = Agency.find(params[:id])
    @contact = Contact.new
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      flash[:notice] = "Contact Saved"
      redirect_to root_url
    else
      flash[:notice] = "Sorry, but there was an error in creating your contact"
      redirect_to root_url
    end
  end

  def index
  end

end

  # def new
  #   @user = User.create(params[:user])
  # end

  # def create
  #   user = User.new(params[:user])
  #   if user.save
  #     flash[:notice] = "Welcome to Resourceful!"
  #     session[:user_id] = user.id
  #     redirect_to :root
  #   else
  #     flash[:notice] = "Invalid signup, please try again"
  #     redirect_to signup_url
  #   end
  # end