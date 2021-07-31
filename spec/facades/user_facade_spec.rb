require 'rails_helper'

RSpec.describe 'UserFacade' do
  it 'returns user attributes' do
    auth_hash = File.read('spec/fixtures/user_service/auth_hash.json')
    json_response = File.read('spec/fixtures/user_service/user_test.json')

    stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/roommates')
      .with(
        body: { 'roommate' => { 'email' => nil, 'google_id' => 'uid', 'name' => nil, 'token' => nil } },
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'Faraday v1.5.1'
        }
      )
      .to_return(status: 200, body: json_response, headers: {})
    user_info = {
      roommate:
      {
        name: auth_hash['info']['name'],
        email: auth_hash['info']['email'],
        google_id: auth_hash['uid'],
        token: auth_hash['credentials']['token']
      }
    }
    facade = UserFacade.user(user_info)

    expect(facade).to be_an(GoogleUser)
    expect(facade.email).to eq('cutthatgrass@ex.com')
    expect(facade.google_id).to eq('456')
    expect(facade.household_id).to eq('nil')
    expect(facade.name).to eq('Moe deGrasse Tyson')
    expect(facade.token).to eq('1234567890')
  end
end
