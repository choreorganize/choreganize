class HouseholdService
  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_or_find_household(household_info)
    response = connection.post('/api/v1/household', household_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_houshold(id)
    response = connection.get("/api/v1/household/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
