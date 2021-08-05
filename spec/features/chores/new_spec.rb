require 'rails_helper'

RSpec.describe 'Chore New Page' do
  it 'creates a new chore' do
    json_response = File.read('spec/fixtures/chore_service/chore_test.json')
    # require 'pry'; binding.pry
    respite = JSON.parse(json_response, symbolize_names: true)

    stub_request(:post, "https://choreganize-api.herokuapp.com/api/v1/chores").
      with(
        body: {"chore"=>{"description"=>"Cut some grass, my friend.",
               "frequency"=>"2",
               "household_id"=>"82",
               "outdoor"=>"1",
               "task_name"=>"Mow Lawn",
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
      # save_and_open_page
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
