class UsersController < ApplicationController

  # def show
  #   @contacts = Contact.where("user_id = ?", current_user.id)
  #   @agencies = []
  #   @contacts.each do |contact|
  #     @agencies << Agency.find(contact.agency_id)
  #   end
  #   @contact_list = @contacts.zip(@agencies)
  # end

  def show
    if params[:search_by] == 'contact'
      @contacts = Contact.search(params[:search], params[:search_by], current_user.id)
      if !@contact.nil?
        @agencies = []
        @contacts.each do |contact|
          @agencies << Agency.find(contact.agency_id)
        end
        @contact_list = @contacts.zip(@agencies)
      else
        @contacts = Contact.where("user_id = ?", current_user.id)
        @agencies = []
        @contacts.each do |contact|
         @agencies << Agency.find(contact.agency_id)
        end
        @contact_list = @contacts.zip(@agencies)
        flash[:notice] = "Your search, #{params[:search]}, returned no results"
      end
    elsif params[:search_by] == 'agency'
      @agencies = Contact.search(params[:search], params[:search_by], current_user.id)
      if !@agencies.nil?
        @contacts = []
        @agencies.each do |agency|
          @contacts << Contact.where("user_id = ? AND agency_id = ?", current_user.id, agency.id)
        end
        @contact_list = @contacts.zip(@agencies)
      else
        @contacts = Contact.where("user_id = ?", current_user.id)
        @agencies = []
        @contacts.each do |contact|
          @agencies << Agency.find(contact.agency_id)
        end
        @contact_list = @contacts.zip(@agencies)
        flash[:notice] = "Your search, #{params[:search]}, returned no results"
      end
    else
      @contacts = Contact.where("user_id = ?", current_user.id)
      @agencies = []
      @contacts.each do |contact|
        @agencies << Agency.find(contact.agency_id)
      end
      @contact_list = @contacts.zip(@agencies)
    end
  end
  # CLUSTERFUCK!!!

end
