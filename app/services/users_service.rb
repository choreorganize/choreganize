class UsersService

  def self.connection
    Faraday.new('https://chorginize-api.herokuapp.com/api/v1/')
  end

  # def self.create_or_find_user(params)
  #   response = connection.post("roommates") do |faraday|
  #     params.each do |key, value|
  #       faraday.params[key] = value
  #     end
  #   end
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.create_or_find_user(user_info)
    response = connection.post("roommates") do |faraday|
      faraday.params['roommate'] = user_info
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
