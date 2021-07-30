class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #before_action: :authenticate_user
  #def authenticate_user
  #  redirect_to '/' if current_user.nil?
  #end
end
