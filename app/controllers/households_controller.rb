class HouseholdsController < ApplicationController
  def new; end

  def create
    household_info = {
      household:
      {
        address: params[:address],
        city: params[:city],
        state: params[:state],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    }

    house = HouseholdsFacade.create_household(household_info)
    flash[:success] = 'House Created!'
    # redirect_to user_dashboard_index_path
    redirect_to household_path(house.id)
  end

  def show

  end 
end
