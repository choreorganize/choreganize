class GoogleUserFacade
  def self.user(user_info)
    require 'pry'; binding.pry
    user_attributes = GoogleUsersService.create_or_find_user(user_info)
    formatted = user_attributes[:data][:attributes]
    GoogleUser.new(formatted)
  end

  def self.update_user(user_info)
    user_attributes = GoogleUsersService.update_user(user_info)
    GoogleUser.new(user_attributes)
  end
end
