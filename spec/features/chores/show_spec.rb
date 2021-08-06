require 'rails_helper'

RSpec.describe 'Chore show Page' do
  before :each do
    json_response = File.read('spec/fixtures/household_service/weather_test.json')
    stub_request(:get, 'https://choreganize-api.herokuapp.com/api/v1/household/1')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v1.5.1'
        }
      )
      .to_return(status: 200, body: json_response, headers: {})
      
    @chore1 = Chore.new( data: {
                         id: 1,
                         attributes: {
                         task_name: 'wash dishes',
                         household_id: '123',
                         description: 'Clean dishes please',
                         weight: 1,
                         frequency: 1,
                         outdoor: true
                       }})

    @chore2 = Chore.new( data: {
                         id: 2,
                         attributes: {
                         task_name: 'Dont Mow',
                         household_id: '123',
                         description: 'Dont Cut some grass, my friend.',
                         weight: 3,
                         frequency: 'daily',
                         outdoor: false
                       }})

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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end
  it 'shows a chores attributes' do
    visit "/households/#{@house.id}/chores/#{@chore1.id}"

    expect(page).to have_content(@chore1.task_name)
    expect(page).to have_content(@chore1.description)
    expect(page).to have_content(@chore1.weight)
    expect(page).to have_content(@chore1.frequency)
    expect(page).to have_content(@chore1.location)
    expect(page).to have_content('Weather Forecast')
  end
  xit 'does not show forecast if chore is indoors' do
    visit "/households/#{@house.id}/chores/#{@chore2.id}"

    expect(page).to_not have_content('Weather Forecast')
  end
  xit 'has a button to update a chore' do
    visit "/households/#{@house.id}/chores/#{@chore2.id}"

    click_button 'Update Chore'

    expect(current_path).to eq()
# # =======
#   it 'creates a new chore' do
#     chore1 = Chore.new({
#       id: 1,
#       task_name: 'Mow',
#       household_id: 123,
#       description: 'Cut some grass, my friend.',
#       weight: 1,
#       frequency: 'weekly',
#       outdoor: true
#     })

#     chore2 = Chore.new({
#       id: 2,
#       task_name: 'Dont Mow',
#       household_id: 123,
#       description: 'Dont Cut some grass, my friend.',
#       weight: 3,
#       frequency: 'daily',
#       outdoor: false
#     })

#     attributes = { address: '123 Main Street',
#                    city: 'Denver',
#                    state: 'CO',
#                    id: 123,
#                    roommates: [@current_user],
#                    chores: [chore1, chore2],
#                    weather_forecast: { id: nil,
#                                        current_weather: { datetime: '2021-08-02 18:58:52 -0400',
#                                                           sunrise: '08:00',
#                                                           sunset: '22:12',
#                                                           temperature: 303,
#                                                           feels_like: 301.76,
#                                                           humidity: 30,
#                                                           uvi: 2.8,
#                                                           visibility: 10_000,
#                                                           conditions: 'broken clouds',
#                                                           icon: '04d' },
#                                        daily_weather: [{ date: '2021-08-02',
#                                                          sunrise: '08:00',
#                                                          sunset: '22:12',
#                                                          max_temp: 303.67,
#                                                          min_temp: 292.59,
#                                                          conditions: 'scattered clouds',
#                                                          icon: '03d' },
#                                                        { date: '2021-08-03',
#                                                          sunrise: '08:01',
#                                                          sunset: '22:11',
#                                                          max_temp: 298.35,
#                                                          min_temp: 293.45,
#                                                          conditions: 'light rain',
#                                                          icon: '10d' },
#                                                        { date: '2021-08-04',
#                                                          sunrise: '08:01',
#                                                          sunset: '22:09',
#                                                          max_temp: 305.11,
#                                                          min_temp: 293.5,
#                                                          conditions: 'clear sky',
#                                                          icon: '01d' },
#                                                        { date: '2021-08-05',
#                                                          sunrise: '08:02',
#                                                          sunset: '22:08',
#                                                          max_temp: 307.77,
#                                                          min_temp: 294.13,
#                                                          conditions: 'clear sky',
#                                                          icon: '01d' },
#                                                        { date: '2021-08-06',
#                                                          sunrise: '08:03',
#                                                          sunset: '22:07',
#                                                          max_temp: 308.6,
#                                                          min_temp: 295.06,
#                                                          conditions: 'light rain',
#                                                          icon: '10d' }] } }

#     house = Household.new(attributes)

#     @current_user = GoogleUser.new({
#                                      google_id: '789',
#                                      name: 'Anita Nappe',
#                                      email: 'sleepy1@ex.com',
#                                      household_id: 123,
#                                      token: 'longgooletokenhere',
#                                      incomplete_chores: [chore1, chore2],
#                                      completed_chore: []
#                                    })
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

#     visit "/households/#{house.id}/chores/#{chore1.id}"
#     # save_and_open_page
#     # expect(current_path).to eq(user_dashboard_path)
#     expect(page).to have_content('1')
# >>>>>>> new_chore
  end
end
