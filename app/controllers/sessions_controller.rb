class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    send_to_back_end = {
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      google_id: auth_hash["uid"],
      token: auth_hash["credentials"]["token"]
    }

    user = UsersService.create_or_find_user(send_to_back_end)

    # session[:user_id] = user.id

    # redirect_to '/dashboard'

    # binding.pry
  end

end
