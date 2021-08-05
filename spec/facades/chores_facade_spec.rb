require 'rails_helper'

RSpec.describe 'ChoresFacade' do
  describe "::find_and_create_chore" do
    it 'finds chore and returns attribute attributes', :vcr do
      chore_hash = { data: {id: "1", type: "chore",
                      attributes: {
                        task_name: 'wash dishes',
                        description: 'Clean dishes please.',
                        household_id: 22,
                        id: 1,
                        weight: 2,
                        frequency: 1,
                        outdoor: true
                      }
                    }}
      pre_chore = Chore.new(chore_hash)

      # chore_id = 1
      chore = ChoresFacade.find_and_create_chore(pre_chore.id)

      expect(chore).to be_a(Chore)
      expect(chore.task_name).to eq("wash dishes")
      expect(chore.id).to eq(1)
      expect(chore.outdoor).to eq(true)
      expect(chore.weight).to eq(2)
      expect(chore.description).to eq("Clean dishes please.")
    end
  end

  # describe '::create_chore' do

  #   chore_hash = ChoreService.create_or_find_chore(chore_info )
  # end
end
