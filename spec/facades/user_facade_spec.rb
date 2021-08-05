require 'rails_helper'

RSpec.describe 'UserFacade' do
  it 'returns user attributes', :vcr do
    # auth_hash = File.read('spec/fixtures/user_service/auth_hash.json')
    # json_response = File.read('spec/fixtures/user_service/user_test.json')

    # stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/roommates')
    #   .with(
    #     body: { 'roommate' => { 'email' => nil, 'google_id' => 'uid', 'name' => nil, 'token' => nil } },
    #     headers: {
    #       'Accept' => '*/*',
    #       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #       'Content-Type' => 'application/x-www-form-urlencoded',
    #       'User-Agent' => 'Faraday v1.5.1'
    #     }
    #   )
    #   .to_return(status: 200, body: json_response, headers: {})
    user_params = { roommate: {
      name: 'Suzie Kim',
      email: 'suziekim.dev@gmail.com',
      google_id: '101278412815195230082',
      token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN'
      } }

    user = GoogleUserFacade.user(user_params)

    expect(user).to be_an(GoogleUser)
    expect(user.email).to eq('suziekim.dev@gmail.com')
    expect(user.google_id).to eq('101278412815195230082')
    expect(user.household_id).to eq(nil)
    expect(user.name).to eq('Suzie Kim')
    expect(user.token).to eq('ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN')
  end
end
