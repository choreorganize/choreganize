class ChoreService
  def self.find_by_id(id)
    response = connection.get("/api/v1/chores/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_or_find_chore(chore_info)
    response = connection.post('/api/v1/chores', chore_info)
    JSON.parse(response.body, symbolize_names: true)
  end

    def self.connection
      Faraday.new('https://choreganize-api.herokuapp.com/')
    end
  end
