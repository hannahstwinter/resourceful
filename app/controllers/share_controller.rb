class ShareController < ApplicationController

  def index
    @contact = Contact.find(params[:id])
    @agency = Agency.find(@contact.agency_id)
    @note = "Here is a contact I thought you might find useful."
  end

  def post
    email = {:recipient => params[:email],
             :first_name => params[:first_name],
             :last_name => params[:last_name],
             :agency => params[:agency],
             :agency_desc => params[:agency_desc],
             :phone => params[:phone],
             :contact_email => params[:contact_email],
             :notes => params[:notes],
             :additional_notes => params[:add_notes],
             :user => current_user
            }

    Mailer.contact_email(email).deliver

    flash[:notice] = "#{params[:first_name]} #{params[:last_name]}'s contact information has been sent to #{params[:email]}."
    redirect_to users_path
  end

end