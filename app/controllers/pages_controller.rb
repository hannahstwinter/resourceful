class PagesController < ApplicationController

  def index
    @agencies = Agency.search(params[:search], params[:rating])
  end

end
