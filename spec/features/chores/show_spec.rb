require 'rails_helper'

RSpec.describe 'Chore show Page' do
  it 'creates a new chore' do
    chore1 = Chore.new({
      id: 1,
      task_name: 'Mow',
      household_id: 123,
      description: 'Cut some grass, my friend.',
      weight: 1,
      frequency: 'weekly',
      outdoor: true
    })

    chore2 = Chore.new({
      id: 2,
      task_name: 'Dont Mow',
      household_id: 123,
      description: 'Dont Cut some grass, my friend.',
      weight: 3,
      frequency: 'daily',
      outdoor: false
    })

    attributes = { address: '123 Main Street',
                   city: 'Denver',
                   state: 'CO',
                   id: 123,
                   roommates: [@current_user],
                   chores: [chore1, chore2],
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

    house = Household.new(attributes)

    @current_user = GoogleUser.new({
                                     google_id: '789',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 123,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [chore1, chore2],
                                     completed_chore: []
                                   })
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    visit "/households/#{house.id}/chores/#{chore1.id}"
    # save_and_open_page
    # expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content('1')
  end
end

# {:data=>
#   {:id=>"189",
#    :type=>"chore",
#    :attributes=>
#     {:task_name=>"Mow Lawn",
#      :household_id=>82,
#      :description=>"Cut some grass, my friend.",
#      :weight=>1,
#      :frequency=>"weekly",
#      :outdoor=>true,
#      :household=>
#       {:id=>82,
#        :address=>"87022 Victor Summit",
#        :password_digest=>"L5rIcKx27E0",
#        :created_at=>"2021-08-02T22:59:01.512Z",
#        :updated_at=>"2021-08-02T22:59:01.512Z",
#        :city=>"denver",
#        :state=>"co"}},
#    :relationships=>{:household=>{:data=>{:id=>"82", :type=>"households"}}}}}
