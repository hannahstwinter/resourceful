class AgenciesController < ApplicationController

  def new
  end

  def create
  end

  def index
    # if search
    #   @agencies = Agency.search #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    # else
    #   @agencies = Agency.order("out_of_house DESC").limit(5)
    # end
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def destroy
  end

end