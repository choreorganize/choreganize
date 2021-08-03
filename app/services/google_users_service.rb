class GoogleUsersService
  def self.connection
    # Faraday.new('https://choreganize-api.herokuapp.com/')
    Faraday.new('http://localhost:4000')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/roommates', user_info)
    JSON.parse(response.body, symbolize_names: true)
  end
end
