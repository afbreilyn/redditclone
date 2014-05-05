class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  private

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    user.reset_token!
    @current_user = user
    session[:token] = @current_user.token
  end

  def log_out
    current_user.try(:reset_token!)
    session[:token] = nil
  end

  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end

end
