class HouseholdsFacade
  def self.create_household(household_info)
    household_attributes = HouseholdService.create_or_find_household(household_info)
    formatted = household_attributes[:data][:attributes]
    Household.new(formatted)
  end

  def self.get_weather(household_id)
    house_data = HouseholdService.weather_data(household_id)[:data][:attributes]
    Household.new(house_data)
  end

  def self.get_household_by_id(id)
    household_attributes = HouseholdService.fetch_houshold(id)
    formatted = household_attributes[:data][:attributes]
    Household.new(formatted)
  end
end
