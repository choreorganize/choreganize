require 'rails_helper'

RSpec.describe TaskService do
  describe 'class methods' do
    describe '::create_task' do
      it 'can connect to the Google Task API' do
        # this is mocking out the thing that we're testing right now...

        # json_response = File.read('spec/fixtures/user_service/user_test.json')
        # stub_request(:post, 'https://tasks.googleapis.com')
        # .with(
        #   body: { title: "Move and Groove" },
          
        #   headers: {
        #     'Authorization' => 'Bearer ya29.a0ARrdaM_OO_Xj2aC67JU2TU_xXvlXb_0BTGfrKUG49mpAJM3jBno_sWsWfEPVNgB8lZCdU4A7Uo29-21KDU4Uapduf6fdWpVic81SQjMbWAV_DO4fobE2cDJNtMimRQV2rDzpTG4NbHD8JMxll5cgOgqOVHqC',
        #     'Content-Length' => '0',
        #     'User-Agent' => 'Faraday v1.5.1',
        #     'Accept' => '*/*',
        #     'Accept-Encoding' => 'gzip, deflate, br',
        #     'Connection' => 'keep-alive'
        #   }
        # )
        # .to_return(status: 200, body: json_response, headers: {})

        WebMock.allow_net_connect!
        

        response = TaskService.create_task("Mow the lawn", user)
        expect(response).to be_a(Hash)
      end
    end
  end
end