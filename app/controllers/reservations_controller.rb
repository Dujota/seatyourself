class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  before_action :new_reservation, only: [:new, :create]
  before_action :find_restaurant
  before_action :restaurant_id, only: [:edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
    # find_reservation

  end

  def new
    # new_reservation
  end

  def create
    # new_reservation
    # restaurant_id
    @reservation.reserved_time = params[:reservation][:reserved_time]

    if @reservation.save
      flash[:notice] = "Reservation has been saved"
      redirect_to restaurant_reservation_path(find_restaurant, @reservation.id)
    else
      flash[:alert] = "Unable to save reservation"
      render :new
    end
  end

  def edit
    # find_reservation
  end

  def update
    # find_reservation
    # restaurant_id
    @reservation.reserved_time = params[:reservation][:reserved_time]

    if @reservation.save
      flash[:notice] = "Reservation has been udpated"
      redirect_to restaurant_reservation_path(find_restaurant, @reservation.id)
    else
      flash[:alert] = "Unable to udpate reservation"
      render :edit
    end
  end

  def destroy
    # find_reservation
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new_reservation
    @reservation = Reservation.new
  end

  def restaurant_id
    @reservation.restaurant = @restaurant
  end
end