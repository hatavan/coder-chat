class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :require_login, :skip_if_logged_in

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    current_user != nil
  end

  def require_login
    return false if signed_in?
    flash[:notice] = 'You must sign in to see this page!'
    redirect_to login_path
  end

  def skip_if_logged_in
    return false unless signed_in?
    redirect_to users_path
  end
end
