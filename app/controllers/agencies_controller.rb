class AgenciesController < ApplicationController

  def new
    @agency = Agency.new
  end

  def create
    agency = Agency.new(params[:agency])
    if agency.save
      flash[:notice] = "Agency added!"
      redirect_to root_url
    else
      flash[:notice] = "Sorry, but there was an error in adding the agency information."
      redirect_to root_url
    end
  end

  def index
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def destroy
  end

end