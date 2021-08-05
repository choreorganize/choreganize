class Chores::AssignmentController < ApplicationController
  def create
    @chore = ChoresFacade.find_and_create_chore(chore_id)

    assignment_info = {
      assignment:
      {
        completed: false,
        roommate_id: current_user.id,
        chore_id: params[:id]
      } }
    
      user_info = {
        roommate: {
          incomplete_chores: [@chore]
        }
      }

    AssignmentService.create_assignment(assignment_info)
    TasksFacade.post_task(params[:chore_name], current_user) # add form to take in chore_name
    GoogleUserFacade.update_user(user_info)
    redirect_to household_chore_path(household_id: params[:household_id], id: params[:id])
  end

  private 
    def assignment_params
      params.permit(:completed, :roommate_id, :chore_id)
    end
end