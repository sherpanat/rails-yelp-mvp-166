class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = find_restaurant
  end

  def create
    @review = Review.new(review_params)
    @restaurant = find_restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(find_restaurant)
    else
      render 'reviews/new', restaurant: @restaurant
    end
  end

private

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
