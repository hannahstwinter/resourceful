class PagesController < ApplicationController

  def index
    @agencies = Agency.search(params[:search], params[:rating])
    # if current_user && current_user.agency_id != nil
    #   @user_agency = Agency.find(current_user.agency_id)
    # end
  end

end
