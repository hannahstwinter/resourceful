class UsersController < ApplicationController

  def show
    @contacts = Contact.where("user_id = ?", current_user.id)
    @agencies = []
    @contacts.each do |contact|
      @agencies << Agency.find(contact.agency_id)
    end
    @contact_list = @contacts.zip(@agencies)
  end

end
