class HouseholdsFacade
  def self.create_household(household_info)
    household_attributes = HouseholdService.create_or_find_household(household_info)

    Household.new(household_attributes)
  end

  def self.get_weather(household_id)
    house_data = HouseholdService.weather_data(household_id)
    Household.new(house_data)
  end
end
