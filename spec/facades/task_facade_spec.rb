require 'rails_helper'

RSpec.describe 'TasksFacade' do
  it 'returns user attributes' do
    current_user = GoogleUser.new({
      google_id: '789',
      name: 'Anita Nappe',
      email: 'sleepy1@ex.com',
      household_id: 123,
      token: 'longgooletokenhere',
      incomplete_chores: [],
      completed_chore: []
    })

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    task_name = "vacuum"

    task = TasksFacade.post_task(task_name, @current_user)


  end
end