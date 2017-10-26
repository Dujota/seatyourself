class AvailabilitiesController < ApplicationController
before_action :new_availability, only: [:new, :create]
before_action :find_restaurant
before_action :find_availability, only: [:edit, :update]

  def new
    #new_availability
    #find_restaurant

  end

  def create
    #new_availability
    #find_restaurant
    @availability =  Availability.new(availability_params)
    @availability.restaurant_id = params[:restaurant_id]

    if @availability.save
      flash[:notice] = "Your Hours have been created"
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    #find_availability
    #find_restaurant
  end

  def update
    #find_availability
    #find_restaurant
  end

  private

  def availability_params
    params.require(:availability).permit(:available_time)
  end

  def new_availability
    @availability = Availability.new
  end

  def find_availability
    @availability = Availability.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
