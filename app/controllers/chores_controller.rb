class ChoresController < ApplicationController
  def new; end

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
# GET /api/v1/household/:id
# current_user.household_id