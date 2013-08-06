class PagesController < ApplicationController

  def index
    if current_user
      @user = current_user
      @user_contacts = @user.contacts
      @contacts = Hash.new
      @user_contacts.each do |contact|
        @contacts[contact.agency_id] = contact.id
      end
    else
      @user_contacts = nil
      @user = nil
    end
    @agencies = Agency.search(params[:search], @contacts, @user)
  end

end
