require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before(:each)do
    # person = { 'household_id' => '82',
    #            'google_id' => ENV["GOOGLE_CLIENT_ID"],
    #            'token' => ENV["GOOGLE_CLIENT_SECRET"],
    #            'id' => '8'}
    #
    # ApplicationController.any_instance.stub(:current_user).and_return(@current_user = GoogleUser.new(person))
    # logger = GoogleUser.new(person)
    # # stub_google_oauth2
    #
    # visit root_path
  end

  context "happy path" do
    xit 'has a button to Sign in with Google that redirects to user dashboard' do
      # click_button "Sign in with Google"
      # expect(current_path).to eq(user_dashboard_index_path)
      # expect(page).to have_content("Welcome")
      # expect(page).to have_button("Log out")
    end
  end

  context "sad path" do
    xit 'has a button to Sign in with Google that can fail to login' do
      # click_button "Sign in with Google"
      # expect(current_path).to_not eq(user_dashboard_index_path)
      # expect(page).to have_content("Sorry, sign in not successful.")
      # expect(page).to_not have_button("Log out")
      # expect(current_path).to eq(root_path)
    end
  end
end
