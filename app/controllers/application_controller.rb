class ApplicationController < ActionController::Base
  
  def current_user 
    # @user ||= User.find(session[:user_id]) if session[:user_id]
    require 'pry'; binding.pry
    @user ||= GoogleUserFacade.user(session[:user])
    require 'pry'; binding.pry
  end
end
