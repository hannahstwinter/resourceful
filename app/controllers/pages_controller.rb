class PagesController < ApplicationController

  def index
    @agencies = Agency.search(params[:search], params[:rating])
    # if search
    #   @agencies = Agency.search #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    # else
    #   @agencies = Agency.order("out_of_house DESC").limit(5)
    # end

    # @agencies = Agency.order("out_of_house DESC").limit(5)

    if current_user && current_user.agency_id != nil
      @user_agency = Agency.find(current_user.agency_id)
    end
  end

end
