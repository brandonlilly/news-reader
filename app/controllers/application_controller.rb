class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def log_in_user(user)
    session[:token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  # def require_login
  #
  # end


end
