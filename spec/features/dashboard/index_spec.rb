require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    # @chore1 = Chore.new({ data: {
    #                       attributes: {
    #                       id: "1",
    #                       task_name: 'Mow',
    #                       household_id: 123,
    #                       description: 'Cut some grass, my friend.',
    #                       weight: 1,
    #                       frequency: 'weekly',
    #                       outdoor: true
    #                     }}})
    #
    # @chore2 = Chore.new({ data: {
    #                       attributes: {
    #                       id: "2",
    #                       task_name: 'Clean Dishes',
    #                       household_id: 123,
    #                       description: 'Clean some dishes.',
    #                       weight: 3,
    #                       frequency: 'daily',
    #                       outdoor: false
    #                     }}})
    #
    # @chore3 = Chore.new({ data: {
    #                       attributes: {
    #                       id: "3",
    #                       task_name: 'Laundry',
    #                       household_id: 123,
    #                       description: 'Wash some laundry.',
    #                       weight: 2,
    #                       frequency: 'bimonthly',
    #                       outdoor: true
    #                     }}})
    #
    # attributes = {
    #   "data": {
    #     "id": '91',
    #     "type": 'households',
    #     "attributes": {
    #       "address": '9385 Dooley Plains',
    #       "city": 'denver',
    #       "state": 'co',
    #       "roommates": [],
    #       "chores": [@chore1, @chore2, @chore3],
    #       "weather_forecast": {
    #         "id": 'nil',
    #         "current_weather": {
    #           "datetime": '2021-08-02 18:58:52 -0400',
    #           "sunrise": '08:00',
    #           "sunset": '22:12',
    #           "temperature": 303,
    #           "feels_like": 301.76,
    #           "humidity": 30,
    #           "uvi": 2.8,
    #           "visibility": 10_000,
    #           "conditions": 'broken clouds',
    #           "icon": '04d'
    #         },
    #         "daily_weather": [
    #           {
    #             "date": '2021-08-02',
    #             "sunrise": '08:00',
    #             "sunset": '22:12',
    #             "max_temp": 303.67,
    #             "min_temp": 292.59,
    #             "conditions": 'scattered clouds',
    #             "icon": '03d'
    #           },
    #           {
    #             "date": '2021-08-03',
    #             "sunrise": '08:01',
    #             "sunset": '22:11',
    #             "max_temp": 298.35,
    #             "min_temp": 293.45,
    #             "conditions": 'light rain',
    #             "icon": '10d'
    #           },
    #           {
    #             "date": '2021-08-04',
    #             "sunrise": '08:01',
    #             "sunset": '22:09',
    #             "max_temp": 305.11,
    #             "min_temp": 293.5,
    #             "conditions": 'clear sky',
    #             "icon": '01d'
    #           },
    #           {
    #             "date": '2021-08-05',
    #             "sunrise": '08:02',
    #             "sunset": '22:08',
    #             "max_temp": 307.77,
    #             "min_temp": 294.13,
    #             "conditions": 'clear sky',
    #             "icon": '01d'
    #           },
    #           {
    #             "date": '2021-08-06',
    #             "sunrise": '08:03',
    #             "sunset": '22:07',
    #             "max_temp": 308.6,
    #             "min_temp": 295.06,
    #             "conditions": 'light rain',
    #             "icon": '10d'
    #           }
    #         ]
    #       }
    #     }
    #   }
    # }
    # @house = Household.new(attributes)
  end
  describe 'Happy Path: Displays all chores' do
    xit 'shows all assigned chores' do
      user_params = { data:{
                      id: "60",
                      attributes: {
                        name: 'Suzie Kim',
                        email: 'suziekim.dev@gmail.com',
                        google_id: '101278412815195230082',
                        token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN',
                        completed_chores: [@chore2],
                        incomplete_chores: [@chore1]
                        }}}

      @current_user = GoogleUser.new(user_params)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      expect(@current_user.incomplete_chores).to eq([@chore1])
      expect(@current_user.completed_chores).to eq([@chore2])

      within(first('.incompleteChores')) do
        expect(page).to have_content('Incomplete Chores')
        expect(page).to have_link(@chore1.task_name.to_s)
        expect(page).to have_content(@chore1.task_name)
        expect(page).to have_content(@chore1.description)
        expect(page).to have_content(@chore1.frequency)
        expect(page).to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content('Complete Chores')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).to have_link(@chore2.task_name.to_s)
        expect(page).to have_content(@chore2.task_name)
        expect(page).to have_content(@chore2.description)
        expect(page).to have_content(@chore2.frequency)
        expect(page).to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe 'Displays to-do chores' do
    xit 'shows chores that are incomplete_chores' do
      @current_user = GoogleUser.new({ data: {
                                       attributes: {
                                       google_id: '123',
                                       name: 'Anita Nappe',
                                       email: 'sleepy1@ex.com',
                                       household_id: 123,
                                       token: 'longgooletokenhere',
                                       incomplete_chores: [],
                                       completed_chores: [@chore2]
                                     }}})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content('Incomplete Chores')
        expect(page).to have_link(@chore1.task_name.to_s)
        expect(page).to have_content(@chore1.task_name)
        expect(page).to have_content(@chore1.description)
        expect(page).to have_content(@chore1.frequency)
        expect(page).to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content('Complete Chores')
        expect(page).not_to have_content('You have no completed chores😭.')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe 'Displays complete chores' do
    xit 'shows chores that are completed_chores' do
      @current_user = GoogleUser.new({ data: {
                                       attributes: {
                                       google_id: '123',
                                       name: 'Anita Nappe',
                                       email: 'sleepy1@ex.com',
                                       household_id: 123,
                                       token: 'longgooletokenhere',
                                       incomplete_chores: [],
                                       completed_chores: [@chore2]
                                     }}})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content('Incomplete Chores')
        expect(page).not_to have_content('You have no incompleted chores!🎉')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content('Complete Chores')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).to have_link(@chore2.task_name.to_s)
        expect(page).to have_content(@chore2.task_name)
        expect(page).to have_content(@chore2.description)
        expect(page).to have_content(@chore2.frequency)
        expect(page).to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe 'Sad Path: Displays no chores' do
    xit 'doest show chores that are not assigned' do
      @current_user = GoogleUser.new({ data: {
                                       attributes: {
                                       google_id: '123',
                                       name: 'Anita Nappe',
                                       email: 'sleepy1@ex.com',
                                       household_id: 123,
                                       token: 'longgooletokenhere',
                                       incomplete_chores: [],
                                       completed_chores: []
                                     }}})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content('Incomplete Chores')
        expect(page).not_to have_content('You have no incompleted chores!🎉')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content('Complete Chores')
        expect(page).not_to have_content('You have no completed chores😭.')
        expect(page).not_to have_link(@chore1.task_name.to_s)
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link(@chore2.task_name.to_s)
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link(@chore3.task_name.to_s)
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe 'Sad Path: No household' do
    xit 'doest show chores if household nil' do
      @current_user = GoogleUser.new({ data: {
                                       attributes: {
                                       google_id: '123',
                                       name: 'Anita Nappe',
                                       email: 'sleepy1@ex.com',
                                       household_id: nil,
                                       token: 'longgooletokenhere',
                                       incomplete_chores: [],
                                       completed_chores: []
                                     }}})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

      visit user_dashboard_index_path
      expect(page).to have_content('Join or create a hosuehold')
      expect(page).to have_link('Create A Household')
      click_link 'Create A Household'
      expect(current_path).to eq(new_household_path)
      expect(page).not_to have_content('Incomplete Chores')
      expect(page).not_to have_content('Complete Chores')
    end
  end
end
