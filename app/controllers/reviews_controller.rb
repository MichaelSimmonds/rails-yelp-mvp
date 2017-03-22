class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:index, :new,:create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    @review.save()
    redirect_to restaurant_reviews_path(@restaurant)

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    # byebug
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
