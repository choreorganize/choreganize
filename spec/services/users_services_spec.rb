require 'rails_helper'


RSpec.describe 'user service' do

  describe 'create_or_find_user' do
    describe ' happy path ' do

      it 'gets us info' do

        user_info =  File.read('spec/fixtures/user_service/user_test.json')
        # stub_request(:post, "https://chorginize-api.herokuapp.com/api/v1/roommates?email=test_email.com&google_id=user_id_test&name=test_name&token=token_test").
        #   with(
        #     headers: {
        # 	  'Accept'=>'*/*',
        # 	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        # 	  'Content-Length'=>'0',
        # 	  'User-Agent'=>'Faraday v1.5.1'
        #     }).
        #   to_return(status: 200, body: user_info, headers: {})

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

        expect(response).to eq(expected_response)
      end

    end

    describe ' sad path ' do
    end


  end

  # describe 'happy paths', :vcr do
  #   it 'returns a representatives twitter_id 1' do
  #     twitter_name = 'jaredpolis'
  #     response = TwitterService.representative_twitter_id(twitter_name)
  #
  #     expect(response).to eq("15361570")
  #   end
  #
  #   xit 'returns a representatives twitter_id 1' do
  #     @user = User.create!(uid: '1399770258081128450', username: 'testuser', token: 'test junk')
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  #
  #     response = TwitterService.follow('15361570', '1399770258081128450')
  #   end
  #
  #   xit 'returns tweets that include text with the representatives twitter handle' do
  #     search = 'jaredpolis'
  #     response = TwitterService.find_tweets(search)
  #
  #     expect(response).to be_a(Hash)
  #     expect(response[:meta][:result_count]).to eq(10)
  #     response[:data].each do |data|
  #       expect(data[:text]).to be_a(String)
  #     end
  #   end
  #
  #   it 'returns the last 10 tweets from a representatives twitter handle' do
  #     twitter_id = '15361570'
  #     response = TwitterService.rep_tweets(twitter_id)
  #     expect(response).to be_a(Hash)
  #     expect(response[:meta][:result_count]).to eq(10)
  #     response[:data].each do |data|
  #       expect(data[:text]).to be_a(String)
  #     end
  #   end
  # end
  #
  # describe 'sad paths', :vcr do
  #   xit 'returns no results if no tweets are found' do
  #     search = 'jiridpolis'
  #     response = TwitterService.find_tweets(search)
  #     expect(response[:meta][:result_count]).to eq(0)
  #   end
  #
  #   it 'returns error if twitter id is incorrect' do
  #     twitter_id = '1'
  #     response = TwitterService.rep_tweets(twitter_id)
  #     expect(response).to have_key(:errors)
  #   end
  # end
end
