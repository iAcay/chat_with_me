class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome! You have been succesfully logged in."
      redirect_to root_path
    else
      flash.now[:alert] = "Wrong username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Bye! You have been succesfully logged out."
    redirect_to login_path
  end
end
