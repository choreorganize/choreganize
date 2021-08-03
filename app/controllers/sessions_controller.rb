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
    # session[:name] = user.name
    # session[:email] = user.email
    # require 'pry'; binding.pry

    flash[:success] = "Welcome, #{user.name}!"
    redirect_to dashboard_index_path
  end

  def destroy
    session[:user] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end




#def create
# auth_hash = request.env['omniauth.auth']
# to_back_end = {
#   name: auth_hash["info"]["name"],
#   email: auth_hash["info"]["email"],
#   google_id: auth_hash["uid"],
#   token: auth_hash["credentials"]["token"]
# }
# user = UsersService.create_or_find_user(to_back_end)
# # session[:user_id] = user.id
# # redirect_to '/dashboard'  ## binding.pry
