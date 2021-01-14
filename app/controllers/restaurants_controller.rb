class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  
  def index
    @restaurants = Restaurant.all
  end
  
  def new
    @restaurant = Restaurant.new
    @states = ["chinese", "italian", "japanese", "french", "belgian"]
  end

  def create
    restaurant = Restaurant.new(restaurants_params)
    if restaurant.valid?
      restaurant.save
      redirect_to restaurant_path(restaurant), notice: 'Restaurant was successfully created.'
    else
      render new_restaurant_path
    end
  end

  def show
    @reviews = Review.joins(:restaurant).where(restaurant_id: params[:id])
  end
  
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end  

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
  
end
