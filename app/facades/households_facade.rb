class HouseholdsFacade
  def self.create_household(household_info)
    household_attributes = HouseholdService.create_or_find_household(household_info)
    formatted = household_attributes[:data][:attributes]
    Household.new(formatted)
  end


  def self.get_houshold_by_id(id)
    household_attributes = HouseholdService.fetch_houshold(id)
    formatted = household_attributes[:data][:attributes]
    Household.new(formatted)
  end
end
