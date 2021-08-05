require 'rails_helper'

RSpec.describe 'Household New Page' do
  describe 'happy path' do
    it 'creates a new household' do
      user_params = { data: {
                      id: '1',
                      attributes: {
                      id: '1',
                      name: 'Suzie Kim',
                      household_id: nil,
                      email: 'suziekim.dev@gmail.com',
                      google_id: '101278412815195230082',
                      token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN'
                      }}}

      @current_user = GoogleUser.new(user_params)

      ApplicationController.any_instance.stub(:current_user).and_return(@current_user)


      json_response = File.read('spec/fixtures/household_service/household_test.json')

      stub_request(:post, 'https://choreganize-api.herokuapp.com/api/v1/household')
        .with(
          body: { 'household' => { 'address' => '123 Main Street', 'city' => 'Anytown', 'password' => 'MoreCowBell123*',
                                   'password_confirmation' => 'MoreCowBell123*', 'state' => 'CO' } },
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type' => 'application/x-www-form-urlencoded',
            'User-Agent' => 'Faraday v1.5.1'
          }
        )
        .to_return(status: 200, body: json_response, headers: {})

      visit new_household_path

      within('.createHousehold') do
        fill_in 'Address',	with: '123 Main Street'
        fill_in 'City',	with: 'Anytown'
        fill_in 'State',	with: 'CO'
        fill_in 'Password',	with: 'MoreCowBell123*'
        fill_in 'Confirm Your Password',	with: 'MoreCowBell123*'

        click_button 'Submit'
      end
      expect(page).to have_current_path(user_dashboard_index_path)
    end
  end
  describe 'sad path' do
    xit 'reqires all fields to be provided' do
      visit new_household_path

      within('.createHousehold') do
        expect(find_field('Address')[:required]).to eq('required')
        expect(find_field('City')[:required]).to eq('required')
        expect(find_field('State')[:required]).to eq('required')
        expect(find_field('Password')[:required]).to eq('required')
        expect(find_field('Confirm Your Password')[:required]).to eq('required')
      end
    end
  end
end
