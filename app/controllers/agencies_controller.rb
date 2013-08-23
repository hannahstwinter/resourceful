class AgenciesController < ApplicationController
  load_and_authorize_resource

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(params[:agency])
    @similar = Agency.find_similar(@agency.name)
    if @agency.save
      flash[:notice] = "Agency added."
      redirect_to root_url
    else
      @errors = @agency.errors.messages
      flash.now[:error] = "We need more information about the agency, please continue filling out the form."
      render :new
    end
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def update
    agency = Agency.update(params[:id], params[:agency])
    flash[:notice] = "#{agency.name}'s information has been updated."
    redirect_to "/agencies/#{agency.id}"
  end

  def destroy
    agency = Agency.find(params[:id])
    flash[:notice] = "#{agency.name}'s information has been deleted."
    Agency.destroy(agency.id)
    Contact.update_agency_id(agency.id)
    redirect_to root_url
  end

end