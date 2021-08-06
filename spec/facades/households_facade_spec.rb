require 'rails_helper'

RSpec.describe 'HouseholdsFacade' do
  it 'returns household attributes', :vcr do
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

    # expect(facade.id).to eq('113')  #supposed to be 30
    expect(facade.roommates).to eq([])
    expect(facade.chores).to eq([])
    expect(facade.weather_forecast).to be_a(Hash)
    expect(facade.weather_forecast).to have_key(:id)
    expect(facade.weather_forecast).to have_key(:current_weather)
    expect(facade.weather_forecast).to have_key(:daily_weather)
  end


  it 'get_houshold_by_id' do
    json_response = File.read('spec/fixtures/household_service/household_test.json')

    stub_request(:get, "https://choreganize-api.herokuapp.com/api/v1/household/1").
             with(
               headers: {
           	  'Accept'=>'*/*',
           	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           	  'User-Agent'=>'Faraday v1.5.1'
               }).
             to_return(status: 200, body: json_response, headers: {})

    facade = HouseholdsFacade.get_houshold_by_id(1)

    expect(facade).to be_an(Household)
    expect(facade.address).to eq('123 Main Street')
    expect(facade.city).to eq('Anytown')
    expect(facade.state).to eq('CO')
  end

end
