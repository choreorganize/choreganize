require 'rails_helper'

RSpec.describe 'HouseholdsFacade' do
  xit 'returns household attributes', :vcr do
    household_info = {
      household:
      {
        address: '9385 Dooley Plains',
        city: 'denver',
        state: 'CO',
        password: 'MoreCowBell123*',
        password_confirmation: 'MoreCowBell123*'
      }
    }
    facade = HouseholdsFacade.create_household(household_info)

    expect(facade).to be_an(Household)
    expect(facade.address).to eq('9385 Dooley Plains')
    expect(facade.city).to eq('denver')
    expect(facade.state).to eq('co')

    expect(facade.id).to eq('30')
    expect(facade.roommates).to eq([])
    expect(facade.chores).to eq([])
    expect(facade.weather_forecast).to be_a(Hash)
    expect(facade.weather_forecast).to have_key(:id)
    expect(facade.weather_forecast).to have_key(:current_weather)
    expect(facade.weather_forecast).to have_key(:daily_weather)
  end
end
