require 'rails_helper'

RSpec.describe 'user service' do
  describe 'create_or_find_user' do
    describe ' happy path ' do
      it 'gets us info' do
        user_info = File.read('spec/fixtures/user_service/user_test.json')

        stub_request(:post, "https://chorginize-api.herokuapp.com/api/v1/roommates?roommate%5Bemail%5D=test_email.com&roommate%5Bgoogle_id%5D=user_id_test&roommate%5Bname%5D=test_name&roommate%5Btoken%5D=token_test").
            with(
              headers: {
             'Accept'=>'*/*',
             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
             'Content-Length'=>'0',
             'User-Agent'=>'Faraday v1.5.1'
              }).
            to_return(status: 200, body: user_info, headers: {})

        send_to_back_end = {
          name: 'test_name',
          email: 'test_email.com',
          google_id: 'user_id_test',
          token: 'token_test'
        }

        response = UsersService.create_or_find_user(send_to_back_end)

        expected_response = {
          name: 'test_name',
          email: 'test_email.com',
          google_id: 'user_id_test',
          token: 'token_test',
          house_id: 3
        }
        # require 'pry'; binding.pry
        expect(response).to eq(expected_response)
      end
    end
    describe ' sad path ' do
    end
  end
end
