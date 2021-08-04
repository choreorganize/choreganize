require 'rails_helper'

RSpec.describe 'HouseholdsFacade' do
  it 'returns household attributes' do
    json_response = File.read('spec/fixtures/household_service/household_test.json')

    stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/household')
      .with(
        body: { 'household' => { 'address' => '9385 Dooley Plains', 'city' => 'denver', 'password' => 'MoreCowBell123*',
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
  end
end
