require 'rails_helper'

RSpec.describe 'Chore show Page' do
  it 'creates a new chore' do
    attributes = { address: '123 Main Street',
                   city: 'Anytown',
                   state: 'CO',
                   id: 123 }

    house = Household.new(attributes)

    chore1 = Chore.new({
                        id: 1,
                        task_name: 'Mow',
                        household_id: house.id.to_s,
                        description: 'Cut some grass, my friend.',
                        weight: 1,
                        frequency: 'weekly',
                        outdoor: true
                      })

    chore2 = Chore.new({
                        id: 2,
                        task_name: 'Dont Mow',
                        household_id: house.id.to_s,
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
