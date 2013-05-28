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
    @contacts = Contact.where("user_id = ?", current_user.id)
    @agencies = []
    @contacts.each do |contact|
      @agencies << Agency.find(contact.agency_id)
    end
    @contact_list = @contacts.zip(@agencies)
    # LOOK INTO CANCAN
  end

end
