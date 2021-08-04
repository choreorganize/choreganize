require "rails_helper"

RSpec.describe "User Dashboard" do
  before :each do
    attributes = { address: '123 Main Street',
                   city: 'Anytown',
                   state: 'CO',
                   id: 123 }
    @house = Household.new(attributes)
    @chore1 = Chore.new({
                        id: 1,
                        task_name: 'Mow',
                        household_id: 123,
                        description: 'Cut some grass, my friend.',
                        weight: 1,
                        frequency: 'weekly',
                        outdoor: true
                      })
    @chore2 = Chore.new({
                        id: 2,
                        task_name: 'Dont Mow',
                        household_id: 123,
                        description: 'Dont Cut some grass, my friend.',
                        weight: 3,
                        frequency: 'daily',
                        outdoor: false
                      })
      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 123,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [@chore1],
                                     completed_chore: []
                                   })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end
  describe "Displays to-do chores" do
    it "shows chores that are incomplete_chores" do
      visit user_dashboard_index_path
      save_and_open_page
      expect(page).to have_content("Incomplete Chores")
      within(first('.incompleteChores')) do
        expect(page).to have_content(@chore1.task_name)
        expect(page).to have_content(@chore1.description)
        expect(page).to have_content(@chore1.frequency)
        expect(page).to have_content(@chore1.weight)

        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)
      end

      expect(page).to have_content("Complete Chores")
      within(first('.completedChores')) do
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)
      end
    end
  end
end
