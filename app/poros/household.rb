
class Household
  attr_reader :address,
              :city,
              :state,
              :id,
              :roommates,
              :chores,
              :weather_forecast

  def initialize(attributes)
    @address = attributes[:data][:attributes][:address]
    @city = attributes[:data][:attributes][:city]
    @state = attributes[:data][:attributes][:state]
    @id = attributes[:data][:id]
    @roommates = attributes[:data][:attributes][:roommates]
    @chores = attributes[:data][:attributes][:chores]
    @weather_forecast = attributes[:data][:attributes][:weather_forecast]
  end
end
