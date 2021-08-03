require 'rails_helper'

RSpec.describe Household do
  it 'it should build a Household PORO' do
    attributes = { address: '123 Main Street',
                   city: 'Anytown',
                   state: 'CO'
                  }

    house = Household.new(attributes)

    expect(house.address).to eq(attributes[:address])
    expect(house.city).to eq(attributes[:city])
    expect(house.state).to eq(attributes[:state])
  end
end
