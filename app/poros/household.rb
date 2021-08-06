
class Household
  attr_reader :address,
              :city,
              :state,
              :id,
              :roommates,
              :chores,
              :weather_forecast

  def initialize(attributes)
    @address = attributes[:address]
    @city = attributes[:city].downcase
    @state = attributes[:state].downcase
    @id = attributes[:id]
    @roommates = attributes[:roommates]
    @chores = attributes[:chores]
    @weather_forecast = attributes[:weather_forecast]
  end
end
