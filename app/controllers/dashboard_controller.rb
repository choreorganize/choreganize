class DashboardController < ApplicationController
  def index
    @user = current_user
    @incomplete_chores = @user.incomplete_chores
    @completed_chores = @user.completed_chores
  end

  def update
    # require 'pry'; binding.pry
    update_info = {
      roommate: {
        id: params[:id],
        household_id: params[:household_id]
      }
    }
    GoogleUserFacade.update_user(update_info)
    # params[:id] #user id
    # params[:household_id]
    # params[:house_password] <~~~Can we move this beyond our MVP?
    redirect_to user_dashboard_index_path
  end
end
# PATCH /api/v1/roommates/:id
