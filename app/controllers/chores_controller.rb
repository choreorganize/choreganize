class ChoresController < ApplicationController
  def new; end

  def show
    chore_id = params[:id].to_i
    @chore = ChoresFacade.find_and_create_chore(chore_id)
    @house = HouseholdsFacade.get_weather(@chore.household_id)
    @daily_forecast = @house.weather_forecast[:daily_weather]
  end

  def update
    # require 'pry'; binding.pry
    # params[:household_id]
    # params[:id]
  end
end
# GET /api/v1/household/:id
# current_user.household_id