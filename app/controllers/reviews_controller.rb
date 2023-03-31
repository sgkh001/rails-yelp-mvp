class ReviewsController < ApplicationController
  def create
    # write the review
    @review = Review.new(review_params)
    # find the restaurant for which you are writing the review
    @restaurant = Restaurant.find(params[:restaurant_id])
    # assign review to the restaurant
    @review.restaurant = @restaurant
    # save
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
