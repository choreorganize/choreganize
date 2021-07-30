class UsersService
  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_or_find_user(user_info)
    # require 'pry'; binding.pry
    # response = connection.post('/api/v1/roommates') do |faraday|
    #   faraday.params['roommate'] = user_info
    # end
    # JSON.parse(response.body, symbolize_names: true)
    # params = user_info
    # conn = Faraday.new(url: 'https://choreganize-api.herokuapp.com/', params: params)

    # response = conn.post('/api/v1/roommates')

    # JSON.parse(response.body, symbolize_names: true)
    response = connection.post('/api/v1/roommates', user_info.to_json)
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
