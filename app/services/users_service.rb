class UsersService
  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/roommates', user_info.to_json)
    data = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end
