# require 'rails_helper'

# RSpec.describe 'TasksFacade' do
#   it 'returns user attributes', :vcr do
#     end_to_back_end = { roommate: {
#                         name: 'Moe deGrasse Tyson',
#                         email: 'cutthatgrass@ex.com',
#                         google_id: '456',
#                         token: '1234567890'
#                       } }

#     user_params = GoogleUsersService.create_or_find_user(send_to_back_end)
    
#     current_user = GoogleUser.new(user_params[:data])
#     task_name = "vacuum"

#     task = TasksFacade.post_task(task_name, current_user)


#   end
# end