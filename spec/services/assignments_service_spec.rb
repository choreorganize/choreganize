require 'rails_helper'

RSpec.describe Assignment API do
  describe 'create an assignment' do
    describe '::create_task' do
      household = create(:mock_household)
      chore = create(:mock_chore, household: household)
      roommate = create(:mock_roommate, household: household)

      assignment_info = { assignment: {
        chore ,

      } }

      response = AssignmentsService.create_assignment(assignment_info)
      expect(response).to eq(Hash)
    end
  end
end