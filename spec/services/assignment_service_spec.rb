require 'rails_helper'

RSpec.describe "Assignment API" do
  describe 'create an assignment' do
    describe '::create_task', :vcr do
      
      user_params = { roommate: {
        name: 'Suzie Kim',
        email: 'suziekim.dev@gmail.com',
        google_id: '101278412815195230082',
        token: 'ya29.a0ARrdaM8He2f1lV96cw6s83YS2Ikxtl1g0av-enxXPPK1iEgiy9QtYIgZ6J2DKmHe6VaLlaxgLQX3Tdu8D9Zv52R8eQTnZQG8m1wQ5m_338_6qA9Cbpv9gnAAD1yEPSrj1bcL1O41vCajVE42TsSDC0PS2N7I'
      } }

      roommate = GoogleUserFacade.user(user_params)
   
      attributes = { address: '123 Main Street',
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
                                                         icon: '10d' }] } }

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
   
      expect(response).to eq(Hash)
    end
  end
end