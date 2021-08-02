class Household
  attr_reader :address,
              :city,
              :state

  def initialize(attributes)
    @address = attributes[:address]
    @city = attributes[:city]
    @state = attributes[:state]
  end
end
