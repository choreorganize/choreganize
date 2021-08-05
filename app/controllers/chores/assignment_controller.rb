class Chores::AssignmentController < ApplicationController
  def create
    # assignment = assignment_params 
    # assignment[:roomate_id] = current_user.id 
    # assignment[:chore_id] = params[:id] #double check this when chore show is set up 
    assignment_info = {
      assignment:
      {
        roommate_id: current_user.id,
        chore_id: params[:id]
      } }
    AssignmentService.create_assignment(assignment_info)
    TasksFacade.post_task(params[:chore_name], current_user) # add form to take in chore_name 
    redirect_to household_chore_path(household_id: params[:household_id], id: params[:id])
  end

  private 
    def assignment_params
      params.permit(:completed, :roommate_id, :chore_id)
    end
end