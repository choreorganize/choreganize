require 'rails_helper'

RSpec.describe "Assignment API" do
  describe 'create an assignment' do
    describe '::create_assignment', :vcr do
      xit 'creates an assignment' do 
        user_params = { roommate: {
        name: 'Suzie Kim',
        email: 'suziekim.dev@gmail.com',
        google_id: '101278412815195230082',
        token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN'
        } }

        roommate = GoogleUserFacade.user(user_params)

        attributes = { data: {
                  attributes: {
                  address: '123 Main Street',
                   city: 'Denver',
                   state: 'CO',
                   id: 123,
                   roommates: [roommate],
                   chores: [],
                   weather_forecast: { id: nil,
                                       current_weather: { datetime: '2021-08-02 18:58:52 -0400',
                                                          sunrise: '08:00',
                                                          sunset: '22:12',
                                                          temperature: 303,
                                                          feels_like: 301.76,
                                                          humidity: 30,
                                                          uvi: 2.8,
                                                          visibility: 10_000,
                                                          conditions: 'broken clouds',
                                                          icon: '04d' },
                                       daily_weather: [{ date: '2021-08-02',
                                                         sunrise: '08:00',
                                                         sunset: '22:12',
                                                         max_temp: 303.67,
                                                         min_temp: 292.59,
                                                         conditions: 'scattered clouds',
                                                         icon: '03d' },
                                                       { date: '2021-08-03',
                                                         sunrise: '08:01',
                                                         sunset: '22:11',
                                                         max_temp: 298.35,
                                                         min_temp: 293.45,
                                                         conditions: 'light rain',
                                                         icon: '10d' },
                                                       { date: '2021-08-04',
                                                         sunrise: '08:01',
                                                         sunset: '22:09',
                                                         max_temp: 305.11,
                                                         min_temp: 293.5,
                                                         conditions: 'clear sky',
                                                         icon: '01d' },
                                                       { date: '2021-08-05',
                                                         sunrise: '08:02',
                                                         sunset: '22:08',
                                                         max_temp: 307.77,
                                                         min_temp: 294.13,
                                                         conditions: 'clear sky',
                                                         icon: '01d' },
                                                       { date: '2021-08-06',
                                                         sunrise: '08:03',
                                                         sunset: '22:07',
                                                         max_temp: 308.6,
                                                         min_temp: 295.06,
                                                         conditions: 'light rain',
                                                         icon: '10d' }] } } } }

        household = Household.new(attributes)

        chore = Chore.new({
                            id: 1,
                            task_name: 'Mow',
                            household_id: 123,
                            description: 'Cut some grass, my friend.',
                            weight: 1,
                            frequency: 'weekly',
                            outdoor: true
                          })

        assignment_info = { assignment: {
                            completed: true,
                            roommate_id: roommate.id,
                            chore_id: chore.id
                        } }

        response = AssignmentService.create_assignment(assignment_info)

        expect(response[:data]).to have_key(:attributes)
        expect(response[:data]).to have_key(:id)
        expect(response[:data]).to have_key(:relationships)
        expect(response[:data][:attributes]).to have_key(:chore_id)
        expect(response[:data][:attributes]).to have_key(:completed)
        expect(response[:data][:attributes]).to have_key(:roommate_id)

        expect(response[:data][:attributes][:chore_id]).to eq(chore.id)
        expect(response[:data][:attributes][:completed]).to eq(true)
        expect(response[:data][:attributes][:roommate_id]).to eq(roommate.id.to_i)
      end
    end
  end
end
