class Households::ChoresController < ApplicationController
  def new;  end

  def create
    # @household = Household.find(params[:household_id])
    chore_info = {
      chore:
      {
        household_id: params[:household_id],
        task_name: params[:task_name],
        description: params[:description],
        weight: params[:weight],
        frequency: params[:frequency],
        outdoor: params[:outdoor]
      }
    }

    ChoresFacade.create_chore(chore_info)
    flash[:success] = 'Chore Created!'
  end
end
