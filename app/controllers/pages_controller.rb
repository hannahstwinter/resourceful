class PagesController < ApplicationController
  def index
    if current_user
      @user = current_user
      @user_contacts = @user.contacts
      @contact_agency_ids = Hash.new
      @user_contacts.each {|contact| @contact_agency_ids[contact.id] = contact.agency_id }
    end
    @agencies = Agency.search(params[:search], @user, @contact_agency_ids)
    @tags = all_tags
  end
end
