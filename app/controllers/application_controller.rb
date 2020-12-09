class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
   # session[:user_id]
   !!current_user
  end

  def current_user 
   # session[:name]
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  private 
  
  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end 
end
