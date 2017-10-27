class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  helper_method :current_user # helper_method lets you use this shorthand in the views as well

  def logged_in?
    session[:user_id].present?
  end

  helper_method :logged_in?

  def require_logged_in
    unless logged_in?
      flash[:alert] = "You must be logged in!"
      redirect_to new_session.url
    end
  end

  def restaurant_owner
    current_user == @restaurant.user
  end

  helper_method :restaurant_owner

  def hours_intervals
    hours = [ "1:00 AM",
      "2:00 AM",
      "3:00 AM",
      "4:00 AM",
      "5:00 AM",
      "6:00 AM",
      "7:00 AM",
      "8:00 AM",
      "9:00 AM",
      "10:00 AM",
      '11:00 AM',
      "12:00 PM",
      "1:00 PM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
      '5:00 PM',
      "6:00 PM",
      "7:00 PM",
      "8:00 PM",
      "9:00 PM",
      "10:00 PM",
      "11:00 PM",
      "12:00 AM"
    ]
  end

  helper_method :hours_intervals
end
