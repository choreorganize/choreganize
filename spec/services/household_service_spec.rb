require 'rails_helper'

RSpec.describe 'household service' do
  describe 'create_or_find_household' do
    describe ' happy path ' do
      xit 'gets us info', :vcr do
        request_data = { household: {
          address: '9385 Dooley Plains',
          city: 'denver',
          state: 'co'
        } }

        response = HouseholdService.create_or_find_household(request_data)

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
