class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    auth_hash = request.env['omniauth.auth']
    user_info = {
      roommate:
      {
        name: auth_hash['info']['name'],
        email: auth_hash['info']['email'],
        google_id: auth_hash['uid'],
        token: auth_hash['credentials']['token']
      }
    }
    user = GoogleUserFacade.user(user_info)
    session[:user_id] = user.google_id
    session[:user] = user
    require 'pry'; binding.pry
    if user.nil?
      flash[:error] = "Sorry, sign in not successful."
      redirect_to root_path
    else
      flash[:success] = "Welcome #{user.name.split.first}!"
      redirect_to user_dashboard_index_path
    end
  end

  def destroy
    session[:user] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end
