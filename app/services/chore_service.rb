class ChoreService
  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_or_find_chore(chore_info)
    response = connection.post('/api/v1/chore', chore_info)
    JSON.parse(response.body, symbolize_names: true)
  end
end
