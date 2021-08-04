require 'rails_helper'

RSpec.describe 'houshold show page' do

  describe ' lacking authentication ' do
    it 'if user is not loged in ' do
    end
    it 'if user does not belong to the household in question' do
    end

  end



  describe ' unassighned chores section ' do
    it 'displays all un assigned chores in household' do

      household = File.read('spec/fixtures/household_service/household_test.json')

      stub_request(:get, "https://choreganize-api.herokuapp.com/api/v1/household/1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.5.1'
          }).
        to_return(status: 200, body: household, headers: {})


      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 1,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [],
                                     completed_chore: []
                                   })
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)


      household_id = 1

      visit "households/#{household_id}"

      # save_and_open_page

      # within('.unassighned_chores') do
      #   expect(page).to have_content()
      #   expect(page).to have_content()
      #   expect(page).to have_content()
      #   expect(page).to have_content()
      # end
    end
    describe 'chores have link to chore show page' do
    end
    describe ' chores have a point value displaied ' do
    end
    describe '  chores are unassighned' do
    end

  end

  describe 'roommate list ' do
    describe 'sees roommates of household  ' do
    end
    describe 'each roommate displays chores that they assigned ' do
    end
    describe 'displays total points of each roommate ' do
    end
    describe '  if no roommates exist' do
    end
  end

  describe 'general info ' do
    describe 'forecast ' do
    end
    describe 'house hold id displayed ' do
    end
    describe 'todays date ' do
    end

  end

end
