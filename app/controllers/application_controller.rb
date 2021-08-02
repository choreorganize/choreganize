class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate_user

  def current_user
    @current_user ||= session[:user_id]
  end

  def authenticate_user
   redirect_to root_path if current_user.nil?
  end
end
