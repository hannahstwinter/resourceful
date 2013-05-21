class PagesController < ApplicationController

  def index
    @agencies = Agency.order("out_of_house DESC").limit(5)
  end

end
