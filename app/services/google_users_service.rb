class GoogleUsersService
  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/roommates', user_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_by_id(id)
    response = connection.get("/api/v1/roommates/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_by_guid(id)
    response = connection.get("/api/v1/roommates/search?google_id=#{id}")

    {
      status: response.status,
      body:  JSON.parse(response.body, symbolize_names: true)
    }
  end

  def self.update_user(user_info)
    response = connection.patch("/api/v1/roommates/#{user_info[:roommate][:id]}", user_info)
    JSON.parse(response.body, symbolize_names: true)
  end
end
