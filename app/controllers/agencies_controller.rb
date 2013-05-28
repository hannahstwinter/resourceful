class AgenciesController < ApplicationController

  def new
  end

  def create
  end

  def index
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def destroy
  end

end