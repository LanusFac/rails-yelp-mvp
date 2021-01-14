class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:id])
    if @review.valid?
      @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      redirect_to restaurants_path
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
  
  
end
