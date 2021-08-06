require 'rails_helper'

RSpec.describe Chore do
  it 'it should build a Chore PORO' do
    chore_hash = { data: {id: "1", type: "chore",
                    attributes: {
                      task_name: 'Do',
                      description: 'do it',
                      household_id: 22,
                      id: 1,
                      weight: 2,
                      frequency: 1,
                      outdoor: true
                    }
                  }}
    chore = Chore.new(chore_hash)

    expect(chore.id).to eq(chore_hash[:data][:id].to_i)
    expect(chore.task_name).to eq(chore_hash[:data][:attributes][:task_name])
    expect(chore.description).to eq(chore_hash[:data][:attributes][:description])
    expect(chore.household_id).to eq(chore_hash[:data][:attributes][:household_id])
  end
end
