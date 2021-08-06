class GoogleUserFacade
  def self.find_user(id)
    user_attributes = GoogleUsersService.find_user(id)
    formatted = user_attributes[:data][:attributes]
    GoogleUser.new(formatted)
  end

  def self.user(user_info)
    id = user_info[:roommate][:google_id]
    response = GoogleUsersService.find_by_guid(id)

    if response[:status] == 404 #eventually other errors
      user_attributes = GoogleUsersService.create_or_find_user(user_info)
      formatted = user_attributes[:data][:attributes]
      GoogleUser.new(formatted)
    else
      formatted = response[:body][:data][:attributes]
      GoogleUser.new(formatted)
    end
  end

  def self.update_user(user_info)
    user_attributes = GoogleUsersService.update_user(user_info)
    GoogleUser.new(user_attributes)
  end
end
