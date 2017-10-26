class RestaurantsController < ApplicationController
  before_action :new_restaurant, only:[:new, :create]
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :not_restaurant_owner, only: [:edit, :update, :destroy] # restrict display unless user is the creator of the restaurant

  def index; end

  def show
    # find_restaurant
  end

  def new
    # new_restaurant
  end

  def create
    # find_restaurant
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      flash[:notice] = "Your Restaurant has been created"
      redirect_to new_restaurant_availability_path(@restaurant.id)
    else
      render :new
    end
  end

  def edit
    # find_restaurant
  end

  def update
    # find_restaurant
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Your Restaurant has been updated"
      redirect_to restaurant_path(@restaurant.id)
    else
      flash[:alert] = "Please review the form and fix your errors"
      render :edit
    end

  end

  def destroy
    # find_restaurant
    @restaurant.destroy
    redirect_to root_path
  end

  def new_restaurant
    @restaurant = Restaurant.new
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private
  # this mehtod passes in the params from the form to the create method
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :neighborhood, :price_range, :menu, :summary, :time_slots)
  end

  def not_restaurant_owner
    unless restaurant_owner
      flash[:alert] = "You are not authorized to make any changes to this restaurant"
      redirect_to root_path
    end
  end
end
