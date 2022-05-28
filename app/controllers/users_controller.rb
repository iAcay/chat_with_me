class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def index
    render :index, locals: { users: User.all.order('username ASC') }
  end

  def new
    render :new, locals: { user: User.new }
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = 'Welcome! You have been succesfully registered.'
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new, locals: { user: user }
    end
  end

  def edit
    render :edit, locals: { user: user }
  end

  def update
    if user.update(user_params)
      flash[:success] = 'Your account has been successfully updated.'
      redirect_to root_path
    else
      render :edit, locals: { user: user }
    end
  end

  def destroy
    user.destroy
    flash[:warning] = 'Your account has been successfully deleted. Good bye - see you!'
    redirect_to root_path
  end

  private

  def user
    user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def correct_user
    flash[:error] = 'You are not authorized.' unless user == current_user
  end
end
