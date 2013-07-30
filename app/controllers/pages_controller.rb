class PagesController < ApplicationController

  def index
    @agencies = Agency.search(params[:search], params[:rating])
    if current_user
      contacts = Contact.where("user_id LIKE ?", current_user.id)
      agency_ids = []
      contacts.each do |contact|
        agency_ids << contact.agency_id
      end
      @agencies_w_contact = []
      @agencies.each do |agency|
        if agency_ids.include?(agency.id)
          @agencies_w_contact << agency
        end
      end
    end
  end

end
