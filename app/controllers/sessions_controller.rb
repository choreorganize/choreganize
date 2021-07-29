class SessionsController < ApplicationController

  def create

    auth_hash = request.env['omniauth.auth']
    send_to_back_end = {
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      google_id: auth_hash["uid"],
      token: auth_hash["credentials"]["token"]
    }

    # make api call to back end.
    # make service for users.

    # user = {response from Back End, filtered through facade&poro}
    # session[:user_id] = user.id

    # redirect_to '/dashboard'

    # binding.pry
  end

end


# private
# def auth_hash
#  request.env['omniauth.auth']
# end

# def user_attributes
#  {
#     google_id: auth_hash["uid"],
#     email: auth_hash["info"]["email"],
#     token: auth_hash["credentials"]["token"]
#  }
# end
