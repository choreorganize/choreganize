class Chores::AssignmentsController < ApplicationController
  def create
    assignment = assignment_params 
    assignment[:roomate_id] = current_user.id 
    assignemtn[:chore_id] = params[:id] #double check this when chore show is set up 
    AssignmentService.create_assignment(assignment_params)
    TasksFacade.create_task(params[:chore_name], current_user) # add form to take in chore_name 
  end

  private 
    def assignment_params
      params.permit(:roommate_id, :chore_id)
    end
end