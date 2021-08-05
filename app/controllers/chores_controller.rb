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

    if chore_info[:chore].has_value?(nil)
      flash[:error] = 'Error:  Chore Not Created.'
    else
      chore = ChoresFacade.create_chore(chore_info)
      flash[:success] = 'Chore Created!'
      redirect_to root_path
    # redirect_to household_chore_path(id: chore.id)
    end
  end

  def show
    chore_id = params[:id].to_i
    @chore = ChoresFacade.find_and_create_chore(chore_id)
    @house = HouseholdsFacade.get_weather(@chore.household_id)
    @daily_forecast = @house.weather_forecast[:daily_weather]
  end

  def update
    # require 'pry'; binding.pry
    # params[:household_id
  end
end

