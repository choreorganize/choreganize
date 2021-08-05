require 'rails_helper'

RSpec.describe 'household service' do
  describe 'create_or_find_household' do
    describe ' happy path ' do
      it 'gets us info' do
        json_response = File.read('spec/fixtures/household_service/household_test.json')

        stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/roommates')
          .with(
            body: { 'household' => { 'address' => '9385 Dooley Plains', 'city' => 'denver', 'state' => 'co' } },
            headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Type' => 'application/x-www-form-urlencoded',
              'User-Agent' => 'Faraday v1.5.1'
            }
          )
          .to_return(status: 200, body: json_response, headers: {})

        request_data = { household: {
          address: '9385 Dooley Plains',
          city: 'denver',
          state: 'co'
        } }

        response = GoogleUsersService.create_or_find_user(request_data)

        expect(response).to be_a(Hash)
        expect(response[:data]).to have_key(:id)
        expect(response[:data]).to have_key(:type)
        expect(response[:data]).to have_key(:attributes)
        expect(response[:data][:attributes][:address]).to eq('9385 Dooley Plains')
        expect(response[:data][:attributes][:city]).to eq('denver')
        expect(response[:data][:attributes][:state]).to eq('co')
      end
    end

    
    describe ' sad path ' do
    end
  end
end
