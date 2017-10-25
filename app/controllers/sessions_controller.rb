class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Thank you for logging in"
      redirect_to root_path
    else
      flash[:alert] = "Nice try succa!"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end