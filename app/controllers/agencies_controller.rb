class AgenciesController < ApplicationController
  load_and_authorize_resource

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(params[:agency])
    @similar = Agency.where('name LIKE ?', params[:agency][:name])
    if @similar.empty?
      if @agency.save
        flash[:notice] = "Agency added."
        redirect_to root_url
      else
        errors = []
        @agency.errors.messages.each do |field, message|
          errors << field.to_s.gsub("_", " ") unless field == :phone
          if field == :phone
            # handle it differently
          end
        end
        flash.now[:error] = "The fields #{errors.join(', ')} cannot be left blank."
        render :new
      end
    else
      @agencies = []
      @similar.each do |agency|
        @agencies << agency
      end
      render :new
    end
  end

  def show
    @agency = Agency.find(params[:id])
    @reviews = @agency.reviews
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def update
    Agency.update(params[:id], params[:agency])
    flash[:notice] = "#{params[:agency][:name]}'s information has been updated."
    redirect_to "/agencies/#{params[:id]}"
  end

  def destroy
    @agency = Agency.find(params[:id])
    flash[:notice] = "#{@agency.name}'s information has been deleted."
    Agency.destroy(@agency.id)
    contacts = Contact.where(:agency_id => @agency.id)
    contacts.each do |contact|
      contact.update_attribute(:agency_id, nil)
    end
    redirect_to root_url
  end

end