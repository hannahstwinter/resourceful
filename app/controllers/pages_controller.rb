class PagesController < ApplicationController

  def index
    if current_user
      @user = current_user
      @user_contacts = @user.contacts
      @contacts = Hash.new
      @user_contacts.each do |contact|
        @contacts[contact.agency_id] = contact.last_name[0]
      end
    end
    @agencies = Agency.search(params[:search], @contacts_agency_ids)
  end

end
