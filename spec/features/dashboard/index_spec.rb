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
                        task_name: 'Clean Dishes',
                        household_id: 123,
                        description: 'Clean some dishes.',
                        weight: 3,
                        frequency: 'daily',
                        outdoor: false
                      })
    @chore3 = Chore.new({
                        id: 3,
                        task_name: 'Laundry',
                        household_id: 123,
                        description: 'Wash some laundry.',
                        weight: 2,
                        frequency: 'bimonthly',
                        outdoor: true
                      })
      # @current_user = GoogleUser.new({
      #                                google_id: '123',
      #                                name: 'Anita Nappe',
      #                                email: 'sleepy1@ex.com',
      #                                household_id: 123,
      #                                token: 'longgooletokenhere',
      #                                incomplete_chores: [@chore1],
      #                                completed_chores: [@chore2]
      #                              })
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe "Happy Path: Displays all chores" do
    it "shows all assigned chores" do
      @current_user = GoogleUser.new({
                                    google_id: '123',
                                    name: 'Anita Nappe',
                                    email: 'sleepy1@ex.com',
                                    household_id: 123,
                                    token: 'longgooletokenhere',
                                    incomplete_chores: [@chore1],
                                    completed_chores: [@chore2]
                                    })
      #
      # @assignment1 = Assignment.new({
      #                               id: 1,
      #                               completed: false,
      #                               chore_id: @chore1.id,
      #                               roommate_id: @current_user,
      #                               })
      # @assignment2 = Assignment.new({
      #                               id: 2,
      #                               completed: true,
      #                               chore_id: @chore2.id,
      #                               roommate_id: @current_user,
      #                               })

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      expect(@current_user.incomplete_chores).to eq([@chore1])
      expect(@current_user.completed_chores).to eq([@chore2])

      within(first('.incompleteChores')) do
        expect(page).to have_content("Incomplete Chores")
        expect(page).to have_link("#{@chore1.task_name}")
        expect(page).to have_content(@chore1.task_name)
        expect(page).to have_content(@chore1.description)
        expect(page).to have_content(@chore1.frequency)
        expect(page).to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content("Complete Chores")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).to have_link("#{@chore2.task_name}")
        expect(page).to have_content(@chore2.task_name)
        expect(page).to have_content(@chore2.description)
        expect(page).to have_content(@chore2.frequency)
        expect(page).to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe "Displays to-do chores" do
    it "shows chores that are incomplete_chores" do
      # @assignment1 = Assignment.new({
      #                               id: 1,
      #                               chore: @chore1.id,
      #                               roommate: @current_user,
      #                               })
      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 123,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [@chore1],
                                     completed_chores: []
                                   })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content("Incomplete Chores")
        expect(page).to have_link("#{@chore1.task_name}")
        expect(page).to have_content(@chore1.task_name)
        expect(page).to have_content(@chore1.description)
        expect(page).to have_content(@chore1.frequency)
        expect(page).to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content("Complete Chores")
        expect(page).not_to have_content("You have no completed chores😭.")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)


        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe "Displays complete chores" do
    it "shows chores that are completed_chores" do
      # @assignment2 = Assignment.new({
      #                               id: 1,
      #                               completed: true,
      #                               chore: @chore2.id,
      #                               roommate: @current_user,
      #                               })
      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 123,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [],
                                     completed_chores: [@chore2]
                                   })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content("Incomplete Chores")
        expect(page).not_to have_content("You have no incompleted chores!🎉")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content("Complete Chores")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).to have_link("#{@chore2.task_name}")
        expect(page).to have_content(@chore2.task_name)
        expect(page).to have_content(@chore2.description)
        expect(page).to have_content(@chore2.frequency)
        expect(page).to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe "Sad Path: Displays no chores" do
    it "doest show chores that are not assigned" do
      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: 123,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [],
                                     completed_chores: []
                                   })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
      visit user_dashboard_index_path
      within(first('.incompleteChores')) do
        expect(page).to have_content("Incomplete Chores")
        expect(page).not_to have_content("You have no incompleted chores!🎉")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end

      within(first('.completedChores')) do
        expect(page).to have_content("Complete Chores")
        expect(page).not_to have_content("You have no completed chores😭.")
        expect(page).not_to have_link("#{@chore1.task_name}")
        expect(page).not_to have_content(@chore1.task_name)
        expect(page).not_to have_content(@chore1.description)
        expect(page).not_to have_content(@chore1.frequency)
        expect(page).not_to have_content(@chore1.weight)

        expect(page).not_to have_link("#{@chore2.task_name}")
        expect(page).not_to have_content(@chore2.task_name)
        expect(page).not_to have_content(@chore2.description)
        expect(page).not_to have_content(@chore2.frequency)
        expect(page).not_to have_content(@chore2.weight)

        expect(page).not_to have_link("#{@chore3.task_name}")
        expect(page).not_to have_content(@chore3.task_name)
        expect(page).not_to have_content(@chore3.description)
        expect(page).not_to have_content(@chore3.frequency)
        expect(page).not_to have_content(@chore3.weight)
      end
    end
  end

  describe "Sad Path: No household" do
    it "doest show chores if household nil" do
      @current_user = GoogleUser.new({
                                     google_id: '123',
                                     name: 'Anita Nappe',
                                     email: 'sleepy1@ex.com',
                                     household_id: nil,
                                     token: 'longgooletokenhere',
                                     incomplete_chores: [],
                                     completed_chores: []
                                   })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

      visit user_dashboard_index_path
      expect(page).to have_content("Join or create a hosuehold")
      expect(page).to have_link("Create A Household")
      click_link "Create A Household"
      expect(current_path).to eq(new_household_path)
      expect(page).not_to have_content("Incomplete Chores")
      expect(page).not_to have_content("Complete Chores")
    end
  end
end
