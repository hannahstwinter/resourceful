class AgenciesController < ApplicationController
  load_and_authorize_resource

  def new
    @agency = Agency.new
  end

  def create
    tags = Tags.process_tags(params[:agency][:tag])
    params[:agency][:tag] = Tags.find_or_create(tags)
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
    @user_reviews_hash = Review.get_users(@agency.reviews)
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
    Contact.update_agency_id(agency.id)
    Agency.destroy(agency.id)
    redirect_to root_url
  end
end