require 'rails_helper'

RSpec.describe 'Chore New Page' do
  context "happy path" do
    xit 'creates a new chore', :vcr do
      attributes = {
        "data": {
          "id": '1',
          "type": 'households',
          "attributes": {
            "address": '123 Main Street',
            "city": 'Anytown',
            "state": 'CO',
            "roommates": [],
            "chores": [@chore1, @chore2],
            "weather_forecast": {
              "id": nil,
              "current_weather": {
                "datetime": '2021-08-04 16:53:01 +0000',
                "sunrise": '12:11',
                "sunset": '02:08',
                "temperature": 296.09,
                "feels_like": 295.56,
                "humidity": 43,
                "uvi": 8.59,
                "visibility": 10_000,
                "conditions": 'clear sky',
                "icon": '01d'
              },
              "daily_weather": [
                {
                  "date": '2021-08-04',
                  "sunrise": '12:11',
                  "sunset": '02:08',
                  "max_temp": 298.85,
                  "min_temp": 283.42,
                  "conditions": 'clear sky',
                  "icon": '01d'
                },
                {
                  "date": '2021-08-05',
                  "sunrise": '12:12',
                  "sunset": '02:07',
                  "max_temp": 299.58,
                  "min_temp": 284.26,
                  "conditions": 'moderate rain',
                  "icon": '10d'
                },
                {
                  "date": '2021-08-06',
                  "sunrise": '12:13',
                  "sunset": '02:06',
                  "max_temp": 301.55,
                  "min_temp": 285.15,
                  "conditions": 'few clouds',
                  "icon": '02d'
                },
                {
                  "date": '2021-08-07',
                  "sunrise": '12:14',
                  "sunset": '02:05',
                  "max_temp": 300.28,
                  "min_temp": 286.8,
                  "conditions": 'clear sky',
                  "icon": '01d'
                },
                {
                  "date": '2021-08-08',
                  "sunrise": '12:15',
                  "sunset": '02:04',
                  "max_temp": 301.54,
                  "min_temp": 284.38,
                  "conditions": 'clear sky',
                  "icon": '01d'
                }
              ]
            }
          }
        }
      }

      @house = Household.new(attributes)

      user_params = { data: {
                      id: '1',
                      attributes: {
                      id: '1',
                      name: 'Suzie Kim',
                      household_id: @house.id,
                      email: 'suziekim.dev@gmail.com',
                      google_id: '101278412815195230082',
                      token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN'
                      }}}

      @current_user = GoogleUser.new(user_params)

      ApplicationController.any_instance.stub(:current_user).and_return(@current_user)

      visit new_household_chore_path(household_id: @house.id)
      expect(page).to have_content('Create a new chore')

      within('#createChore') do
        fill_in :task_name,	with: 'Mow Lawn'
        fill_in :description,	with: 'Cut some grass, my friend.'
        select "Simple", from: :weight
        select "Bi-Monthly", from: :frequency
        check :outdoor

        click_button 'Submit Chore'
      end

      # expect(current_path).to eq(household_chore_path)
      expect(page).to have_content('Chore Created!')
    end
  end

  context "sad path" do
    xit 'fails to create a new chore' do
      json_response = File.read('spec/fixtures/chore_service/chore_test.json')
      respite = JSON.parse(json_response, symbolize_names: true)

      stub_request(:post, "https://choreganize-api.herokuapp.com/api/v1/chores").
        with(
          body: {"chore"=>{"description"=>"Cut some grass, my friend.",
                 "frequency"=>"2",
                 "household_id"=>"82",
                 "outdoor"=>"1",
                 "task_name"=> nil,
                 "weight"=>"1"}},
          headers: {
       	    'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Content-Type'=>'application/x-www-form-urlencoded',
       	    'User-Agent'=>'Faraday v1.5.1'}
        ).
       to_return(status: 200, body: respite.to_json, headers: {})

      person = { 'household_id' => '82' }

      ApplicationController.any_instance.stub(:current_user).and_return(@current_user = GoogleUser.new(person))

      visit new_household_chore_path(household_id: 82)
      expect(page).to have_content('Create a new chore')

      within('#createChore') do
        click_button 'Submit Chore'
      end
      # expect(current_path).to eq(household_chore_path)
      expect(page).to have_content('Error:  Chore Not Created.')
    end
  end
end
