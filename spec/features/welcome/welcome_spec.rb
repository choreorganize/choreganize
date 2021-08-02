require 'rails_helper'

RSpec.describe 'welcome page' do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
  end

  it 'as a registered user, I can log in with correct credentials' do
    expect(find('form')).to have_content('Email')
    expect(find('form')).to have_content('Password')

    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_link("New to Viewing Party? Register Here")
    expect(page).to have_content("test123@xyz.com is signed in")
    expect(page).to have_link("Log out")
  end

  it 'as a registered user, I can not log in with incorrect credentials' do
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "NOparty"
    click_button "Sign In"

    expect(current_path).to eq(welcome_path)
    expect(page).to have_content("Your email or password are incorrect")
  end
end
