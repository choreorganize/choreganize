class Household
  attr_reader :address,
              :city,
              :state,
              :id

  def initialize(attributes)
    @address = attributes[:address]
    @city = attributes[:city]
    @state = attributes[:state]
    @id = attributes[:id]
  end
end
