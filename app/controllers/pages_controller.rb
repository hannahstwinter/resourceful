class PagesController < ApplicationController

  def index
    @agencies = Agency.search(params[:search])
    if current_user
      @user = current_user
      @user_contacts = @user.contacts
      @contacts_agency_ids = []
      @user_contacts.each do |contact|
        @contacts_agency_ids << contact.agency_id
      end
    end
  end

end
