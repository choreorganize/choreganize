class UserFacade
  def self.user(user_info)
    user_attributes = UsersService.create_or_find_user(user_info)
    formatted = user_attributes[:data][:attributes]
    GoogleUser.new(formatted)
  end
end
