class ShareController < ApplicationController

  def index
    @contact = Contact.find(params[:id])
    @agency = Agency.find(@contact.agency_id)
    @note = "Here is a contact I thought you might find useful."
  end

end