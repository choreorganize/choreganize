require 'rails_helper'

RSpec.describe 'HouseholdsFacade' do
  it 'returns household attributes' do
    json_response = File.read('spec/fixtures/household_service/household_test.json')

    stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/household')
      .with(
        body: { 'household' => { 'address' => '123 Main Street', 'city' => 'Anytown', 'password' => 'MoreCowBell123*',
                                 'password_confirmation' => 'MoreCowBell123*', 'state' => 'CO' } },
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'Faraday v1.5.1'
        }
      )
      .to_return(status: 200, body: json_response, headers: {})
    household_info = {
      household:
      {
        address: '123 Main Street',
        city: 'Anytown',
        state: 'CO',
        password: 'MoreCowBell123*',
        password_confirmation: 'MoreCowBell123*'
      }
    }
    facade = HouseholdsFacade.create_household(household_info)

    expect(facade).to be_an(Household)
    expect(facade.address).to eq('123 Main Street')
    expect(facade.city).to eq('Anytown')
    expect(facade.state).to eq('CO')
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
