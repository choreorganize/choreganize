require 'rails_helper'

RSpec.describe 'user service' do
  describe 'create_or_find_user' do
    describe ' happy path ' do
      it 'gets us info' do
        json_response = File.read('spec/fixtures/user_service/user_test.json')

        stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/roommates')
          .with(
            body: { 'roommate' => { 'email' => 'cutthatgrass@ex.com', 'google_id' => '456', 'name' => 'Moe deGrasse Tyson',
                                    'token' => '1234567890' } },
            headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Type' => 'application/x-www-form-urlencoded',
              'User-Agent' => 'Faraday v1.5.1'
            }
          )
          .to_return(status: 200, body: json_response, headers: {})

        send_to_back_end = { roommate: {
          name: 'Moe deGrasse Tyson',
          email: 'cutthatgrass@ex.com',
          google_id: '456',
          token: '1234567890'
        } }

        response = GoogleUsersService.create_or_find_user(send_to_back_end)

        expect(response).to be_a(Hash)
        expect(response[:data]).to have_key(:id)
        expect(response[:data]).to have_key(:type)
        expect(response[:data]).to have_key(:attributes)
        expect(response[:data][:attributes][:name]).to eq('Moe deGrasse Tyson')
        expect(response[:data][:attributes][:household_id]).to eq('nil')
        expect(response[:data][:attributes][:email]).to eq('cutthatgrass@ex.com')
        expect(response[:data][:attributes][:google_id]).to eq('456')
        expect(response[:data][:attributes][:token]).to eq('1234567890')
      end
    end
    describe ' sad path ' do
    end
  end
end
