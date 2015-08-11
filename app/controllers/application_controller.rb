class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout!
    @user.reset_session_token!
    @user = nil
    session[:session_token] = nil
  end
end
