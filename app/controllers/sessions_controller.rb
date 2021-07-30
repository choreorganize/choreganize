class SessionsController < ApplicationController
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
    user = UsersService.create_or_find_user(user_info)
    session[:user_id] = user.id
    redirect_to '/dashboard'
  end
end
