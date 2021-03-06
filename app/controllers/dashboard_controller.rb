class DashboardController < ApplicationController
  def index
    @user = current_user
    @incomplete_chores = @user.incomplete_chores
    @completed_chores = @user.completed_chores
  end

  def update
    update_info = {
      roommate: {
        id: params[:id],
        household_id: params[:household_id]
      }
    }
    # require 'pry'; binding.pry
    a = GoogleUserFacade.update_user(update_info)
    redirect_to user_dashboard_index_path
  end
end
