class DashboardController < ApplicationController
  def index
    @user = current_user
    @incomplete_chores = @user.incomplete_chores
    @completed_chores = @user.completed_chores
  #   @incomplete_chore_location = if @incomplete_chores.outdoor == true
  #                 'Outdoor'
  #               else
  #                 'Indoor'
  #               end
  #   @completed_chore_location = if @completed_chores.outdoor == true
  #                 'Outdoor'
  #               else
  #                 'Indoor'
  #               end
  end
end
