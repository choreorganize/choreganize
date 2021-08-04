class Household
  attr_reader :address,
              :city,
              :state,
              :roommates,
              :chores,
              :weather_forecast

  def initialize(attributes)
    @address = attributes[:address]
    @city = attributes[:city]
    @state = attributes[:state]
    @roommates = attributes[:roommates]
    @chores = attributes[:chores]
    @weather_forecast = attributes[:weather_forecast]
  end
end
