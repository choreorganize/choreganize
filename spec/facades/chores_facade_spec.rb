require 'rails_helper'

RSpec.describe 'ChoresFacade' do
  describe "::find_and_create_chore" do
    xit 'finds chore and returns attribute attributes', :vcr do
      chore_id = 1
      chore = ChoresFacade.find_and_create_chore(chore_id)

      expect(chore).to be_a(Chore)
      expect(chore.task_name).to eq("wash dishes")
      expect(chore.id).to eq(1)
      expect(chore.outdoor).to eq(true)
      expect(chore.weight).to eq(1)
      expect(chore.description).to eq("Clean dishes please\n")
    end
  end

  # describe '::create_chore' do
  #   it 'finds chore and returns attribute attributes', :vcr do
  #   end
  # end
end
