class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    agency = Agency.find(@review.agency_id)

    if @review.save
      flash[:notice] = "Your review has been saved."
      redirect_to "/agencies/#{agency.id}"
    else
      flash[:error] = "Sorry, but there was an error in adding your review."
      redirect_to "/agencies/#{agency.id}"
    end
  end

  def destroy
    review = Review.find(params[:id])
    agency = Agency.find(review.agency_id)
    flash[:notice] = "Your review for #{agency.name} has been deleted."
    Review.destroy(review.id)
    redirect_to "/agencies/#{agency.id}"
  end
end