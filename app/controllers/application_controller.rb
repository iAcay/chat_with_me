# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "dlaSopla", password: "apkaDoKontaktu"
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = 'You must be logged in.'
      redirect_to login_path
    end
  end
end
