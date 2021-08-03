require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context "happy path" do
    it 'has a button to Sign in with Google that redirects to user dashboard' do
      # stub_google_oauth2
      # @user = create(:user)
      # visit root_path

      # click_button "Sign in with Google"
      # expect(current_path).to eq(user_dashboard_index_path)
      # expect(page).to have_content("Welcome")
      # expect(page).to have_button("Log out")
    end
  end

  context "sad path" do
    it 'has a button to Sign in with Google that fails to login' do
      # stub_google_oauth2
      # @user = create(:user)
      # visit root_path
      #
      # click_button "Sign in with Google"
      # expect(current_path).to_not eq(user_dashboard_index_path)
      # expect(page).to have_content("Sorry, sign in not successful.")
      # expect(page).to_not have_button("Log out")
      # expect(current_path).to eq(root_path)
    end
  end
end
