class Chores::AssignmentsController < ApplicationController
  def create
    assignment = assignment_params
    assignment[:roomate_id] = current_user.id
    assignment[:chore_id] = params[:id] #double check this when chore show is set up
    AssignmentService.create_assignment(assignment_params)
    TasksFacade.post_task(params[:chore_name], current_user) # add form to take in chore_name
  end

  def update
    assignment = assignment_params
    assignment[:roomate_id] = current_user.id
    assignment[:chore_id] = params[:id]
    assignment[:completed] = true
    AssignmentService.update_assignment(assignment_params)
  end

  private
    def assignment_params
      params.permit(:completed, :roommate_id, :chore_id)
    end
end
