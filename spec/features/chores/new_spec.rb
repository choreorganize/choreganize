require 'rails_helper'

RSpec.describe 'Chore New Page' do
  it 'creates a new chore' do
    json_response = File.read('spec/fixtures/chore_service/chore_test.json')

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

    within('.createChore') do
      fill_in 'Address',	with: '123 Main Street'
      fill_in 'City',	with: 'Anytown'
      fill_in 'State',	with: 'CO'
      fill_in 'Password',	with: 'MoreCowBell123*'
      fill_in 'Confirm Your Password',	with: 'MoreCowBell123*'

      click_button 'Submit'
    end
    # expect(current_path).to eq(user_dashboard_path)
    expect(page).to have_content('Chore Created!')
  end
end
