class ChoresController < ApplicationController
  def new
    @household_id = params[:household_id]
  end

  def create
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

    chore = ChoresFacade.create_chore(chore_info)
    flash[:success] = 'Chore Created!'
    redirect_to root_path
    # redirect_to household_chore_path(id: chore.id)
  end

  def show
    chore_id = params[:id].to_i
    @chore = current_user.incomplete_chores.select { |chore| chore.id == chore_id }.pop
    @house = HouseholdsFacade.get_weather(current_user.household_id)
    @daily_forecast = @house.weather_forecast[:daily_weather]
  end

  def update
    # require 'pry'; binding.pry
    # params[:household_id]
    # params[:id]
  end
end
